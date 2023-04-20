require 'nokogiri'
require 'open-uri'

begin
    cryptopage = Nokogiri::HTML(URI.open("https://annuaire-des-mairies.com/val-d-oise.html"))
    city_names = cryptopage.xpath('//a[contains(@href, "95")]/@href').map(&:text)

rescue => exception
    puts "Adresse invalide."
end

for i in 0..city_names.length-1
    city_names[i][0] = ''
    begin
        temp_link = Nokogiri::HTML(URI.open("https://annuaire-des-mairies.com/"+city_names[i]))
        temp_mail = temp_link.xpath('//tr/td[contains(text(), "@")]').map(&:text)
        puts temp_mail
    rescue => exception
        puts "Adresse mail non trouvée."
    end
end