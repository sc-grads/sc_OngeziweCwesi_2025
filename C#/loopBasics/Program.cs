
//in strings \ is an "Escape Character"
// \n for "new line"
// \r - carriage return
string myString = "Hi\nHi";

for (int counter =10; counter >= 0; counter--)
{
    Console.WriteLine("Counter is "+ counter);
    //Console.WriteLine(myString);
    Thread.Sleep(1000);
}

Console.ReadKey();