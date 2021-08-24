require 'csv'
require 'byebug'

class Titanic
    def initialize(csv_file)
        file = File.open(csv_file)
        @table = CSV.parse(File.read(file), headers: true)
    end

    def survival_rate
        array = @table.by_col[1]
        array.map!(&:to_i)
        survival = 100 * array.sum / array.length

        puts "survival rate for all passengers: #{survival}%" 
    end

    def women_survival_rate
        all_women = @table.select { |row| row["Sex"] == "female" }
        female_survivors = @table.select { |row| row["Sex"] == "female" && row["Survived"] == "1" }
        
        women_survival_rate = 100 * (female_survivors.length) / (all_women.length)

        puts "survival rate for women: #{women_survival_rate}%"
    end

    def men_survival_rate
        all_men = @table.select { |row| row["Sex"] == "male" }
        male_survivors = @table.select { |row| row["Sex"] == "male" && row["Survived"] == "1" }

        men_survival_rate = 100 * (male_survivors.length) / (all_men.length)

        puts "survival rate for men: #{men_survival_rate}%"
    end
end

titanic = Titanic.new("titanic.csv")

titanic.survival_rate
titanic.women_survival_rate
titanic.men_survival_rate
