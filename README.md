# Week 4: Bookmark Manager

### Day 1: Jihin and Shih Han

#### Create user stories and domain model.

First user story:

- As a user, I would like to be able to see a list of bookmarks.
  So I can make a decision on which bookmark to click on.

  Objects | Messages
  -----------|-----------
  Person |
  Bookmark Manager | list bookmarks

#### Setting up a web project

In a new git repo, run `bundle init` to create a new Gemfile. Inside the Gemfile, we entered a bunch of core gems that we usually use on top of Capybara, Rspec and Sinatra.
`bundle install` will install the gems.
`rspec --init` creates the base RSpec files.
We filled in the spec_helper file with the relevant `require`s.
We created a `config.ru` file and required our `app.rb`, as well as running the the app.
We created a `.gitignore` to ignore the coverage data.
We created a `app.rb` file and created app class.
We created `bookmark_spec.rb` for `all` method, and implemented into `bookmark.rb`.
We fixed the `spec_helper.rb`, because it couldn't reach the `app.rb` file.

We decided to hardcode the bookmarks into the `Bookmark` class. We called on the class in the `app.rb` file, saving it as an instance variable, and then calling on these instance variables in the `index.erb` file.
The result is a website that lists the pages.


#### Setting up a database, creating first table, manipulating table data

We first ran `brew install postgresql` to install PostgreSQL, a relational database.

`$ psql` enters into PostgreSQL, and from there we can use the cheatsheet to navigate and manipulate databases from the terminal:
https://blog.jasonmeridth.com/posts/postgresql-command-line-cheat-sheet/

http://www.cheat-sheets.org/sites/sql.su/

`\q` quits back to the terminal.

### Day 2: Jihin and Mary

#### Interating with PostgreSQL from Ruby

We will be doing this via a gem called pg. This is a module that allows Ruby programs to interact with PostgreSQL database.

I have renamed the `bookmark.rb` file to `link.rb`, and changed the class name to `Link`.
In order for pg to work, it needs to be included in the Gemfile, bundle installed, and then required in the `link.rb` file. From there, I followed the pg documentation:

http://zetcode.com/db/postgresqlruby/

Under the "Retrieving multiple rows of data" paragraph, I followed the syntaxing in order to connect to the database, selecting the data froml the database, and then tried the `rs.each do |row|` block. I then tried saving this all in the array. I ended up using the walkthrough to find out how to do this, and it turns out I would need to map through the hash and save it all in an array.

The tests have been adjusted to reflect the new bookmarks and the correct link formatting.

#### Upgrading your toolset

We downloaded Tableplus and connected to the `bookmark_manager` database. From here, we can edit the database easily.


#### Setting up a testing environment

I first enabled ENV in spec-helper. From there, I started working on the `link_spec.rb`. As I was adding the connection to the new test database, I realised that the test had no way to reset the database so that it would only show the information that would be included in the test.

Mary then pointed out that I needed to create a `setup_test_database.rb` file, which essentially acts like a script that clears the database whenever RSpec is run, so that the data would be correct.

In the tests for `link_spec.rb` and `app_spec.rb`, I reset the PG connection to the bookmark_manager_test database, and then run through the process of saving and then printing the row.

However, I realised while looking into the `app_spec.rb`, I have realised that while I'm running the test, the capybara test wouldn't pass. I spoke to Sam Jones mentioned that I needed to look into environment variables that can keep tabs of when RSpec is working. In order to implement this, I would need an `if` statement that checks if an environment variable is active. If it is, then it would select the test database. If not, it would select the standard database. 

In the end, this is a long winded way of stubbing the function of the database using a test database that wipes itself at each RSpec run.

#### Creating bookmarks

```
As a user, so that I can refer to them later, I want to save a bookmark.
```
