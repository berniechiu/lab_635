# Start at creating a namespace
namespace :db do
  desc "Fill database with initial data"
  # Ensure that the Rake task has access to the local Rails environment.
  task init_data: :environment do
    make_admins
  end
end

def make_admins
  # User.create! raises an exception for an invalid user rather than
  # returing false
  Admin.create!(email: "102938002@ntut.edu.tw", password: "lab635")
end