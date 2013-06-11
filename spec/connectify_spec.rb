require File.expand_path('../lib/em-connectify', File.dirname(__FILE__))

describe EventMachine do

  it "should negotiate a connect connection" do

    class Handler < EM::Connection
      include EM::Connectify

      def post_init
        puts "asdhi"
      end

      def connection_completed
        connectify('google.ca', 80, 'conrad', 'conrad') do
          puts "ping"
          send_data "GET / HTTP/1.1\r\nConnection:close\r\nHost: google.ca\r\n\r\n"
        end.callback do
          puts "ping"
        end.errback do |e|
          puts e
        end
      end

      def receive_data(data)
        @received ||= ''
        @received << data
      end

      def unbind
        @received.size.should > 0
        @received[0,4].should == 'HTTP'
        EM.stop
      end
    end

    EM::run do
      EventMachine.connect '127.0.0.1', 8080, Handler
    end

  end

end
