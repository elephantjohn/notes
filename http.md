http

__HTTP__ = __H__yper__t__ext __T__ransfer __P__rotocol

the __HTTP__ is an __application layer protocol__ that allows web-based applications to communicate and exchage data

the __HTTP__ is the __messager__ of the web

it is a __TCP/IP based__ protocal

it is used to __deliver contents__,for example,images,videos,audios,documents,etc

the computers that communicate via HTTP __must__ speak the http protocol



# Three important things about the HTTP

### 1. HTTP is __connectionless__

after making the request,the client __disconnet__ From the server,then when the response is ready the server __re-establish the connection__ again and deliver the response

### 2. HTTP 's __deliver variation__

the HTTP can __deliver__ any  sort of data,as long as the two computers are __able to read__ it

### 3. HTTP is __stateless__

the client and server know about each other __just during__ the __current__ request,if it closes,and the two computers want to connect again,they need to provide information to each other __anew__,and the connection is handled __as the very first one__



# Why The HTTP

The HTTP was designed mainly to fetch html documents and sends it to the client

```
at the time 1991,it was created only for fetch html documents,not videos ,audios etc, it was designed for web.
```

It was  designed in a exquisite way

It was being continually evolved and features were being added to it

It became the most convenient way to quickly and reliably move data on the web

 

# How the Web works ?  And How HTTP makes that possible

If i type "www.mywebsite.com/products/my.html", what will happend?

1st , __THE INTERNET__ will establish the connection of the two computers(client and server),using the __TCP/IP__ suite of protocols ,it establish the connection using a combination of cable media and wireless media and do all the necessary work to prepare the environment for the two computers to talk via the HTTP protocol.

2nd, when the connections establishs,the client sends a request called a __HTTP message__ and because the HTTP is a connectionless protocol the client __disconnects__ from the server,waiting for the response . 

3rd, the server on the other side __process the request__ ,__prepare the response__, and __establishes the connection__ again and __send back the response__ again in  form of an __HTTP message__ to the client.

4th, then the two computers __completely disconnect__.



