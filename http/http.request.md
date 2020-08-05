what is http request

# http request

**http** is HyperText transfer protocal.it is a underlying format to structure request and response for comminucation between client and server.

in one sentence,it is a **request-response** protocal.

a browser send a message to server by a URL to access resources, its known as **http request.**

there are many methods to send data to a server,they almost the same but inspectively,like GET,POST,PUT,HEAD,

they called as **HTTP request method**. 			request methods are  case-sensitive. but always UPPER case.

# various http methods

#### GET

retrieve and request data from a resouce in a server.

#### POST

send data to a server to create update a resource.

```
 what's it mean?
 
 Most common HTML forms on the web operate using this request method. It usually transmits relatively small loads of data to a receiver. This method allows data to be sent as a package in a separate communication with the processing script. This means that data sent through the POST method will not be visible in the URL, as parameters are not sent along with the URI.
 
 POST request can be used to submit a web form or upload a file, but it is critical to ensure that the receiving application resonates with the format being used. The Content-Type header indicates the type of body in the POST request.
 
  HTTP POST request provides additional data from the client to the server message body. On the other hand, the GET request incorporates all the required data in the URL. The method specified when information is transferred can determine how form data is submitted to the server. When it comes to POST, form data is visible within the message body of the HTTP request
```