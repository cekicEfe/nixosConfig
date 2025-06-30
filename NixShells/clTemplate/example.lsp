(load (sb-ext:posix-getenv "ASDF"))
(asdf:load-system 'alexandria)
(asdf:load-system 'local-time)

(print (alexandria:factorial 5))

(cl-user::quit)
