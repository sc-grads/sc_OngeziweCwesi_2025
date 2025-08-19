namespace DateTimeApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            DateTime dateTime = new DateTime(2003, 7, 25);

            Console.WriteLine("My birthdday is {0}",dateTime);


            //Write today on screen
            Console.WriteLine(DateTime.Today);

            //Write current date and time on screen
            Console.WriteLine(DateTime.Now);

            Console.WriteLine(DateTime.UtcNow);

            DateTime tomorrow = GetTomorrow();
            Console.WriteLine("Tomorrow will be the {0}", tomorrow);
            Console.WriteLine("Today is {0}", DateTime.Today.DayOfWeek);
            Console.WriteLine(GetFirstDayOfYear(2003));

            int days = DateTime.DaysInMonth(2003, 7);
            Console.WriteLine("Days in Jul 2003: {0}",days);

            DateTime now = DateTime.Now;
            Console.WriteLine("Minute : {0}", now.Minute);

            Console.WriteLine("{0} o'clock {1} minutes and {2} seconds", now.Hour,now.Minute, now.Second);

            Console.WriteLine("Write a date in this format: yyyy-mm-dd");
            string input = Console.ReadLine();
            if (DateTime.TryParse(input, out dateTime))
            {
                Console.WriteLine(dateTime);
                TimeSpan daysPassed = now.Subtract(dateTime);
                Console.WriteLine("Days passed since: {0}", daysPassed.Days);
            }
        }

        static DateTime GetTomorrow()
        {
            return DateTime.Today.AddDays(1);
        }

        static DateTime GetFirstDayOfYear(int year)
        {
            return new DateTime(year,1,1);
        }
    }
}
