﻿using DataBinding.Data;
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

namespace DataBinding
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Person person = new Person
        {
            Name = "Ongeziwe",
            Age = 22
        };
        public MainWindow()
        {
            InitializeComponent();
            this.DataContext = person;
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string personData = person.Name + " is " + person.Age + " years old";
            MessageBox.Show(personData);
        }
    }
}