require 'open-uri'
require 'nokogiri'

class Restaurant < ActiveRecord::Base
  has_many :selections
  has_many :users, through: :selections

  def get_special
    today_special = ""
    if self.name == "CheeseBoard"
      today_special = self.cheese_board_scraper

      # store in database
      self.special = today_special
      self.save
    else
      today_special = self.special
    end

    return today_special
  end


  def cheese_board_scraper
    special_of_day = ""
    
    # parse html
    doc = Nokogiri::HTML(open('http://www.cheeseboardcollective.coop/pizza'))

    date_tues = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[2]').text
    pod_tues = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[1]').text

    date_wed = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[3]').text
    pod_wed = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[2]').text

    date_thurs = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[4]').text
    pod_thurs = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[3]').text

    date_fri = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[5]').text
    pod_fri = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[4]').text

    date_sat = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/h4[6]').text
    pod_sat = doc.xpath('//*[@id="body"]/div/div[2]/div[1]/p[5]').text

    # no pizza of the day on monday or sunday
    week_pizza = [[],[pod_tues],[pod_wed],[pod_thurs],[pod_fri],[pod_sat],[]]

    # check date
    today = Date.today
    if today.wday == 1 || today.wday == 7
      special_of_day = "There is no pizza of the day on Monday or Sunday"
    else
      special_of_day = week_pizza[today.wday][0]
    end

    # return special
    return special_of_day

  end

end
