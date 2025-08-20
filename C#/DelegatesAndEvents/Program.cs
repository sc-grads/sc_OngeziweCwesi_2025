using System.Security.Cryptography.X509Certificates;

namespace DelegatesAndEvents
{
    /*public delegate void LogHandler(string message);

    public class Logger
    {
        public void LogToConsole(string message)
        {
            Console.WriteLine("Console Log: " + message);
        }

        public void LogToFile(string message)
        {
            Console.WriteLine("File log: " + message);
        }
    }*/
    internal class Program
    {
        
        // 1. Declaration:
       // public delegate void Notify(string message);


        static void Main(string[] args)
        {


            /*Logger logger = new Logger();
            LogHandler logHandler = logger.LogToConsole;
            logHandler("Logging to console");

            logHandler = logger.LogToFile;
            logHandler("Log some stuff");
            // Delegates define a method signature,
            // and any method assigned to a delegate must match this signature.
            // 2. Instantiation:
            Notify notifyDelegate = ShowMessage;
            //Notify notifyDelegate = new Notify(notifyDelegate);
            // 3. Invocation:
            notifyDelegate("Hello, Delegates!");*/

            int[] intArray = { 1, 2, 3, 4, 5, };
            string[] stringArray = { "One", "Two", "Three", "Four" };

            PrintArray(intArray);
            PrintArray(stringArray);


            Console.ReadKey();
        }

        public static void PrintIntArray(int[] array)
        {
            foreach (int item in array)
            {
                Console.WriteLine(item);
            }
        }

        public static void PrintStringArray(string[] array)
        {
            foreach (string item in array)
            {
                Console.WriteLine(item);
            }
        }

        // a generic Method, that accepts a generic datatype
        public static void PrintArray<T>(T[] array)
        {
            foreach (T item in array)
            {
                Console.WriteLine(item);
            }

        }




        /*static void ShowMessage(string messag2e)
        {
            Console.WriteLine(messag2e);
        }*/
    }
}
