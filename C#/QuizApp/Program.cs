string question1 = "What is the capital of Germany?";
string answer1 = "Berlin";

string question2 = "What is 2+2?";
string answer2 = "4";

string question3 = "What color do you get by mixing blue and yellow?";
string answer3 = "Green";

int score = 0;

Console.WriteLine(question1);
string userAnswer1 = Console.ReadLine();

if(userAnswer1.Trim().ToLower() == answer1.ToLower())
{
    Console.WriteLine("Correct!");
    score =score++;
}
else
{
    Console.WriteLine("Wrong, the correct naswer is: "+ answer1);
}

Console.WriteLine(question2);
string userAnswer2 = Console.ReadLine();

if (userAnswer2.Trim().ToLower() == answer2.ToLower())
{
    Console.WriteLine("Correct!");
    score =score++;
}
else
{
    Console.WriteLine("Wrong, the correct naswer is: " + answer2);
}

Console.WriteLine(question3);
string userAnswer3 = Console.ReadLine();

if (userAnswer3.Trim().ToLower() == answer3.ToLower())
{
    Console.WriteLine("Correct!");
    score =score++;
}
else
{
    Console.WriteLine("Wrong, the correct naswer is: " + answer3);
}

Console.WriteLine($"Quiz completed! Your final score is: {score}/3");

if(score == 3)
{
    Console.WriteLine("Excellent! You got all answers right!");
}
else if (score >0)
{
    Console.WriteLine("Good Job, but keep learning!");
}
else
{
    Console.WriteLine("Try again and see if you  can get some answers right");
}

    Console.ReadKey();