;;;; unix-pipes.asd

(asdf:defsystem #:unix-pipes
  :description "Describe unix-pipes here"
  :author "K. Isom <kyle@metacircular.net>"
  :license "MIT license"
  :depends-on (#:osicat #:trivial-gray-streams)
  :serial t
  :components ((:file "package")
	       (:file "unix-pipes")
	       ))

