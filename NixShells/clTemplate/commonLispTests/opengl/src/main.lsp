(load (sb-ext:posix-getenv "ASDF"))

(asdf:load-system 'alexandria)
(asdf:load-system 'local-time)
(asdf:load-system 'cl-opengl)
(asdf:load-system 'cl-glfw3)
(asdf:load-system 'trivial-main-thread)

(glfw:def-key-callback quit-on-escape (window key scancode action mod-keys)
  (declare (ignore window scancode mod-keys))
  (when (and (eq key :escape) (eq action :press))
    (set-window-should-close)))

(defun render ()
  (gl:clear :color-buffer)
  (gl:with-pushed-matrix
    (gl:color 1 1 1)
    (gl:rect -25 -25 25 25)))

(defun set-viewport (width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (gl:ortho -50 50 -50 50 -1 1)
  (gl:matrix-mode :modelview)
  (gl:load-identity))

(glfw:def-window-size-callback update-viewport (window w h)
  (declare (ignore window))
  (set-viewport w h))

(defun basic-window-example ()
  ;; Graphics calls on OS X must occur in the main thread
  (trivial-main-thread:with-body-in-main-thread ()
    (glfw:with-init-window (:title "Window test" :width 600 :height 400)
      (setf %gl:*gl-get-proc-address* #'glfw:get-proc-address)
      (glfw:set-key-callback 'quit-on-escape)
      (glfw:set-window-size-callback 'update-viewport)
      (gl:clear-color 0 0 0 0)
      (set-viewport 600 400)
      (loop until (glfw:window-should-close-p)
         do (render)
         do (glfw:swap-buffers)
         do (glfw:poll-events)))))

(basic-window-example)
