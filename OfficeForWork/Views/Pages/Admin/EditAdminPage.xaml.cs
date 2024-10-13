using Microsoft.Win32;
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
using DocumentSave = OfficeForWork.DB.DocumentSave;
using System.Data.Entity;

namespace OfficeForWork.Views.Pages.Admin
{
    /// <summary>
    /// Логика взаимодействия для EditAdminPage.xaml
    /// </summary>
    public partial class EditAdminPage : Page
    {
        public static Start CurrentUser { get; set; }
        public Member member { get; set; }
        public Document document { get; set; }
        OFWEntities context = new OFWEntities();
        public EditAdminPage(Start getUser, Member currentMember, Document currentDocument)
        {
            InitializeComponent();
            CurrentUser = getUser;
            member = currentMember;
            document = currentDocument;
            this.DataContext = this;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            NameSection.ItemsSource = ConnectClass.db.Section.ToList();
            MemberPosition.ItemsSource = ConnectClass.db.Position.ToList();
            MemberName.ItemsSource = ConnectClass.db.Member.ToList();
        }
        string filePath;
        private void ButtonBrowse_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();
            dialog.Filter = "All Files (*.*)|*.*";
            dialog.CheckFileExists = true;
            dialog.Title = "Выберите файл";
            dialog.InitialDirectory = @"C:\";

            if (dialog.ShowDialog() == true)
            {
                filePath = dialog.FileName; // Получение пути к выбранному файлу

              

                string ss = dialog.FileName;

                string newFilePath = dialog.FileName; // получение нового пути к файлу
                // Предположим, у вас есть экземпляр класса, представляющего запись в базе данных, в которой хранится путь к файлу.
                // Вам нужно обновить значение пути к файлу в этой записи с новым значением newFilePath.
                using (OFWEntities context = new OFWEntities())
                {
                    DocumentSave document = new DocumentSave
                    {
                        DocumentDate = newFilePath
                    };

                    ButtonBrowse.Content = newFilePath;
                }
                //ConnectClass.db.SaveChanges(documentSave);
                // Получение экземпляра DocumentSave из базы данных
                //DocumentSave document = context.DocumentSave.FirstOrDefault();

                //if (document == null) // Если экземпляр DocumentSave не существует, создаем новый
                //{
                //    document = new DocumentSave();
                //    context.DocumentSave.Add(document);
                //}

                /*document.DocumentDate = filePath; */// Обновление пути к файлу в экземпляре DocumentSave

                // Сохранение изменений в базе данных
                //context.SaveChanges();

                //ButtonBrowse.Content = filePath; // Обновление текста кнопки с выбранным путем к файлу
            }
        }

        private void GoBackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            Member newMember = new Member();

            if (MemberName.SelectedItem != null)
            {
                var CurrentNameMember = MemberName.SelectedItem as Member;
                newMember.NameMember = CurrentNameMember.NameMember;
            }

            var CurrentNameDepartament = NameSection.SelectedItem as Section;
            newMember.SectionID = CurrentNameDepartament.ID;

            var CurrentMemberPosition = MemberPosition.SelectedItem as Position;
            newMember.PositionID = CurrentMemberPosition.ID;
            
            newMember.Document = new Document(); // Создание нового экземпляра Document
            newMember.Document.DateCreation = TimeSTART.SelectedDate;
            newMember.Document.DataLastChange =  TimeEND.SelectedDate;
            newMember.Document.DescriptionDocument = NameDescriptionDocument.Text;
            DocumentSave save = new DocumentSave();
            save.DocumentDate = filePath;
            ConnectClass.db.DocumentSave.Add(save);
            MessageBox.Show("" + newMember.Document.ID );
            //var Docum = ConnectClass.db.DocumentSave.FirstOrDefault(x => x.ID == newMember.Document.DocumentSaveID);
         
            //newMember.DocumentDate = filePath;

            //ConnectClass.db.Member.Attach(newMember); // Прикрепление нового участника к контексту базы данных
            //ConnectClass.db.Entry(newMember).State = EntityState.Modified; // Установка состояния модели в "Modified" для обновления данных
            
            //newMember.Document.DocumentSaveID = DSave.ID;
            MessageBox.Show("Успешно!");
            ConnectClass.db.SaveChanges();
            context.SaveChanges(); // Сохранение изменений в базе данных
            NavigationService.GoBack();
        }
    }
}
