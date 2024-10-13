using OfficeForWork.DB;
using OfficeForWork.Classes;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Diagnostics;
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
    /// Логика взаимодействия для AddTaskPage.xaml
    /// </summary>
    public partial class AddTaskPage : Page
    {
        public AddTaskPage()
        {
            InitializeComponent();
        }
        private void OpenDocument_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            string filePath = button.Content.ToString();

            // Открыть файл Word
            Process.Start(filePath);
        }


        private void ButtonBrowse_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog Dlg = new OpenFileDialog();
            Dlg.Filter = "All Files (*.*)|*.*";
            Dlg.CheckFileExists = true;
            Dlg.Title = "Выберите файл";
            Dlg.InitialDirectory = @"C:\";
            if (Dlg.ShowDialog() == true)
            {
                string selectedFilePath = Dlg.FileName;

                using (OFWEntities context = new OFWEntities())
                {
                    DocumentSave document = new DocumentSave
                    {
                        DocumentDate = selectedFilePath
                    };
                    ButtonBrowse.Content = selectedFilePath;
                    context.DocumentSave.Add(document);
                    context.SaveChanges();
                }
            }
        }
        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            MemberName.ItemsSource = ConnectClass.db.Member.ToList();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            Member newMember = new Member();

            if (MemberName.Text == "")
            {
                MessageBox.Show("Введите сотрудника");
            }
            else if (TimeSTART.SelectedDate == null)
            {
                MessageBox.Show("Дата начала не выбрана");
            }
            else
            {
                var CurrentNameMember = MemberName.SelectedItem as Member;
                newMember.NameMember = CurrentNameMember.NameMember;

                newMember.Document = new Document(); // Создание экземпляра объекта Document
                newMember.Document.DateCreation = TimeSTART.SelectedDate;

                ConnectClass.db.Member.Add(newMember);
                MessageBox.Show("Успешно!");
                ConnectClass.db.SaveChanges();
                NavigationService.GoBack();
            }
        }

        private void GoBackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
