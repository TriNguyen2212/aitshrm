using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aits_Hrm.Model;
using System.Data.SqlClient;
using System.IO;

namespace Aits_Hrm.QuanTri
{
    public partial class SaoLuuHeThong : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        static string path = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            path = Server.MapPath("../BackupDB");
            lbNote.Text =  "1. Nên sao lưu dữ liệu định kỳ để đảm bảo hệ thống hoạt động tốt nhất.<br />";
            lbNote.Text += "2. Nếu sảy ra sự cố về dữ liệu cần khôi phục tại thời điểm hệ thống hoạt động ổn định.<br />";
            lbNote.Text += "3. Nếu khôi phục dữ liệu thì mọi dữ liệu hiện tại sẽ trở về thời điểm sao lưu gần đây nhất.<br />";
            lbNote.Text += "4. Đường dẫn mặc đinh của file sao lưu là: " + path + "\\BackupQuanLyNhanSu.bak<br />";
            lbNote.Text += "5. KHÔNG ĐÓNG CỬA SỔ NÀY KHI ĐANG TIẾN HÀNH SAO LƯU HOẶC KHÔI PHỤC HỆ THỐNG!<br /><br />";
        }
        protected void butBackup_Click(object sender, EventArgs e)
        {
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            try
            {
                _entities.ExecuteStoreCommand("BACKUP DATABASE [QuanLyNhanSu] TO DISK='"+path+"\\BackupQuanLyNhanSu.bak'");
                RadWindowManager1.RadAlert("Sao lưu dữ liệu thành công", 300, 100, "Thành công", "");                
            }
            catch (SqlException ex)
            {
                RadWindowManager1.RadAlert("Lỗi: " + ex.Message, 300, 100, "Lỗi", "");
                return;
            }
        }

        protected void butRestore_Click(object sender, EventArgs e)
        {
            try
            {
                _entities.ExecuteStoreCommand("USE MASTER RESTORE DATABASE [QuanLyNhanSu] FROM DISK='" + path + "\\BackupQuanLyNhanSu.bak'");                
                RadWindowManager1.RadAlert("Khôi phục dữ liệu thành công", 300, 100, "Thành công", "");
            }
            catch (SqlException ex)
            {
                RadWindowManager1.RadAlert("Lỗi: " + ex.Message, 300, 100, "Lỗi", "");
                return;
            }
        }
    }
}