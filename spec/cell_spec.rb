require 'spec_helper'
require 'cell'

RSpec.describe DeadCell do
  describe '#alive?' do
    it { expect(DeadCell.new).not_to be_alive }
  end

  describe '#evolve!' do
    it { expect(DeadCell.new.evolve!(3)).to be_alive }
    it { expect(DeadCell.new.evolve!(1)).not_to be_alive }
    it { expect(DeadCell.new.evolve!(2)).not_to be_alive }
    it { expect(DeadCell.new.evolve!(4)).not_to be_alive }
  end
end

RSpec.describe LiveCell do
  describe '#alive?' do
    it { expect(LiveCell.new).to be_alive }
  end

  describe '#evolve!' do
    it { expect(LiveCell.new.evolve!(2)).to be_alive }
    it { expect(LiveCell.new.evolve!(3)).to be_alive }
    it { expect(LiveCell.new.evolve!(1)).not_to be_alive }
    it { expect(LiveCell.new.evolve!(4)).not_to be_alive }
  end
end
