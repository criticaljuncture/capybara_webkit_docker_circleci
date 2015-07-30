require 'spec_helper'

feature "Homepage" do
  scenario "contains a greeting", :js do
    visit "/"
    expect(page).to have_text("Hello, world!")
  end
end
