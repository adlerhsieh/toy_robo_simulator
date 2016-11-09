require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'toy_robo_simulator'

def expect_no_attr_assigned_to_robo
  expect(robo.x).to be_falsey
  expect(robo.y).to be_falsey
  expect(robo.orientation).to be_falsey
end

def stub_console_output
  stub ToyRoboSimulator::Console, :puts
  stub ToyRoboSimulator::Console, :print
  stub ToyRoboSimulator::Robo,    :puts
  stub ToyRoboSimulator::Robo,    :print
end

def stub(klass, method)
  allow_any_instance_of(klass).to receive(method)
end
