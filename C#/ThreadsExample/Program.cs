using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;

namespace ThreadsExample
{
    internal class Program
    {
        static void Main(string[] args)
        {
            /*Console.WriteLine("Hello, World 1");
            Thread.Sleep(1000);
            Console.WriteLine("Hello, World 2");
            Thread.Sleep(1000);
            Console.WriteLine("Hello, World 3");
            Thread.Sleep(1000);
            Console.WriteLine("Hello, World 4");
            Thread.Sleep(1000);
            Console.WriteLine("Hello, World 5");

            new Thread(() =>
            {
                Thread.Sleep(1000);
                Console.WriteLine("Thread 1");
            }).Start();

            new Thread(() =>
            {
                Thread.Sleep(1000);
                Console.WriteLine("Thread 2");
            }).Start();

            new Thread(() =>
            {
                Thread.Sleep(1000);
                Console.WriteLine("Thread 3");
            }).Start();

            new Thread(() =>
            {
                Thread.Sleep(1000);
                Console.WriteLine("Thread 4");
            }).Start();
           
            //Threads Start and End Completion

            var taskCompletionSource = new TaskCompletionSource<bool>();

            var thread = new Thread(() =>
            {
                Console.WriteLine($"Thread number: {Thread.CurrentThread.ManagedThreadId} started");
                Thread.Sleep(1000);
                taskCompletionSource.TrySetResult(true);
                Console.WriteLine($"Thread number: {Thread.CurrentThread.ManagedThreadId} ended");
            });
            
            thread.Start();

            var test = taskCompletionSource.Task.Result;

            Console.WriteLine("Task was done: {0}",test);

            //ThreadsPools and Threads in the background

            Enumerable.Range(0, 100).ToList().ForEach(f => { 
            new Thread(() =>
            {
                Console.WriteLine($"Thread number: {Thread.CurrentThread.ManagedThreadId} started");
                Thread.Sleep(1000);

                Console.WriteLine($"Thread number: {Thread.CurrentThread.ManagedThreadId} ended");
            }).Start();
        });*/

            Console.WriteLine("Main Thread started");

            Thread thread1 = new Thread(Thread1Function);
            Thread thread2 = new Thread(Thread2Function);
            thread1.Start();
            thread2.Start();

            thread1.Join();
            Console.WriteLine("Thread1Function done");
            thread2.Join();
            Console.WriteLine("Thread2Function done");

            Console.WriteLine("Main Thread ended");

            if (thread1.IsAlive)
            {
                Console.WriteLine("Thread1 is still doing stuff");
                Thread.Sleep(1000);
            }
            else
            {
                Console.WriteLine("Thread1 completed");
            }

        }

            //Join and IsAlive

            public static void Thread1Function()
            {
                Console.WriteLine("Thread1Function started");
            Thread.Sleep(3000);
            }
        public static void Thread2Function() 
        {
            Console.WriteLine("Thread2Function started");
        }

          
    }
}

