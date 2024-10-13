using Microsoft.Win32;
using OfficeForWork.Classes;
using OfficeForWork.DB;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Section = OfficeForWork.DB.Section;

namespace OfficeForWork.Views.Pages.Admin
{
    /// <summary>
    /// Логика взаимодействия для AdminMainPage.xaml
    /// </summary>
    public partial class AdminMainPage : Page
    {
        public static Start CurrentUser { get; set; }
        public Member member { get; set; }
        public Document document { get; set; }
        OFWEntities context = new OFWEntities();
        public AdminMainPage(Start getUser)
        {
            InitializeComponent();
            CurrentUser = getUser;
            this.DataContext = this;
            Loaded += Page_Loaded;
        }
        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            //var CurrentAdmin = ConnectClass.db.Admin.FirstOrDefault(i => i.StartID == CurrentUser.ID);
            DataGridRegistration.ItemsSource = ConnectClass.db.Member.ToList();
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void BtnDeleteClic_Click(object sender, RoutedEventArgs e)
        {
            var row = DataGridRegistration.SelectedItem as Member;
            if (row == null)
            {
                MessageBox.Show("Строка не выбрана");
                return;
            }
            MessageBoxResult result = MessageBox.Show("Вы уверены", "Вопрос", MessageBoxButton.YesNoCancel, MessageBoxImage.Question);
            if (result == MessageBoxResult.Yes)
            {
                ConnectClass.db.Member.Remove(row);
                ConnectClass.db.SaveChanges();
                DataGridRegistration.ItemsSource = ConnectClass.db.Member.ToList();
            }
        }

        private void SearchTxb_TextChanged(object sender, TextChangedEventArgs e)
        {
            DataGridRegistration.ItemsSource = ConnectClass.db.Member.Where(
                i => i.NameMember.Contains(SearchTxb.Text)).ToList();
            //DataGridRegistration.ItemsSource = ConnectClass.db.Document.Where(
            //    i => i.NameDocument.Contains(SearchTxb.Text)).ToList();
            ////DataGridRegistration.ItemsSource = ConnectClass.db.Section.Where(
            //    i => i.Name.Contains(SearchTxb.Text)).ToList();
            //DataGridRegistration.ItemsSource = ConnectClass.db.Position.Where(
            //    i => i.Name.Contains(SearchTxb.Text)).ToList();
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            var row = DataGridRegistration.SelectedItem as Member;
            var ss = DataGridRegistration.SelectedItem as Document;
            if (row == null)
            {
                MessageBox.Show("Строка не выбрана");
                return;
            }

            NavigationService.Navigate(new EditAdminPage(CurrentUser, row, ss));
        }

        

        private void DataGridRegistration_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //bool isValueTrue = ConnectClass.db.Document.ToList(); 

            //if (isValueTrue)
            //{
            //    checkBox.IsChecked = true;
            //    checkBox.Content = "Выполнено";
            //}
            //else
            //{
            //    checkBox.IsChecked = false;
            //    checkBox.Content = "Не выполнено";
            //}
        }

        //private void BtnOpenFile_Click(object sender, RoutedEventArgs e)
        //{
        //    // Проверка наличия подключения к базе данных
        //    if (ConnectClass.db == null || ConnectClass.db.DocumentSave == null)
        //    {
        //        MessageBox.Show("Отсутствует подключение к базе данных.");
        //        return;
        //    }

        //    // Получение пути к файлу из базы данных
        //    var document = ConnectClass.db.DocumentSave.FirstOrDefault(); // Предполагается, что в таблице есть хотя бы один документ
        //    string filePath = document?.DocumentDate; // Проверяем наличие документа и получаем путь к файлу

        //    if (!string.IsNullOrEmpty(filePath))
        //    {
        //        // Проверка существования файла
        //        if (File.Exists(filePath))
        //        {
        //            // Открытие файла в ассоциированном приложении
        //            Process.Start(filePath);
        //        }
        //        else
        //        {
        //            // Файл не найден
        //            MessageBox.Show("Файл не найден.");
        //        }
        //    }
        //    else
        //    {
        //        // Путь к файлу не был найден в базе данных
        //        MessageBox.Show("Путь к файлу не найден в базе данных.");
        //    }
        //}

        //private void ButtonBrowse_Click(object sender, RoutedEventArgs e)
        //{
        //    // Подключение к базе данных
        //    using (var context = new ConnectClass)
        //    {
        //        // Получение пути к файлу из базы данных
        //        var document = context.DocumentSave.FirstOrDefault(); // Предполагается, что в таблице есть хотя бы один документ
        //        string filePath = document?.FilePath; // Проверяем наличие документа и получаем путь к файлу

        //        if (!string.IsNullOrEmpty(filePath))
        //        {
        //            // Проверка существования файла
        //            if (File.Exists(filePath))
        //            {
        //                // Открытие файла в ассоциированном приложении
        //                Process.Start(filePath);
        //            }
        //            else
        //            {
        //                // Файл не найден
        //                MessageBox.Show("Файл не найден.");
        //            }
        //        }
        //        else
        //        {
        //            // Путь к файлу не был найден в базе данных
        //            MessageBox.Show("Путь к файлу не найден в базе данных.");
        //        }
        //    }
        //}
        private void BtnAddClic_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxButton buttons = MessageBoxButton.YesNoCancel;
            bool? result = ShowCustomMessageBox("Выберите вариант:", "Выбор", buttons, "Сотрудник", "Новая задача");

            if (result == true)
            {
                NavigationService.Navigate(new AddMemberPage(CurrentUser));
            }
            else if (result == false)
            {
                NavigationService.Navigate(new AddTaskPage());
            }
            else if (result == null)
            {
                MessageBox.Show("Строка не выбрана");
                return;
            }
        }

        private bool? ShowCustomMessageBox(string message, string caption, MessageBoxButton buttons, string button1Text, string button2Text)
        {
            bool? result = null;

            Application.Current.Dispatcher.Invoke(() =>
            {
                MessageBoxCustomWindow customWindow = new MessageBoxCustomWindow(message, caption, buttons, button1Text, button2Text);
                customWindow.ShowDialog();
                result = customWindow.DialogResult;
            });

            return result;
        }
    }

    // Класс для создания кастомного окна сообщения MessageBox
    public class MessageBoxCustomWindow : Window
    {
        public MessageBoxCustomWindow(string message, string caption, MessageBoxButton buttons, string button1Text, string button2Text)
        {
            Title = caption;
            WindowStartupLocation = WindowStartupLocation.CenterScreen;
            ResizeMode = ResizeMode.NoResize;
            SizeToContent = SizeToContent.WidthAndHeight;

            StackPanel stackPanel = new StackPanel();
            stackPanel.Margin = new Thickness(20);

            TextBlock messageTextBlock = new TextBlock();
            messageTextBlock.Text = message;
            messageTextBlock.Margin = new Thickness(0, 0, 0, 10);

            stackPanel.Children.Add(messageTextBlock);

            Button button1 = new Button();
            button1.Content = button1Text;
            button1.Margin = new Thickness(0, 0, 0, 5);
            button1.Click += (sender, e) =>
            {
                DialogResult = true;
                Close();
            };

            Button button2 = new Button();
            button2.Content = button2Text;
            button2.Margin = new Thickness(0, 0, 0, 5);
            button2.Click += (sender, e) =>
            {
                DialogResult = false;
                Close();
            };

            switch (buttons)
            {
                case MessageBoxButton.YesNo:
                    stackPanel.Children.Add(button1);
                    break;
                case MessageBoxButton.YesNoCancel:
                    stackPanel.Children.Add(button1);
                    stackPanel.Children.Add(button2);
                    break;
                default:
                    break;
            }

            Content = stackPanel;
        }
    }
}
