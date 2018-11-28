require "./divclass"

STDIN.each_line do |line|
  STDOUT.puts Divclass.translate(line)
end
