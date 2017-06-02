class HomeController < ApplicationController

require 'nokogiri'
require 'open-uri'

def index

@mon = Haksick.find_by_day("월")
@tue = Haksick.find_by_day("화")
@wed = Haksick.find_by_day("수")
@thu = Haksick.find_by_day("목")
@fri = Haksick.find_by_day("금")
@sat = Haksick.find_by_day("토")

end

def get_bob

doc =Nokogiri::HTML(open("http://www.korea.ac.kr/user/restaurantMenuAllList.do?siteId=university&id=university_050402000000"))

for i in (1..6)

bob = Haksick.new

if i == 5 or i == 6

day = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//span.day").inner_text

bob.day = day

date = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//span.date//span")[0].inner_text + "/" + doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//span.date//span")[1].inner_text

bob.date = date

morning_a = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//p").inner_text.split("-")[1]

bob.morning_a = morning_a

lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//div:nth-child(4)").inner_text.split("-")[1]

bob.lunch = lunch

dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//div:nth-child(5)").inner_text.split("-")[1]

bob.dinner =dinner


else

  day = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//span.day").inner_text

  bob.day = day

  date = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//span.date//span")[0].inner_text + "/" + doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//span.date//span")[1].inner_text

  bob.date = date

  morning_a = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//p").inner_text.split("-")[1]

  bob.morning_a = morning_a

  morning_b = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//div:nth-child(4)").inner_text.split("-")[1]

  bob.morning_b = morning_b

  lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//div:nth-child(4)").inner_text.split("-")[1]

  bob.lunch = lunch

  dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//div:nth-child(5)").inner_text.split("-")[1]

  bob.dinner = dinner

    end

bob.save

  end

redirect_to '/'

end

end
