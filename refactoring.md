#Bloater

##Long Method
- if you need to comment, new method
- > 10 lines
- move local variable evaluation into a function

##Large Class
- encapsulate domain object in their own classes
- subclass components
- make interface for class to reduce scope

##Long Parameter List
- change into a data object
- if pass in repeated field to multiple method, make a value object


##Data Clump
- groups of parameters pass into multiple methods
- abstract it into a class

##Primative Obsession
- Having a constant to represent a data value or enum
- primative type to represent a simple task
- instead make it a class by grouping those values


#Object oriented Abusers
##Switch statements
- should not have many if statements or need for switch statement
- switch should be polymorphism
- So Example:

```
class Client
	StateType state;

	method ()
		if (state.getState() == state.TYPE1)
		if (state.getState() == state.TYPE2)

class StateType
	TYPE1 = str
	TYPE2 = str

	getState()
	setState(newState)
```

##Refused Bequest
- if subclass doesn't use all parent methods
- either change parent class to remove unneeded methods into a child class or make the unused method a delegate in class

##Temporary Field
- a temp variable used in a method in algorithm
- hard to understand where they came from
- change temp variable into a method that returns the result of input going in ie return bar(a,b) + 34;
- put the operation inline with the rest of the equation
- temp variable are null other than these times

##Alternative Classes with Different Interfaces
- 2 class have same function but different name can be confusing

#Change Preventer

##Divergent Change
- make 1 feature change and class needs to make many changes to accomodate for it
- split behaviour of class so it doesn't happen

##Shotgun Surgery
- 1 feature change, changes many different classes
- make all class single responsibility principles

##Parallel Inheritance Hierarchies
- subclassing 1 class results in you subclassing another class
- treatment is make 1 class refer to the other class inside


#Dispensables

##Comments
- should not use comments whenever you can

##Duplicate Code

##Dead Code

##Lazy Class
- classes with in complete functionality

##Speculative Generality
- code made for just in case scenario

#Couplers

##Feature Envy
- access another object more than it's own set

##Incomplete Library Class
- have a read only library that you need to reimplement method
- create a fascade around library with method that encasulates the old functionality

##Message Chains
- A method calls another method and another method ...
- change chain method call into delegators

##Middle Man
- only has 1 action and delegate it to another class is not necessary

#Some refactor tricks

#Switch statements
- use switch statement rarely if you can avoid it
- fix it by having a static hashmap and refer to hashmap so setValue(type, hashmap[type])
- refactor function that multiple lines used

#Interface
- if multiple files have similar functions, extract out common function to interface and have them implement it
- you can extend interface

#Routes
- if routes are all similar, make a generic class and have each one implement it with generic template

#Return values form api
- make sure responses are consistent
- so return value should always be full objects not partial objects
- all parameters should be full objects unless formData
- make sure api path is consistent
- try to have validation done at a generic level

#Events
- events should be notifying others of something and not commanding them

#Naming
- name something what it does exactly
- cut down on verbs
- make sure the naming cannot be misinterupted
- make sure code is so readable they don't have to go into code and see what it does

#Code Standards
- Don't put Class or Object in variable or field or class name
- Always be consistent when returning objects, so always return full objects
- Only encapsulate private fields in functions
- Think logically in terms of real life objects. ie. Do if your human do you setType(angel)?
- always wrap basic services if they could potentially be a bottleneck point so you can handle a common response at first impact
- for curl service, wrap it so you can handle global errors in one place and send out events
- events should only broadcast an event has happened, not command someone else. If you want to command, control that object. Any event that cares about it, should change themselve in response.
- should have basic classes to handle connect to db related stuff. If you need to use other services in conjuction, create integration service. This service will have each service as delegate and wrap their delegate functions to do global functions.
- for every integration service, create an interface for what's passed in and services implement those interfaces. This way you can switch out the services very easily
- naming should be exactly what it does without being too long. Always in reference to the object its in. So if you say addField, that means as addField to class.
- should always have backend handle data manipulation and have ui respond to backend and not otherway around.
- for components, should always try to encapsulate it in object class. This way you can build out components very fast by just attaching fields it needs and not rebuild ui everytime. This also forces all ui to be the same look and you know it works.
- when naming variables, make sure it doesn't sound like a different variable type. For example, appFound sounds like boolean rather storing object found
- try to do evolutionary coding. Write code once, see what small thing you can refactor and refactor. Keep abstracting until you cant abstract further
- make sure lines are at 80 character long so people can show 2 files side by side and read it
- make each commit atomic aka each commit change 1 small thing. This way you can determine where a bug occur and revert it really easy.
- dont have no op functions
- if any duplicate code, refactor it with interface.
