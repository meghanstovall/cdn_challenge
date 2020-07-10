## Setup  
---
- If you don't already have one, download a text editor
- Clone this repo to your local machine with: `git clone git@github.com:meghanstovall/cdn_challenge.git`  

In your terminal:
- cd into this root directory
- install ruby - rbenv install 2.5.1
- install postgres - brew install postgresql
- bundle install
- bundle exec figaro install
  - This should have created a git ignored file /config/application.yml, paste the key provided in the email into this file
- rails db:reset
- rails db:migrate
- rails s

- In your browser visit `localhost:3000/locations/new`


## Research   
---
### Edge Caching
From my understanding, Edge caching is when data gets cached onto servers in order to store content closer to the users. When requests are sent for the same content, the content can be delivered quickly from the edge cache without having to download the data onto the server again. This can reduce network congestion and costs across WAN links, therefore provided faster network speeds and better user experience.

### Round Trip Time
Round Trip Time (RTT) is the time, in milliseconds, that it takes for a user to send a request to a server, the server receive the request and send the response, and the user to receive the response from the server. RTT is one of the main factors when measuring page load time and network latency, which is the measurement of time it takes for the user request to be received by the server. However, network latency isn't always half of the RTT because RTT includes a processing delay at each endpoint, which may be asymmetrical.

#### Reducing RTT by using a CDN
- Points of Presence (PoPs)
..* PoPs are geographically located data centers containing copies of a websites contents. These are responsible for communicating with the sites users in the vicinity of the data centers. PoPs are important because they reduce the number of hops needed to reach a sites server therefore reducing the distance a signal has to travel  

- Web caching
..* CDN's also cache html content on PoPs. Therefore a request can be handeled on these local PoPs instead of having to travel to the websites original server. This also helps reduce the round trip time.  

- Load distribution
..* Load distrubition is important to consider during high traffic times. CDNs requests can be sent through backup servers that have lower network traffic and therefore making server response time faster.  

- Scalability
..* CDN services operate in the cloud. This allows for high scalability, as well as the ability to process a large number of user requests at once.  

- Tier 1 access
..* CDN's have agreements with ISPs to provide tier 1 access to the internet. Like Points of Presence, this reduces the number of hops a connection travels through.  

One of the issues CDNs were built to solve was to reduce round trip time. Due to PoPs, Web caching, Load distribution, Scalability, and Tier 1 access, CDN's have been successful with doing so.  

#### Calculating RTT
![GitHub Logo](/images/calculatingRTT.png)  
---  

### Bandwidth
The Maximum bandwidth is the maximum amount of data that can be transferred over a server at a given time If there are multiple sites hosted on a shared server, the bandwidth can be shared among those sites. Bandwidth is usually measured in the number of bits or bytes per second, it is calculated as the product of the link capacity (num bits transmitted per second) of the channel and the RTT of transmission.

#### Calculating Bandwidth  
![GitHub Logo](/images/calculatingBandwidth.png)  
---

#### Code Layout
For this program I have decided to create a ruby on rails web application. I chose to do so because I believed it would allow me to write clean and organized code by following a Model View Controller architecture.
