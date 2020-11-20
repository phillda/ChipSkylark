#include <cstdlib>
#include <cstdio>
#include <string>

struct cell_struct{
	std::string input;
	std::string gate_type;
	std::string num_cells;
	std::string num_nets;
	std::string delay;
};

struct net_struct{
	std::string input;
	std::string gate_type;
	int num_cells;
    	int num_nets;
	int delay;
};

