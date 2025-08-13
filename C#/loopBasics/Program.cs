for (int i = 0; i < 10; i++)
{
    Console.WriteLine(i);
    if (i == 3) 
    {
        Console.WriteLine("I've had enough!");
        continue;
    }
    Console.WriteLine("Only if not continued");
}

//------------------------------------------------------------------------------------------------------------------------------
/*int currentScore;
int sum=0;
int counter = 0;
do
{
    Console.WriteLine("Enter your students score. Enter -1 to finish");
    currentScore= int.Parse( Console.ReadLine() );
    if (currentScore != -1)
    {
        sum = sum + currentScore;
        counter++;
    }
    } while (currentScore!=-1);


int average = sum / counter;
Console.WriteLine("The average is: " + average);

*/
/*//------------------------------------------------------------------------------------------------------------------------
int counter = 0;

do
{
    Console.WriteLine(counter);
    counter++;
} while (counter<10);


//-------------------------------------------------------------------------------------------------------------------------

Console.WriteLine("Welcome to the Adventure Game!");

Console.WriteLine("Enter your character's name");

string playerName = Console.ReadLine();

Console.WriteLine("Choose your character type (Warrior, Wizard, Archer)");

string characterType = Console.ReadLine();

Console.WriteLine($"You, {playerName} the {characterType} find yourself at the edge of a dark forest.");

Console.WriteLine("Do you enter the forest or camp outside? (Enter/Camp)");

string choice1 = Console.ReadLine();

if (choice1.ToLower() == "enter")
{
    Console.WriteLine("You bravely enter the forest");
}
else
{
    Console.WriteLine("You decide to camp out and wait for daylight");
}

bool gameContinues = true;

while ( gameContinues)
{
    Console.WriteLine("You come to a fork in the road. Go left or right?");
    string direction = Console.ReadLine();
    if (direction.ToLower() == "left")
    {
        Console.WriteLine("You find a treasure chest");
        gameContinues = false;
    }
    else
    {
        Console.WriteLine("You encounter a wild beast!");
        Console.WriteLine("Fight or flee? (fight/flee)");
        string fightChoice = Console.ReadLine();
        if (fightChoice.ToLower() == "fight")
        {
            Random random = new Random();
            int luck = random.Next(1, 11);
            if (luck > 5)
            {
                Console.WriteLine("You beat the wild beast");
                if (luck < 8)
                {
                    Console.WriteLine("The wild beast dropped a treasure");
                }
            }
            else
            {
                Console.WriteLine("The beast attacked you when you didn't expect it!");
                gameContinues = false;

            }

        }
    }
}

//-------------------------------------------------------------------------------------------------------------------------
*/
/*// The While loop
using System.Diagnostics.Metrics;
Random random = new Random();

int secretNumber = random.Next(1, 101);
int userGuess = 0;
int Counter = 0;

Console.WriteLine("Guess the number I'm thinking of between 1 and 100");

//int counter = 0;



while (userGuess != secretNumber)
{
    Counter++;
    Console.WriteLine("Enter your guess: ");
    userGuess = int.Parse(Console.ReadLine());
    if (userGuess < secretNumber)
    {
        Console.WriteLine("Too low!, Try again.");
    }
    else if (userGuess > secretNumber)
    {
        Console.WriteLine("Too high!, Try again.");
    }
    else
    {
        Console.WriteLine("Correct! You guessed the number right! It took you "+Counter + " times");
    }
}

/*

//in strings \ is an "Escape Character"
// \n for "new line"
// \r - carriage return

/*string rocket = "      ^\n     /^\\\n    /___\\\n   |=   =|\n   |     |\n   |     |\n   |     |\n  /|##!##|\\\n / |##!##| \\\n/  |##!##|  \\\n   |     |\n   |     |\n   |     |\n   |     |\n   |     |\n   '-----'\n";

for (int counter =10; counter >= 0; counter--)
{
    Console.Clear();
    Console.WriteLine("Counter is "+ counter);
    Console.WriteLine(rocket);
    rocket = "\r\n" + rocket;
    Thread.Sleep(1000);

}

Console.WriteLine("The Rocket has landed!");*/
Console.ReadKey();