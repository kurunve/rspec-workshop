require 'spec_helper'

RSpec.describe Warship do
  let(:challenger) { described_class.new(100, 20) }
  let(:defiant)    { described_class.new(50, 10) }

  # Кораблики делают пиу-пиу бластерами
  before(:each) do
    loop do
      break if challenger.state == :destroyed || defiant.state == :destroyed
      defiant.attack(challenger)
      challenger.attack(defiant)
    end
  end

  it 'у кого больше брони и кто мощнее стреляет, тот и победил' do
    expect(challenger.health).to be > defiant.health

    expect(challenger.state).to equal(:ok)
    expect(defiant.state).to    equal(:destroyed)
  end
end
