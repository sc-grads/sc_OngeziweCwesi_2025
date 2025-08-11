// See https://aka.ms/new-console-template for more information

//implicitely typed variable
var myFavoriteGenre = "LitRPGs";

var myFavoriteNumber = 13;

var yourFavoriteNumber = 14;

var ourNumbersCombined = myFavoriteNumber + yourFavoriteNumber;

//Operators and Orders of Evaluation

int num1 = 5;
int num2 = 13;

Console.WriteLine("Addition num1 + num2 = " + num1 + num2);
//Console.WriteLine("Subtraction num1 - num2 = " + num1 - num2);
Console.WriteLine("Multiplication num1 * num2 = " + num1 * num2);
Console.WriteLine("Division num1 / num2 = " + num1 / num2);

//Reference Type
string myName = "Ongeziwe";

//defining or setting up a variable
string petsName;

//initialize variable
petsName = "Bobby";
Console.WriteLine($"my pet is {petsName}");

//assign a new value
petsName = "Sporty";
Console.WriteLine($"my pet is {petsName}");

//Value Type
int myAge = 35;
//double pi = -3.14;

byte age = 255;

short linkedinConnections = 32550;

long phoneNumber = 0721707197;

float pi = 3.14f;

Console.ReadKey();
