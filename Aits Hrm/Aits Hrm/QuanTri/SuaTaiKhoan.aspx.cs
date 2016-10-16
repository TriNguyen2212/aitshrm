using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using Aits_Hrm.Model;
using Aits_Hrm.CommonMethod;
using Telerik.Web.UI;

namespace Aits_Hrm.QuanTri
{
    public partial class SuaTaiKhoan : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        Methods cbm = new Methods();
        private int idUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            idUser = (int)Session["userID"];
            if (!IsPostBack)
            {
                FillData();
                cbxNhanVien.DataTextField = "TenNV";
                var dt = _entities.GetAllCV();
                cbxNhanVien.DataSource = dt;
                cbxNhanVien.DataBind();
            }            
        }

        protected void FillData()
        {
            Int32 IDAcc = (Int32)Session["idAcc"];
            DangNhap dn = _entities.DangNhaps.Where(x => x.IDDangNhap == IDAcc).FirstOrDefault();
            HoSoNhanVien_UngVien nv = _entities.HoSoNhanVien_UngVien.Where(x=> x.IDNhanVien == dn.IDNhanVien).FirstOrDefault();
            txtTenDangNhap.Text = dn.Username;
            chbCanLogin.Checked = (bool)nv.DuocDangNhap;
            cbxNhanVien.Text = nv.TenNV;
            lbLog.Text = "Người tạo: " + cbm.GetTenNVByID(dn.NguoiTao) + " lúc " + dn.NgayTao.ToString();
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
                    Int32 IDAcc = (Int32)Session["idAcc"];
                    DangNhap dn = _entities.DangNhaps.Where(x => x.IDDangNhap == IDAcc).FirstOrDefault();
                    dn.Username = txtTenDangNhap.Text;
                    dn.NguoiTao = idUser;
                    dn.NgayTao = DateTime.Now;
                    //dn.Password = txtMatkhau.Text;
                    /*Int32 IDNhanVien = Int32.Parse(cbxNhanVien.SelectedValue);*/
                    dn.IDNhanVien = Int32.Parse(cbxNhanVien.SelectedValue);
                    HoSoNhanVien_UngVien nv = _entities.HoSoNhanVien_UngVien.Where(x => x.IDNhanVien == dn.IDNhanVien).FirstOrDefault();
                    nv.DuocDangNhap = chbCanLogin.Checked;
                    _entities.SaveChanges();
                    RadWindowManager1.RadAlert("Sửa tài khoản thành công", 285, 100, "Thông báo", "");
                    break;
            }
        }

        protected void cbxNhanVien_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            var dt = from q in _entities.GetAllCV()
                     where q.TenNV.Contains(e.Text) 
                     select q;
            cbxNhanVien.DataSource = dt;
            cbxNhanVien.DataBind();
        }
    }
}