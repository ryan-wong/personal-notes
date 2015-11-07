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

##Value Object
- define by its properties


Domain Event
- Event that trigger some kind of reaction
Mapping our actors out—creating a dependency graph for our domain
