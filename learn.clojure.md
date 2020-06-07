learn clojure

# Variables & DataTypes

```clojure
(ns tutorial.core
  (:gen-class))


(def randVar 10)

(def aDouble 1.233)

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (def d 10)
 
  (prn d)
  (number? 15)
  (pos? 15)
  (neg? -5)
  (nil? d)
  (integer? 1154)
  )

```

the output is :

```clojure
tutorial.core=> (-main)
10
true
```



# Formatted Output

```clojure
(ns tutorial.core
  (:gen-class))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (def aString "tommy")
  (def aLong 15)
  (def aDouble 1.234567)
  (format "This is string %s" aString)
  (format "5 spaces and %5d" aLong)
  (format "Leading zeros %04d" aLong)
  (format "%-4d left justified" aLong)
  (format "3 decimals %.3f" aDouble)
  )

```

the output is :

```clojure
tutorial.core=> (-main)
"3 decimals 1.235"
```

# Strings 

```clojure
(ns tutorial.core
  (:require [clojure.string :as str])
  (:gen-class))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (def str1 "This is my 2nd string")
  (str/blank? str1)
  ;; => false

  (str/includes? str1 "my")
  ;; => true
;
  (str/index-of str1 "my")
  ;; => 8

  (str/split str1 #" ")
  ;; => ["This" "is" "my" "2nd" "string"]

  (str/split str1 #"\d")
  ;; => ["This is my " "nd string"]

  (str/join " " ["The" "Big" "Cheese"])
  ;; => "The Big Cheese"

  (str/replace "I am 42" #"42" "43")
  ;; => "I am 43"

  (str/upper-case str1)
  ;; => "THIS IS MY 2ND STRING"

  (str/lower-case str1)
  ;; => "this is my 2nd string"
 )

```

# Lists

