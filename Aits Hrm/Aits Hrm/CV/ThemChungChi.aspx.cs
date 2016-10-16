using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aits_Hrm.Model;
using Aits_Hrm.CommonMethod;
using System.Collections;
using Telerik.Web.UI;
using System.IO;

namespace Aits_Hrm.CV
{
    public partial class ThemChungChi : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        Methods cbm = new Methods();
        private int idUser;
        private static int? idDaoTao = null;
        private static byte[] imgdata = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckPermis();
            idUser = (int)Session["userID"];
            if (Session["idNV"] == null)
            {
                Response.Redirect("HoSo.aspx");
            }
            if (!IsPostBack)
            {
                // Load data into each combobox
                cbm.LoadCombobox(cboTenChungChi, _entities.ChungChis, "TenChungChi", "IDChungChi");
                cbm.LoadCombobox(cboNoiDT, _entities.NoiCapBangs, "NoiCapBang1", "IDNoiCapBang");
                cbm.LoadCombobox(cboLoaiBang, _entities.LoaiBangDTs, "LoaiBangDT1", "IDLoaiBangDT");
                cbm.LoadCombobox(cboChuyenNganh, _entities.ChuyenNganhDTs, "ChuyenNganh", "IDChuyenNganh");
                // End load
                idDaoTao = null;
            }
        }

        protected void CheckPermis()
        {
            // xem dang nhap chua
            Methods m = new Methods();
            m.CheckUserLoged();
            // kiem tra quyen
            Int32 IDUser = (Int32)Session["UserID"];
            ArrayList dsQuyen = new ArrayList();
            
            dsQuyen.AddRange(_entities.GetQuyenByIDNhanVien(IDUser, 7).ToArray());//chuc nang dao tao
            RadToolBar1.Items.FindItemByValue("Save").Enabled = dsQuyen.Contains(2);
            RadToolBar1.Items.FindItemByValue("Reset").Enabled = dsQuyen.Contains(2);
            grvChungChi.Columns.FindByUniqueName("columnXoa").Visible = dsQuyen.Contains(3);

        }

        protected void RadAjaxManager1_AjaxRequest(object sender, AjaxRequestEventArgs e)
        {
            if (e.Argument == "a")
            {
                AnhScan.ImageUrl = "../Images/no_photo.jpg";
            }
        }

        protected void AsyncUpload1_FileUploaded(object sender, FileUploadedEventArgs e)
        {
            using (Stream stream = e.File.InputStream)
            {
                imgdata = new byte[stream.Length];
                stream.Read(imgdata, 0, (int)stream.Length);
                AnhScan.DataValue = imgdata;
            }
        }

        protected void RadToolBar1_ButtonClick(object sender, RadToolBarEventArgs e)
        {
            switch (e.Item.Value)
            {
                case "Save":
                    if (idDaoTao == null)
                    {
                        DaoTao dt = new DaoTao();
                        dt.IDNhanVien = (int)Session["idNV"];
                        dt.IDChungChi = Convert.ToInt32(cboTenChungChi.SelectedValue);
                        dt.IDNoiCapBang = Convert.ToInt32(cboNoiDT.SelectedValue);
                        dt.TuNgay = txtTuNgay.SelectedDate;
                        dt.DenNgay = txtDenNgay.SelectedDate;
                        dt.IDChuyenNganh = Convert.ToInt32(cboChuyenNganh.SelectedValue);
                        dt.IDLoaiBangDT = Convert.ToInt32(cboLoaiBang.SelectedValue);
                        if (txtDiem.Text != "") dt.Diem = Convert.ToDouble(txtDiem.Text);
                        else dt.Diem = null;
                        dt.Anh = imgdata;
                        dt.Type = 1; // Type = 1 là chứng chỉ
                        dt.NgayTao = dt.NgayCapNhat = DateTime.Now;
                        dt.NguoiTao = dt.NguoiCapNhat = idUser;
                        _entities.AddToDaoTaos(dt);
                        try
                        {
                            _entities.SaveChanges();
                            grvChungChi.Rebind();
                            RadWindowManager1.RadAlert("Thêm thông tin thành công",285,100,"Thông báo",null);
                        }
                        catch (Exception ex)
                        {
                            RadWindowManager1.RadAlert("Thêm thông tin thất bại", 285, 100, "Lỗi", null);
                            throw ex;
                        }
                    }
                    else
                    {
                        DaoTao daoTao = _entities.DaoTaos.Where(d => d.IDDaoTao == idDaoTao).FirstOrDefault();
                        daoTao.IDChungChi = Convert.ToInt32(cboTenChungChi.SelectedValue);
                        daoTao.IDNoiCapBang = Convert.ToInt32(cboNoiDT.SelectedValue);
                        daoTao.TuNgay = txtTuNgay.SelectedDate;
                        daoTao.DenNgay = txtDenNgay.SelectedDate;
                        daoTao.IDChuyenNganh = Convert.ToInt32(cboChuyenNganh.SelectedValue);
                        daoTao.IDLoaiBangDT = Convert.ToInt32(cboLoaiBang.SelectedValue);
                        if (txtDiem.Text != "")
                        {
                            daoTao.Diem = Convert.ToDouble(txtDiem.Text);
                        }
                        else
                        {
                            daoTao.Diem = null;
                        }
                        daoTao.Anh = imgdata;
                        daoTao.Type = 1; // Type = 1 là chứng chỉ
                        daoTao.NgayCapNhat = DateTime.Now;
                        daoTao.NguoiCapNhat = idUser;
                        try
                        {
                            _entities.SaveChanges();
                            grvChungChi.Rebind();
                            RadWindowManager1.RadAlert("Sửa thông tin thành công", 285, 100, "Thông báo", null);
                        }
                        catch (Exception ex)
                        {
                            RadWindowManager1.RadAlert("Sửa thông tin thất bại", 285, 100, "Lỗi", null);
                            throw ex;
                        }
                    }
                    break;
                case "Reset":
                    cboTenChungChi.SelectedIndex = -1;
                    cboNoiDT.SelectedIndex = -1;
                    txtTuNgay.Clear();
                    txtDenNgay.Clear();
                    cboChuyenNganh.SelectedIndex = -1;
                    cboLoaiBang.SelectedIndex = -1;
                    txtDiem.Text = "";
                    upAnh.UploadedFiles.Clear();
                    AnhScan.ImageUrl = "../Images/no_photo.jpg";
                    idDaoTao = null;
                    break;
            }
        }

        protected void grvChungChi_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "RowClick" && e.Item is GridDataItem)
            {
                e.Item.Selected = true;
                idDaoTao = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["IDDaoTao"]);
                var daoTao = _entities.DaoTaos.Where(d => d.IDDaoTao == idDaoTao).FirstOrDefault();
                cboTenChungChi.SelectedValue = daoTao.IDChungChi.ToString();
                cboNoiDT.SelectedValue = daoTao.IDNoiCapBang.ToString();
                cboChuyenNganh.SelectedValue = daoTao.IDChuyenNganh.ToString();
                txtTuNgay.SelectedDate = daoTao.TuNgay;
                txtDenNgay.SelectedDate = daoTao.DenNgay;
                cboLoaiBang.SelectedValue = daoTao.IDLoaiBangDT.ToString();
                txtDiem.Text = String.Format("{0:#.#}",daoTao.Diem);
                AnhScan.Height = Unit.Pixel(160);
                AnhScan.Width = Unit.Pixel(160);
                if (daoTao.Anh != null)
                {
                    AnhScan.DataValue = imgdata = daoTao.Anh;
                }
                else
                {
                    AnhScan.ImageUrl = "../Images/no_photo.jpg";
                }
                RadBinaryImage imgl = (RadBinaryImage)e.Item.FindControl("largeImage");
                HyperLink lnk = (HyperLink)e.Item.FindControl("Link1");
                lnk.NavigateUrl = imgl.ImageUrl;
            }
        }

        protected void grvChungChi_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            var ID = (e.Item as GridDataItem).GetDataKeyValue("IDDaoTao").ToString();
            int id = Convert.ToInt32(ID);
            DaoTao dt = _entities.DaoTaos.Where(d => d.IDDaoTao == id).FirstOrDefault();
            _entities.DaoTaos.DeleteObject(dt);
            _entities.SaveChanges();
        }

        protected void grvChungChi_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var listDT = _entities.GetDaoTaoByIDNhanVien((int)Session["idNV"]).Where(x=>x.Type==1); // Type = 1 là chứng chỉ
            grvChungChi.DataSource = listDT;
        }

        protected void butXoaAnh_Click(object sender, EventArgs e)
        {
            imgdata = null;
            AnhScan.ImageUrl = "../Images/no_photo.jpg";
        }
    }    
}