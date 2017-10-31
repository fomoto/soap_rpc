require "xmlrpc/server"

s = XMLRPC::Server.new(8080)

s.add_handler("add") do |a,b|
  a + b
end

s.add_handler("sub") do |a,b|
  a - b
end

s.add_handler("mul") do |a,b|
  a * b
end

s.add_handler("div") do |a,b|
  if b == 0
    raise XMLRPC::FaultException.new(1, "division by zero")
  else
    a / b
  end
end

s.set_default_handler do |name, *args|
  raise XMLRPC::FaultException.new(-99, "Method #{name} missing" +
                                   " or wrong number of parameters!")
end

s.serve