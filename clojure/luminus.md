usage of luminus

# change port

modify dev-config.edn in root working directory.

```clojure
change default 7000 to 7001:

srx@szzn:~/Work/tmpDemo/Clojure/my-app$ cat dev-config.edn
;; WARNING
;; The dev-config.edn file is used for local environment variables, such as database credentials.
;; This file is listed in .gitignore and will be excluded from version control by Git.

{:dev true
:port 3000
;; when :nrepl-port is set the application starts the nREPL server on load
:nrepl-port 7001   

}
```

# template version

when i dowoload a template version( luminus 2.9.12.14) ,the result is below as some refer.

```clojure
srx@szzn:~/Work/isz/clojure$ lein new luminus lum-2.9.12.14 --template-version 2.9.12.14 
Retrieving luminus/lein-template/2.9.12.14/lein-template-2.9.12.14.pom from clojars
Retrieving selmer/selmer/1.0.3/selmer-1.0.3.pom from clojars
Retrieving joda-time/joda-time/2.9.2/joda-time-2.9.2.pom from central
Retrieving json-html/json-html/0.3.9/json-html-0.3.9.pom from clojars
Retrieving cheshire/cheshire/5.3.1/cheshire-5.3.1.pom from clojars
Retrieving com/fasterxml/jackson/core/jackson-core/2.3.1/jackson-core-2.3.1.pom from central
Retrieving com/fasterxml/jackson/dataformat/jackson-dataformat-smile/2.3.1/jackson-dataformat-smile-2.3.1.pom from central
Retrieving cheshire/cheshire/5.5.0/cheshire-5.5.0.pom from clojars
Retrieving com/fasterxml/jackson/core/jackson-core/2.5.3/jackson-core-2.5.3.pom from central
Retrieving com/fasterxml/jackson/jackson-parent/2.5.1/jackson-parent-2.5.1.pom from central
Retrieving com/fasterxml/oss-parent/19/oss-parent-19.pom from central
Retrieving com/fasterxml/jackson/dataformat/jackson-dataformat-smile/2.5.3/jackson-dataformat-smile-2.5.3.pom from central
Retrieving com/fasterxml/jackson/dataformat/jackson-dataformat-cbor/2.5.3/jackson-dataformat-cbor-2.5.3.pom from central
Retrieving joda-time/joda-time/2.9.2/joda-time-2.9.2.jar from central
Retrieving com/fasterxml/jackson/core/jackson-core/2.5.3/jackson-core-2.5.3.jar from central
Retrieving com/fasterxml/jackson/dataformat/jackson-dataformat-smile/2.5.3/jackson-dataformat-smile-2.5.3.jar from central
Retrieving com/fasterxml/jackson/dataformat/jackson-dataformat-cbor/2.5.3/jackson-dataformat-cbor-2.5.3.jar from central
Retrieving json-html/json-html/0.3.9/json-html-0.3.9.jar from clojars
Retrieving selmer/selmer/1.0.3/selmer-1.0.3.jar from clojars
Retrieving cheshire/cheshire/5.5.0/cheshire-5.5.0.jar from clojars
Retrieving luminus/lein-template/2.9.12.14/lein-template-2.9.12.14.jar from clojars
Generating a Luminus project.
```

