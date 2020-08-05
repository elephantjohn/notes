clojure related

# make project to jar

```clojure
lein uberjar

@return:
Compiling my-stuff.core
Created /home/srx/Work/tmpDemo/Clojure/hello-world/my-stuff/target/uberjar/my-stuff-0.1.0-SNAPSHOT.jar
Created /home/srx/Work/tmpDemo/Clojure/hello-world/my-stuff/target/uberjar/my-stuff-0.1.0-SNAPSHOT-standalone.jar
```

# run a jar

```clojure
 java -jar target/uberjar/my-stuff-0.1.0-SNAPSHOT-standalone.jar
```

# template

the templates located in ~/.m2/repository

generate a project by a template:

```clojure
lein new $template-name my-name

# the $template-name can be anyone in " ~/.m2/repository"
```

# help

run below for help:

```clojure
lein new --help
lein help
```