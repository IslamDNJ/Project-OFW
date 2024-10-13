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
    /// Логика взаимодействия для RegistrationPage.xaml
    /// </summary>
    public partial class RegistrationPage : Page
    {
        public RegistrationPage()
        {
            InitializeComponent();
        }
        private void GoBackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void SignUpBtn_Click(object sender, RoutedEventArgs e)
        {
            if (PasswordTxb.Text != RepeatPasswordTxb.Text)
            {
                MessageBox.Show("Пароли не совпадают!");
            }
            else
            {
                Start start = new Start();
                DB.Member user = new DB.Member();

                user.NameMember = NameTxb.Text;


                start.Login = LoginTxb.Text;
                start.Password = PasswordTxb.Text;

                start.RoleID = 2;
                ConnectClass.db.Start.Add(start);

                user.StartID = user.ID;

                ConnectClass.db.Member.Add(user);
                ConnectClass.db.SaveChanges();
                MessageBox.Show("Регистрация прошла успешно!");
                NavigationService.GoBack();
            }
        }
    }
}
