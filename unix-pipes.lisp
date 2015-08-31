;;;; unix-pipes.lisp

(in-package #:unix-pipes)

;;; This package relies on the nifty trick that file descriptors end
;;; up in /proc.

(defun interpose (x sep)
  "Takes a list and a separator, and places separator between element
of the list."
  (let ((x (coerce x 'list)))
    (apply #'append
	   (mapcar (lambda (y)
		     (list y sep))
		   x))))

(defun to-string (x)
  "Coerce x to a string."
  (with-output-to-string (s)
    (princ x s)))

(defun getpid ()
  "What's the current PID?"
  (with-output-to-string (s)
    (princ (osicat-posix:getpid) s)))
   
(defun merge-pathnames-unixly (&rest paths)
  "Given a list of pathnames, interpose the Unix path separator between them. For example,
(merge-pathnames-unixly '(\"/tmp\" \"logs\" \"something.log\")) would return
#P\"/tmp/logs/something.log\"."
  (pathname
   (apply #'concatenate 'string
	  (butlast
	   (interpose paths "/")))))

(defun fd-path (fd)
  "Return the path to the file descriptor FD for the current process."
  (merge-pathnames-unixly "/proc" (getpid) "fd" (to-string fd)))

(defun pipe (&key (element-type '(unsigned-byte 8)))
  "Return a list of the two ends of a Unix pipe. The #'first is the
reader (input) stream, and the #'second is the writer (output) stream."
  (multiple-value-bind (rfd wfd)
      (osicat-posix:pipe)
    (let ((r (open (fd-path rfd)
		   :direction :input
		   :element-type element-type))
	  (w (open (fd-path wfd)
		   :direction :output
		   :if-exists :append
		   :if-does-not-exist :error
		   :element-type element-type)))
      (osicat-posix:close rfd)
      (osicat-posix:close wfd)
      (list r w))))
