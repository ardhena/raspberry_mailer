module Fetcher
  class TimeTable
    URL = 'http://zajecia.wmi.amu.edu.pl/plan_zaoczne/PlanZaoczne.aspx'
    YEAR = 1.to_s
    SEMESTER = '2016L'

    attr_reader :session, :day

    def initialize(day)
      @day = day
    end

    def call
      setup_capybara
      get_table
    end

    private

    def get_table
      session.visit(URL)
      session.find(:select, 'Studia').find(:option, text: 'Informatyka - Licencjackie').select_option
      session.find(:select, 'RokStudiow').find(:option, YEAR).select_option
      session.find(:input, '#Semestr').set(SEMESTER)
      session.find(:input, '#datepicker1').set(day.to_s)
      session.find(:input, '#datepicker2').set(day.to_s)
      session.find(:button, 'Button1').click
      session.find_all('table#DataGrid1 tr').map{ |tr|
        tr.find_all('td').map{ |td|
          td.text
        }
      }.drop(1)
    end

    def setup_capybara
      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app, { timeout: 60, js_errors: false })
      end
      Capybara.javascript_driver = :poltergeist
      @session = Capybara::Session.new(:poltergeist)
    end
  end
end
