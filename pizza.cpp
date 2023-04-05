
#include <iostream>
#include <fstream>
#include <string>
#include <map>

#include "pizzaDB.h"
#include "pizzaEntry.h"
const int port = 5006;

using namespace std;

int main () {

  pizzaDB pDB;
  vector<pizzaEntry> results;
  string in = "1";
   
  while (in != "3") {

    if (in == "1") {
      results = pDB.find("");
      for (int i = 0; i<results.size(); i++) {
	cout << results[i].text() << endl;
      }
      
    } else if (in == "2") {
      string name, address, rating;
      cout << "name: ";
      getline(cin,name);
      cout << "address: ";
      getline(cin,address);
      cout << "rating: ";
      getline(cin,rating);
      pDB.addEntry(name,address,rating);
    }
    cout << "1. List, 2. Add: 3. Done";
    getline(cin,in);
  }
}
