#Painless Plugin

##Plugin Types
- Main application have ports for plugin to bind too
- plugin attach to main application and a plugin can attach to that plugin
- multiple plugin can connect to main application and connect to each other

###Main application
- plugin holes are optional
- class that peg the hole are classes that implement that interface
- try reducing cardinality to <= 2 or too coupled
- The plugin framework should be able to assemble the components according to the types of the classes they contain.
- The framework should form a platform on top of which an application can run
- We want plugins to work as automatically as possible, so that the right interfaces and classes from each component are detected, loaded and bound by the framework without the developer having to do any extra work. The matching of components should be taken care of by the framework.
- The developer should not be forced to design their software in a particular way, to make extensive calls to an API, or to write complex descriptions of their components in any form of architecture definition language. There should be no particular installation procedure that needs to be gone through in order to add a component
- matching is performed using Java’s reflection, custom loading and dynamic linking features, which allow classes to be inspected at runtime.
- Any object can register with the platform as an observer [6], so that it can be notified whenever a new binding is made to the component to which that object belongs (i.e. the component containing the class from which that object was created). The platform calls a method in each observer from the component that contains the interface (hole) that was matched, passing a reference to the newly instantiated object (peg). A list of instantiated pegs is maintained to ensure that in the case where a certain class implements several different interfaces, that class is instantiated only once, rather than once per interface. T
- getClass().getClassloader() method to identify which Component it is associated with, without having to keep our own records (keeping such records would be difficult anyway)
- by allowing the developer to include a special constant, cardinality in any of the Java interfaces in their components.
- currently plugin components are placed in a specific directory and discovered when the application starts up, but the mechanism could easily be altered to allow plugins to be added at any time during execution)
- discovers the set of available plugins, reads their manifests and builds an in-memory plugin registry.
- the actual Java interfaces implemented by classes in plugins are interrogated using reflection, and this information is used to organise and connect components.

Platform Class
- port (Adder)
- strategy (Return appropriate class)
- list of components
- bindEach(component)
- loadPlugins ()
	- use reflection to retrieve components
	- look through all class and interface and determine how it will connect with system
	- compatability with each of the interfaces in each of the other components currently in the system

App Class
- port (Extension)


```
class A implements Notifiable {
 	PluginManager.getInstance().addObserver(this);
    void pluginAdded( Object o ) {
        //do something with the new plugin
        //method which the platform calls to notify the observer that a new plugin has been connected and pass the object reference.
    }
}
```


```
interface Strategy {
	Binding prefer (Binding this, Binding that);
}

interface Inhabitant {
  final static int cardinality = 6;
move();
draw();
}

class Fish {
  draw() { ... }
}

class GoldFish
extends Fish
implements Inhabitant {
  getColor() { ... }
  move() { ... }
}


#Modeling a framework fro plugins

```
Class System {
	constructor(IPlugin[])
	start()
	_bind(IPlugin, App)
	_canBind(IPlugin, App) : Boolean
}
//finds out which plugin is an App and bind to it and start that App
//bind manually or auto bind
//_bind checks if IPlugin can add to another plugin with _canBind then binds the plugin
//should we use init() function so can create it first and bind after
//should have preferred plugin as well

Class App implements IApp{
	//is a component
	constructor(holes)
}

Class Plugin {

}

Interface IApp implements IPlugin {
	name: string
}

Interface IPlugin {
	holes: IHole
	getPegInterface(): IPeg
	getManifest(): Object
	getHoles(): IHole
	addPlugins(IPlugin[]): IPlugin
	prefer(IPlugin[]): IPlugin
	_match(IPlugin)
	_best(IPlugin[])
}
//_best calls _match inside prefer inside addPlugins

Interface IHole {
	type: string
}

Interface IPeg {
	type: string
}

Interface IService {
	type: string
	getInstance() : IService
}
```
