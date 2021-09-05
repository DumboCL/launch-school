1. The Internet
   1. A "network of networks"
   2. A network: At the most basic level, it's two devices connected in such a way that they can communicate or exchange data.
   3. Such as in an office environment, would be multiple computers and other devices connected via a network bridging device such as a **hub** or, more likely, a **switch**. This implementation is known as **LAN**.
   4. We add **routers** to enable communication between networks. Within a Local Area Network, they work as gateways.
   5. ![what-is-internet-multiple-networks-routers](/var/folders/13/k6h94srx0bldtb13zzlm2gpc0000gn/T/com.evernote.Evernote/WebKitDnD.wFBd9y/what-is-internet-multiple-networks-routers.png)
   6. ![img](https://vahid.blog/post/2020-12-21-how-the-internet-works-part-ii-layers/featured_hu6bd523470eca3355f8b7ab1c32ccd32e_185506_720x0_resize_q90_lanczos.jpg)
2. Protocols
   1. A set of rules governing the exchange or transmission of data.
   2. Protocols act as systems of rules for network communication.
   3. Why there are so many different protocols for network communication?
      1. Protocols for Different Aspects of Network Communication
         1. TCP and HTTP would be examples of two protocols that address different aspects of communication; TCP the transfer of messages between applications, and HTTP the structure of those messages.
      2. Different Protocols for the Same Aspect of Network Communication
         1. TCP and UDP would be examples of two protocols that address the same basic aspect of communication, the transfer of messages between applications, but do so in different ways. 
3. A Layered System
   1. Groups of protocols work in a layered system.
   2. TCP/IP  (OSI)
      1. Application
         1. Application
         2. Presentation
         3. Session
      2. Transport
         1. Session
         2. Transport
      3. Internet
         1. Network
      4. Link
         1. Data Link
         2. Physical
   3. The Internet Protocol Suite divides the layers in terms of the scope of communications within each layer (within a local network, between networks, etc). 
   4. The OSI model divides the layers in terms of the functions that each layer provides (physical addressing, logical addressing and routing, encryption, compression, etc).
4. Data Encapsulation
   1. We are essentially hiding data from one layer by encapsulating it within a data unit of the layer below.
   2. Data is encapsulated into a Protocol Data Unit, creating separation between protocols operating at different layers.
   3. PDU: Protocol Data Units
      1. Different protocols or protocol layers refer to PDUs by different names. At the Link/ Data Link layer, for example, a PDU is known as a *frame*. At the Internet/ Network layer it is known as a *packet*. At the Transport layer, it is known as a *segment* (TCP) or *datagram* (UDP).
      2. the PDU consists of a header, a data payload, and in some cases a trailer or footer.
      3. the purpose of them is the same in each case: to provide protocol-specific metadata about the PDU.
      4. 
      5. ![layered-system-encapsulation](/var/folders/13/k6h94srx0bldtb13zzlm2gpc0000gn/T/com.evernote.Evernote/WebKitDnD.LwYFIB/layered-system-encapsulation.png)
         1. The entire PDU from a protocol at one layer is set as the data payload for a protocol at the layer below. For example, a HTTP Request at the Application layer could be set as the payload for a TCP segment at the transport layer.
            1. For example, an email client would use SMTP, and web browser HTTP, and a file transfer program FTP, but all three of these programs could use TCP at the Transport layer to transfer the application layer data.
         2. Protocols at one layer provide services to the layer above.
            1. In other words, a TCP segment isn't really concerned whether its data payload is an HTTP request, an SMTP command, or some other sort of Application layer data. It just knows it needs to encapsulate *some data* from the layer above and provide the result of this encapsulation to the layer below.
5. The Physical Network
   1. Bits and Signals
      1. The functionality at Physical layer is essentially concerned with the transfer of bits (binary data). In order to be transported, these bits are converted into signals.
   2. Characteristics
      1. Latency
         1. Concept
            1. Latency is a measure of the time it takes for some data to get from one point in a network to another point in a network.
            2. A measure of delay
         2. The Elements of Latency
            1. Propagation delay
               1. the amount of time it takes for a message to travel from the sender to the receiver
               2. can be calculated as the ratio between distance & speed
            2. Transmission delay
               1. when travel across different wires and cables that are connected by network devices
               2. if consider all of these elements as 'link'
               3. Transmission delay is the amount of time it takes to push the data onto the link
            3. Processing delay
               1. the amount of time it takes to be processed at the checkpoint of every interchange is the processing delay.
            4. Queuing delay
               1. the amount of time the data is waiting in the queue to be processed.
            5. Last-mile latency
            6. Round-trip Time (RTT)
               1. A latency calculation often used in networking is Round-trip Time (RTT). This is the length of time for a signal to be sent, added to the length of time for an acknowledgement or response to be received.
      2. Bandwidth
         1. Bandwidth is the amount of data that can be sent in a particular unit of time (typically, a second).
         2. The bandwidth that a connection receives is the lowest amount at a particular point in the overall connection. 
         3. A point at which bandwidth changes from relatively high to relatively low is generally referred to as a bandwidth bottleneck.
6. The Link / Data Link Layer
   1. The protocols operating at this layer are primarily concerned with the identification of devices on the physical network and moving data over the physical network between the devices that comprise it.
   2. Ethernet
      1. The Ethernet protocol provides communication between devices on the same local network
      2. Ethernet Frames are a Protocol Data Unit, and encapsulate data from the Internet/ Network layer above.
      3. Ethernet is the most commonly used protocol at Link / Data Link Layer 
      4. Framing
         1. ![data-link-layer-frame-structure](/var/folders/13/k6h94srx0bldtb13zzlm2gpc0000gn/T/com.evernote.Evernote/WebKitDnD.H6bAk4/data-link-layer-frame-structure.png)
         2. Ethernet framing adds logical structure to binary data.
         3. The above describes the structure of a frame under the IEEE 802.3 Ethernet standard
         4. The key components to remember are the Source and Destination MAC address and the Data Payload.
      6. Interframe Gap
         1. This gap is a brief pause between the transmission of each frame, which permits the receiver to prepare to receive the next frame.
         2. This Interframe gap contributes to the Transmission Delay element of latency we looked at in the previous assignment.
      8. The main elements to focus on are the Data Payload field being used as an encapsulation mechanism for the layer above, and the MAC Address fields being used to direct the frame between network devices. These particular fields exist across all the different Ethernet standards.
      7. MAC Addresses
         1. this address is linked to the specific physical device, and (usually) doesn't change, it is sometimes referred to as the *physical address* or *burned-in address*. 
         2. MAC Addresses are formatted as a sequence of six two-digit hexadecimal numbers
         3. Like a hub, a switch is a piece of hardware to which you connect devices to create a network. Unlike a hub however, a switch uses the destination address in order to direct a frame *only* to the device for which it is intended.
         4. A problem of scale
            1. They are physical rather than logical. Each MAC Address is tied (burned in) to a specific physical device
            2. They are flat rather than hierarchical. The entire address is a single sequence of values and can't be broken down into sub-divisions.
7. The Internet / Network Layer
   1. The Internet Protocol (IP) is the predominant protocol used at this layer for inter-network communication.
   2. The primary function of protocols at this layer is to facilitate communication between hosts (e.g. computers) on different networks.
   3. IP (The Internet Protocol) enables communication between devices
   4. is a key part of the functionality of the internet. 
   5. Whereas the Ethernet protocol provides communication between devices on the same local network, the Internet Protocol enables communication between two networked devices anywhere in the world.
   6. The primary features of both versions (IPv4 and IPv6) are the same:
      1. Routing capability via IP addressing
      2. Encapsulation of data into packets
   7. Packet
      1. ![network-layer-ip-packet-structure](/var/folders/13/k6h94srx0bldtb13zzlm2gpc0000gn/T/com.evernote.Evernote/WebKitDnD.AE7FSO/network-layer-ip-packet-structure.png)
      2. IP Addresses (IPv4)
         1. Unlike MAC Addresses, IP Addresses are logical in nature.
         2. a router that wants to forward an IP packet to any address in the entire range only needs to keep a record of which router on the network controls access to the segment with that network address. This logic is what creates the hierarchical structure, and means that routers don't need to keep records of every single device within an addressable range.
         3. Subnetting is actually *enabled* by IP addressing rather than being an alternative to it. It is the hierarchical structure of IP Addresses that allows networks to be logically split into subnets.
         4. All routers on the network store a local routing table. 
         5. IP enables communication between devices, or *hosts*, but not between specific applications running on that device.
8. The Transport Layer
   1. Although we have multiple communication channels *on* a host, with IP addresses we only have a single channel *between* hosts.
   2. Multiplexing / Demultiplexing
      1. Multiplexing and demultiplexing provides the ability to transmit multiple signals over a single channel.
      2. Multiplexing is enabled through the use of network ports
   3. Ports
      1. In simple terms a port is an identifier for a specific process running on a host.
      2. The IP address and the port number *together* are what enables end-to-end communication between specific applications on different machines. This is called a communication end-point, and is generally referred to as a socket, for example `216.3.128.12:8080`
   4. Sockets
      1. At a conceptual level a socket is, an abstraction for an endpoint used for inter-process communication. At an implementation level it can be used to refer to different specific things
      2. The combination of IP address and port number information can be thought of as defining a communication end-point. This communication end-point is generally referred to as a socket.
      3. In the TCP RFC document: To allow for many processes within a single Host to use TCP communication facilities simultaneously, the TCP provides a set of addresses or ports within each host. Concatenated with the network and host addresses from the internet communication layer, this forms a socket.
      4. In a connectionless system
         1. we could have one socket object defined by the IP address of the host machine and the port assigned to a particular process running on that machine.
      5. In a connection-oriented system
         1. we could instantiate a *new* socket object; this new socket object wouldn't just be defined by the local IP and port number, but also by the IP and port of the process/host which sent the message. This new socket object would then listen specifically for messages where all four pieces of information matched (source port, source IP, destination port, destination IP). The combination of these four pieces of information are commonly referred to as a four-tuple.
         2. The advantage of having a dedicated connection like this is that it more easily allows you to put in place rules for managing the communication such as the order of messages, acknowledgements that messages had been received, retransmission of messages that weren't received, and so on. The purpose of these types of additional communication rules is to add more reliability to the communication. 
   5. Pipelining
      1. To improve the efficient, multiple messages are being transferred at any one time.
      2. Finding a balance between reliability and performance is a major part of the implementation of the TCP.
   6. TCP (Transmission Control Protocol)
      1. What TCP essentially provides is the abstraction of reliable network communication on top of an unreliable channel. What this abstraction does is to hide much of the complexity of reliable network communication from the application layer: data integrity, de-duplication, in-order delivery, and retransmission of lost data.
      2. TCP provides reliability, data encapsulation, multiplexing
      3. TCP provides reliability through message acknowledgement and retransmission, and in-order delivery.
      4. Segments are the PDU of TCP.
         1. Source Port and Destination Port provide the multiplexing capability of the protocol.
         2. Checksum provides the Error Detection aspect of TCP reliability
         3. Sequence number and Acknowledgement number are used together to provide for the other elements of TCP reliability such as In-order Delivery, Handling Data loss, and Handling Duplication
         4. Window Size field is related to Flow Control
         5. Flag fields are one-bit boolean fields
      5. Three-way Handshake process
         1. The processes:
            1. The sender sends a SYN message (a TCP Segment with the SYN flag set to 1)
            2. Upon receiving this SYN message, the receiver sends back a SYN ACK message (a TCP Segment with the SYN and ACK flags set to 1)
            3. Upon receiving the SYN ACK, the sender then sends an ACK (a TCP Segment with the ACK flag set to 1)
         2. connection is now established
         3. The key characteristic of this process is the sender cannot send any application data until after it has sent the `ACK` Segment.
         4. there is an entire round-trip of latency before any application data can be exchanged.
      6. Three-way Handshake process is the service that TCP provides reliability. The flip-side of this benefits is the performance challenges. In order to help facilitate efficient data transfer once a connection is established, TCP provides mechanisms for flow control and congestion avoidance.
      7. Flow control
         1. Flow control is a mechanism to prevent the sender from overwhelming the receiver with too much data at once.
         2. The receiver will only be able to process a certain amount of data in a particular time-frame. 
         3. Data awaiting processing is stored in a 'buffer'.
      8. Congestion Avoidance
         1. Although flow control prevents the sender from overwhelming the receiver, it doesn't prevent either the sender or receiver from overwhelming the underlying network. For that task we need a different mechanism: Congestion Avoidance.
         2. Congestion avoidance is a process by which TCP uses data loss (based on the volume of retransmissions required) as a feedback mechanism to determine how congested the network is, and adjusts the amount of data being sent accordingly.
      9. Disadvantages of TCP
         1. not so efficiently
         2. latency overhead in establishing a TCP connection due to the handshake process.
         3. Head-of-Line (HOL) blocking.
            1. Although this in order delivery is one aspect of TCP's reliability, if one of the segments goes missing and needs to be retransmitted, the segments that come after it in the sequence can't be processed, and need to be buffered until the retransmission has occurred. This can lead to increased queuing delay which, as we saw in an [earlier assignment](https://launchschool.com/lessons/4af196b9/assignments/097d7577), is one of the elements of latency.
   7. User Datagram Protocol (UDP)
      1. PDU: Datagram
      2. It provides multiplexing, but no reliability, no in-order delivery, and no congestion or flow control.
      3. It's a connectionless protocol, and so doesn't need to establish a connection before it starts sending data
      4. UDP does provide error detection via a checksum, though this is optional if using IPv4.
      5. It provides no guarantee of message delivery
      6. It provides no guarantee of message delivery order
      7. It provides no built-in congestion avoidance or flow-control mechanisms
      8. It provides no connection state tracking, since it is a connectionless protocol
      9. The advantage is simplicity, this simplicity provides two things to a software engineer: speed and flexibility.
9. HTTP and the Web
   1. HTTP is a text-based protocol
   2. HTML (Hypertext Markup Language)
   3. URI (Uniform Resource Identifier)
      1. a URI is "sequence of characters that identifies an abstract or physical resource"
      2. a URL is a *subset* of URI that includes the network location of the resource.
      3. URL (Uniform Resource Locator)
         1. components
            1. **scheme**: http
            2. **host**: www.example.com
            3. **port**: :88
            4. **path**: /home/, optional
            5. **query string**: ?item=book, optional
         2. query strings limits
            1. query strings have a maximum length
            2. query strings are visible in the URL. So passing sensitive information in this manner is not recommended
            3. Space and special characters like & cannot be used with query strings unless being encoded
         3. The way the path portion of the URL is used is determined by the application logic, and doesn't necessarily bear any relationship to an underlying file structure on the server.
   4. HTTP (Hypertext Transfer Protocol)
      1. It is a system of rules, a protocol, that serve as a link between applications and the transfer of [hypertext](http://en.wikipedia.org/wiki/Hypertext) documents.
      2. even though you may feel the application is stateful, underneath the hood, the web is built on HTTP, a stateless protocol. It's what makes the web so resilient, distributed, and hard to control. It's also what makes it so difficult to secure and build on top of.
      3. HTTP is nothing more than an agreement in the form of formatted text that dictates how a client and server communicate.
   5. HTTP headers allow the client and the server to send additional information during the request/response HTTP cycle.
   6. Request
      1. Enter a URL like [http://www.google.com](http://www.google.com/) into your web browser's address bar.
      2. The browser creates an HTTP request, which is packaged up and sent to your device's network interface.
      3. If your device already has a record of the IP address for the domain name in its DNS cache, it will use this cached address. If the IP address isn't cached, a DNS request will be made to the Domain Name System to obtain the IP address for the domain.
      4. The packaged-up HTTP request then goes over the Internet where it is directed to the server with the matching IP address.
      5. The remote server accepts the request and sends a response over the Internet back to your network interface which hands it to your browser.
      6. Finally, the browser displays the response in the form of a web page.
   7. Response
      1. HTTP Status Code
      2. Headers
      3. Message body, which contains the raw response data
   8. Statelessness
      1. A protocol is said to be stateless when it's designed in such a way that each request/response pair is completely independent of the previous one.
      2. Each request made to a resource is treated as a brand new entity, and different requests are not aware of each other.
      3. The stateless of HTTP makes the web so resilient, distributed, and hard to control. It's also what makes it so difficult to secure and build on top of, in other words it's also the same ephemeral attribute that makes it difficult for web developers to build stateful web applications.
      4. session identifier
         1. Have the server send some form of a unique token to the client. Whenever a client makes a request to that server, the client appends this token as part of the request, allowing the server to identify clients. In web development, we call this unique token that gets passed back and forth the **session identifier**.
         2. This sort of faux statefulness has several consequences, which means that the server has to work very hard to simulate a stateful experience.
      5. cookies
         1. Browser cookie is a means to store session information
         2. A cookie is a piece of data that's sent from the server and stored in the client during a request/response cycle. **Cookies** or **HTTP cookies**, are small files stored in the browser and contain the session information.
         3. We've seen that the session data is generated and stored on the server-side and the session id is sent to the client in the form of a cookie.
         4. When you access any website for the first time, the server sends session information and sets it in your browser cookie on your local computer.
         5. The actual session data is stored on the server.
         6. The client side cookie is compared with the server-side session data on each request to identify the current session. This way, when you visit the same website again, your session will be recognized because of the stored cookie with its associated information.
      6. AJAX
         1. AJAX is short for Asynchronous JavaScript and XML. Its main feature is that it allows browsers to issue requests and process responses *without a full page refresh*.
         2. AJAX requests are just like normal requests: they are sent to the server with all the normal components of an HTTP request, and the server handles them like any other request. The only difference is that instead of the browser refreshing and processing the response, the response is processed by a callback function, which is usually some client-side JavaScript code.
      7. Security
         1. HTTPS
            1. With HTTPS every request/response is encrypted before being transported on the network.
            2. HTTPS sends messages through a cryptographic protocol called TLS for encryption. These cryptographic protocols use certificates to communicate with remote servers and exchange security keys before data encryption happens.
         2. Same-origin policy
            1. The same-origin policy is an important concept that permits unrestricted interaction between resources originating from the same origin, but restricts certain interactions between resources originating from different origins.
            2. The following must be Same
               1. scheme
               2. hostname
               3. port
         3. Threats
            1. Session Hijacking
               1. If an attacker gets a hold of the session id, both the attacker and the user now share the same session and both can access the web application
               2. In session hijacking, the user won't even know an attacker is accessing his or her session without ever even knowing the username or password.
               3. Countermeasures
                  1. resetting sessions. With authentication systems, this means a successful login must render an old session id invalid and create a new one.
                  2. setting an expiration time on sessions
                     1. gives the attacker a far narrower window to access the app
                  3. HTTPS
                     1. to use HTTPS across the entire app to minimize the chance that an attacker can get to the session id.
            2. Cross-Site Scripting (XSS)
               1. This type of attack happens when you allow users to input HTML or JavaScript that ends up being displayed by the site directly.
               2. If the server side code doesn't do any sanitization of input, the user input will be injected into the page contents, and the browser will interpret the HTML and JavaScript and execute it.
               3. Countermeasures
                  1. make sure to always sanitize user input
                  2. escape all user input data when displaying it
   9. HTTP Request
      1. GET
         1. Retrieving information / Retrieve a resource
      2. POST
         1. is used to initiate some action on the server, or send data to a server.
         2. why we need POST
            1. we could use GET request to send messages to server but our credentials become exposed instantly in the URL. Using a POST request in a form fixes this problem
            2. POST requests also help sidestep the query string size limitation.
         3. HTTP body (optional)
         4. The next page indicated in the Response
            1. `Location` in the Response header
            2. The browser sees the response header and automatically issues a brand new request to the URL specified in the `Location` header, thereby initiating a new, unrelated request.
   10. HTTP Response
       1. Status Code
          1. 302 Found
             1. When your browser sees a response status code of *302*, it knows that the resource has been moved, and will automatically follow the new re-routed URL in the `Location` response header.
          2. 404 Not Found
             1. 4xx level response codes indicate an error or issue on the client side.
          3. 500 Internal Server Error
             1. 5xx level response codes indicate an error or issue on server side.
10. Server-side development
    1. Server
       1. a web server
          1. is typically a server that responds to requests for static assets: files, images, css, javascript, etc.
          2. these requests don't require any data processing.
       2. an application server
          1. is typically where application or business logic resides
          2. this is where your server-side code lives when deployed
       3. a data store
    2. Request & Response
       1. HTTP operates at the application layer and is concerned with structuring the messages that are exchanged between applications; 
       2. it's actually TCP/IP that's doing all the heavy lifting and ensuring that the request/response cycle gets completed between your browser and the server.
11. Demonstrate
    1. Connection
       1. `nc -vc launchschool.com 800`
    2. Request
       1. `GET / HTTP/1.1`
       2. a client MUST send a HOST header field in all HTTP/1.1 request messages
          1. `Host: launchschool.com`
    3. Bash
       1. fix the `permission denied`
          1. `chmod +x hello_world.sh`
    4. set `listen` and `verbose` mode on port 2345
       1. `nc -lv 2345`
    5. connect to port `2345` on `localhost`
       1. `nc -v localhost 2345`
12. TLS (Transport Layer Security)
    1. Why HTTP is insecure
       1. One of the major characteristics of HTTP is that it is a text-based protocol.
       2. By working with HTTP Requests and Responses, we've seen that they are transferred across the network in plain text.
       3. It's also essentially a fairly simple protocol, with quite a basic message structure and set of rules.
       4. If an HTTP Request or Response is intercepted, the contents of that message can easily be read.
       5. It's also difficult to know if the source of an HTTP response is trustworthy, or if an HTTP message
    2. Chracteristics
       1. TLS adds a level of security that HTTP lacks
       2. TLS provides for secure message exchange over an unsecure channel
       3. TLS can be used to secure HTTP traffic, but it doesn't *replace* HTTP. HTTP is still used at the Application layer for structuring messages between applications.
    3. Services
       1. Encryption
          1. a process of encoding a message so that it can only be read by those with an authorized means of decoding the message
          2. Asymmetric key encryption
             1. a pair of keys: one public key, one private key
             2. the public key is used to encrypt
                1. is made openly available
             3. the private key is used to decrypt
                1. is kept in the sole possession of the message receiver
             4. Process
                1. Alice wants to receive encrypted messages. She generates a public key and a private key. She makes the public key available but keeps the private key to herself. Bob uses Alice's public key to encrypt a message and send it to Alice. Alice decrypts Bob's message using her private key.
          3. TLS handshake
             1. TLS Handshake takes place after the TCP Handshake
             2. The bulk of the message exchange is conducted via symmetric key encryption, but the initial symmetric key exchange is conducted using asymmetric key encryption.
             3. The TLS Handshake is used to agree which version of TLS to use.
             4. The TLS Handshake is used to exchange the symmetric encryption key.
             5. The TLS Handshake is used to agree on the Cipher Suite.
       2. Authentication
          1. a process to verify the identity of a particular party in the message exchange
          2. During the TLS Handshake, as part of its response to the `ClientHello` message, the server provides its certificate. One function of this certificate is to provide a means of identification for the party providing it.
          3. However, the certificate, and the Public Key it contains, are only one part of an overall system of authentication.
          4. Client software, such as browsers, store a list of these authorities along with their Root Certificates (which includes their public key). When receiving a certificate for checking, the browser can go up the chain to the Root Certificate stored in its list.
          5. CAs digitally sign the certificates they issue, generating a signature using their own private key.
          6. Before issuing a certificate, CAs verify that whoever is requesting the certificate is who they claim to be.
       3. Integrity
          1. a process to detect whether a message has been interfered with or faked
          2. The way this is implemented is through the use of a hashing algorithm.
          3. Message Authentication Code (MAC)
             1. The intention of the `MAC` field in a TLS record is to add a layer of security by providing a means of checking that the message hasn't been altered or tampered with in transit.
13. The PDU Direction
    1. The entire PDU from a protocol at one layer is set as the data payload for a protocol at the layer below.
       1. For example, a HTTP Request at the Application layer could be set as the payload for a TCP segment at the transport layer.
       2. ![layered-system-encapsulation](/var/folders/13/k6h94srx0bldtb13zzlm2gpc0000gn/T/com.evernote.Evernote/WebKitDnD.dqHlki/layered-system-encapsulation.png)
       3. It creates a system whereby a lower layer effectively provides a 'service' to the layer above it.
       4. It just knows it needs to encapsultate some data from the layer above and provide the result of this encapsulation to the layer below.
14. Q
    1. Same-origing policy
       1. Is it already implemented in HTTP?
    2. How to describe a HTTP request/response cycle
       1. Client initiates the request/response cycle by sending a request to the server. Then the server does what? Sends a respond back.
       2. Every request has response.
    3. How does request response cycle work.



Study Guide:

![img](https://vahid.blog/post/2020-12-21-how-the-internet-works-part-ii-layers/featured_hu6bd523470eca3355f8b7ab1c32ccd32e_185506_720x0_resize_q90_lanczos.jpg)

![img](https://vahid.blog/post/2020-12-21-how-the-internet-works-part-ii-layers/layered_trip_graph.jpg)

![img](https://vahid.blog/post/2020-12-24-how-the-internet-works-part-iii-reliability-and-security/featured_hu78e3c93a0bef0662cce491862a21fe6c_241397_720x0_resize_q90_lanczos.jpg)

The Internet
===================

- Have a broad understanding of what the internet is and how it works

- Understand the characteristics of the physical network, such as latency and bandwidth
- Have a basic understanding of how lower level protocols operate
- Know what an IP address is and what a port number is
- Have an understanding of how DNS works
- Understand the client-server model of web interactions, and the role of HTTP as a protocol within that model

TCP & UDP
===================

- Have a clear understanding of the TCP and UDP protocols, their similarities and differences

- Have a broad understanding of the three-way handshake and its purpose
- Have a broad understanding of flow control and congestion avoidance

URLs
===================

- Be able to identify the components of a URL, including query strings

- Be able to construct a valid URL
- Have an understanding of what URL encoding is and when it might be used

HTTP and the Request/Response Cycle
===================

- Be able to explain what HTTP requests and responses are, and identify the components of each

- Be able to describe the HTTP request/response cycle
- Be able to explain what status codes are, and provide examples of different status code types
- Understand what is meant by 'state' in the context of the web, and be able to explain some techniques that are used to simulate state
- Explain the difference between GET and POST, and know when to choose each

Security
===================

- Have an understanding of various security risks that can affect HTTP, and be able to outline measures that can be used to mitigate against these risks
- Be aware of the different services that TLS can provide, and have a broad understanding of each of those services



Network, Models, Protocols and Infrastructure

•

What is internet? 

•

How does internet came to be? 

•

What is a use of internet? Why do we need it? What can be connected to Internet? 

•

Who is in charge of Internet? 

•

How does internet works? 

•

What is a switch? 

•

What is a router? 

•

What is WLAN? 

•

What is LAN? 

•

How does lower level protocols operate? 

•

What is an IP address? 

•

What is a port number 

•

What is DNS and how does it work? 

•

Describe client-server model of web interactions and the role of HTTP as a protocol within 

that model 

•

What is HTTP and what is it's role as a protocol withing client-server model 

•

What is a protocol? 

•

Why there are many different types of protocols? 

Physical Network

•

What are characteristic of physical network? 

•

What is bandwith? 

•

What is latency? 

•

What are 

Network 'Hops' ?

•

What are the

 l

imitations of physical network?

•

Give an overview on how network is build physically 

The Link/Data Link Layer

•

What is included in a Ethernet frame? 

•

What are responsibilities and purpose of Ethernet frame? 

•

What is a structure of a frame in IEEE 802.3 Ethernet standard? 

•

What is switch and what is hub and what is a difference between them and purpose of each? 

•

What is the reason why MAC addresses doesn't allow for scalability? 

The Internet/ Network Layer

•

Describe the Internet/Network Layer and it's role 

•

How do port numbers and IP addresses work together? 

•

What is an IP address? 

•

What are the components of IP address? 

•

What are two most versions of IP. Describe both and compare. 

•

What is a packet? 

•

Describe what are components of a packet? 

•

What is TTL and what is it used for? 

•

What is a checksum? 

•

What is IP? (Internet Protocol) Describe. 

•

What is routing table? 

Transport Layer 

•

how transport layer protocols enable communication between processes 

•

What are multiplexing and demultiplexing? 

•

how ports work, along with IP addresses, to provide this functionality. 

•

What does it mean that network reliability is engineered? 

•

Compare UDP and TCP 

The Application Layer

•

What is HTTP tool and what does it do?

"Because browsers show us the processed version of the response, we don't get to see the 

raw response the server sent back. How do we see the raw HTTP response data?"

•

why was WEB invented?

•

What is HTML

•

What is HTTP

•

What is WWW (WEB)

•

How does WEB come to be?

•

What is URI?

•

What is URL?

•

What is HTTPs

•

What is a get request and how does it work?

•

What means that protocol is Statelessness?

•

Which characters can be safely use i URL?

•

What is HTTP GUI Tools? And what do we use it for?

•

What is HTTP Command line Tools and what do we use it for?

•

What is a User-Agent and what do we use it for?

•

How is GET request initiated?

•

What is HTTP body

•

How do we send request to server without URL?

•

What is HTTP response header?

•

Which method would you use to send sensitive information to a server? Why?

•

Compare GET and POST

•

Describe how would you send GET request to a server and what is happening on each stage

•

Describe how would you send POST request to a server and what is happening on each stage

•

What means 200, 302, 404 and 500 status codes?

•

How web applications can mimic stateful experience on the web?

•

how modern web applications remember state for each client.?

•

what role does AJAX plays in displaying dynamic content in web applications?

•

What can we do to ensure security?

•

Describe some of the security threats and what can be done to minimize their possibility

•

What is escaping and why and how would we do it?

•

WHat is the difference between URI and URL?

•

Describe request response cycle

•

What are the required components of an HTTP request? What are the additional optional 

components?

•

What are the required components of an HTTP response? What are the additional optional 

components?

•

What determines whether a request should use GET or POST as its HTTP method?

•

What's the difference between a GET and a POST request?

•

Describe request, response cycle

•

What is the relationship between a scheme and a protocol in the context of a URL.

•

How is DNS used in conjunction with IP?

•

What are the principal components of a URL?

•

Identify the scheme and port from this URL: 

http://theonion.com:2000/article/man-decides-

to-listen-for-once

.

•

In what ways can we pass information to the application server via the URL?

•

By convention, which character do we use to separate query parameters from each other 

within a URL?

•

What is a HTTP method?

•

What is an HTTP GET request used for, and what is an HTTP POST request used for?

•

What are HTTP headers?

•

What do we mean when we say that HTTP is a “stateless” protocol?

•

How might we go about simulating a “stateful” application?

•

What conditions must be present so that a script may manipulate a resource, and meet the 

requirements of the “Same-Origin” policy?

•

How would you set up a local server to process a GET responses from browser. Describe 

steps

•

what is TLS and what does it do?

•

what unsecure HTTP message transfer looks like.

•

How TLS works in comparison to HTTP

•

What services does HTTP provides and what the particular problems each of them aims to 

address.

•

What is TLS Handshake.

•

what is symmetric key encryption?

•

what is Asymmetric Key Encryption?

•

Describe SSL/TLS encyrption process

•

Describe pros and cons of TLS Handshake

•

Why do we need digital TLS/SSL certificates?

•

What is Cipher Suites?



_______
Marcos
Source port: 65535
Source ip: my.home.in.ny

To -> Spotify server

506     TCP Segment
108.23.46.77:       IP Packet
destination IP  + Destination port



Spotify



                  Ip packet

______

spotify.com

request

DNS - 

TCP Segment Port :506

DNS - dns database - DNS Servers

108.23.46.77:506

Source: my.home.in.ny
destination108.23.46.77

_____

108.23.46.77:506 listen() [original socket object]


vic(destionation IP, destination port, source ip, source port)

natalie(destionation IP, destination port, source ip, source port)