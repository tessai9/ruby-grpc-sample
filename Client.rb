current_dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(current_dir)

require "grpc"
require "vtuber_services_pb"

def main
  host = 'localhost:10001'
  stub = Vtuber::VtuberService::Stub.new(host, :this_channel_is_insecure)
  begin
    res = stub.search_vtuber(Vtuber::SearchRequest.new(id: '1'))
    p "#{res.name} : #{res.channel_id}"
  rescue GRPC::BadStatus => e
    puts "Failed: #{e.message}"
  end
end

main
