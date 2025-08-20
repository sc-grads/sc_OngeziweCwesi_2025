namespace Enums
{
    enum DaysOfWeek
    {
        Monday,
        Tuesday,
        Wednesday,
        Thursday,
        Friday,
        Saturday,
        Sunday
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            DaysOfWeek today = DaysOfWeek.Wednesday;
            Console.WriteLine(today);   // Output: Wednesday
            Console.WriteLine((int)today); // Output: 2 (starts from 0 by default)

            Console.ReadKey();
        }
    }
}
