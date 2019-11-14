# Project Wander - backend api

Desktop application which based on what local you choose shows you possible trails, information about them, photos and maps.
Through the application you can choose your next place to wander and explore.

### Deloyment URL
[Frontend Deployment](https://wanderproject.netlify.com/)  
[Backend Deployment](https://c-wander-api.herokuapp.com/)

## Getting Started
Fork the repo and `bundle`. We use Yarn so makes sure you have it. 

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
What things you need to install the software and how to install them...

#### Coveralls/Coverage
We use Coveralls to keep track of our testing measurements, you can remove this `gem 'coveralls'` if you won't want to use it.

#### Elastic Search
Elastic Search needs to be installed on your local computer, to install follow the offical documentation  [mac-installation](https://chartio.com/resources/tutorials/how-to-install-elasticsearch-on-mac-os-x/)

To start elasticsearch service on Mac `$ brew services start elastic/tap/elasticsearch-full` Replace start with stop to kill the service. 
To start elasticsearch service on Linus `$ sudo systemctl start elasticsearch.service` Replace start with stop to kill the service. 

You can check that the elasticsearch service is started by `$ curl http://localhost:9200`

We need to put `do post.import force: true`

#### Kibana (needed for Elastic Search)
Install it following offical documentation, [Mac install](https://www.elastic.co/guide/en/kibana/current/brew.html) [Ubuntu install](https://www.elastic.co/guide/en/kibana/current/deb.html).
To start Kibana on Mac `$ brew services start elastic/tap/kibana-full` Replace start with stop to kill the service. 
To start Kibana on Ubuntu `$ sudo -i service kibana start` Replace start with stop to kill the service. 
Kibana homepage: `http://localhost:5601`

#### Storage
We use cloud storage on Amazon S3, implemented using the `gem 'aws-sdk-s3'`. 
If you want to store things locally you need to change `:amazon` to `:local` in the `config.active_storage.service` within the files `development` and `production` found in the folders `config/environments`.

## Running the tests
How to run the automated tests for this system:

To run request test and spec test: in Terminal `$ rspec`

## Authors
[Pia von Wachenfelt](https://github.com/piavW)  
[Luca Lobacher](https://github.com/lucamarial)  
[Jonas Masharqa](https://github.com/tazzex7)  
[David Izosimov](https://github.com/DavveDavve)  
[Alex Saxena](https://github.com/AlexSaxena)  

## Acknowledgments
### Inspiration
We took inspiration for our elasticsearch implementation from this [tutorial](https://iridakos.com/programming/2017/12/03/elasticsearch-and-rails-tutorial).

## License
MIT-License
