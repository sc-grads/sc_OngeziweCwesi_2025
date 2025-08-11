// See https://aka.ms/new-console-template for more information



//datatype variableName = initial value;
double myNumber = 0;
double myNumber2 = 0;

// Prints out whatever is inside of ()
Console.WriteLine("Enter a number");

//takes the user input and stores it
//Variable with the name "userInput" and the data type "string"
//strings are used for text
string userInput = Console.ReadLine();
//myNumber = int.Parse(Console.ReadLine());
myNumber = double.Parse(userInput);

Console.WriteLine("Enter a number");
userInput = Console.ReadLine();
myNumber2 = double.Parse(userInput);

double sum = myNumber + myNumber2;
sum = Math.Round(sum);

//string concatenation
//Console.WriteLine("The result of " + myNumber + " and "+ myNumber2 + " is " + sum);

//string inerpolation
Console.WriteLine($"The result of { myNumber} and {myNumber2} is {sum}");

Console.ReadKey();
