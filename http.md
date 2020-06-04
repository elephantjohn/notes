

#     __*the HTTP protocol & how the web works*__

​                                      

# The HTTP protocol

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

# HTTP message

A typical HTTP message include 3 parts: __Start line, Headers,Body__, they all contain plaintext information ,unless if the Body contains binary data,but in general, HTTP messages are plaintext and easy to read. The information in the three sections very dependent on the HTTP message whether  it is a request or a response. A request HTTP message differs from a response one. 

#### Differs from Request and Response

| --\\--     | Request http message                             | response http message                            |
| ---------- | ------------------------------------------------ | ------------------------------------------------ |
| Start line | Method   path/to/file.ext  http/version          | http/version  status_code                        |
| Headers    | Name1:value1<br />Name2:value2<br />Name3:value3 | Name1:value1<br />Name2:value2<br />Name3:value3 |
| Body       | E.g some content                                 | E.g  File requested                              |

lets look at each of them

#### Request HTTP message

| --\\--     |                                                              |
| ---------- | ------ |
| Start line | Method          URI                                HTTP/VERSION<br />----------------------------------------------------------------------<br />GET                /products/my.html          HTTP/1.0 |
| Headers    |Host:www.mywebsite.com<br/>Accept: text/html<br />Accept-language:en-us<br />etc..     |
| Body | The Body __does not exit__ beacuse it's not needed |
|  |  |

in Start line,the HTTP vetsion is that the version that the client is using.

in Headers,the host is the address of the server to which we are sending the request.  Accept-language specific the language, Accept tells the server what type of file we are requesting,it holds a MIME type as its value,MIME type looks like:

```
MIME Type : fileType/ext

E.g.: image/gif 

E.g.: text/html
```



#### Response HTTP message

| --\\--     |                                                              |
| ---------- | ------------------------------------------------------------ |
| Start line | HTTP/VERSION                   STATUS CODE<br />--------------------------------------------------------------------------<br />HTTP/1.0                              200: OK |
| Headers    | Host: www.mywebsite.com<br />Accept: text/html<br />Accept-language:en-us<br />etc. |
| Body       | products/my.html                                             |

the Response HTTP message __dont have__ a METHOD or URI because those are specifically for the requests.

in Start line, status code tells the client if the request succeeded or failed, it may 200 or 404 or other codes,as below:

```
status code:
E.g.: 200:ok
E.g.: 404:file not found
```



# Summary

- The HTTP is a __TCP/IP based__ application layer  protocol that allows web-based  applications to communicate and exchange data
- The computers that communicate via the HTTP __must__ speak HTTP
- The HTTP is __stateless, connectionless,and can deliver any data__
- We use HTTP ptotocol because it is a convinient way to __quickly and reliably__ move data on the web
- The request response cycle works on the web __via HTTP messages__
- A HTTP message contains __three sections__,the start line,the headers,and the body
- The HTTP request message __differs from__ the http response message



 