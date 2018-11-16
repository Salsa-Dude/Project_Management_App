require "rails_helper"

describe 'User' do

  it 'Can create a new user with secure password' do
    @user = User.create(name: "Joe", username: "Joe", email: "Joe@gmail.com",
      password: "password")
    expect(User.find_by(name: "Joe")).to eq(@user)
    expect(@user.authenticate("password")).to eq(@user)
    expect(@user.authenticate("joe")).to eq(false)
  end

  it 'Can create a new project, format date and name' do
    @project = Project.create(name: "bob's project", description: "a cool project", status: "In Progress", due_date: Date.today)
    expect(@project.format_due_date).to eq(Date.today.strftime("%A, %B %d, %Y"))
    expect(@project.capitalize_stuff).to eq("Bob's Project")
  end
end
