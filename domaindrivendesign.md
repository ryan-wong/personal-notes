#Domain Driven Design
Value objects
Entities
Aggregates
Bounded context

##Finding the Core Problem
Sadly, the problem a piece of software solves so perfectly is not always the problem the software was created for in the first place or even the problem the programmer had in mind when the software was written.

When starting a software project, especially one motivated by a business need, we set out to model a part of the real world and apply a set of constraints and algorithms
to it, to ease the job of one or more parties involved in the business.

In domain-driven design, this is referred to as the ubiquitous language of the project, a language shared by all parties involved in the project. Establishing this kind of language allow us to communicated clearly across team boundaries, and as mentioned before, this is one of the core ideas in domain-driven design.

There are not many problems in software development that can be fully specified easily. Even the few that seem like it leave some room for interpretation.

How are people going to use this piece of code? In a lot of cases, there are multiple ways to implement a certain feature, but picking one often means weighing different tradeoffs against each other, such as speed, extensibility, and readability.

How is the client going to use our software? Sadly, this question by itself will not yield the results we have in mind. The problem is that our users don't know our software.

#Outlining the problem

Use markdown to track features. This can be transfer to wiki page very easily.

Title of feature in start with # sign.
list all characteristics of feature below it.
This makes it very easy to manipulate and see.

#Using pen and paper for programming.

Draw boxes for each entity.
Draw arrows between entities to represent the interaction between them.
Add symbols on top of arrows to illustrate what kind of interaction.
Number the interaction based on the ordering of the story information.

#UML

##Structural Diagram
Draw actors in the system and draw their relationship between each other
- 1 to 1
- 1 to n
- n to n

##Usecase Diagram
Draw a common box 2 actors point too.
List the interaction between the two.
Connect the arrows to the specific interaction.

#Code spikes and throwaway code
We create a throwaway code, which is just there to explore a certain difficult
part, without the intention of having this code ever make it into production.

This frees us from a lot of the intricacies that are often involved in creating
production-ready code.

The code is there just to solve a specific case and help us gain knowledge about
how to solve the same problem later.

A spike is all about the knowledge gain and not about the code, so be ready to
write something quick and dirty just to make it work.

A common area to spike is the interaction with external services, such as our
notification service where the interface is known on a high level but the
developer has actually never worked with it.

The other interesting problem is going to be creating the interface between our
code and the users.

In domain-driven design, we have multiple building blocks to choose from:
- Entity
- Value object
- Aggregate
- Domain event
- Service
- Repository
- Factory

##Entity
- define by its identity
- have to deal with internal state

##Value Object
- define by its properties
- have a equal function
- no internal state
- store property with no state change
- every function call is pass by rev

```
Coin.prototype.equals = function(other) {
     if(!(other instanceof Coin)) {
       return false
     }
     return this.value === other.value
   }
}
```

Domain Event
- Event that trigger some kind of reaction
Mapping our actors out—creating a dependency graph for our domain

Mapping Dependacies
- create dependancy graphs of all domain objects
- see which one gets depended on the most then implement that first (aka the highest level object first)

Drawing with code - spiking
- when need to make low level functions, create throwaway code to make it owrk without going to production
- good for interacting with external services

#Setting up project for domain driven design

##The project file structure and what to consider when laying it out
- should be able to find files very easily

###Approachability
- need to be able to find files, clear interface of apis so save time developing and adoption
- filename reflect content
- directory name reflect content
- follow convention establish by community
- index.js indicatea entry into a module

###Locality of edits
- make sure develop doesn't have to jump to many sections to make edits
- this apply to folder as well. Want developer to stay in same folder with changes

###Fitness for handling change
- build system as a lot of small components, and have stuff that aggregate them to use after
- should allow mallable use case changes without changing any of the small components
- have harsh integration rules
- need to have each small part tested seperately and have api level integrate it
- this way very easy to remove features fast and increase maintanence velocity and overhead

###Dealing with shared functionality
- create a shared interface that both dependancy implement for shared functionality
- use for duplicate snippets
- db access, configurations

###Shared toolbox
- becomes public location for dumping duplicate snippets
- need to make sure they are in correct location

###Moving up dependancies
- move lib into npm packages

###Isolate domain
- try to isolate business logic away from UI and database so you can run automated test
without it
##Different forms of testing and why they are important
- performance testing
- unit testing

##Building the application
- use build tools like grunt , gulp, broccolli

##An introduction to hexagonal architecture
- domain logic in a hexagon shape isolated
- only care about its own logic, language and concepts
- ports are available for serivces to plugin (UI adapter, database adapter, external services)
- ports are interfaces and provide a clear api for what it will provide
- adapters can also be elements that provide api so you can swap them out for testing
- ***persistence ignorance*** ignore layers of loading and saving data
- use seperate objects to encapsulate the domain objects actions and use those to integrate with
web framework

#Modeling Actors
- use mocks to stand in for an api(element or url)
- can test mock right away
- stubb out external apis
- we are mocking interfaces not classes

#Naming things
- don't use word manager, makes abstracting away details hard in the system, when testing need to hold on to all its dependancies even though we don't need them, test look complicated, setup of test trump the assertion
- object/class has a role in a system anad should be named for that not real life terms of it
- name should reflect what it actually does
- dont use generic objects because they don't do domain specific actions and are only specified when calling their internal implementation
- want to avoid getter/setter as much as possible since you want the object to control its internal state and not let others change its state, so when object needs to do an action, it should cahnge it's own properties

#Naming Services/Manager
- nouns can be services
- verbs need to be accompany after a noun or before
- so change NounService to Noun(ServiceAction) and provide a method to do it
- ie. Letter Class(field1,field2,field3) and send function(postman) to LetterSender(postman, letterObject) and send()
- do this if noun and function are associated very deeply like letter and postman

#Anti domain design pattern
- not every object is an entity object
- focus refactoring on code parts that change the most and can have new features added in

#Coding in big teams
- want ot keep development team to below the number of people who can eat a pizza
- more people, more meetings to get on the same page
- want to decouple code so much that you can have many different teams working on the code

#Service oriented Architecture (SOA)
- each service has a small set of responsibilities
- have very little reason to change so easily maintainable
- each service context is bound by a service
- shift most problems into the communication layer

##Drawing a context map
- draw out clear api for each context

#Example
```javascript
 function getOtherDungeon() {
     return { inbox: [] }
}
   function getLocalDungeon() {
     return {
       getOrc: function () { return {} },
         getCarriage: function () { return {} }
} }
   function getNotifier() {
     return {
       message: function (target, reason) { target.inbox.push({}) }
     }
}


prisonerTransfer = function (prisoner,
                                otherDungeon,
                                ourDungeon,
                                notifier,
                                callback) {
     var keeper = ourDungeon.getOrc()
     var carriage = ourDungeon.getCarriage()
     var transfer = prepareTransfer(carriage, keeper, prisoner)
     if (transfer) {
       notifier.message(dungeon, transfer)
       callback()
     } else {
       callback(new Error("Transfer initiation failed."))
     }
   }
   function prepareTransfer(carriage, keeper, prisoner) {
￼return {} }

it("notifies other dungeons of the transfer", function (done) {
     prisonerTransfer("prisoner",
                      getOtherDungeon(),
                      getLocalDungeon(),
                      getNotifier(),
                      function (err) {
         assert.ifError(err)
         assert.equal(dungeon.inbox.length, 1)
         done()
}) })




function Notifier(backend) {
     this.backend = backend
}

function createMessageFromSubject(subject) {
     return {} // Not relevant for the example here.
￼}

Notifier.prototype.message = function (target, subject, cb) {
  var message = createMessageFromSubject(subject)
  backend.connectTo(target, function (err, connection) {
    connection.send(message)
    connection.close()
    cb()
}) }

var sinon = require("sinon")
   var connection = {
     send: function (message) {
// NOOP },
     close: function () {
       // NOOP
} }
   var backend = {
     connectTo: function (target, cb) {
       cb(null, connection)
     }
}
   describe("Notifier", function () {
     it("calls the backend and sends a message", function () {
		var backendMock = sinon.mock(backend)
		mock.expects("connectTo").once()
		var notifier = new Notifier(backendMock)
		var dungeon = {}
		var transport = {}
		notifier.message(dungeon, transport, function (err) {
      		mock.verify();
    })
}) })
```
