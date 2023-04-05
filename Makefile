# PizzaApp
# James Skon, Kenyon College 2022

CC= g++

#For Optimization
#CFLAGS= -O2
#For debugging
CFLAGS= -std=c++14  -Wno-deprecated-declarations

RM= /bin/rm -f

all: pizza 

pizzaEntry.o: pizzaEntry.cpp pizzaEntry.h
	$(CC) -c $(CFLAGS) pizzaEntry.cpp

pizzaDB.o: pizzaDB.cpp pizzaDB.h
	$(CC) -c $(CFLAGS) -I/usr/include/cppconn pizzaDB.cpp

pizza.o: pizza.cpp pizzaEntry.h	pizzaDB.h
	$(CC) -c $(CFLAGS) pizza.cpp

pizza: pizza.o pizzaDB.o pizzaEntry.o
	$(CC) pizza.o pizzaDB.o pizzaEntry.o -L/usr/lib -o pizza -L/usr/local/lib -lmariadbcpp


clean:
	rm -f *.o  pizza
