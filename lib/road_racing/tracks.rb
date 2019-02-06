class RoadRacing::Tracks

    attr_accessor :name, :location, :opened_date, :city, :state, :turns, :length
    @@tracks = []

    def self.all_tracks
        @@tracks
    end

    def save
        @@tracks << self
    end
end