int month = 3;
string monthName;
    switch(month)
{
    case 1:
        monthName = "January";
        break;

    case 2:
        monthName = "February";
        break;

    case 3:
        monthName = "March";
        break;

    default:
        monthName = "Unknown";
        break;
}

Console.WriteLine($"The month is {monthName}");



/*Console.WriteLine("How old are you? Write a whole number");

int age = int.Parse(Console.ReadLine());
bool isWithParents = false;

if (age > 18)
{
    Console.WriteLine("Go party in the club");
}

else if (age >= 13)
{
    Console.WriteLine("Are you with your parents? Answer with y or n");
    string isWithParentString = Console.ReadLine();
    if (isWithParentString == "y")
    {
        Console.WriteLine("Go to party in the Club with your parents");
    }

    else
    {
        Console.WriteLine("No party for you today!");
    }
}
else
{
    Console.WriteLine("Go party in Kindergarten!");
}
*/


    //bool isRainy = true;

    //bool hasUmbrella = true;



    /*int num1 = 5;
    int num2 = 6;

    bool isEqual = num1 == num2;

    bool isNotEqual = num1 != num2;

    Console.WriteLine("Please enter a whole number");

    if (num1 == int.Parse(Console.ReadLine()))
    {
        Console.WriteLine("Numbers are equal");

        Console.WriteLine("Please enter your age");
        int age = int.Parse(Console.ReadLine());
        if (age >=18)
        {
            Console.WriteLine("Please enter your address, so that we can send you the prize!");
            string address = Console.ReadLine();
        }

        else
        {
            Console.WriteLine("Sorry, you can't get your prized due to your age!");
        }
    }

    else
    {
        Console.WriteLine("Numbers are not equal");
    }*/

    /*
    //relational operator < <= > >= 
    //
    bool isGreater = num1 < num2;

    int age = 10;

    if(age >=18)
    {
        Console.WriteLine("Go party in the club!");
    }

    else if (age > 6)
    {
        Console.WriteLine("Go to sleep!");
    }

    else
    {
        Console.WriteLine("Go to school");
    }

    //Logical Operators
    //AND &&
    //OR ||
    // NOT !



    if (!isRainy || hasUmbrella)
    {
        // Console.WriteLine("I am not getting wet!");
    }
    //Console.WriteLine("Ay OK!");
    */

    Console.ReadKey();
