require 'spec_helper'

describe ToyRoboSimulator::Table do
  subject { ToyRoboSimulator::Table.new(2,3) }
  it '#init' do
    expect(subject.x).to eq 2
    expect(subject.y).to eq 3
  end
end
