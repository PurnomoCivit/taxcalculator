# Tax Calculator
## Requirement
Before you use this, you should install some tools, like
```
1. Ruby v2.5+
2. Gem
3. Docker
```

## Installation

Tax Calculator requires [Ruby on Rals](https://rubyonrails.org/) v5+ to run and using docker-compose.

````
1. git clone https://github.com/PurnomoCivit/taxcalculator.git name_project_folder

2. if you already install docker run this command to run docker compose in project folder : 
   1. docker-compose run web rails new . --force --database=postgresql
   2. docker-compose build
   3. docker-compose up
3. open your browser and type this on url address: http://localhost:4000/user/
````

### Test
In Tax Calculator have been Test code. how to run just type this command

````
docker-compose run web bundle exec rspec
````
we use rspec for testing our API. 


### Documentation API
Here's you can see our [documentasi api](https://documenter.getpostman.com/view/5028492/RWaKTUds)

License
----

MIT


