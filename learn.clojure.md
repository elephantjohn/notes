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

```clojure
(ns tutorial.core
  (:require [clojure.string :as str])
  (:gen-class))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println (list "Dog" 1 3.4 true))
  (println (first (list 1 2 3)))
  (println (rest  (list 1 2 3)))
  (println (nth  (list 1 2 3) 1)) ;the n-th element in list
  (println (list* 1 2 [3 4 ]))
  (println (cons 3 (list 1 2)))
  )

```

the output is:

```clojure
tutorial.core=> (-main)
(Dog 1 3.4 true)
1
(2 3)
2
(1 2 3 4)
(3 1 2)
nil
```

# Set

```clojure
(ns tutorial.core
  (:gen-class))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println (set '(1 1 2)))
  (println (get (set '(3 2)) 2))  ;get the 2nd element in set
  (println (conj (set '(3 2)) 1)) ;==> #{1 3 2}
  (println (contains? (set '(3 2)) 2))
  (println (disj (set '(3 40 30 2 5 6 7)) 2))
  )
```

the output is:

```clojure
tutorial.core=> (-main)
#{1 2}
2
#{1 3 2}
true
#{7 40 6 3 5 30}
nil
```

# Vectors

```clojure
(ns tutorial.core
  (:gen-class))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println (vector 1 "Dog"))
  (println (get (vector 3 2) 0))
  (println (get (vector 3 2) 1))
  (println (get (vector 3 2) 2))
  (println (conj (vector 3 2) 1))
  (println (pop (vector 3 2 1)))
  (println (subvec (vector 1 2 3 4 5 6 7) 1 5))
  )
```

the output is:

```clojure
tutorial.core=> (-main)
[1 Dog]
3
2
nil
[3 2 1]
[3 2]
[2 3 4 5]
nil
```

# Maps

```clojure
(ns tutorial.core
  (:gen-class))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println (hash-map "Name" "Derek" "Age" 18 "Bank" "Guangda"))
  (println (sorted-map "Name" "Derek" "Age" 18 "Bank" "Guangda"))
  (println (sorted-map 3 42 2 "Banas" 1 "Derek"))
  (println (get (hash-map "Name" "Derek" "Age" 18) "Name"))
  (println (find (hash-map "Name" "Derek" "Age" 18) "Name"))
  (println (contains? (hash-map "Name" "Derek" "Age" 18) "Name"))
  (println (keys (hash-map "Name" "Derek" "Age" 18)))
  (println (vals (hash-map "Name" "Derek" "Age" 18)))
  (println (merge-with + (hash-map "Name" "Derek") (hash-map "Age" 18)))
  )
```

the output is :

```clojure
tutorial.core=> (-main)
{Age 18, Bank Guangda, Name Derek}
{Age 18, Bank Guangda, Name Derek}
{1 Derek, 2 Banas, 3 42}
Derek
[Name Derek]
true
(Age Name)
(18 Derek)
{Age 18, Name Derek}
nil
```

# Atoms/Watchers

```clojure
(ns tutorial.core
  (:gen-class))

(defn atom-ex
  [x]
  (def atomEx (atom x))
  (add-watch atomEx :watcher
       (fn [  atom old-state new-state]
         (println "atomEx changed from "
                  old-state "  to " new-state)))
  (println "1st x" @atomEx)
  (reset! atomEx 10)
  (println "2nd x" @atomEx)
  (swap! atomEx inc)
  (println "Increment x" @atomEx))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (atom-ex 5))
```

```clojure
tutorial.core=> (-main)
1st x 5
atomEx changed from  5   to  10
2nd x 10
atomEx changed from  10   to  11
Increment x 11
nil
```

# Agents

```clojure
(ns tutorial.core
  (:gen-class))

(defn agent-ex
  []
  (def tickets-sold (agent 0))
  (send tickets-sold + 15)
  (println)
  (println "Tickets " @tickets-sold)
  
  (send tickets-sold + 10)
  (await-for 100 tickets-sold)
  (println "Tickets " @tickets-sold)
  
  (shutdown-agents)
  
  )

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (agent-ex)
  )
```

the output is :

```clojure
tutorial.core=> (-main)
Tickets  15
Tickets  25
nil
```

# Math

```clojure
(ns tutorial.core
  (:gen-class))

(defn math-stuff
  []
  (println (+ 1 2 3))
  (println (- 5 3 2))
  (println (* 2 5))
  (println (/ 10 5))
  (println (mod 12 5)) 
  
  (println (inc 5))
  (println (dec 5))
  
  (println(Math/abs -10))
  (println(Math/cbrt 8))
  (println(Math/sqrt 4))
  (println(Math/ceil 4.5))
  (println(Math/floor 4.5))
  (println(Math/exp 1))
  (println(Math/hypot 2 2))
  (println(Math/log 2.71828))
  (println(Math/log10 100))
  (println(Math/max 1 5))
  (println(Math/min 1 5))
  (println(Math/pow 2 2))
  
  (println(rand-int 20))
  
  (println(reduce + [1 2 3]))
  (println Math/PI)
  )


(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (math-stuff)   
  )
```

the output is :

```clojure
tutorial.core=> (-main)
6
0
10
2
2
6
4
10
2.0
2.0
5.0
4.0
2.718281828459045
2.8284271247461903
0.999999327347282
2.0
5
1
4.0
16
6
3.141592653589793
nil
```

# Basic Funtions

```clojure
(ns tutorial.core
  (:gen-class))

(defn say-hello
  "Receives a name with 1 parameter and responds"
  [name]
  (println "Hello again" name))

(defn get-sum
  [x y]
  (println(+ x y)))

(defn get-sum-more
  ([x y z]
  (println(+ x y z)))
  
  ([x y]
   (println(+ x y))))

(defn hello-you
  [name]
  (str "Hello " name))

(defn hello-all
  [& names]
  (map hello-you names))
  



(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (say-hello "Derek")
  (get-sum 4 5)
  (get-sum-more 1 2 3)
  (get-sum-more 3 2)
  (hello-all "Dong" "Merry" "Paul")
  )
```

the output is :

```clojure
tutorial.core=> (-main)
Hello again Derek
9
6
5
("Hello Dong" "Hello Merry" "Hello Paul")
```

# Relationship Operators

```clojure
(ns tutorial.core
  (:gen-class))


(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (= 4 5)
  ;; => false

  (not= 4 5)
  ;; => true

  )
```

# Logical Operators

```clojure
(ns tutorial.core
  (:gen-class))


(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  
  (and true false)
  ;; => false

  (or true false)
  ;; => true

  (not true)
  ;; => false

  )
```

# If/Do/When/Cond

```clojure
(ns tutorial.core
  (:gen-class))

(defn can-vote
  [age]
  (if (>= age 18)
    (println "You can vote")
    (println "You can't vote")))

(defn can-do-more
  [age]
  (if (>= age 18)
    (do (println "You can drive")
        (println "You can vote"))
    (println "You can't vote")))

(defn when-ex
  [tof]
  (when tof
    (println "1st thing")
    (println "2nd thing")))

(defn what-grade
  [n]
  (cond
    (< n 5) (println "Proschool")
    (= n 5) (println "Kindergarten")
    (and (> n 5) (<= n 18)) (format "Go to grade%d" (- n 5))
    :else "Go to College"))


(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  
  (can-vote 17)
  (can-do-more 24)
  (when-ex true)
  (what-grade 19)
  )
```

the output is :

```clojure
tutorial.core=> (-main)
You can't vote
You can drive
You can vote
1st thing
2nd thing
"Go to College"
```

# While/Dotimes/Loop

```CLOJURE
(ns tutorial.core
  (:gen-class))

(defn one-to-x
  [x]
  (def i (atom 1))
  (while (<= @i x)
    (do
      (println @i)
      (swap! i inc))))

(defn dbl-to-x
  [x]
  (dotimes [i x]
    (println (* i 2))))

(defn triple-to-x
  [x y]
  (loop [i x]
    (when (< i y)
      (println (* i 3))
      (recur (+ i 1)))))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (one-to-x 5)
  (dbl-to-x 5)
  (triple-to-x 1 5))
```

the output is :

```clojure
tutorial.core=> (-main)
1
2
3
4
5
0
2
4
6
8
3
6
9
12
nil
```

# Doseq

```clojure
(ns tutorial.core
  (:gen-class))

(defn print-list
  [& nums]
  (doseq [x nums]
    (println x)))



(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (print-list 7 8 9 10)
  )
```

the output is:

```clojure
tutorial.core=> (-main)
7
8
9
10
nil
```

# File/IO

```clojure
(ns tutorial.core
  (:gen-class))

(use 'clojure.java.io)

(defn write-to-file
  [file text]
  (with-open [wrtr (writer file)]
    (.write wrtr text)))

(defn read-from-file
  [file]
  (try
    (println (slurp file))
  (catch Exception e (println "Error : " (.getMessage e)))))

(defn append-to-file
  [file text]
  (with-open [wrtr (writer file :append true)]
    (.write wrtr text)))

(defn read-line-from-file
  [file]
  (with-open [rdr (reader file)]
    (doseq [line (line-seq rdr)]
      (println line))))



(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (write-to-file "test.txt" "This is a sentece\n")
  (read-from-file "test.txt")
  (append-to-file "test.txt" "This is another sentence\n")
  (read-line-from-file "test.txt") 
  )
```

the output is:

```clojure
tutorial.core=> (-main)
This is a sentece

This is a sentece
This is another sentence
nil
```

