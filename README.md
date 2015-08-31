# :unix-pipes
## Common Lisp Unix pipes as streams.

![Ceci n'est pas une pipe](https://upload.wikimedia.org/wikipedia/en/b/b9/MagrittePipe.jpg)

This currently only works on Linux. 

I wrote this because I wanted in-memory streams when running programs
with external-program, and found flexi-streams didn't work. That led
to meandering about reading up on streams, and then I ended up
here. Also, Unix programming in Lisp is a fun thing.

### Example:

```
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
```

### License: MIT

```
Copyright (c) 2015 Kyle Isom <kyle@metacircular.net>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

### Image credit:

"MagrittePipe" by Image taken from a University of Alabama site,
"Approaches to Modernism": [1]. Licensed under Fair use via
Wikipedia -
https://en.wikipedia.org/wiki/File:MagrittePipe.jpg#/media/File:MagrittePipe.jpg
