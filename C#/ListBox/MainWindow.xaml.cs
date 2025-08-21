using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ListBox
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public List<Data.Person> People = new List<Data.Person>
        {
            new Data.Person{Name = "Ongeziwe", Age=22},
            new Data.Person{Name = "Iviwe", Age=24},
            new Data.Person{Name = "Neo", Age=20},
            new Data.Person{Name = "Pascal", Age=30}

        };
        public MainWindow()
        {
            InitializeComponent();

            ListBoxPeople.ItemsSource = People;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var selectedItems = ListBoxPeople.SelectedItems;
            foreach (var item in selectedItems)
            {
                var person = (Data.Person)item;
                MessageBox.Show(person.Name);
            }
        }
    }
}