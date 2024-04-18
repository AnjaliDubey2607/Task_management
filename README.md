# Task_management
This is a simple task management(to-do list) application built with Ruby on Rails.


**Prerequisites**
Before you begin, ensure you have the following installed on your local machine: 
  Ruby : 3.2.2
  Rails : 7.1.3
  PostgreSQL


**Getting Started**
To get this application up and running on your local machine, follow these steps:

  **1. Clone the Repository**
  git clone https://github.com/AnjaliDubey2607/Task_management.git
  
  **2. Install Dependencies**
  cd todo-list-rails
  bundle install
  
  **3. Database Setup**
  configure database file with your PostgreSQL credentials and run the following command :
  rails db:create
  rails db:migrate

  **4. precompile the assets**
  rails assets:precompile

  **5. Start the Server**
  rails server
  Your application will now be running at http://localhost:3000.

  **6. Run Test Cases**
  bundle exec rspec
