current_dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(current_dir)

require "grpc"
require "simple_vtuber_pb"

pb = Vtuber::Vtuber.new(
  name: "Kizuna AI",
  channel_id: "UC4YaOt1yT-ZeyB0OmxHgolA"
)

puts pb
