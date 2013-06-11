# EM-Connectify: Transparent CONNECT support for any EventMachine protocol

Heavily based on igrigorik's [em-socksify](https://github.com/igrigorik/em-socksify), em-connectify provides a simple shim to send an eventmachine connection via an HTTP CONNECT proxy.

## Example
```ruby
class Handler < EM::Connection
  include EM::Connectify

  def connection_completed
    connectify('google.ca', 80) do
      send_data "GET / HTTP/1.1\r\nConnection:close\r\nHost: google.ca\r\n\r\n"
    end
  end

  def receive_data
    p data
  end
end

EM.run do
  EventMachine.connect PROXY_HOST, PROXY_PORT, Handler
end
```

What's happening here? First, we open a raw TCP connection to the CONNECT proxy (after all, all data will flow through it). Then, we provide a Handler connection class, which includes "EM::Connectify". Once the TCP connection is established, EventMachine calls the **connection_completed** method in our handler. Here, we call connectify with the actual destination host & port (address that we actually want to get to), and the module does the rest.

After you call connectify, the module temporarily intercepts your receive_data callbacks, negotiates the connection, and then once all is done, returns the control back to your code. Simple as that.

### Authorization

If you need to log into your proxy server, pass the username and password to `connectify` and em-connectify will send a `Proxy-Authorization: Basic` header.

```ruby
connectify('google.ca', 80, 'username', 'password')
```
