#include <iostream>
#include <fstream>

#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <time.h>
#include <unistd.h>

using namespace std;

// maximale Größe des Datenarrays
#define ARRAYSIZE 2000
#define FILENAMELENGTH 1024

// empirischer Faktor zur Korrektur des Phasensprungs
#define Phase_Corr_Fac 0.5

extern "C" void fitdata(int , double *, double *, double *, int, int , int *, double *,double *, double, int, double, double);

struct stat file_status;
struct tm *file_time;
char text[256];

void swap(char *array, int datasize)
{
	char dummy;
	for (int i = 0; i < datasize / 2; i++) {
		dummy = array[i];
		array[i] = array[datasize - i - 1];
		array[datasize - i - 1] = dummy;
	}
}

inline float sgn(float x)
{
	if (x<0) {
		return -1.0;
	} else {
		if (x>0) return 1.0;
	}
	return 0.0;
}

inline float sqr(float x)
{
	return x * x;
}

float amplitude(float x, float y)
{
	return sqrt(sqr(x) + sqr(y));
}

float phase(float x, float y)
{
	if (x > 0.0) {
		return atan(y / x);
	} else {
		if (y > 0.0) {
			if (x != 0.0) {
				return M_PI + atan(y / x);
			} else {
				return M_PI / 2;
			}
		} else {
			if (x != 0.0) {
				return -M_PI + atan(y / x);
			} else {
				return -M_PI / 2;
			}
		}
	}
}

int main(int argc, char *argv[])
{
	int argindex, arglength, argnumber;
	double freqstart=0.0, freqstop=0.0, freqdelta=0;
	char infilename[FILENAMELENGTH], outfilename[FILENAMELENGTH], fitparfilename[FILENAMELENGTH], maxoutfilename[FILENAMELENGTH];
	
	bool output_to_file=true;
	bool lorex_fit=false;
	
	// Optionen parsen und aus dem Argumentfeld entfernen:

	for (argindex = 1; argindex < argc;) {
		if (argv[argindex][0] == '-') {
			
			argnumber=1;
			/* Hier die Optionen abfragen: */
			arglength = strlen(argv[argindex]);

			if (strncmp(argv[argindex], "-help", arglength) == 0) {
				cout << "USAGE: " << argv[0] << " [options] files\n\n";
				cout << "   options: -s output to stdout\n";
				cout << "            -h[elp]            show this text\n\n";
				exit(0);
				
			} else if (strncmp(argv[argindex], "-s", arglength) == 0) {
				output_to_file=false;
			} else if (strncmp(argv[argindex], "-f", arglength) == 0) {
				lorex_fit=true;
				output_to_file=false;
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
	
	cin.tie(&cout);
	
	argindex = 1;

	if (argc==1) {
		cout << "enter filename: ";
		cin >> infilename;
	} else {
		strcpy(infilename, argv[argindex]);
	}
	
	strcpy(maxoutfilename, infilename);
	strcat(maxoutfilename, ".max");
	ofstream maxoutfile;
	if (output_to_file) {
		maxoutfile.open(maxoutfilename);
	}
	
	do {
		float xdata[ARRAYSIZE], ydata[ARRAYSIZE], phi[ARRAYSIZE];
		float maximum, minimum;
		int maximum_index, minimum_index;
		int i=0, max_i=0;

		if (argc!=1) {
			strcpy(infilename, argv[argindex]);
		}

		// Dateinamen der Ausgabedatei
		strcpy(outfilename, infilename);
		strcat(outfilename, ".out");

		ifstream infile(infilename);
		ofstream outfile;
			
		if (output_to_file) {
			outfile.open(outfilename);
		}
		
		if (infile) {
						
			double phaseval, lastphase=0;
			int phasecount=0;
			
			// den ersten Datensatz einlesen	
			infile.read((char *) &xdata[i], sizeof(xdata[i]));
			infile.read((char *) &ydata[i], sizeof(ydata[i]));

			#ifdef __BYTE_ORDER
			#if __BYTE_ORDER == __BIG_ENDIAN
			// Daten liegen im Intel-Format vor :-(
			printf("swap bytes\n");
			swap((char *)&xdata[i], sizeof(xdata[i]));
			swap((char *)&ydata[i], sizeof(ydata[i]));
			#endif
			#endif

			// Bestimmung von Maximal- und Minimalamplitude
			maximum       = sqrt(sqr(xdata[i])+sqr(ydata[i]));
			maximum_index = i;
			minimum       = sqrt(sqr(xdata[i])+sqr(ydata[i]));
			minimum_index = i;
			
			// Phasenkorrektur:
			// eine Gerade an den Verlauf der Phase anfitten 
			phaseval = phase(xdata[i], ydata[i]);
			
			if (phaseval*lastphase < -sqr(Phase_Corr_Fac*M_PI)) {
				phasecount += int(sgn(lastphase));
			}
			lastphase = phaseval;
			phi[i] = phaseval + phasecount*2.0*M_PI;
			
			while (1) {
				// Datenzähler erhöhen
				i++;
				
				// Binärdaten (2 float-Variablen) einlesen 
				infile.read((char *) &xdata[i], sizeof(xdata[i]));
				infile.read((char *) &ydata[i], sizeof(ydata[i]));
				
				if (strncmp((char *)(&xdata[i]), "para",4) == 0) {
					char parameter[100];
					char valuetext[100];
					double value;
					
					// Zuerst den Rest von "parameters:" einlesen
					infile >> parameter;
					
					// Dann bis zum Dateiende die Variable und ihren jeweiligen
					// Wert einlesen
					
				
					while (!infile.eof()) {
						infile >> parameter >> valuetext;
						// Weitere Zeichen bis zum Zeilenende
						// schlucken: 
						while (infile.peek()!=10 && !infile.eof()) {
							char dummy;
							infile.get(dummy);
						}
						
						value=atof(valuetext);

						if (strncmp(parameter,"start",strlen("start")) == 0) {
							freqstart = value;
						}
						else if (strncmp(parameter,"stop",strlen("stop")) == 0) {
							freqstop = value;
						}
					}
					
					break;
				}
				
				#ifdef __BYTE_ORDER
				#if __BYTE_ORDER == __BIG_ENDIAN
				// Daten liegen im Intel-Format vor :-(
				swap((char *)&xdata[i], sizeof(xdata[i]));
				swap((char *)&ydata[i], sizeof(ydata[i]));
				#endif
				#endif
				
				if (maximum < sqrt(sqr(xdata[i])+sqr(ydata[i]))) {
					maximum = sqrt(sqr(xdata[i])+sqr(ydata[i]));
					maximum_index = i;
				}
				
				if (minimum > sqrt(sqr(xdata[i])+sqr(ydata[i]))) {
					minimum = sqrt(sqr(xdata[i])+sqr(ydata[i]));
					minimum_index = i;
				}

				// cout << i << " " << xdata[i] << " " << ydata[i] << endl;

				// Phasenkorrektur:
				// eine Gerade an den Verlauf der Phase anfitten 
				phaseval = phase(xdata[i], ydata[i]);
				
				if (phaseval*lastphase < -sqr(Phase_Corr_Fac*M_PI)) {
					phasecount += int(sgn(lastphase));
				}
				lastphase = phaseval;
				phi[i] = phaseval + phasecount*2.0*M_PI;

				if (infile.eof())
					break;
			}
			if (output_to_file) {
				cout << infilename << ": " << i << " Punkte eingelesen\n";
			}
			
			max_i = i;
			freqdelta = (freqstop - freqstart)/double(max_i);
			
			// lineare Regression:
			double intercept=0, slope=0;
			double sum_x=0, sum_x2=0, sum_y=0, sum_xy=0;

			for (i=0; i<max_i; i++) {
				sum_x  += i;
				sum_x2 += sqr(i);
				sum_y  += phi[i];
				sum_xy += i*phi[i];
			}

			intercept  = (sum_x2*sum_y - sum_x*sum_xy) / (double(max_i)*sum_x2 - sqr(sum_x));
			slope = (double(max_i)*sum_xy - sum_x*sum_y) / (double(max_i)*sum_x2 - sqr(sum_x));
		
			for (i=0; i<max_i; i++) {
				if (output_to_file) {
					if (freqdelta!=0.0) {
						sprintf(text,"%10.8g\t",freqstart + double(i)*freqdelta);
						outfile << text;
					} else
						outfile << i << "\t";
				} else {
					if (!lorex_fit) {
						if (freqdelta!=0.0) {
							sprintf(text,"%10.8g\t",freqstart + double(i)*freqdelta);
							cout << text;
						} else
							cout << i << "\t";
					}
				}
				
				if (output_to_file) {	
					outfile << amplitude(xdata[i], ydata[i]) << " ";
					outfile	<< phi[i]-intercept-double(i)*slope << endl;
				} else {
					if (!lorex_fit) {
						cout << amplitude(xdata[i], ydata[i]) << " ";
						cout << phi[i]-intercept-double(i)*slope << endl;
					}
				}	
			}
			if (output_to_file) outfile.close();
			
			if (output_to_file) {

				// Jetzt das Dateidatum und die bestimmten Maximal- und Minimalwerte
				// ausgeben
			
				char outputstring[100];
				stat(infilename, &file_status);
				file_time = localtime(&file_status.st_mtime);
				if (freqdelta != 0.0) {
					sprintf(outputstring,"%02d.%02d.%02d %02d:%02d:%02d %g %f %g %f\n",
							file_time->tm_mday, (file_time->tm_mon)+1,
							file_time->tm_year, file_time->tm_hour, file_time->tm_min,
							file_time->tm_sec, \
							freqstart + maximum_index*freqdelta, maximum, \
							freqstart + minimum_index*freqdelta, minimum);
				} else {
					sprintf(outputstring,"%02d.%02d.%02d %02d:%02d:%02d %d %f %d %f\n",
							file_time->tm_mday, (file_time->tm_mon)+1,
							file_time->tm_year, file_time->tm_hour, file_time->tm_min,
							file_time->tm_sec, \
							maximum_index, maximum, \
							minimum_index, minimum);
				}
				maxoutfile << outputstring;
			}

			infile.close();
			
		} else {
			cout << "FEHLER: Datei '" << infilename << "' konnte nicht geöffnet werden\n";
			return 10;
		}
		
		if (lorex_fit) {
			double x[ARRAYSIZE],y[ARRAYSIZE],sig[ARRAYSIZE];
			maximum=0;	
			for (int i=0; i<max_i; i++) {
				x[i+1] = freqstart/1e9 + (double(i)/1e9)*freqdelta;
				y[i+1] = amplitude(xdata[i], ydata[i]);
				sig[i+1] = 1.0;
				if (y[i+1] > maximum) {
					maximum = y[i+1];
					maximum_index = i;
				}
			}

			// Jetzt erst mal die ungefähre Linienbreite herausfinden ...
			float frequency=(freqstart+maximum_index*freqdelta)/1e9;
			float amplitude=maximum;
			float linewidth=0.0;
			float linephase=M_PI/4.0;
			float offset=1e-9;
			float linear=1e-9;

			int index=maximum_index;
			int search_direction=1;

			while (1) {
				if (index<max_i && index>0) {
					// Falls der Suchindex im erlaubten Bereich
					// des Datenfeldes ist

					index += search_direction;
					
					if (y[index] < maximum/2.0) {
						linewidth = 1e-9*2.0*abs(index-maximum_index)*freqdelta;

						if (argc<=2) {
							cout << "linewidth = " << linewidth;
							cout << " (max: "<< maximum << "[" << maximum_index << "]";
							cout << ", hmax: " << y[index] << "[" << index << "]";
							cout << ", dir: "<< search_direction << ")\n";
						}
						break;
					}
				} else {
					if (search_direction==1) {

						// mal in die andere Richtung suchen
						search_direction = -1;
						index=maximum_index;
						
					} else {

						// ok. suche in beide Richtungen erfolglos
						cout << "linewidth not available!\n";
						cout << " (max: "<< maximum << "[" << maximum_index << "]";
						cout << ", hmax: " << y[index] << "[" << index << "]";
						cout << ", dir: "<< search_direction << ")\n";
						linewidth = 0.05;
						break;
					}
				}
			}

			double epsilon = 1e-11;
			double deltachisq = 0;
			double urf = 1;
			int iflag=0;

			int fitpar_list[]={1,1,2,3,4,5,6};
			double param_array[7],param_error_array[7];

			param_array[1]=amplitude;
			param_array[2]=frequency;
			param_array[3]=linewidth;
			param_array[6]=linephase;
			param_array[4]=offset;
			param_array[5]=linear;
	
			cout << "Fitting " << infilename << endl;

			fitdata(6,x,y,sig,max_i,5,fitpar_list,param_array,
					  param_error_array,epsilon,iflag,deltachisq,urf);

			if (argc<=2) {
				cout << "     Amplitude: " << param_array[1] << " ± " << param_error_array[1] << " U\n";
				cout << "      Frequenz: " << param_array[2] << " ± " << param_error_array[2] << " Ghz\n";
				cout << "  Linienbreite: " << param_array[3] << " ± " << param_error_array[3] << " GHz\n";
				cout << "         Phase: " << param_array[6] << " ± " << param_error_array[6] << " rad\n";
				cout << "        Offset: " << param_array[4] << " ± " << param_error_array[4] << " U\n";
				cout << "        Linear: " << param_array[5] << " ± " << param_error_array[5] << " U/GHz\n";
				cout << "          Güte: " << param_array[2]/param_array[3] << endl;
			}
			
			strcpy(fitparfilename, infilename);
			strcat(fitparfilename, ".fitpar");
			ofstream fitparfile;
			fitparfile.open(fitparfilename);
			
			stat(infilename, &file_status);
			file_time = localtime(&file_status.st_mtime);

			sprintf(text,"%02d.%02d.%02d %02d:%02d:%02d ",
							file_time->tm_mday, (file_time->tm_mon)+1, file_time->tm_year,
							file_time->tm_hour, file_time->tm_min, file_time->tm_sec);
			fitparfile << text;
			
			for (int i=1; i<=6; i++) {
				if (i==2 || i==3 || i==5) {
					sprintf(text,"%11.9g %g ",param_array[i]*1e9, param_error_array[i]*1e9);
					fitparfile << text;
				} else {
					sprintf(text,"%11.9g %g ",param_array[i], param_error_array[i]);
					fitparfile << text;
				}
			}
			fitparfile << infilename << endl;
			fitparfile.close();
		}
		argindex++;
		
	} while (argindex<argc);
	
	return 0;
}
