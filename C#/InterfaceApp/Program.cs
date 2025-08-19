namespace InterfaceApp
{
    public interface ILogger
    {
        void Log(string message);
    }


    public class FileLogger: ILogger
    {
        public void Log(string message)
        {
            string directoryPath = "C:\\sc_OngeziweCwesi_2025\\C#";
            string filePath = Path.Combine(directoryPath, "log.txt");
            message = "This is a log entry";

            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }

            File.AppendAllText(filePath, message + "\n");
        }
    }

    public class  DatabaseLogger: ILogger
    {
        public void Log(string message)
        {
            //Implement the logic to log a message to a database
            Console.WriteLine($"Logging to database. {message}");
        }
    }

    public class Application
    {
        private readonly ILogger _logger;

        public Application(ILogger logger)
        {
            _logger = logger;
        }

        public void DoWork()
        {
            _logger.Log("Work started!");

            //DO ALL THE WORK!!
            _logger.Log("WORK DONE");
        }
    }

    /*public class Animal
    {
        public virtual void MakeSound()
        {
            Console.WriteLine("Some generic animal sound");
        }
    }

    public class Dog : Animal
    {
        public override void MakeSound()
        {
            Console.WriteLine("Bark!"); 
        }
    }

    public class Cat : Animal
    {
        public override void MakeSound()
        {
            Console.WriteLine("Meow!"); ;
        }
    }


    public class CreditCardProcessor : IPaymentProcessor
    {
        public void ProcessPayment(decimal amount)
        {
            Console.WriteLine($"Processing credit card payment of {amount}");
            //Implement credit card payment logic
        }
    }

    public class PaypalProcessor : IPaymentProcessor
    {
        public void ProcessPayment(decimal amount)
        {
            Console.WriteLine($"Processing paypal payment of {amount}");
            //Implement paypal payment logic
        }
    }

    public class PaymentService
    {
        private readonly IPaymentProcessor _processor;

        public PaymentService(IPaymentProcessor processor)
        {
            _processor = processor;
        }

        public void ProcessOrderPayment(decimal amount) 
        { 
            _processor.ProcessPayment(amount);
        
        }

    }*/
    internal class Program
    {
        static void Main(string[] args)
        {
            ILogger fileLogger = new FileLogger();
            Application app = new Application(fileLogger);
            app.DoWork();
            
            ILogger dbLogger = new DatabaseLogger();
            app = new Application(dbLogger);
            app.DoWork();



           /* IPaymentProcessor creditCardProcessor = new CreditCardProcessor();
            PaymentService paymentService = new PaymentService(creditCardProcessor);
            paymentService.ProcessOrderPayment(100.00m);

            IPaymentProcessor paypalProcessor = new PaypalProcessor();
            paymentService = new PaymentService(paypalProcessor);
            paymentService.ProcessOrderPayment(200.00m);

            /*Animal myDog = new Dog();
            myDog.MakeSound();*/

            Console.ReadKey();
        }
    }

}
