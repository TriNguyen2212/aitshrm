using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using System.DirectoryServices;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using Aits_Hrm.Model;

public partial class Dangnhap : System.Web.UI.Page 
{
    static string prevPage = String.Empty; // static variable to back previous page
    private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
       
            Login1.DestinationPageUrl = "~/Home";

    }

    protected void Login_Authenticate(object sender, AuthenticateEventArgs e)
    {        
        if (UserValidate(sender))
        {
            e.Authenticated = true;
        }
        else
        {
            e.Authenticated = false;
        }
    }

    protected Boolean UserValidate(object sender)
    {
        Boolean b = false;
        DirectoryEntry entry = new DirectoryEntry();
        entry.Path = "LDAP://10.1.4.134:389";
        entry.Username = Login1.UserName;
        entry.Password = Login1.Password;
        DirectorySearcher seacrh = new  DirectorySearcher(entry);
        SearchResult Results;
        try
        {
            Results = seacrh.FindOne();
            if (Results != null)
            {
                
                var dt = _entities.DangNhaps.Where(x => x.Username == ((Login)sender).UserName).FirstOrDefault();
                var nv = _entities.HoSoNhanVien_UngVien.Where(x => x.IDNhanVien == dt.IDNhanVien).FirstOrDefault();
                if (nv.DuocDangNhap == true)
                {
                    Session["userID"] = dt.IDNhanVien;
                    b = true;
                }  
            }
        }
        catch (System.Exception ex)
        {
           // Error
        }
        return b;
    }
}
