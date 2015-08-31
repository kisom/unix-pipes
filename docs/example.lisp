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
