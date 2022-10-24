# Simple BUG MANAGMENT SYSTEM
  Users are of three types implmented using STI(Developer, Manager, QA).
  Mangers can create projects. Projects has tickets. Tickets are of two types implmented using STI(Bug, Ticket).
  Tickets can be created by QA. Developer can assign tickets to himself.
  Slient features of the system are:
  # Associations
  * Manager has_many :projects
  * bug has creator
  * bug has dev to solve
  * bug belongs to project
  * project has_many users
  * project has_many tickets

  # Validations
  * screenshot can only be of type .png and .gif
  * title, type and status must present in bug
  * title of a bug must be unique throughout the project

  # Use Cases
  * Register
  * Log In
  * Log out
  * User can enter bugs
  * manager can create project
  * manager can edit/delete its projects
  * Can add/remove dev/qa to its created projects
  * Dev can assign bugs to himself
  * Mark bug as resolved
  * QA can report the bugs

#### Ruby version
ruby 2.7

#### Rails version
rails 5.2

### System dependencies

#### Configuration
* Make sure to have ruby installed. You can check by running following command:
```console
$ ruby -v
```
* Make sure to have rails installed as well.
```console
$ rails -v
```
* Install and enable postgresql.
```console
$ sudo yum install postgresql-server postgresql-contrib
```
* Create postgres database cluster.
```console
$ sudo postgresql-setup initdb

```
* Install necessary gems.
```console
$ bundle install

```
* Create Stripe account and add stripe API in credentials.
```console
$ EDITOR=vim rails credentials:edit --environment=development

```
* Add card 5555 5555 5555 4444.

```
* Run following data to initialize DB with seed admin.
```console
$ rails db:seed

```
* Run Rails server.
```console
$ rails s

```
