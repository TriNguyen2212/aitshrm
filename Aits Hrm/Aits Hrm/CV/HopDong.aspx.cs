using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Aits_Hrm.Model;
using System.Collections;

namespace Aits_Hrm.CV
{
    public partial class HopDong : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["idNV"] = null;
            if (!IsPostBack)
            {
                var TreeData = _entities.CoCauToChucs;
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

        protected void RadTreeView1_Nodeclick(object sender, RadTreeNodeEventArgs e)
        {
            var dt = new object();
            if (RadTreeView1.SelectedNode.Level != 0)
            {
                dt = _entities.GetHopDongByIDPhongBan(Int32.Parse(e.Node.Value));
            }
            else
            {
                dt = _entities.GetAllHopDong();
            }
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();

            if (RadGrid1.Items.Count > 0)
            {
                RadGrid1.Items[0].Selected = true;
                GridDataItem item = RadGrid1.Items[0];
                Int32 IDHD = Int32.Parse(item["IDHopDongLD"].Text);
                Session["idHD"] = IDHD;
                FillCurrentDetail(IDHD);
                RadContextMenu1.Items.FindItemByValue("xoa").Enabled = true;
                RadContextMenu1.Items.FindItemByValue("sua").Enabled = true;
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
                Int32 IDHD = Int32.Parse(item["IDHopDongLD"].Text);
                Session["idHD"] = IDHD;
                FillCurrentDetail(IDHD);//tu dinh nghia ham dien du lieu vao tab.
            }
        }

        protected DateTime? SetNgay(GridItem item, string Column)
        {
            if (item.OwnerTableView.GetColumn(Column).CurrentFilterValue == string.Empty)
            {
                return new DateTime?();
            }
            else
            {
                return DateTime.Parse(item.OwnerTableView.GetColumn(Column).CurrentFilterValue);
            }
        }

        protected void FillCurrentDetail(Int32 ID)
        {
            //thong tin hop dong
             var hd = _entities.GetHopDongByID(ID).FirstOrDefault();
             if (hd != null)
             {
                 lbSoHD.Text = hd.SoHD;
                 lbNguoiDaiDien.Text = hd.NguoiDaiDien;
                 lbLoaiHD.Text = hd.LoaiHD;
                 lbNgayKy.Text = String.Format("{0:dd/MM/yyyy}", hd.NgayKyHD);
                 lbNgaycoHieuLuc.Text = String.Format("{0:dd/MM/yyyy}", hd.TuNgay);
                 lbNgayHetHieuLuc.Text = String.Format("{0:dd/MM/yyyy}", hd.DenNgay);
                 lbNguoiLD.Text = hd.NguoiLaoDong;
                 lbTrinhDo.Text = hd.TrinhDoChuyenMon;
                 lbChucDanhChuyenMon.Text = hd.ChucDanh;
                 lbChucDanhCongViec.Text = hd.ChucDanhCongViec;
                 lbNgach.Text = hd.MaNgach;
                 lbBac.Text = hd.Bac.ToString();
                 lbDonVi.Text = hd.ToChuc;
                 txtMucHuong.Text = hd.MucHuong.ToString() + "%";
                 var hesobacngach = _entities.BacNgaches.Where(b => b.IDBacNgach == hd.IDBacNgach).First().HeSo;
                 lbLuongBHXH.Text = String.Format("{0:###,###,###} ₫", hd.MucLuongToiThieu * Convert.ToDecimal(hesobacngach));
                 if (hd.AnhNhanVien != null) { ImageEmp.DataValue = hd.AnhNhanVien; ImageEmp.Width = 120; ImageEmp.Height = 160; ImageEmp.ResizeMode = BinaryImageResizeMode.Fill; }
                 else { ImageEmp.ImageUrl = "../Images/Staff.png"; ImageEmp.Width = 120; ImageEmp.Height = 160; }
                 //phu luc hop dong
                 var list = _entities.GetPhuLucHdByIDHd(ID);
                 RadGridPhuLucHD.DataSource = list;
                 RadGridPhuLucHD.DataBind();
             }            
        }

        protected void Timer_ontick(object sender, EventArgs e)
        {
            RadGrid1.DataSource = _entities.GetAllCV();
            RadGrid1.DataBind();
        }

        protected void Grid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var dt = new object();
            if (RadTreeView1.SelectedNode.Level != 0)
            {
                dt = _entities.GetHopDongByIDPhongBan(Int32.Parse(RadTreeView1.SelectedNode.Value));
            }
            else
            {
                dt = _entities.GetAllHopDong();
            }
            RadGrid1.DataSource = dt;
            if (RadGrid1.Items.Count > 0)
            {
                RadGrid1.Items[0].Selected = true;
                GridDataItem item = RadGrid1.Items[0];
                Int32 IDHD = Int32.Parse(item["IDHopDongLD"].Text);
                Session["idHD"] = IDHD;
                FillCurrentDetail(IDHD);
                RadContextMenu1.Items.FindItemByValue("xoa").Enabled = true;
                RadContextMenu1.Items.FindItemByValue("sua").Enabled = true;
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
                case "XoaHD":
                    Int32 idHD = (Int32)Session["idHD"];
                    _entities.DeleteHopDongByID(idHD);
                    RadGrid1.Rebind();
                    tne = new RadTreeNodeEventArgs(RadTreeView1.SelectedNode);
                    RadTreeView1_Nodeclick(sender, tne);
                    break;
                case "RebindGrid":
                    tne = new RadTreeNodeEventArgs(RadTreeView1.SelectedNode);
                    RadTreeView1_Nodeclick(sender, tne);
                    break;
            }
        }

        protected void RadGridPhuLucHD_OnItemCommand(object sender, GridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "download":
                    ArrayList Args = new ArrayList();
                    Args.AddRange(e.CommandArgument.ToString().Split(new char[] { '/' }));
                    String pathFile =  e.CommandArgument.ToString();
                    String fileName = Args[Args.Count - 1].ToString();
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);
                    Response.WriteFile(pathFile);
                    Response.End();
                    break;
            }
        }       
    }
}