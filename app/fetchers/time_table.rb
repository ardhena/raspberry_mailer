module Fetcher
  class TimeTable
    URL = 'http://zajecia.wmi.amu.edu.pl/plan_zaoczne/PlanZaoczne.aspx'

    attr_reader :session

    def initialize
      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app, { timeout: 60, js_errors: false })
      end

      Capybara.javascript_driver = :poltergeist
      @session = Capybara::Session.new(:poltergeist)
    end

    def call
      @session.visit(URL)
      @session.select 'ZL-INF', from: 'Studia'
      @session.select '1', from: 'RokStudiow'
      @session.fill_in '.form-group input#Semestr', with: '2016L'
      @session.find('.form-group #Button1').click
    end
  end
end
