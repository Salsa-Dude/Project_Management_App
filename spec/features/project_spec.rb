require 'rails_helper'

describe 'navigate' do
  before do
    @project = Project.create(name: "Make Cookies", description: "baking some cookies", status: "Complete", due_date: Date.today)
  end

  it 'shows the name on the show page in an h1 tag' do
    visit "/projects/#{@project.id}"
    expect(page).to have_css("h1", text: "Make Cookies")
  end

  it 'shows the description on the show page in a p tag' do
    visit "/projects/#{@project.id}"
    expect(page).to have_css("p", text: "baking some cookies")
  end
end
