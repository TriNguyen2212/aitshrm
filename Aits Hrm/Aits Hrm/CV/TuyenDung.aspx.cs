using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Aits_Hrm.Model;
using Aits_Hrm.CommonMethod;
using System.Collections;

namespace Aits_Hrm.CV
{
    public partial class TuyenDung : System.Web.UI.Page
    {
         private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                var dt = _entities.GetAllCVUngVien();
                RadGrid1.DataSource = dt;
                RadGrid1.DataBind();
                RadGrid1.Items[0].Selected = true;
                GridDataItem item = RadGrid1.Items[0];
                Int32 IDNhanVien = Int32.Parse(item["IDNhanVien"].Text);
                FillCurrentEmployeeDetail(IDNhanVien);                
                var TreeData = _entities.GetDotTuyenDung();
                RadTreeView1.DataTextField = "TenDotTuyenDung";
                RadTreeView1.DataFieldID = "IDDotTuyenDung";
                RadTreeView1.DataFieldParentID = "IDParent";
                RadTreeView1.DataSource = TreeData;
                RadTreeView1.DataBind();
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
            dsQuyen.AddRange(_entities.GetQuyenByIDNhanVien(IDUser, 1).ToArray());//chuc nang ho so
            RadContextMenu1.Items.FindItemByValue("them").Enabled = dsQuyen.Contains(1);
            RadContextMenu1.Items.FindItemByValue("xoa").Enabled = dsQuyen.Contains(3);
            RadContextMenu1.Items.FindItemByValue("in").Enabled = dsQuyen.Contains(4);
            dsQuyen = new ArrayList();
            dsQuyen.AddRange(_entities.GetQuyenByIDNhanVien(IDUser, 4).ToArray());// chuc nang nhan than
            RadContextMenuNhanThan.Items.FindItemByValue("sua").Enabled = dsQuyen.Contains(5);
            dsQuyen = new ArrayList();
            dsQuyen.AddRange(_entities.GetQuyenByIDNhanVien(IDUser, 2).ToArray());//chuc nang HDLD
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
                dt = _entities.GetCVUngVienByIDTuyendung(Int32.Parse(e.Node.Value));
            }
            else
            {
                dt = _entities.GetCVUngVienByVongTuyendung(Int32.Parse(e.Node.Value));
            }

            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
           
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

        protected void RadGrid1_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridPagerItem)
            {
                GridPagerItem gridPager = e.Item as GridPagerItem;
                Control numericPagerControl = gridPager.GetNumericPager();
                Control placeHolder = gridPager.FindControl("NumericPagerPlaceHolder");
                placeHolder.Controls.Add(numericPagerControl);
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

        protected void FillCurrentEmployeeDetail(Int32 IDNhanvien)
        {
            Session["idNV"] = IDNhanvien;
            HoSoNhanVien_UngVien lq = (from q in _entities.HoSoNhanVien_UngVien
                                       where q.IDNhanVien == IDNhanvien
                                       select q).First();
            //***  thong tin chung ***//
            lbMaNV.Text = lq.MaNV.ToString();
            lbTenNV.Text = lq.TenNV.ToString();
            lbGioitinh.Text = (lq.GioiTinh == true) ? "Nam" : "Nữ";
            lbDateOfBirth.Text = String.Format("{0:dd/MM/yyyy}", lq.NgaySinh);
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
            //*** thong tin lien lac ***//
            if (lq.SoDiDong != null) lbDTDĐ.Text = lq.SoDiDong.ToString(); else lbDTDĐ.Text = "";
            lbEmail.Text = lq.Email;
            lbDTCQ.Text = lq.SoMayBan;
            lbDiaChi.Text = lq.DiaChiLienHe;
            lbSoTK.Text = lq.SoTK;
            // *** thong tin nhan than ***//
            var nhanthan = from q in _entities.GetNhanThanByIDNhanVien(IDNhanvien)
                           select q;
            RadGridNhanThan.DataSource = nhanthan;
            RadGridNhanThan.DataBind();
            
            // *** thong tin dao tao ***//
            var daotao = from q in _entities.GetDaoTaoByIDNhanVien(IDNhanvien)
                         select q;
            GridDT.DataSource = daotao;
            GridDT.DataBind();
            //*** thong tin qua trinh lam viec ***//
            var qtlv = from q in _entities.GetQuaTrinhLamViecByIDNhanVien(IDNhanvien)
                       select q;
            GridQTCT.DataSource = qtlv;
            GridQTCT.DataBind();
        }

        protected void Grid_PreRender(object sender, EventArgs e)
        {
            Int32 IDNhanVien = (Int32)Session["idNV"];
            FillCurrentEmployeeDetail(IDNhanVien);
        }

        protected void Grid_Sort(object sender, GridSortCommandEventArgs e)
        {
            GridSortExpression sortExpr = new GridSortExpression();
            switch (e.OldSortOrder)
            {
                case GridSortOrder.None:
                    sortExpr.FieldName = e.SortExpression;
                    sortExpr.SortOrder = GridSortOrder.Descending;

                    e.Item.OwnerTableView.SortExpressions.AddSortExpression(sortExpr);
                    break;
                case GridSortOrder.Ascending:
                    sortExpr.FieldName = e.SortExpression;
                    sortExpr.SortOrder = RadGrid1.MasterTableView.AllowNaturalSort ? GridSortOrder.None : GridSortOrder.Descending;
                    e.Item.OwnerTableView.SortExpressions.AddSortExpression(sortExpr);
                    break;
                case GridSortOrder.Descending:
                    sortExpr.FieldName = e.SortExpression;
                    sortExpr.SortOrder = GridSortOrder.Ascending;

                    e.Item.OwnerTableView.SortExpressions.AddSortExpression(sortExpr);
                    break;
            }
            e.Canceled = true;
            RadGrid1.Rebind();
        }

        protected void GridPageIndexChanged(object sender, GridPageChangedEventArgs e)
        {
            RadGrid1.CurrentPageIndex = e.NewPageIndex;
        }

        protected void Timer_ontick(object sender, EventArgs e)
        {
            var dt = _entities.GetAllCV();
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }

        protected void Grid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var dt = _entities.GetAllCV();
            RadGrid1.DataSource = dt;
            //RadGrid1.DataBind();
        }

        protected void AjaxManager_Request(object sender, AjaxRequestEventArgs e)
        {
            RadTreeNodeEventArgs tne;// = new RadTreeNodeEventArgs(RadTreeView1.SelectedNode);
            switch (e.Argument)
            {
                case "XoaNV":
                    var dt = _entities.DeleteEmployeeByIDNhanVien((Int32)Session["idNV"]);
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
                        dtRebind =  _entities.GetCVByIDToChuc(Int32.Parse(tn.Value));
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