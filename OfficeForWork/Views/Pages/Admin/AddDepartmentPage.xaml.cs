using OfficeForWork.DB;
using OfficeForWork.Classes;
using System;
using System.Collections.Generic;
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
    /// Логика взаимодействия для AddDepartmentPage.xaml
    /// </summary>
    public partial class AddDepartmentPage : Page
    {
        public AddDepartmentPage()
        {
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {

        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            Section newSection = new Section();

            if (NameDepartament.Text == "")
            {
                MessageBox.Show("Отсутствует название нового отдела");
            }
            else
            {
                newSection.Name = NameDepartament.Text;

                ConnectClass.db.Section.Add(newSection);
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
