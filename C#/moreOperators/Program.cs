﻿// See https://aka.ms/new-console-template for more information
int num = 10;
double price = 19.95;
string name = "Ongeziwe";

//Interpolation
Console.WriteLine($"The number is {num}");


//String concatination
Console.WriteLine("The number is "+ num);

//String formatting
Console.WriteLine("The number is {0}, and the price is {1}, and the name is {2}", num, price, name);

Console.ReadKey();