require 'spec_helper'
require 'board'

RSpec.describe Board do
  let(:dead) { DeadCell.new }
  let(:live) { LiveCell.new }
  let(:seed) do
    [[dead, dead, dead, dead],
     [dead, live, dead, dead],
     [dead, live, dead, dead],
     [dead, live, dead, dead],
     [dead, dead, dead, dead]]
  end
  let(:board) { Board.new(seed) }

  describe '#cells' do
    it { expect(Board.new.cells).not_to be_empty }
    it { expect(Board.new(seed).cells).to eq(seed) }
  end

  describe '#cell_at' do
    it { expect(board.cell_at(0, 0)).not_to be_alive }
    it { expect(board.cell_at(1, 1)).to be_alive }
    it { expect(board.cell_at(0, 5)).not_to be_alive }
  end

  describe '#alive_neighbors' do
    it { expect(board.alive_neighbors(0, 0)).to eq(1) }
    it { expect(board.alive_neighbors(1, 2)).to eq(2) }
    it { expect(board.alive_neighbors(0, 3)).to eq(0) }
  end

  describe '#tick!' do
    let(:new_board) { board.tick! }

    it { expect(new_board.cell_at(0, 0)).not_to be_alive }
    it { expect(new_board.cell_at(0, 1)).not_to be_alive }
    it { expect(new_board.cell_at(0, 2)).not_to be_alive }
    it { expect(new_board.cell_at(0, 3)).not_to be_alive }
    it { expect(new_board.cell_at(1, 0)).not_to be_alive }
    it { expect(new_board.cell_at(1, 1)).not_to be_alive }
    it { expect(new_board.cell_at(1, 2)).not_to be_alive }
    it { expect(new_board.cell_at(1, 3)).not_to be_alive }
    it { expect(new_board.cell_at(2, 0)).to be_alive }
    it { expect(new_board.cell_at(2, 1)).to be_alive }
    it { expect(new_board.cell_at(2, 2)).to be_alive }
    it { expect(new_board.cell_at(2, 3)).not_to be_alive }
    it { expect(new_board.cell_at(3, 0)).not_to be_alive }
    it { expect(new_board.cell_at(3, 1)).not_to be_alive }
    it { expect(new_board.cell_at(3, 2)).not_to be_alive }
    it { expect(new_board.cell_at(3, 3)).not_to be_alive }
  end
end
