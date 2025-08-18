namespace ListApp
{
    public class Product
    {
        public string Name { get; set; }

        public double Price {  get; set; }
    }


    internal class Program
    {
        static void Main(string[] args)
        {
            List<Product> products = new List<Product> 
            {
                new Product {Name = "Apple", Price = 0.80},
                new Product {Name = "Banana", Price = 0.30},
                new Product {Name = "Cherry", Price = 3.80},
                new Product {Name = "Strawberry", Price = 0.1},

            };
            products.Add(new Product { Name = "Berries", Price = 2.99 });

            List<Product> cheapProducts = products.Where(p => p.Price < 1.0).ToList();

            Console.WriteLine("Available Products for less than $1: ");

            foreach (Product product in cheapProducts) 
            {
                Console.WriteLine($"product name: {product.Name} for {product.Price}");

            }


            /*A lambda expression consists of 2 Parts
             * 1. Parameters
             * 2. Expression or Statement Block
             * 
             * Parameters are written on the left side of the =>
             * (this symbol is read as "goes to" or "becomes").
             * The expression or action to perform is on the right side
             * 
             * This reads as:
             * "Take an input x and turn it into x multiplied by x
             * x => x * x;
             

            static int Squaring(int num1)
            {
                return num1 * num1;
            }


            List<int > numbers = new List<int> { 10,5,15,3,9,25,18};

            bool hasLargeNumber = numbers.Any(x => x > 20);

            if (hasLargeNumber)
            {
                Console.WriteLine("There are large numbers in the List");
            }
            else
            {
                Console.WriteLine("There are no large numbers in the List");
            }

                numbers.Sort();

            //Define the predicate to check if a number is greater than 10
            Predicate<int> isGreaterThanTen = x=> x > 10;

            //This will return a list of numbers that are 10 and higher
            List<int> higherTen = numbers.FindAll(isGreaterThanTen);

            Console.WriteLine("Sorted numbers");
            foreach (int num in numbers)
            {
                Console.WriteLine(num);
                
            }

            Console.WriteLine("All numbers 10 and higher in our list of numbers");
            foreach (int num in higherTen)
            {
                Console.WriteLine(num);

            }

            //Declaring a list and initializing it
            //List<string> colors = new List<string>();
            /*colors.Add("red");
            colors.Add("blue");
            colors.Add("green");
            colors.Add("red");


            List<string> colors = ["red", "blue", "green"];

            colors.Add("Orange");
            Console.WriteLine("Current colors in the colors list");

            foreach (string color in colors)
            {                
                Console.WriteLine(color);
            }

            bool isDeleteSuccessful = colors.Remove("red");
            while (isDeleteSuccessful)
            {
                isDeleteSuccessful = colors.Remove("red");
            }



            Console.WriteLine("Current colors in the colors list");
            foreach (string color in colors)
            {
                Console.WriteLine(color);
            }*/

            Console.ReadKey();
        }

    }
}
