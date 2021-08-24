require 'csv'
require 'byebug'

class Titanic
    def initialize(csv_file)
        file = File.open(csv_file)
        @table = CSV.parse(File.read(file), headers: true)
    end

    def survival_rate
        passengers = @table.by_col[1]
        passengers.map!(&:to_i)
        survival = 100 * passengers.sum / passengers.length

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

    def survival_rate_by_class
        first_class_survival_rate
        second_class_survival_rate
        third_class_survival_rate
        
        puts "survival rate by class: #{first_class_survival_rate}% in 1st, #{second_class_survival_rate}% in 2nd, #{third_class_survival_rate}% in 3rd"
    end

    private
    def first_class_survival_rate
        first_class = @table.select { |row| row["Pclass"] == "1" }
        first_class_survivors = @table.select { |row| row["Pclass"] == "1" && row["Survived"] == "1" }

        first_class_survival_rate = 100 * first_class_survivors.length / first_class.length
    end

    def second_class_survival_rate
        second_class = @table.select { |row| row["Pclass"] == "2" }
        second_class_survivors = @table.select { |row| row["Pclass"] == "2" && row["Survived"] == "1" }

        second_class_survival_rate = 100 * second_class_survivors.length / second_class.length
    end

    def third_class_survival_rate
        third_class = @table.select { |row| row["Pclass"] == "3" }
        third_class_survivors = @table.select { |row| row["Pclass"] == "3" && row["Survived"] == "1" }

        third_class_survival_rate = 100 * third_class_survivors.length / third_class.length
    end
end

titanic = Titanic.new("titanic.csv")

titanic.survival_rate
titanic.women_survival_rate
titanic.men_survival_rate
titanic.survival_rate_by_class
