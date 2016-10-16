using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aits_Hrm.Model;
using Telerik.Web.UI;
using Aits_Hrm.CommonMethod;
using System.Collections;
namespace Aits_Hrm
{
    public partial class Hoso : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            /*if (Session["UserID"] != null )*/ CheckPermis();

            if (!IsPostBack) 
            {
                // fill data treeview
                var TreeData = from k in _entities.CoCauToChucs
                               select k;
                RadTreeView1.DataTextField = "TenDonVi";
                RadTreeView1.DataFieldID = "IDCoCauToChuc";
                RadTreeView1.DataFieldParentID = "IDParent";
                RadTreeView1.DataSource = TreeData;
                RadTreeView1.DataBind();
                RadTreeView1.Nodes[0].Selected = true;
                RadTreeNodeEventArgs tne = new RadTreeNodeEventArgs(RadTreeView1.Nodes[0]);
                RadTreeView1_Nodeclick(sender, tne);
            }
        }

        /*
         * kiem tra quyen su dung cua user
         */
        protected void CheckPermis()
        {
            // xem dang nhap chua
            Methods m = new Methods();
            m.CheckUserLoged();
            // kiem tra quyen
            Int32 IDUser = (Int32)Session["UserID"];
            ArrayList dsQuyen = new ArrayList();
            dsQuyen.AddRange(_entities.GetQuyenByIDNhanVien(IDUser, 1).ToArray());//chuc nang ho so
            RadContextMenu1.Items.FindItemByValue("them").Enabled = dsQuyen.Contains(1);
            RadContextMenu1.Items.FindItemByValue("xoa").Enabled = dsQuyen.Contains(3);
            RadContextMenu1.Items.FindItemByValue("in").Enabled = dsQuyen.Contains(4);
            dsQuyen = new ArrayList();
            dsQuyen.AddRange(_entities.GetQuyenByIDNhanVien(IDUser, 4).ToArray());// chuc nang nhan than
            RadContextMenuNhanThan.Items.FindItemByValue("sua").Enabled = dsQuyen.Contains(5);
            dsQuyen = new ArrayList();
            dsQuyen.AddRange(_entities.GetQuyenByIDNhanVien(IDUser, 2).ToArray());//chuc nang HDLD
            RadContextMenuHD.Items.FindItemByValue("sua").Enabled = dsQuyen.Contains(5);
            dsQuyen = new ArrayList();
            dsQuyen.AddRange(_entities.GetQuyenByIDNhanVien(IDUser, 7).ToArray());//chuc nang dao tao
            RadContextMenuDaoTao.Items.FindItemByValue("sua").Enabled = dsQuyen.Contains(5);
            dsQuyen = new ArrayList();
            dsQuyen.AddRange(_entities.GetQuyenByIDNhanVien(IDUser, 8).ToArray());//chuc nang QTCT
            RadContextMenuQTCT.Items.FindItemByValue("sua").Enabled = dsQuyen.Contains(5);
        }

        protected void RadTreeView1_Nodeclick(object sender, RadTreeNodeEventArgs e)
        {
           var dt = new object();
           if (e.Node.Level.Equals(0))
           {
                dt = _entities.GetAllCV();
           }
           else
           {
               dt = _entities.GetCVByIDToChuc(Int32.Parse(e.Node.Value));
           }
            HoSoNhanVien_UngVien hs= new HoSoNhanVien_UngVien();
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
            if (RadGrid1.Items.Count > 0 )
            {
               
                RadGrid1.Items[0].Selected = true;
                GridDataItem item = RadGrid1.Items[0];
                Int32 IDNhanVien = Int32.Parse(item["IDNhanVien"].Text);
                FillCurrentEmployeeDetail(IDNhanVien);
                RadContextMenu1.Items.FindItemByValue("xoa").Enabled = true;
                RadContextMenu1.Items.FindItemByValue("sua").Enabled = true;
                CheckPermis();
            }
            else
            {
                RadContextMenu1.Items.FindItemByValue("xoa").Enabled = false;
                RadContextMenu1.Items.FindItemByValue("sua").Enabled = false;
            }
        }

        protected void Grid_ItemCommand(object sender, GridCommandEventArgs e)
        { 
            if (e.CommandName == "RowClick")
            {
                GridDataItem item = (GridDataItem)e.Item;
                Int32 IDNhanVien = Int32.Parse(item["IDNhanVien"].Text);
                FillCurrentEmployeeDetail(IDNhanVien);//tu dinh nghia ham dien du lieu vao tab.
            }
        }

        protected DateTime? SetNgaySinh(GridItem item)
        {
            if (item.OwnerTableView.GetColumn("NgaySinh").CurrentFilterValue == string.Empty)
            {
                return new DateTime?();
            }
            else
            {
                return DateTime.Parse(item.OwnerTableView.GetColumn("NgaySinh").CurrentFilterValue);
            }
        }

        public void FillCurrentEmployeeDetail(Int32 IDNhanvien)
        {
            Session["idNV"] = IDNhanvien;
            HoSoNhanVien_UngVien lq = (from q in _entities.HoSoNhanVien_UngVien
                     where q.IDNhanVien == IDNhanvien
                     select q).First();
            //***  thong tin chung ***//
            lbMaNV.Text = lq.MaNV.ToString();
            lbTenNV.Text = lq.TenNV.ToString();
            lbGioitinh.Text = (lq.GioiTinh == true) ? "Nam" : "Nữ";
            lbDateOfBirth.Text = String.Format("{0:dd/MM/yyyy}",lq.NgaySinh);
            lbNoiSinh.Text = lq.NoiSinh;
            lbDanToc.Text = lq.DanToc.DanToc1;
            lbTonGiao.Text = lq.TonGiao.TonGiao1;
            lbQuocTich.Text = lq.QuocTich.QuocTich1;
            if (lq.SoCNMD != null) lbCMND.Text = lq.SoCNMD.ToString(); else lbCMND.Text = "";
            if (lq.NgayCapCMND != null) lbNgayCapCMND.Text = String.Format("{0:dd/MM/yyyy}", lq.NgayCapCMND); else lbNgayCapCMND.Text = "";
            if (lq.NoiCapCMND != null) lbNoiCapCMND.Text = lq.NoiCapCMND.ToString(); else lbNoiCapCMND.Text = "";
            if (lq.AnhCaNhan != null) { ImageEmp.DataValue = lq.AnhCaNhan; ImageEmp.Width = 120; ImageEmp.Height = 160; ImageEmp.ResizeMode = BinaryImageResizeMode.Fill; } 
            else { ImageEmp.ImageUrl = "../Images/Staff.png"; ImageEmp.Width = 120; ImageEmp.Height = 160; }
            lbChucDanh.Text = (_entities.GetChucDanhByNhanVien(IDNhanvien).FirstOrDefault() != null) ? _entities.GetChucDanhByNhanVien(IDNhanvien).FirstOrDefault().TenChucDanh : "";
            lbDonVi.Text = (_entities.GetDonViCongTacByIDNhanVien(IDNhanvien).FirstOrDefault() != null) ? _entities.GetDonViCongTacByIDNhanVien(IDNhanvien).FirstOrDefault().TenDonVi : "";
            txtNgayVaoHK.Text = String.Format("{0:dd/MM/yyyy}", lq.NgayVaoHK);
            lbNgayBienChe.Text = String.Format("{0:dd/MM/yyyy}", lq.NgayBienChe);
            //*** thong tin lien lac ***//
            if (lq.SoDiDong != null) lbDTDĐ.Text = lq.SoDiDong.ToString(); else lbDTDĐ.Text = "";
            lbEmail.Text = lq.Email;
            lbDTCQ.Text = lq.SoMayBan;
            lbDiaChi.Text = lq.DiaChiLienHe;
            lbSoTK.Text = lq.SoTK;
            // *** thong tin nhan than ***//
            RadGridNhanThan.DataSource = _entities.GetNhanThanByIDNhanVien(IDNhanvien);
            RadGridNhanThan.DataBind();
            //*** thong tin hop dong ***//
            var hd = from q in _entities.GetHopDongByIDNhanVien(IDNhanvien)
                     select q;
            GridHD.DataSource = hd;
            GridHD.DataBind();
            // *** thong tin dao tao ***//
            var daotao = _entities.GetDaoTaoByIDNhanVien(IDNhanvien).Where(x=>x.Type == 0);
            GridDT.DataSource = daotao;
            GridDT.DataBind();
            // *** thong tin chung chi ***//
            var chungchi = _entities.GetDaoTaoByIDNhanVien(IDNhanvien).Where(x => x.Type == 1);
            GridChungChi.DataSource = chungchi;
            GridChungChi.DataBind();
            //*** thong tin qua trinh lam viec ***//
            var qtlv = from q in _entities.GetQuaTrinhLamViecByIDNhanVien(IDNhanvien)
                       select q;
            GridQTCT.DataSource = qtlv;
            GridQTCT.DataBind();
            //*** thong tin qua trinh nghi ***//
            var qtnghi = from q in _entities.GetNghiByIDNhanVien(IDNhanvien)
                       select q;
            grvNghi.DataSource = qtnghi;
            grvNghi.DataBind();
        }

        protected void grvNghi_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if ((e.Item is GridDataItem))
            {
                GridDataItem dataItem = (GridDataItem)e.Item;
                Label duocNghiLabel = (Label)dataItem.FindControl("DuocNghiLabel");
                switch (duocNghiLabel.Text)
                {
                    case "":
                        duocNghiLabel.Text = "Chưa duyệt";
                        break;
                    case "True":
                        duocNghiLabel.Text = "Có";
                        break;
                    case "False":
                        duocNghiLabel.Text = "Không";
                        break;
                }
            }
        }

        protected void Grid_PreRender(object sender, EventArgs e)
        {
            Int32 IDNhanVien = (Int32)Session["idNV"];
            FillCurrentEmployeeDetail(IDNhanVien);
        }

        protected void Timer_ontick(object sender, EventArgs e)
        {
            RadGrid1.DataSource = _entities.GetAllCV();
            RadGrid1.DataBind();
        }

        protected void Grid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var dt = new object();
            if (RadTreeView1.SelectedNode.Level.Equals(0))
            {
                dt = _entities.GetAllCV();
            }
            else
            {
                dt = _entities.GetCVByIDToChuc(Int32.Parse(RadTreeView1.SelectedNode.Value));
            }
            //HoSoNhanVien_UngVien hs = new HoSoNhanVien_UngVien();
            RadGrid1.DataSource = dt;
            //RadGrid1.Rebind();
            if (RadGrid1.Items.Count > 0)
            {

                RadGrid1.Items[0].Selected = true;
                GridDataItem item = RadGrid1.Items[0];
                Int32 IDNhanVien = Int32.Parse(item["IDNhanVien"].Text);
                FillCurrentEmployeeDetail(IDNhanVien);
                RadContextMenu1.Items.FindItemByValue("xoa").Enabled = true;
                RadContextMenu1.Items.FindItemByValue("sua").Enabled = true;
                CheckPermis();
            }
            else
            {
                RadContextMenu1.Items.FindItemByValue("xoa").Enabled = false;
                RadContextMenu1.Items.FindItemByValue("sua").Enabled = false;
            }                 
        }

        protected void AjaxManager_Request(object sender, AjaxRequestEventArgs e)
        {
            RadTreeNodeEventArgs tne;// = new RadTreeNodeEventArgs(RadTreeView1.SelectedNode);
            switch (e.Argument)
            {
                case "XoaNV":
                    int idNv = (int)Session["idNV"];
                    var hs = _entities.HoSoNhanVien_UngVien.Where(x => x.IDNhanVien == idNv).FirstOrDefault();
                    hs.isVisible = false;
                    hs.NgayCapNhat = DateTime.Now;
                    hs.NguoiCapNhat = (int)Session["userID"];
                    _entities.SaveChanges();
                   //var dt = _entities.DeleteEmployeeByIDNhanVien((Int32)Session["idNV"]);
                   RadGrid1.Rebind();
                   tne = new RadTreeNodeEventArgs(RadTreeView1.SelectedNode);
                   RadTreeView1_Nodeclick(sender, tne);
                   break;
                case "RebindGrid":
                   var dtRebind = new object();  
                    RadTreeNode tn = RadTreeView1.SelectedNode;
                    if (tn.Level.Equals(0))
                    {
                        dtRebind = _entities.GetAllCV();
                    }
                    else
                    {
                        dtRebind = _entities.GetCVByIDToChuc(Int32.Parse(tn.Value));
                   
                    }

                    RadGrid1.DataSource = dtRebind;
                    RadGrid1.DataBind();
                   //if (RadGrid1.Items.Count > 0)
                   {
                       FillCurrentEmployeeDetail((int)Session["idNV"]);
                   }

                   //foreach (GridDataItem item in RadGrid1.Items)
                   //{
                   //    if (item.RowIndex == 2)
                   //    {
                   //        item.Selected = true;
                   //    }
                   //}
                   break;
            }
        }

    }
}