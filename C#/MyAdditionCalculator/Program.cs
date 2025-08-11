// See https://aka.ms/new-console-template for more information



//datatype variableName = initial value;
int myNumber = 0;
int myNumber2 = 0;

// Prints out whatever is inside of ()
Console.WriteLine("Enter a whole number");

//takes the user input and stores it
//Variable with the name "userInput" and the data type "string"
//strings are used for text
string userInput = Console.ReadLine();
//myNumber = int.Parse(Console.ReadLine());
myNumber = int.Parse(userInput);

Console.WriteLine("Enter a whole number");
userInput = Console.ReadLine();
myNumber2 = int.Parse(userInput);

int sum = myNumber + myNumber2;

Console.WriteLine("The result of " + myNumber + " and "+ myNumber2 + " is " + sum);
Console.ReadKey();
