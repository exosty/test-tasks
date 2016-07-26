# not sure if i should test private methods...
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara/dsl'
require 'automator'

RSpec.describe Automator do

  describe "#automate", :type => :feature do
    it "creates application with 2 placements on target.my.com" do

      automator = Automator.new("79174691168", "1234qwer", "AAC", "https://itunes.apple.com/en/app/angry-birds/id343200656?mt=8")
      automator.automate

      Capybara.default_driver = :poltergeist
      Capybara.default_max_wait_time = 120

      find_link("Apps").click
      fill_in('Search...', :with => "AAC")

      find_link("AAC").click
      find_link("standard placement").click
      expect(page).to have_content("slot_id")

      find("AAC").click
      find_link("fullscreen placement").click
      expect(page).to have_content("slot_id")
    end
  end
end
