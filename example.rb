# How should I launch a subprocess?
# Based on flow chart at https://stackoverflow.com/a/30463900

require_relative "rude.rb"
require_relative "subprocess_launcher.rb"

rude = Rude.new()
launcher = SubprocessLauncher.new()

rude.add_rule(launcher.method(:return_to_script), launcher.method(:block_until_completes), launcher.method(:use_exec))
rude.add_rule(launcher.method(:block_until_completes), launcher.method(:return_output), launcher.method(:interact_with_output))
rude.add_rule(launcher.method(:return_output), launcher.method(:use_backticks), launcher.method(:use_system))
rude.add_rule(launcher.method(:interact_with_output), launcher.method(:require_stderr), launcher.method(:use_fork))
rude.add_rule(launcher.method(:require_stderr), launcher.method(:require_stderr_stream), launcher.method(:use_popen))
rude.add_rule(launcher.method(:require_stderr_stream), launcher.method(:use_popopen3), launcher.method(:use_spawn))
rude.add_rule(launcher.method(:use_exec), nil, nil)
rude.add_rule(launcher.method(:use_backticks), nil, nil)
rude.add_rule(launcher.method(:use_system), nil, nil)
rude.add_rule(launcher.method(:use_popopen3), nil, nil)
rude.add_rule(launcher.method(:use_fork), nil, nil)
rude.add_rule(launcher.method(:use_popen), nil, nil)
rude.add_rule(launcher.method(:use_spawn), nil, nil)

puts "============================="
puts "Rude.rb example"
puts "============================="
puts "Generating random results..."

(1..10).each do |i|
    rude.check(launcher.method(:return_to_script))
    puts "-- " + i.to_s + " ---------------------------"
    puts "The result is: " + launcher.result
    puts "And the path was: " + rude.get_path
end
