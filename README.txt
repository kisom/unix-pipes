Common Lisp Unix pipes as streams.

This currently only works on Linux. 

I wrote this because I wanted in-memory streams when running programs
with external-program, and because writing Unix system programs in
Lisp is fun.

Example:

CL-USER> (defvar *pipes* (unix-pipes:pipe :element-type 'character))
*PIPES*
CL-USER> (format (second *pipes*) "Hello, world~%~%")
NIL
CL-USER> (force-output (second *pipes*))
NIL
CL-USER> (read-line (first *pipes*))
"Hello, world"
NIL
CL-USER> (mapcar #'close *pipes*)
(T T)

License: MIT
