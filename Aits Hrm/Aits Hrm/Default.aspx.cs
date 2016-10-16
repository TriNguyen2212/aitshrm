using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using Aits_Hrm.Model;

public partial class Default : System.Web.UI.Page 
{
    private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("/Home");
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

    protected Boolean UserValidate(object sender)  // tu viet
    {
        Boolean b = false;
        var dt = _entities.DangNhaps.Where(x => x.Username == ((Login)sender).UserName).FirstOrDefault();
        if (dt != null)
        {
            if (dt.Password == ((Login)sender).Password)
            {
                b = true;
                Session["userId"] = dt.IDNhanVien;// user dang nhap
            }
        }
        return b;
    }
}
