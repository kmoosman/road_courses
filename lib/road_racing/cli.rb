class RoadRacing::CLI

    @input = nil
    @second_input = nil

    def call 
        first_action = nil
        puts "Welcome, let's learn about the Road Courses in the United States!"
        scrape
        puts "When you're ready, type 'list' to see the list of race tracks"
        first_action = gets.chomp.downcase
        if first_action == "list" || first_action == "list" "list "
            list 
        elsif first_action == "exit" || first_action == "exit "
            return
        else 
            puts  "Please type 'list' to begin the program or 'exit' to close."
            first_action = gets.chomp.downcase
        end
    
        select
    end

    def scrape
        @tracks = RoadRacing::Tracks.all_tracks
    end
    
    def list 
        @tracks.each_with_index do |track, i|
            #Check for the date the track was opened, if no date is available put unknown
            if track.opened_date.start_with?("1") || track.opened_date.start_with?("2")
                date = " | Opened in #{track.opened_date}"
            else 
                track.opened_date = "Unknown"
            end

            if i != 0 
                puts "#{i}. #{track.name}"
            end
            
        end
        puts "OR 'EXIT' to exit the program"
    end

    def select 
        while @input != "exit"
            puts "Select a track 1 - #{@tracks.count}"
            list
            @input = gets.chomp.downcase
            if @input.to_i > 0 && @input.to_i < @tracks.count + 1
                puts "You selected #{@tracks[@input.to_i].name}" 
                action
            elsif @input == "exit" || "exit "
                puts "Game Over. You have exited the program!"
            else 
                puts "Go Fish - Please enter a valid number from the in the list" 
                puts "Hit enter to try again"
                @input = gets
                if @input == "\n"
                 list
                else 
                    puts "Go Fish - Please enter a valid number from the in the list" 
                    puts "Hit enter to try again"
                end
            end

            
        end 

        

    end

    def action 
        puts "What would you like to know about this track?"
            list_track_options
        while @second_input != "5"   
            case @second_input
            when "1"
                puts "#{@tracks[@input.to_i].name} opened in #{@tracks[@input.to_i].opened_date}"
                puts "What else would you like to know?"
                list_track_options
            when "2"
                puts "#{@tracks[@input.to_i].name} is located in #{@tracks[@input.to_i].city}, #{@tracks[@input.to_i].state}"
                puts "What else would you like to know?"
                list_track_options
            when "3"
                puts "#{@tracks[@input.to_i].name}'s is #{@tracks[@input.to_i].length} long"
                puts "What else would you like to know?"
                list_track_options
            when "4"
                puts "#{@tracks[@input.to_i].name} has #{@tracks[@input.to_i].turns} turns"
                puts "What else would you like to know?"
                list_track_options
            when "5"
                list
            when @second_input == "exit" || @second_input == "exit "
                list
            else 
                puts "Opps, looks like you entered an invalid input. Try again."
                return
            end
        end 
    end

    def list_track_options
        puts "1. Year the track opened"
        puts "2. Location"
        puts "3. Length"
        puts "4. Number of turns"
        puts "5. Exit -> Go back to the list"
       @second_input = gets.chomp
    end

    
end