clojure syntax

# def

bind symbols to value

avoid to use def cause it introduce state

# let

bind symbols to value

let can nested

symbol's value will resoluted by its lexical scope( from inner to outer)

### diff between def and let

```clojure
let use in where it's declared
def can be accessed from anywhere
```

# defn

define a function

# fn

create anonymous function object

### #()

\#() is shortcut for fn

```clojure
user=> #(+ 1 1) 
user=> (fn [] (+ 1 1 ))
```

# doto

doto is a macro. it's akin to "apply" in Kotlin .

see [here](https://blog.frankel.ch/learning-clojure/2/)

```clojure
;https://blog.frankel.ch/learning-clojure/2/

(doto (HashMap.)
  (.put :a "Alpha")
  (.put :b "Beta")) 

result:
{:b "Beta", :a "Alpha"}

-----------------------
-----------------------
-----------------------


Using the macroexpand reveals the final form:

(macroexpand '(doto (HashMap.)
  (.put :a "Alpha")
  (.put :b "Beta")))

result:

(let* [G__1755 (HashMap.)]   
  (.put G__1755 :a "Alpha")  
  (.put G__1755 :b "Beta")   
  G__1755)     
```