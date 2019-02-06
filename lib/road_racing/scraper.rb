class RoadRacing::Scraper

    def self.scrape_tracks
        doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_auto_racing_tracks_in_the_United_States#Road_courses"))
        doc.search("table.wikitable:nth-child(14)").each do |table|

           table.search("tr").each do |row| 
                track = RoadRacing::Tracks.new
                track.name = row.search("td:first-child a").text
                track.city = row.search("td:nth-child(2) a").text
                track.state = row.search("td:nth-child(3) a").text
                track.opened_date = row.search("td:nth-child(4)").text
                track.length = row.search("td:nth-child(6)").text
                track.turns = row.search("td:nth-child(7)").text
                track.save
            end 
          end
    end

end

#create a scraper class 
#bonus challenge list tracks, sort by name. Show and error when the number is out of range 