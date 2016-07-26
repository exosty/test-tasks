require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

class Automator
  include Capybara::DSL

  attr_accessor :login, :password, :app_name, :app_link, :standard_placement_name, :fullscreen_placement_name,
  :standard_slot_id, :fullscreen_slot_id, :link

  def initialize(login, password, app_name, app_link,
    standard_placement_name="standard placement", fullscreen_placement_name="fullscreen placement")

    Capybara.default_driver = :poltergeist
    Capybara.default_max_wait_time = 120

    @login = login
    @password = password
    @app_name = app_name
    @app_link = app_link
    @standard_placement_name = standard_placement_name
    @fullscreen_placement_name = fullscreen_placement_name
    @link = "https://target.my.com/"
  end

  def automate
    sign_in
    create_app_with_standard_placement
    add_fullscreen_placement
  end

  private

  def sign_in
    visit self.link

    find(".js-head-log-in").click
    fill_in('login', :with => self.login)
    fill_in('password', :with => self.password)

    find('.button_submit').click
  end


  def create_app_with_standard_placement
    click_link('Add App')

    fill_in('Site/app name', :with => self.app_name)
    fill_in('Enter site/app URL', :with => self.app_link)
    fill_in("Name of placement", :with => self.standard_placement_name)

    find('.format-item__image_standard').click

    find(".main-button__label").click

  end

  def add_fullscreen_placement
    open_app_page

    click_link("Create a placement")

    fill_in("Name of placement", :with => self.fullscreen_placement_name)

    find('.format-item__image_fullscreen').click

    find(".create-pad-page__save-button").click
  end

  def open_app_page
    fill_in('Search...', :with => "#{self.app_name}\n")
    find_link(self.app_name).click
  end

end
