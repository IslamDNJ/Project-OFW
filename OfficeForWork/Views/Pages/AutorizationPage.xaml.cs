using OfficeForWork.Classes;
using OfficeForWork.DB;
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

namespace OfficeForWork.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для AutorizationPage.xaml
    /// </summary>
    public partial class AutorizationPage : Page
    {
        public static Start User { get; set; }
        public AutorizationPage()
        {
            InitializeComponent();
        }
        private void SignInBtn_Click(object sender, RoutedEventArgs e)
        {
            var UserData = ConnectClass.db.Start.FirstOrDefault(i => i.Login == loginTxb.Text && i.Password == passwordTxb.Password);

            if (UserData != null && UserData.RoleID == 1)
            {
                NavigationService.Navigate(new Pages.Admin.AdminMainPage(UserData));
                User = UserData;
            }
            else if (UserData != null && UserData.RoleID == 2)
            {
                NavigationService.Navigate(new User.UserMainPage(UserData));
                User = UserData;
            }
            else
            {
                MessageBox.Show("Введите корректные данные!");
            }
        }

        private void SignUpBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.RegistrationPage());
        }
    }
}
