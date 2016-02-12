module Fetcher
  class TimeTable
    URL = 'http://zajecia.wmi.amu.edu.pl/plan_zaoczne/PlanZaoczne.aspx'

    def initialize
      require 'capybara'
      require 'capybara/poltergeist'

      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app, { timeout: 60, js_errors: false })
      end

      Capybara.javascript_driver = :poltergeist
      @session = Capybara::Session.new(:poltergeist)
    end

    def call
      @session.visit(URL)
      @sessio.fill_in '.form-group input#Semestr', '2016L'
      @session.find('.form-group #Button1').click
    end
  end
end
