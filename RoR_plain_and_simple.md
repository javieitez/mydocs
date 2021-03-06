# Basic concepts

#### MVC

* **M**odel -- Defines the objects on the DB, along with their relations and permissions
* **V**iew -- Sets the interface for the user to do things. Views are mostly _.hml.erb_ and _js_ files.
* **C**ontroller -- Defines the actions (Ruby methods) that are applied to the DB objects when the users do things on the views. 

#### REST

* **RE**presentational 
* **S**tate
* **T**ransfer: a set of standards for granting client-server complex interactions, regardless of the nature of the servers and browsers present at each end

#### CRUD

* **C**reate
* **R**ead
* **U**pdate
* **D**elete or **D**estroy

Both REST and CRUD are based on standard http methods: GET, POST, PUT and DELETE.

# Basic Setup
Make a new project and update all required gems. Also, initialize the folder for git

```shell
    rails new projectname
    cd projectname
    bundle update
    git init
```
At this point, you have a working project with a default page. No port or IP provided defaults to localhost:3000.
```shell
    rails server -b $IP -p $PORT
```
Next we need to create a controller and a view

    rails generate controller [Controller] [action]

The controller name and action can be anything and doesn't have to relate to what will be in the DB

    rails generate controller Welcome index
    rails generate controller StaticPages home help

After that, add to `config/routes.rb`

      root 'controller#action'

### Configure Resources

Add the plural name of your resources to `config/routes.rb`. IE: Articles in a blog

    resources :articles 

This will create the CRUD actions, check them with `rails routes`. Next, create the controller for these.
```shell
    rails generate controller Articles
```
Create the file `app/views/articles/new.html.erb` and add some content

### Define actions

define actions in `app/controllers/articles_controller.rb`

IE: to create new DB entry when submitting a form

```ruby
    def create
        @article = Article.new(article_params)
 
        @article.save
        redirect_to @article
    end
```

`article_params` must be defined as a private method at the bottom of the file, this allows the params code part to be reusable (IE: for the `update` action), which is the standard practice in both Ruby and Rails

```ruby
    private
      def article_params
        params.require(:article).permit(:title, :text)
      end
```

### Link_to
```HTML+ERB
    <%= link_to 'Published Articles', controller: 'articles' %>
```
the `link_to` method can link to a controller or to a path defined on routes.rb 


# Working with the DB: Migrations

Objects in methods are named using the singuler name (IE: _Book, Article, Product, user_). DB tables referring to these objects contain the pluralized names. Pluralization and singularization are automatic in most of the cases.

### Create the model

Use the controller's singular for the model name and specify the fields as parameters

    rails generate model Article title:string text:text

after the migration file is created under `db/migrate`, run

    rails db:migrate

to add the new fields to the db. Migrations are cumulative and reversible.

### Create, update and delete records

Use the `form_for` builder syntax. DB fields are preceded by a semicolon. 

IE: To submit articles to an **articles** table that contains **title** and **text** fields

```HTML+ERB
     <%= form_for :article, url: articles_path do |f| %>
     <p>
        <%= f.label :title %><br>
        <%= f.text_field :title %>
      </p>
       <p>
         <%= f.label :text %><br>
         <%= f.text_area :text %>
       </p><p>
         <%= f.submit %>
       </p>
     <% end %>
```
The `url: articles_path` parameter points to the POST path created when the `articles` resource was generated.

When the `form_for` for the object is submitted, the `new` and `save` methods for that object are called. The same goes for updating, using the `update` method. 

For deleting an exisiting entry, a link or a button can point to the `destroy` method. The confirmation is added on the html.erb file.

```HTML+ERB
<%= link_to 'Destroy', article_path(article),
              method: :delete,
              data: { confirm: 'u fuckin sure?' } %>
```

### List DB entries

Add to the view

```HTML+ERB
<% @articles.each do |article| %>
    <tr>
      <td><%= article.title %></td>
      <td><%= article.text %></td>
    </tr>
  <% end %>
```

### Validate the user's input

To validate an input on submission, add to `app/models/modelname.rb`

```ruby
    class Article < ApplicationRecord
      validates :title, presence: true,
                        length: { minimum: 5 }
    end
```
This will only return `false` when entering the article. Further actions must be defined on the object's controller under `app/controllers/controllername.rb`. IE:

```ruby
      if @article.save
        redirect_to @article
      else
        render 'new'
      end
```

### Model associations

You can create successive migrations (a second, third, etc.. set of DB objects to be added to the Database) and associate each entry with a DB entry of the previous model.

IE: 
You create users, and each user writes post. Each post belongs to a given user.
You create articles, and users comment on them. Each comment belongs to a user and to an article.

The relationship is set by using the type `references`

    rails generate model Comment commenter:string body:text article:references

this generates the following in the modelfile `app/models/comment.rb`

```ruby
    Class Comment < ApplicationRecord
      belongs_to :article
    end
```
The association needs to be declared on the other object as well

```ruby
    class Article < ApplicationRecord
      has_many :comments
      validates :title, presence: true,
                        length: { minimum: 5 }
    end
```

### Deleting associated records

The dependency is declared on the association itself:

add
```ruby
     dependent: :destroy
```
to 
```ruby
    class Article < ApplicationRecord
      has_many :comments, dependent: :destroy
      validates :title, presence: true,
                        length: { minimum: 5 }
    end
```
in the model file `app/models/(whatever).rb`. Rails takes care of everything else. 


