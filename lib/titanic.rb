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

    "survival rate for all passengers: #{survival}%"
  end

  def women_survival_rate
    all_women = @table.select { |row| row['Sex'] == 'female' }
    female_survivors = @table.select { |row| row['Sex'] == 'female' && row['Survived'] == '1' }

    women_survival_rate = 100 * female_survivors.length / all_women.length

    "survival rate for women: #{women_survival_rate}%"
  end

  def men_survival_rate
    all_men = @table.select { |row| row['Sex'] == 'male' }
    male_survivors = @table.select { |row| row['Sex'] == 'male' && row['Survived'] == '1' }

    men_survival_rate = 100 * male_survivors.length / all_men.length

    "survival rate for men: #{men_survival_rate}%"
  end

  def survival_rate_by_class
    "survival rate by class: #{class_survival_rate(1)}% in 1st, #{class_survival_rate(2)}% in 2nd, #{class_survival_rate(3)}% in 3rd"
  end

  private

  def class_survival_rate(passenger_class)
    passengers_class = @table.select { |row| row['Pclass'] == passenger_class.to_s }
    class_survivors = @table.select { |row| row['Pclass'] == passenger_class.to_s && row['Survived'] == '1' }

    100 * class_survivors.length / passengers_class.length
  end
end

titanic = Titanic.new('titanic.csv')

puts titanic.survival_rate
puts titanic.women_survival_rate
puts titanic.men_survival_rate
puts titanic.survival_rate_by_class
