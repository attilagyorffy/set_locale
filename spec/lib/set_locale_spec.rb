require 'spec_helper'

RSpec.describe SetLocale do

  describe '.initialize' do
    describe 'strategies' do
      subject { SetLocale.strategies }

      context 'with strategies already set' do
        before do
          class SetLocale::Strategies::One; end
          class SetLocale::Strategies::Two; end

          SetLocale.strategies = [:one, :two]
          SetLocale.initialize
        end

        it 'leaves strategies unaffected' do
          expect(subject).to eql([SetLocale::Strategies::One, SetLocale::Strategies::Two])
        end
      end

      context 'with strategies unset' do
        before do
          SetLocale.initialize
        end

        it 'sets strategies to the DEFAULT_STRATEGIES' do
          defaults = [SetLocale::Strategies::Parameter, SetLocale::Strategies::Cookie]
          expect(subject).to eql(defaults)
        end
      end
    end
  end
end
