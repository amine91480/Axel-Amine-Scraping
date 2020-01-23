require "nokogiri"
require 'open-uri'

deputee_page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50#pagination_deputes"))

def deputee_to_array(doc)
  array = []
  doc.xpath("//h2[contains(@class,'titre_normal')]").each do |name|
    array << name.content
    end
  puts array
end

def mail_deputee_to_array(doc)
  array = []
  #doc.xpath("//a[contains(@href,'mailto')]").each do |mail|
  doc.xpath('//li[.//span="Email : "]').each do |mail|
    
    full_str = mail.text
    mini_array = full_str.delete_prefix("Email : ").split
    puts mini_array.inspect
    array << mail
  end
end


mail_deputee_to_array(deputee_page)
#deputee_to_array(deputee_page)