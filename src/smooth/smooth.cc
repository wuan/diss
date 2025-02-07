#include <iostream>
#include <iomanip>
#include <fstream>
#include <cstring>
#include <cstdlib>

using namespace std;

// maximale Größe des Datenarrays
#define ARRAYSIZE 2000
#define FILENAMELENGTH 1024
#define MAXAVG 500
#define MAXCOL 100

int avg_num=5;
int read_from_stdin=0;
std::string no_value = "?";

int main(int argc, char *argv[])
{
	int argindex, arglength, argnumber;
	char infilename[FILENAMELENGTH];
	ifstream infile;
	
	// Optionen parsen und aus dem Argumentfeld entfernen:

	for (argindex = 1; argindex < argc;) {
		if (argv[argindex][0] == '-') {
			
			argnumber=1;
			/* Hier die Optionen abfragen: */
			arglength = strlen(argv[argindex]);

			if (strncmp(argv[argindex], "-", arglength) == 0) {
				read_from_stdin=1;
			} else if (strncmp(argv[argindex], "-help", arglength) == 0) {
				cout << "USAGE: " << argv[0] << " [options] files\n\n";
				cout << "   options: -n <number> average over <number> points\n";
				cout << "            -h[elp]            show this text\n\n";
				exit(0);
				
			} else if (strncmp(argv[argindex], "-n", arglength) == 0) {
				avg_num = atoi(argv[argindex+1]);
				argnumber=2;
			} else {
				cout << "ERROR: unknown option '" << argv[argindex] << "'\n";
				exit(10);
			}

			/* Zeiger auf Argumente verschieben: */
			if (argindex <= argc-argnumber) {
				int i;
				for (i = argindex; i <= argc-argnumber; i++)
					argv[i] = argv[i + argnumber];
			}
			argc -= argnumber;
		} else
			argindex++;
	}
	
	argindex = 1;

	if (!read_from_stdin) {
		if (argc==1) {
			cin.tie(&cout);
			cout << "enter filename: ";
			cin >> infilename;
		} else {
			strcpy(infilename, argv[argindex]);
		}
	}
	
	if (argc>2) {
		cerr << "ERROR: too many arguments\n";
	}
 
	if (!read_from_stdin) {
//		cout << "opening file ...\n";
		infile.open(infilename);
		if (!infile) {
			cerr << "FEHLER: Datei '" << infilename << "' konnte nicht geoeffnet werden\n";
			return 10;
		}
	}

	double *val[MAXAVG];	
	for (int i=0; i<avg_num; i++) {
		val[i] = new double[MAXCOL];
	}
	char *dataline, *value=0, coltext[100][100];
	char *datafileline = new char[1001];

	int column, line=0, maxcolumn=0;
/*	if (read_from_stdin)
		cout << cin.getline(datafileline,1000);
	else
		cout << infile.getline(datafileline,1000);*/
	
	while ((!read_from_stdin && !infile.eof()) || (read_from_stdin && !cin.eof())) {
		if (read_from_stdin)
			cin.getline(datafileline,1000);
		else
			infile.getline(datafileline,1000);
		dataline=datafileline;

		if (strlen(dataline)==0) {
			line = 0;
		} else {
			for (column = 0; dataline!=0 && column<MAXCOL; column++) {
				value=strsep(&dataline, " ");
				strcpy(coltext[column],value);
				
				if (value[0]==0) {
					break;
				}

				if (value[0] != '?') {
					val[line % avg_num][column] = strtod(value, NULL);
				} else {
					val[line % avg_num][column] = 0;
				}
			}
		
			if (column>maxcolumn) {
				maxcolumn=column;
			}
			if (value[0]==0) {
				//break;
			}
			
			cout << coltext[0] << " " << coltext[1];
			
			for (int i=2; i<column; i++) {
				double sum = 0;
				int number_of_values=0;
				for (int count=0; count < avg_num; count++) {
					if (val[count][i]!=0) {
						number_of_values++;
						sum += val[count][i];
				//		cout << "#" << count << " = " << val[count][i] << endl;
					}
				}

				// cout << number_of_values << ": "<< endl;
				if (number_of_values > 0 && no_value.compare(coltext[column])) {
					cout << " " << setprecision(9) << sum/double(number_of_values);
				} else { 
					cout << " ?";
				}
			}
		}
		cout << endl;
		line++;
	}
	if (!read_from_stdin)
		infile.close();
	
	return 0;
}
