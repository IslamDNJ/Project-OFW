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
using Section = OfficeForWork.DB.Section;

namespace OfficeForWork.Views.Pages.User
{
    /// <summary>
    /// Логика взаимодействия для UserMainPage.xaml
    /// </summary>
    public partial class UserMainPage : Page
    {
        public static Start CurrentUser { get; set; }
        public Member member { get; set; }
        public UserMainPage(Start getUser)
        {
            InitializeComponent();
            CurrentUser = getUser;
            this.DataContext = this;
            //DataGridRegistration.ItemsSource = ConnectClass.db.Member.Where(x => x.StartID == CurrentUser.ID).ToList();

           
        }
        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            var CurrentWorker = ConnectClass.db.Member.FirstOrDefault(i => i.StartID == CurrentUser.ID);
            UserName.Text = CurrentWorker.NameMember;

            var CurrentSection = ConnectClass.db.Section.FirstOrDefault();
            NameSection.Text = CurrentSection.Name;

            var CurrentPosition = ConnectClass.db.Position.FirstOrDefault();
            MemberPosition.Text = CurrentPosition.Name;


            //DataGridRegistration.ItemsSource = ConnectClass.db.Member.ToList();
            DataGridRegistration.ItemsSource = ConnectClass.db.Member.Where(x => x.Document.ID == x.DocumentID && x.StartID == CurrentUser.ID).ToList();
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void BtnOpenFile_Click(object sender, RoutedEventArgs e)
        {

        }

        private void DataGridRegistration_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var output = ConnectClass.db.Member.ToList();

            //output = 
        }
    }
}