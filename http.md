

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

The URL  format is:

```
schme://domain:port/path?query_string#fragment_id

schme: http,https,ftp,etc.
domain: www.google.com,etc.
port:80(default),3000,etc.
path:path_to_the_resource,this can be a series of folder names if you're getting a static web page that ends in the name of the file and its extenion

```

URLs also appear in HTML tags inside the resource,these can be for other resource like images,javascript,css, the attributes in these tags contain URLs that tell the browser go to location. for example:

```HTML
<a href=URL> //when user click this, go to that page
<img src=URL> // go to this location and go get the file,it's a image, i wantto display it.
<script src=URL> // go to this location get the js and i want to run it.
<link rel=URL> //go to get the css , i want to render the page
```

URLs also appear in HTML tags for resources used in the page(fetched __automatically__) and,of cource,hyperlinks(fetched __on click__).





If you type "www.mywebsite.com/products/my.html", what will happend?

- 1st , __THE INTERNET__ will establish the connection of the two computers(client and server),using the __TCP/IP__ suite of protocols ,it establish the connection using a combination of cable media and wireless media and do all the necessary work to prepare the environment for the two computers to talk via the HTTP protocol.

- 2nd, when the connections establishs,the client sends a request called a __HTTP message__ and because the HTTP is a connectionless protocol the client __disconnects__ from the server,waiting for the response . 

- 3rd, the server on the other side __process the request__ ,__prepare the response__, and __establishes the connection__ again and __send back the response__ again in  form of an __HTTP message__ to the client.

- 4th, the client(browser) accept the html file and __parses the HTML__,parsing is a word that means it goes and gets the file and breaks it up into pieces,and then starts trying to figure out what to do with all the pieces,HTML contains the text content for a web page plus the structure of the web page,and also ,HTML contains links to other resouces (js,link,CSS,img),__the next thing__ the browser does is it goes out and using those UTLs,it __fetch those resources__ if there are __images__ that the web page needs or videos or anything . the browser goes out and requests those files ,while those files are coming back it goes out and it looks for any  __CSS__ that it needs, __Finally__,the web browser is going to go out and find any __JavaScript__ files that the web page needs and its going to request them as well. JavaScript is how we described how a web page should behave nce it's all loaded  and ready to go.

  ​       the order of the fetch looks like:

  ```bash
  1. HTML(content,structure,URLs)
  2. Media(content)
  3. stylesheet/CSS (appearance)
  4. JavaScript(perfomance)
  ```

  A browser has a couple of simple behaviors that it knows how to do automatically,such as click a form submit button,it knows how to submit a form, but for all the other things you want a web page to be able to do all the enteractive elements you use JavaScript. And the web browser __goes out and ask for__ all of these files using those get commands, the various servers that contain these resources send them back,this can take a while, but as they return, the browser assembles them(HTML,Media,CSS,JavaScript) into the __document__,and stores it's work in an __internal data strcture__ of some sort different for every browser, but in the end , the point of these whole exercise is  for it to __render this document__,that is to draw the document on the screen,it renders a visible page and puts it in the window of your browser . It __also publishes__ the document as a __document object model(DOM)__, DOM is a standard way to describe web page and other documents that allows us to traverse them and manipulate them,if you write a JavaScript ,the browser(__internal data strctures__) will execute it ,the JavaScript run and they use the DOM to manipulste the web page.__In fact__,  the browser doesn't run the JS at the end time, the browser run scripts at different times as soon as it finds them(documents or particular parts of the documents).

  

- 5th, then the two computers __completely disconnect__.

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



 