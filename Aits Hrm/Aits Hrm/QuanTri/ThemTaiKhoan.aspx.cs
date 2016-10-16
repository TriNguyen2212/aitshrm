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
    public partial class ThemTaiKhoan : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        Methods cbm = new Methods();
        private int idUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            idUser = (int)Session["userID"];
            cbxNhanVien.DataTextField = "TenNV";
            var dt = _entities.GetAllCV();
            var lstDangNhap = _entities.DangNhaps;
            cbxNhanVien.DataSource = dt;
            cbxNhanVien.DataBind();
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
                    Int32 IDNhanVien = Int32.Parse(cbxNhanVien.SelectedValue);
                    var userdn = _entities.DangNhaps.Where(x => x.IDNhanVien == IDNhanVien).FirstOrDefault();                    
                    if (userdn == null)
                    {
                        if (_entities.DangNhaps.Where(x => x.Username == txtTenDangNhap.Text).FirstOrDefault() == null)
                        {
                            DangNhap dn = new DangNhap();
                            dn.Username = txtTenDangNhap.Text;
                            //dn.Password = txtMatkhau.Text;
                            dn.NgayTao = DateTime.Now;
                            dn.NguoiTao = idUser;
                            dn.IDNhanVien = IDNhanVien;
                            HoSoNhanVien_UngVien nv = _entities.HoSoNhanVien_UngVien.Where(x => x.IDNhanVien == IDNhanVien).FirstOrDefault();
                            nv.DuocDangNhap = chbCanLogin.Checked;
                            _entities.AddToDangNhaps(dn);
                            _entities.SaveChanges();
                            RadWindowManager1.RadAlert("Thêm tài khoản thành công", 285, 100, "Thông báo", null);
                        }
                        else
                        {
                            RadWindowManager1.RadAlert("Tên đăng nhập này đã tồn tại", 285, 100, "Lỗi", "");
                        }
                    }
                    else
                    {
                        RadWindowManager1.RadAlert("Tài khoản đã được sử dụng trên hệ thống", 290, 100, "Lỗi", "");
                    }
                    break;
                case "Reset":
                    txtTenDangNhap.Text = "";
                    chbCanLogin.Checked = false;
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