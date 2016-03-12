require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'toy_robo_simulator'

def expect_no_attr_assigned_to_robo
  expect(@robo.x).to be_falsey
  expect(@robo.y).to be_falsey
  expect(@robo.orientation).to be_falsey
end

def stub_console_output
  allow_any_instance_of(ToyRoboSimulator::Console).to receive(:puts)
  allow_any_instance_of(ToyRoboSimulator::Console).to receive(:print)
  allow_any_instance_of(ToyRoboSimulator::Robo).to receive(:puts)
  allow_any_instance_of(ToyRoboSimulator::Robo).to receive(:print)
end
