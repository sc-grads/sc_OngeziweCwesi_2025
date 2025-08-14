using System.Net.WebSockets;

namespace ClassesApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Car myAudi = new Car("A3", "Audi", false);
            myAudi.Drive();

            Car myBmw = new Car ("i7","BMW", true);
            myBmw.Drive();
            Console.WriteLine();



            /*Customer earl = new Customer("Earl");
            Customer frankTheTank = new Customer("Frank", "Toleni A/A", "073402");

            //Console.WriteLine("Name of Customer is "+ earl.Name);

            //Default Customer with no Arguments given
            Customer myCustomer = new Customer();
            Console.WriteLine("Details about customer: " + myCustomer.Name);*/


            /*//Creating an object of the Class Car
            //Creating an instance of the Class Car
            Car audi = new Car("A3", "Audi",false);
            Car bmw = new Car("i7","BMW",true);

            Console.WriteLine("Please enter the Brand name");
            //SETTING BRAND
            audi.Brand = Console.ReadLine();

            //GETTING BRAND
            Console.WriteLine("Brand is "+ audi.Brand);
            Console.WriteLine("Brand is " + bmw.Brand);*/


            Console.ReadKey();
        }
    }
}
