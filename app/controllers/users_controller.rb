# users_controller.rb
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:name).map { |user| user.to_pleaseant_string }.join("\n")
  end

  def login
    user_email = params[:email]
    user_password = params[:password]
    found = User.where(email: user_email, password: user_password).exists?
    render plain: found
  end

  def create
    user_name = params[:name]
    user_email = params[:email]
    user_password = params[:password]
    new_user = User.create!(
      name: user_name,
      email: user_email,
      password: user_password,
    )
    response_text = "Hey, your new user is created with the id #{new_user.id}"
    render plain: response_text
  end

  #def update
  #  id = params[:id]
  #  completed = params[:completed]
  #  todo = Todo.find(id)
  #  todo.completed = completed
  #  todo.save
  #  render plain: "Updated todo completed status to #{completed}"
  #end
end
