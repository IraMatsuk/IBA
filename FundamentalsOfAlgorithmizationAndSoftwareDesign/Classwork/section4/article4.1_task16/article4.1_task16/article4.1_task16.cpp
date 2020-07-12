// article4.1_task16.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <iomanip>
using namespace std;

//Prototype three print functions
void myPrint(const char* s); // Print a string
void myPrint(double dvalue); // Print a double
void myPrint(double dvalue, int prec); // Print a double with a given precision

int main(int argc, char *argv[]) {
    const double dValue = 893094.298769;
    if (argc < 2) {
        // Three calls to print invoke myPrint(char *s)
        myPrint("This program requires one argument.");
        myPrint("The argument specifies the number of");
        myPrint("digits precision for the second number printed.");
        exit(0);
    }
    myPrint(dValue);
    myPrint(dValue, atoi(argv[1]));
}
// article4.1_task14.exe

// Print a string
void myPrint(const char* s) {
    cout << s << endl;
}
// Print a double in default precision
void myPrint(double dValue) {
    cout << dValue << endl;
}
// Print a double in specified precision. Positive numbers for 
//precision indicate how many digits precision after the decimal
//point to show.Negative numbers for precision indicate where to
//round the number to the left of the decimal point.
void myPrint(double dValue, int prec) {
    cout.setf(ios::fixed);
    cout << setprecision(prec) << dValue << '\n';
}
