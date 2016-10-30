require_relative './command_parser'

argv = ARGV
err=STDERR

if argv.empty?
  err.puts("Invalid command detected. Valid commands are:\n  PLACE X,Y,F\n  MOVE\n  LEFT\n  RIGHT\n  REPORT")
else
  CommandParser.new(argv)
end