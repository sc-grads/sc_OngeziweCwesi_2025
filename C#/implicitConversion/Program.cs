//implicit conversion

using System.Runtime.CompilerServices;

int myInt = 13;
double myDouble = myInt;

long myLong = myInt;

myLong = 132345098312389013;

float myFloat = 123.123f;

myDouble = myFloat;

//Explicit conversion (casting)

myLong = 1323450;

int myInt2 = (int)myLong;
myInt2 =(int)myDouble;

myFloat =(float)myDouble;



//Conversion Helpers Parse and Convert

string numberString = "123";
int result = int.Parse(numberString);

string myBoolString = "true";
bool myBool = Convert.ToBoolean(myBoolString);
Console.WriteLine("myBool is "+ myBool);


Console.ReadKey();
