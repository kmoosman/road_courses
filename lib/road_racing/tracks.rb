class RoadRacing::Tracks

    attr_accessor :name, :location, :opened_date, :city, :state, :turns, :length
    @@tracks = []

    def self.all_tracks
        @@tracks
    end

    # def self.all_tracks
    #     doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_auto_racing_tracks_in_the_United_States#Road_courses"))
    #     doc.search("table.wikitable:nth-child(14)").each do |table|
    #        table.search("tr").each do |row| 
    #             track = self.new
    #             track.name = row.search("td:first-child a").text
    #             track.city = row.search("td:nth-child(2) a").text
    #             track.state = row.search("td:nth-child(3) a").text
    #             track.opened_date = row.search("td:nth-child(4)").text
    #             track.length = row.search("td:nth-child(6)").text
    #             track.turns = row.search("td:nth-child(7)").text
    #             @@tracks << track
    #         end 
    #       end
    #       @@tracks
    # end

end