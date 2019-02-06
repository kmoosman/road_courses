class RoadRacing::Tracks

    attr_accessor :name, :location, :opened_date, :city, :state, :turns, :length
    @@tracks = []

    def self.all_tracks
        @@tracks
    end

    def save
        @@tracks << self
    end

    def self.sorted_tracks
        @@tracks.sort_by {|track| track.name}.reverse
    end

end