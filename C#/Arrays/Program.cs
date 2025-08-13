//two dimensional array
int[,] array2DDrclaration = new int[3, 3];
int[,] array2DInitialized = { { 1, 2 }, { 3,4 } };
//[1] [2]
//[3] [4]

//Console.WriteLine(array2DInitialized[1,0]);

//three dimensional array
int[,,] array3DDrclaration = new int[3,3,3];
string[,,] array3DInitialized =
{
    {
        {"000","001" },

        {"010","011" }
    },
    {
        {"100", "101" },

        {"110","111" }
    }
};



/*
int num1 = 0;
int num2 = 0;
int num3 = 0;
int num4 = 0;
int num5 = 0;


string[] weekDays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];

Console.WriteLine("Length of the weekdays Array is "+weekDays.Length);

foreach (string day in weekDays)
{
    Console.WriteLine(day);
}*/


/*for (int i = 0; i < weekDays.Length; i++)
{
    Console.WriteLine(weekDays[i]);
}*/

/*Console.WriteLine("Today is " + weekDays[0]);
Console.WriteLine("Today is " + weekDays[1]);
Console.WriteLine("Today is " + weekDays[2]);
Console.WriteLine("Today is " + weekDays[3]);
Console.WriteLine("Today is " + weekDays[4]);*/


/*
 //declare an array
  int[] myIntArray = new int[5];
 //assigned values to the array
myIntArray[0] = 5;
myIntArray[1] = 12;
myIntArray[2] = 13;
myIntArray[3] = 14;
myIntArray[4] = 15;
*/

Console.ReadKey();
