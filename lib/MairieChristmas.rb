require 'nokogiri'
require 'open-uri'

def profilage_de_mairies()
    begin
        cryptopage = Nokogiri::HTML(URI.open("https://annuaire-des-mairies.com/val-d-oise.html"))
        city_names = cryptopage.xpath('//a[contains(@href, "95")]/@href').map(&:text)

    rescue => exception
        puts "Adresse invalide."
        return false
    end

    #################################################################################################################################################################
    ##################### Il y a 185 villes mais on va en faire que quelques unes par respect pour la personne qui va corriger :-D ##################################
    ########################## On va également en parcourir beaucoup moins afin de pouvoir tester le RSPEC rapidement ! ### #########################################
    #################################################################################################################################################################

    for i in 0..9   #<<<(city_names.length-1)
        city_names[i][0] = ''
        begin
            temp_link = Nokogiri::HTML(URI.open("https://annuaire-des-mairies.com/"+city_names[i]))
            temp_mail = temp_link.xpath('//tr/td[contains(text(), "@")]').map(&:text)
            puts temp_mail
        rescue => exception
            puts "Adresse mail non trouvée."
            return false
        end
    end

    return true
end

profilage_de_mairies()