require_relative '../lib/titanic'

RSpec.describe Titanic do
  describe 'outputs survival rates' do
    let(:titanic) { Titanic.new('titanic.csv') }

    it 'outputs survival_rate' do
      expect(titanic.survival_rate).to eq('survival rate for all passengers: 38%')
    end

    it 'outputs women_survival_rate' do
      expect(titanic.women_survival_rate).to eq('survival rate for women: 74%')
    end

    it 'outputs men_survival_rate' do
      expect(titanic.men_survival_rate).to eq('survival rate for men: 18%')
    end

    it ' outputs survival_rate_by_class' do
      expect(titanic.survival_rate_by_class).to eq('survival rate by class: 62% in 1st, 47% in 2nd, 24% in 3rd')
    end
  end
end
