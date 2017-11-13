# Newsly

# What is this project?
## Overview
## Features

# Programs I Use
## Why Vue
  - For those coming from a React background Vue offers many advantages,
  * Redux is now Vuex and react-router-dom now is router-link. No more worrying about third party library support, or competing/outdated versioning, for these necessary tools.
  * Vuex contains stateful saving of objects whereas Redux reducers save objects inside Case/Switch statements. This can lead to edge case shadowing of Reducer objects and lead to very difficult reasoning for the developer.
  * Vue has an EventBus as a first level abstraction from the Vue object. This allows scoped sharing of variables between components without using Vuex or dealing with props callback hell. Incredibly useful!
  * Mapping subcomponents to be rendered as children can be awkward in React, and renderIf is not a native component (although this is more awkward than deal breaking). Now both of these features are intuitively defined as `v-for` and `v-if`
  - For those coming from an Angular background,
  * No use of JSX, everything is in native HTML with javascript living in a object under the template.
  * [Vue is Gaining Popularity](https://medium.com/unicorn-supplies/angular-vs-react-vs-vue-a-2017-comparison-c5c52d620176)
## Why Phoenix
 - Phoenix is a cool functional programming language that is build on Elixir which is itself built on Erlang (which uses the BEAM vm). As Erlang was originally a routing language designed to be used for telephone routing in the early 70s it allows for high amounts of routing.
 - Phoenix is an opinionated framework, like Rails, which allows for neat generator functions which makes life easier, as well as a nice boilerplate structure tor work with.
 - Because the Rails ORM has high cost per read/write operation it does not scale as well as it could. It is a good language to learn on, but not necessarily to grow with in a modern approach. Phoenix has the benefit of the symantics of Rails without the cost.
 - Phoenix is growing in popularity.
 - Learning new languages is fun!


# How this Program is Organized

![Screenshot](/NewslyProgramSpecs.jpg?raw=true "Program Specs")


# Useful Bash Commands
## For the Phoenix Backend
To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
- To get datatables in postgres: sudo mix do ecto.drop, ecto.create, ecto.migrate
- To generate models (example): mix phx.gen.schema Articles article user:string articleurl:string articletitle:string upvotes:integer downvotes:integer flaggedcount:integer
- `mix phoenix.gen.html Comments comment body:string user:string upvotes:integer downvotes:integer flaggedcount:integer article_id:references:article`
## For the Vue.js Frontend
- To install vue (from scratch):
- To spin up frontend: `npm install, npm run dev`
- To move to production:


# Programming Documentation
- Vue documentation is first in-class and an excellent resource: [Vue Docs](https://vuejs.org/v2/guide/)
- Phoenix Documentation as well: [Phoenix Docs](https://hexdocs.pm/phoenix/Phoenix.html)
- Because Phoenix is built on elixir it is useful to have a cheatsheet on how to use basic functionality. This will go from the basics of `IO.puts` to advanced GNServe models. [Elixir School](https://elixirschool.com/en/)
- Documentation for the Ecto model (the 'go-to' library that handles database storage in Phoenix): [Ecto Docs](https://hexdocs.pm/ecto/Ecto.html)


# Other Useful Links on How to Do Things

- [Deploying Elixir to AWS Elastic Beanstalk with Docker](https://robots.thoughtbot.com/deploying-elixir-to-aws-elastic-beanstalk-with-docker). Generally speaking Docker documentation is *not* first class and the tooling has a very non-orthogonal topology (many ways to do many things), even though the tool is very useful and cool. For more help, it is advisable to ask on **IRC @ freenode#Docker**
- It is also possible to deploy using a service called [Nanobox](nanobox.io), which I have done in the past for a previous application [NotaHotdog](pennydrop.nanobox.io). You can learn more here:
[How to Deploy Phoenix Applications to AWS Using Nanobox](https://content.nanobox.io/how-to-deploy-phoenix-applications-to-aws-using-nanobox/)
- Somewhat surprisingly uploading pictures to S3 with Phoenix is a well documented problem. Here is one (of many) blog posts on the topic [Upload Files to S3 With Phoenix and Ex_Aws](https://alexgaribay.com/2017/01/20/upload-files-to-s3-with-phoenix-and-ex_aws-2/)
- Phoenix uses a non-intuitive approach to returning formatted json objects by using the views handlers. Radar on Github was extraordinarily kind enough to provide a working example (which is probably better than what is shown here). If you would like to learn more please see [Radar's Super Cool Example](https://github.com/radar/phoenix-views-example)


# What's Left to Do / Next Steps
- Currently my picture S3 handling doesn't have an option to delete pictures, that needs to happen.
- Secure authentication is not yet implemented. This should definitely be done to protect user data
- Some refactoring is definitely in order. Major planned revisions include:
* Defmodules in Phoenix Application need to be renamed to be as intuitive as possible
* Track scope of all sockets and see if some can be combined and others eliminated.
