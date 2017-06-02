require 'nokogiri'

require 'open-uri'

doc =Nokogiri::HTML(open("http://www.korea.ac.kr/user/restaurantMenuAllList.do?siteId=university&id=university_050402000000"))

for i in (1..6)

if i == 5 or i ==6

day = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//span.day").inner_text

puts day

date = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//span.date//span")[0].inner_text + "/" + doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//span.date//span")[1].inner_text

puts date

morning_a = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//p").inner_text.split("-")[1]

puts morning_a

lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//div:nth-child(4)").inner_text.split("-")[1]

puts lunch

dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//div:nth-child(5)").inner_text.split("-")[1]

puts dinner


else
day = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//span.day").inner_text

puts day

date = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//span.date//span")[0].inner_text + "/" + doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//span.date//span")[1].inner_text

puts date

morning_a = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//p").inner_text.split("-")[1]

puts morning_a

morning_b = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//div:nth-child(4)").inner_text.split("-")[1]

puts morning_b

lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//div:nth-child(5)").inner_text.split("-")[1]

puts lunch

dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{2*i+1})//div:nth-child(6)").inner_text.split("-")[1]

puts dinner

end

end
