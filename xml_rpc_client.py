import xmlrpclib

calc =  xmlrpclib.ServerProxy("http://localhost:8080/")
print(str(calc.add(3,2)))
print(str(calc.sub(3,2)))
print(str(calc.mul(3,2)))
print(str(calc.div(4,2)))