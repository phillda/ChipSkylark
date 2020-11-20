#include <iostream>
#include <fstream>
#include <cstdlib>
#ifndef _readAsynch_def
  #define _readAsynch_def
  #include "asynchConv.h"
#endif

using namespace std;

int main()
{
	// Initialize all variables
	ifstream circuit;
	string paths, temp_string1, temp_string2, data_string;
	int path_count = 0;
	int num_cells = 0;
	bool start = false;
	bool cell_name = false;
	
	
	// Open the delay path file
	circuit.open("TMULT.timing");
	
	
	// Check if the file was successfully opened
	if (!circuit){	
		cout << "Unable to open file \n";
		exit(1);
	}

	if(circuit.is_open()){
		
		// Initial PTR for the struct data 
		cell_struct *ptr;
		ptr = new (nothrow) cell_struct [7];
		
		while(circuit){

			// inputs the file, line by line
			getline(circuit, paths);
			
			// This if statement tells the program a path is coming up soon
			if(temp_string1 == "------------------------------------------------------------------"){
				start = !start;
			}

			// This if statement tells the program of the beginning of a path
			if(temp_string2 == "------------------------------------------------------------------" && start){
				for(int i = 0; i < sizeof(paths); i++){
					if(paths[i] == ' '){ 
						continue; 
					}
					// Input Name
					if(i == 0){
						data_string.clear();
						data_string.append(paths, i, 15);
						ptr[path_count].input = data_string;
					}
					// Gate Type 
					if(i == 16 && paths[i] != ' '){
						data_string.clear();
						data_string.append(paths, i, 21);
						ptr[path_count].gate_type = data_string;
						}
					// Fanout
					if(i == 38 && paths[i] != ' '){
						data_string.clear();
						data_string.append(paths, i, 2);
						ptr[path_count].num_cells = data_string;
						}
					// Delay
					if(i == 51 && paths[i] != ' '){
						if(paths[i] == '+'){i++;}
						data_string.clear();
						data_string.append(paths, i, 5);
						ptr[path_count].delay = data_string;
						}

				}				
				path_count++;
			}

			// Place holder strings to keep the current, as well as last 2 strings
			temp_string2 = temp_string1;
			temp_string1 = paths;

		}
	}		
	for(int j = 0; j < 7; j++){
		cout << "Starting signal: "*(ptr + j).input << endl;
	        cout << "Gate Type: "*(ptr + j).gate_type << endl; 
		cout << "Num Cells: "*(ptr + j).num_cells << endl; 
		cout << "Delay: "*(ptr + j).delay << endl; 	
	}
	circuit.close();
	return(0);
	
}
