using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Aits_Hrm.Model;
using Aits_Hrm.CommonMethod;

namespace Aits_Hrm.QuanTri
{
    public partial class User_NhomQuyen : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        Methods cbm = new Methods();
        private int idUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            idUser = (int)Session["userID"];
            if (!IsPostBack)
            {
                cbxNhomQuyen.DataSource = _entities.NhomQuyens;
                cbxNhomQuyen.DataBind();
                cbxNhomQuyen.SelectedValue = Session["nhomQuyen"].ToString();
                cbxNhanVien.DataTextField = "TenNV";
                var dt = _entities.GetAllCV();
                cbxNhanVien.DataSource = dt;
                cbxNhanVien.DataBind();                
                if (Request.QueryString["mode"] == "edit")
                {
                    cbxNhanVien.SelectedValue= Session["idNvPq"].ToString();
                    cbxNhanVien.Enabled = false;
                    int idNhanVien = (int)Session["idNvPq"];
                    var nvnq = _entities.NhanVien_NhomQuyen.Where(x => x.IDNhanVien == idNhanVien).FirstOrDefault();
                    lbLog.Text = "Người tạo: " + cbm.GetTenNVByID(nvnq.NguoiTao) + " lúc " + nvnq.NgayTao.ToString() + " -:- Người sửa: " + cbm.GetTenNVByID(nvnq.NguoiCapNhat) + " lúc " + nvnq.NgayCapNhat.ToString();
                }
            }
        }

        protected void cbxNhanVien_ItemDataBound(object sender, RadComboBoxItemEventArgs e)
        {
            e.Item.Text = string.Concat(e.Item.Text.ToLower());
        }

        protected void RadToolBar1_ButtonClick1(object sender, RadToolBarEventArgs e)
        {
            switch (e.Item.Value)
            {
                case "Save":
                    Int32 idNhanVien = Int32.Parse(cbxNhanVien.SelectedValue);
                    Int32 idNhomQuyen = Int32.Parse(cbxNhomQuyen.SelectedValue);
                    NhanVien_NhomQuyen nvq = new NhanVien_NhomQuyen();
                    var dt = _entities.NhanVien_NhomQuyen.Where(x => x.IDNhanVien == idNhanVien).FirstOrDefault();
                    if (dt != null)
                    {
                        dt.IDNhomQuyen = idNhomQuyen;
                        dt.NgayCapNhat = DateTime.Now;
                        dt.NguoiCapNhat = idUser;
                        _entities.SaveChanges();
                    }
                    else
                    {
                        nvq.IDNhanVien = idNhanVien;
                        nvq.IDNhomQuyen = idNhomQuyen;
                        nvq.NgayTao = nvq.NgayCapNhat = DateTime.Now;
                        nvq.NguoiTao = nvq.NguoiCapNhat = idUser;
                        _entities.AddToNhanVien_NhomQuyen(nvq);
                        _entities.SaveChanges();
                    }
                    RadWindowManager1.RadAlert("Lưu thông tin thành công", 200, 100, "Thông báo", null);
                    break;
            }
        }

        protected void cbxNhanVien_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            //var dt = from q in _entities.GetAllCV()
            //         where q.TenNV.Contains(e.Text)
            //         select q;
            //cbxNhanVien.DataSource = dt;
            //cbxNhanVien.DataBind();
        }
    }
}