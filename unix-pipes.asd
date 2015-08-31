;;;; unix-pipes.asd

(asdf:defsystem #:unix-pipes
  :description "Unix pipes as file streams, providing a reader and
  writer stream connected to each other."
  :author "K. Isom <kyle@metacircular.net>"
  :license "MIT license"
  :depends-on (#:osicat #:trivial-gray-streams)
  :serial t
  :components ((:file "package")
	       (:file "unix-pipes")
	       ))

