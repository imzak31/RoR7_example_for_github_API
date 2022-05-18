# README

  Check the Gemfile to take in count Ruby/Rails versions

* Be sure of setting up your database credentials.
* Run rake db:create && rake db:migrate

* Start the server with: rails s

* RUN ALL SPECS with rspec command inside the root folder. Please take into consideration that non-authenticated users has a limited number of requests per user.

* Check Routes file to check routes to test on Postman, or any HTTP client of your like.

- Important things to check: The service Objects structure, in order to modulate the app following Rails conventions of load    distribution.

# Things to Improve:

  * Apply Services namespace to have a clearer context of the Services usage. 
  * Create a Constants class inside the GithubConnections module, to avoid re-using of BASE_URL constant.
  * Create more spec cases. (There is always something more to test, folks!)
