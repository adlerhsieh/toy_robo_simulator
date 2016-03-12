require 'spec_helper'

describe 'Command Line' do
  subject { ToyRoboSimulator::Console }
  before do
    stub_console_output
  end
  describe 'runs' do
    before do
      @console = subject.new
      @robo    = @console.robo
    end
    describe 'MOVE' do
      context 'with args' do
        let(:y) { 3 }
        before do
          @console.run("place 1 #{y} north")
          @console.run('move 1')
        end
        it 'is invalid' do
          expect(@robo.y).to eq y
        end
      end
      context 'with no arg' do
        context 'called before #place' do
          before do
            @console.run('move')
          end
          it 'is invalid' do
            expect_no_attr_assigned_to_robo
          end
        end
        context 'called after #place' do
          context 'out of range' do
            let(:x) { 5 }
            before do
              @console.run("place #{x} 0 east")
              @console.run('move')
            end
            it 'does not move' do
              expect(@robo.x).to eq x
            end
          end
          context 'within range' do
            let(:x) { 1 }
            let(:y) { 1 }
            context 'and the robo facing north' do
              let(:orientation) { :north }
              before do
                @console.run("place #{x} #{y} #{orientation}")
                @console.run('move')
              end
              it 'moves robo 1 unit towards north' do
                expect(@robo.x).to eq(x)
                expect(@robo.y).to eq(y + 1)
                expect(@robo.orientation).to eq orientation
              end
            end
            context 'and the robo facing west' do
              let(:orientation) { :west }
              before do
                @console.run("place #{x} #{y} #{orientation}")
                @console.run('move')
              end
              it 'moves robo 1 unit towards west' do
                expect(@robo.x).to eq(x - 1)
                expect(@robo.y).to eq(y)
                expect(@robo.orientation).to eq orientation
              end
            end
            context 'and the robo facing south' do
              let(:orientation) { :south }
              before do
                @console.run("place #{x} #{y} #{orientation}")
                @console.run('move')
              end
              it 'moves robo 1 unit towards south' do
                expect(@robo.x).to eq(x)
                expect(@robo.y).to eq(y - 1)
                expect(@robo.orientation).to eq orientation
              end
            end
            context 'and the robo facing east' do
              let(:orientation) { :east }
              before do
                @console.run("place #{x} #{y} #{orientation}")
                @console.run('move')
              end
              it 'moves robo 1 unit towards east' do
                expect(@robo.x).to eq(x + 1)
                expect(@robo.y).to eq(y)
                expect(@robo.orientation).to eq orientation
              end
            end
          end
        end
      end
    end
  end
end
