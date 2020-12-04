current_dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(current_dir)

require "grpc"
require "vtuber_services_pb"

class VtuberServer < Vtuber::VtuberService::Service
  def make_kizuna_ai
    Vtuber::Vtuber.new(
      name: "Kizuna AI",
      channel_id: "UC4YaOt1yT-ZeyB0OmxHgolA"
    )
  end

  def search_vtuber(req, _unused_call)
    Vtuber::SearchResponse.new(
      name: "Kizuna AI",
      channel_id: "UC4YaOt1yT-ZeyB0OmxHgolA"
    )
  end
end

def main
  server = GRPC::RpcServer.new
  server.add_http2_port('0.0.0.0:10001', :this_port_is_insecure)
  server.handle(VtuberServer)
  server.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
end

# vt = VtuberServer.new
# puts vt.make_kizuna_ai
main
