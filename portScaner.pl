:- use_module(library(socket)).


start(IP):-
    tcp_socket(Socket),
    port_test(Socket,33888,[a],2).


writer(0):- 
    writeln(' -- OPENED\n').

writer(1):-
    writeln(' -- CLOSED').
writer(2).



    
port_test(_,0,_,1):- 
    write(' -- CLOSED').
port_test(_,0,_,_):-
    write(' -- OPEN\n)').

port_test(Socket,PortNumber,[OpenPort|OtherPorts],X):-
    writer(X),
    write('Testing port : '),
    write(PortNumber),
	New_port is PortNumber -1,
	catch(tcp_connect(Socket,localhost:PortNumber), E,(Z=1)),
	port_test(Socket,New_port,[OpenPort|OtherPorts],Z).

