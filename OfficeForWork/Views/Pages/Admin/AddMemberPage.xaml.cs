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
    /// Логика взаимодействия для AddMemberPage.xaml
    /// </summary>
    public partial class AddMemberPage : Page
    {
        public static Start CurrentUser { get; set; }
        public AddMemberPage(Start getUser)
        {
            InitializeComponent();
            CurrentUser = getUser;
            this.DataContext = this;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            //MemberName.ItemsSource = ConnectClass.db.Member.ToList();
            NameSection.ItemsSource = ConnectClass.db.Section.ToList();
            MemberPosition.ItemsSource = ConnectClass.db.Position.ToList();

            /*var CurrentAdmin = ConnectClass.db.Admin.FirstOrDefault(i => i.StartID == CurrentUser.ID)*/;
        }


        //private void SignUpBtn_Click(object sender, RoutedEventArgs e)
        //{
            
        //    Start start = new Start();
        //    DB.Member user = new DB.Member();

        //    user.NameMember = NameTxb.Text;


        //    start.Login = LoginTxb.Text;
        //    start.Password = PasswordTxb.Text;

        //    start.RoleID = 2;
        //    ConnectClass.db.Start.Add(start);

        //    user.StartID = user.ID;

        //    ConnectClass.db.Member.Add(user);
        //    ConnectClass.db.SaveChanges();
        //    MessageBox.Show("Регистрация прошла успешно!");
        //    NavigationService.GoBack();
        //}
        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            Member newMember = new Member();

            if (NameTxb == null)
            {
                MessageBox.Show("Выберите сотрудника");
            }
            else if (NameSection.SelectedItem == null)
            {
                MessageBox.Show("Выберите отдел сотрудника");
            }
            else if (MemberPosition.SelectedItem == null)
            {
                MessageBox.Show("Выберите должность сотрудника");
            }
            else
            {
                var currentMember = ConnectClass.db.Member.FirstOrDefault(); // Получение текущего экземпляра Member из базы данных

                if (currentMember != null)
                {
                    Start start = new Start();
                    Member user = new Member();

                    user.NameMember = NameTxb.Text;


                    start.Login = LoginTxb.Text;
                    start.Password = PasswordTxb.Text;


                    var selectedNameDepartament = NameSection.SelectedItem as Section;
                    user.SectionID = selectedNameDepartament.ID;

                    var selectedMemberPosition = MemberPosition.SelectedItem as Position;
                    user.PositionID = selectedMemberPosition.ID;

                    start.RoleID = 2;
                    ConnectClass.db.Start.Add(start);

                    user.StartID = user.ID;

                    ConnectClass.db.Member.Add(user);
                    ConnectClass.db.SaveChanges();
                    MessageBox.Show("Сотрудник успешно добавлен!");
                    NavigationService.GoBack();
                }
            }
        }

        private void GoBackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
