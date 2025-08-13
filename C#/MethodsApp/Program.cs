using System.Net.WebSockets;
int AddTwoValues(int value1, int value2)
{
    int result = value1 + value2;
    return result;
}
int myResult = AddTwoValues(1, 2);
Console.WriteLine("The result is "+ myResult);


/*void WriteSomethingSpecific(string myString)
{
    Console.WriteLine("You passed this argument to me " + myString);
}
WriteSomethingSpecific("Bored");
Console.WriteLine();

void MyFirstMethod()
{
    Console.WriteLine("MyFirstMethod was called");
    Console.WriteLine("Some super complicated code");
}


//Calling a Method
MyFirstMethod();*/


Console.ReadKey();
