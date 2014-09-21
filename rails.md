#Rails Folder Structure
- app -> model, view , controller code
- bin -> helper scripts (bundle, rake, rails
- config -> app, database, route configuration)
- db -> database schema vs database migration
- Gemfile -> specify Gems to use
- lib -> rails liibrary file
- log -> applicatiion logging diirectory
- public -> css, javascript, images, 404.html
- test -> unit test are
- tmp -> store cache
- vendor -> vendor packages

#Scaffolding
This makes new Rails app.
```rails new blog```
This makes model, controller,test.
```rails generate scaffold post title:string body:text```
```rails generate scaffold comment post_id:integer body:text```
Put those tables iinto schema.
```rake db:migrate```
Thiis List Out all Routes
```rake routes```

#rails philosphy
##convention over configuration
common web app configurations re provided for you, use them, don't fight them.
>##Naming Convention
>Model
>model_controller
>##Active Record
>All database column names are put into actiive record model, active record will put them into the database.
>Can specify Relationship across classes
> Classes -> Tables
> Object  -> Rows
> Attriibutes -> columns
>###Query Interface
>```
Model.all
Model.first
Model.find_by(1)
Model.find_by_field(param)
```
>###Association
>relationship|Model with no foreign key| Model with foreign key|
|:-------:|:-------:|:-------:|
1:1|has_one:class|belongs_to:class|
N:1|has_many:class|belongs_to:class|
N:N|has_and_belongs_to_many:class|*:class|
>To access join, Model.all[0].join_table
> can add another field dependant: :destroy, to destroy foreign key row if model is destroyed
>###Callbacks
>Bind hooks to active record at different points of active record lifecycle
>####Validation
>You can add validation to create,save, update triggers
```
validates_presence_of :field
validates_numericality_of :field, :only_integer => true
validates_confirmation_of : field
validates_length_of :field, :in miinlength..maxlength
```
##dry dont repeat yourself
every piece of code should not be repeated across the system.
use code generators to prevent copy and pasting of code.
##Testing
>###test driven development
>Write Test for Code first then write Code to satisfy the Code.
>###Behaviour Driven Development
>Determine behaviour of code first, then write code to satisfy the behaviour.
>Behaviour is determiined in natural language.
>Rspec and cucumber are BDD tools.

#Database
- run on different environment rails server -e production
- databases are specified iin db/database.yml

#Command Line
Can inspect current rails application instance
```
rails console
```
Repl
```
ruby -e `puts "Hello World"`
irb
#Routes
##Nested tables
When a table depends on another table, want to put them under same controller.
```
resources :model do
	resources :dependancy
end
```

#Security
>sql injection - inserts in sql as input that disrutes database.
>cross site scripting - storing html/css/javscript that makes an appearance on the website to be malicious.
>buffer overflow - when the input is too large for the programming language to process and crash site.

#Ruby
```
puts "Text"
```
Classes are in CamelCase.
Functions use _.
Must access member variables with getters/setters.
```
class Foo
	@boo #instance variable
	def my_method
		@foo = 2
	end
	def boo=(val) #setter
		@boo = val
	end
	def boo #getter
		return @boo
	end
	def self.class_method #class method or static methods 
		"blah"
	end
end
mc = Foo.new
mc.method
mc.boo # error
```

Last thing Evaluated is returned.
If you add end to end of statement, it will return that value
Parentheses are optional when calling a function