how tu build a clojure script from 0 to 1

---

##### about my clojure environment

the lein verson is:

```bash
user@ipp:~/Work/tmp/helloworld$ lein -v
Leiningen 2.9.3 on Java 11.0.7 OpenJDK 64-Bit Server VM
```

---

# 1. create a simple clojure project

```bash
lein new helloworld
```

the result is:

```bahs
user@ipp:~/Work/tmp/helloworld$ tree .
.
├── CHANGELOG.md
├── doc
│   └── intro.md
├── LICENSE
├── project.clj
├── README.md
├── resources
├── src
│   └── helloworld
│       └── core.clj
└── test
    └── helloworld
        └── core_test.clj

6 directories, 7 files
```

# 2. modify  project.clj

add "main" and some dependencies to project.clj, in the end, the project.clj looks like:

```clojure
(defproject helloworld "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0"
            :url "https://www.eclipse.org/legal/epl-2.0/"}
  :dependencies [[org.clojure/clojure "1.10.1"];1.10.1 is newest, after "lein new helloworld" runing,it added automatically
                 [org.clojure/clojurescript "1.10.741"];1.10.741 is newst in 2020年 06月 14日 星期日 18:01:54 CST
                 [reagent "1.0.0-alpha2"]];1.1.0-alpha2 is newst in 2020年 06月 14日 星期日 18:01:54 CST

  :cljsbuild {:builds [{:id "dev"
                        :source-paths ["src"]
                        ;:figwheel true
                        :compiler
                        {:optimizations :none
                         :output-to "resources/public/javascripts/dev.js"
                         :output-dir "resources/public/javascripts/cljs-dev/"
                         :pretty-print true
                         :source-map true}}]}
  :plugins [[lein-cljsbuild "1.1.8"];1.1.8 is newest in 2020年 06月 14日 星期日 18:01:54 CST
            #_[lein-figwheel "0.3.7"]]

  :repl-options {:init-ns helloworld.core}
  :main helloworld.core);add main as the entry 

```



# 3 .modify core.clj

change core.clj to this:

```clojure
(ns helloworld.core)

(defn -main[]
  "I don't do a whole lot."
  []
  (println  "Hello, World!"))
```



# 4. change the ext of core.clj 

change the ext of core.clj to core.cljc

why should we change it?

see [here](https://www.reddit.com/r/Clojure/comments/5ydj3i/help_regarding_clj_cljc_and_cljs/) as follows:

> .cljc just means that code, that can be compiled to both targets (JS and JVM/Java), will be compiled to both targets, without having to duplicate code.



# 5. make js dirs 

```bash
user@ipp:~/Work/tmp/helloworld$ cd resources/
user@ipp:~/Work/tmp/helloworld/resources$ mkdir -p public/javascripts/cljs-dev

```

# 6. test 'cljsbuild once'

now let's test if clojurescript can be built successfully.

```bash
user@ipp:~/Work/tmp/helloworld/resources$cd helloworld
user@ipp:~/Work/tmp/helloworld$ lein cljsbuild once dev

```

the output is:

```bash
user@ipp:~/Work/tmp/helloworld$ lein cljsbuild once dev
Compiling ClojureScript...
Compiling ["resources/public/javascripts/dev.js"] from ["src"]...
Successfully compiled ["resources/public/javascripts/dev.js"] in 1.572 seconds.
```

when you see this .it means the compile successful. It means that now you can build ClojureScript.

now ,let's keep going, to learn how to make a true ClojuerScript. see next step.

# 7.  add html

make a file named index.html locate in "resources/public/index.html".

the content in it is:

```html
<html>
    <head>
    </head>

    <body>
        <div id="cljs-target">
        </div>

        <div id="footer-javascripts">
            <script src="./javascripts/cljs-dev/goog/base.js"></script>
            <script src="./javascripts/dev.js"></script>
            <script>goog.require('helloworld.core')</script>           
        </div>
    </body>
</html>
```

pay attention, we suggest the "goog.require" statement must be at the end line of the div, or it will be an error in the runing time.

# 8. modify core.cljc

change the content of core.cljc to this:

```clojure
(ns helloworld.core)

(defn say-hello []
  #?(:clj (println "Hello from Clojure...")
     :cljs (js/console.log "Hello from ClojureScript...")))

(say-hello)
```

> the "#?" just like "if-else" .
>
> if run as clojure,it print "Hello from Clojure".
>
> if run as clojuerscript,it print"Hello from ClojureScript".  

# 9. run by 'cljsbuild once'

### 9.1 run as Clojure

in command line, change directory to working directory ("/home/srx/Work/tmp/helloworld").

run :

```bash
lein cljsbuild once dev
```

the output is :

```bash
srx@ipp:~/Work/tmp/helloworld$ lein cljsbuild once dev
Compiling ClojureScript...
Hello from Clojure...
Compiling ["resources/public/javascripts/dev.js"] from ["src"]...
Successfully compiled ["resources/public/javascripts/dev.js"] in 0.592 seconds.
srx@ipp:~/Work/tmp/helloworld$ lein cljsbuild once dev
Compiling ClojureScript...
srx@ipp:~/Work/tmp/helloworld$ 
```

ok,it print the "Hello from Clojuer...", it's ok.

# 9.2 run as ClojureScript

1. run cljsbuild

   open a new terminal, change directory to working directory ("/home/srx/Work/tmp/helloworld"), and run:
   
   ```bash
   lein cljsbuild once dev
   ```
   
2. start a server 

   we can start a simple server by python.

   open a new terminal, change directory to working directory ("/home/srx/Work/tmp/helloworld"), and then run:

   ```bash
   python3 -m http.server 8080
   ```

3. open the browser

   open the browser,input "localhost:8080"

4. redirect to index.html

   now you will see a directory structure, go to "resources/public/index.html".

5. check the result

    then you can open the browser console  by F12, you will see the print of "Hello from ClojureScript".

   

# 10. run by 'cljsbuild auto'

you dont need to build you code every time,so just use :

```bash
lein cljsbuild auto dev
```

when you change the code,it will compile automatically.



let's have a look to see the base work flow:

1. do a little change to core.cljc   

   let's do a little change in core.cljc. we change "js/console.log" to "js/alert",so we can check the result more easily. so the core.cljc looks like:

   ```clojure
   (ns helloworld.core)
   
   (defn say-hello []
     #?(:clj (println "Hello from Clojure...")
        :cljs (js/alert "Hello from ClojureScript...")))
   
   (say-hello)
   ```

2. run cljsbuild auto

   ```
   lein cljsbuild auto dev
   ```

3. start a server

  ```
   python -m http.server 8080
  ```
4.  open browser

   open browser,rediret to :
   
   ```
   localhost:8080/resources/public/index.html
   ```
   
   you will see an alert window show the message "Hello from ClojuerScript". 