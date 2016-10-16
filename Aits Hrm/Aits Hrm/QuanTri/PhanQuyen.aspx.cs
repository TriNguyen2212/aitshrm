using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aits_Hrm.CommonMethod;
using Aits_Hrm.Model;
using Telerik.Web.UI;
using System.Collections;

namespace Aits_Hrm.QuanTri
{
    public partial class PhanQuyen : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Methods m = new Methods();
            //m.CheckUserLoged();

            if (!IsPostBack)
            {
                // fill data treeview
                var dsNhom = _entities.NhomQuyens;
                RadTreeViewNhomQuyen.DataSource = dsNhom;
                RadTreeViewNhomQuyen.DataBind();

                var TreeData = from k in _entities.ChucNangs
                               select k;
                RadTreeViewChucNang.DataFieldParentID = "IDParent";
                RadTreeViewChucNang.DataTextField = "TenChucNang";
                RadTreeViewChucNang.DataValueField = "IDChucNang";
                RadTreeViewChucNang.DataSource = TreeData;
                RadTreeViewChucNang.DataBind();

                cblQuyen.DataValueField = "IDQuyen";
                cblQuyen.DataSource = _entities.Quyens;
                cblQuyen.DataBind();
                //RadTreeView1.Nodes[0].Selected = true;
                //RadTreeNodeEventArgs tne = new RadTreeNodeEventArgs(RadTreeView1.Nodes[0]);
                //RadTreeView1_Nodeclick(sender, tne);
                RadTreeViewNhomQuyen.Nodes[0].Selected = true;
                RadTreeViewChucNang.Nodes[0].Selected = true;
                RadTreeNode treenode = RadTreeViewNhomQuyen.SelectedNode;
                RadTreeNodeEventArgs ne = new RadTreeNodeEventArgs(treenode);
                RadTreeViewNhomQuyen_Nodeclick(sender, ne );
                //fill ds user
                GridUserQuyen.DataSource = _entities.GetUserByIdNhomQuyen(Int32.Parse(RadTreeViewNhomQuyen.Nodes[0].Value));
                GridUserQuyen.DataBind();
                if (GridUserQuyen.Items.Count > 0)
                {
                    GridUserQuyen.Items[0].Selected = true;
                    GridDataItem item = GridUserQuyen.Items[0];
                    Session["idNvPq"] = Int32.Parse(item["IDNhanVien"].Text);
                }
            }

        }
        protected void RadTreeViewChucNang_Nodeclick(object sender, RadTreeNodeEventArgs e)
        {
            Int32 idNhomQuyen = Int32.Parse(RadTreeViewNhomQuyen.SelectedNode.Value);
            Int32 idChucNang = Int32.Parse(RadTreeViewChucNang.SelectedNode.Value);
            LoadQuyen(idNhomQuyen, idChucNang);
        }

        protected void RadTreeViewNhomQuyen_Nodeclick(object sender, RadTreeNodeEventArgs e)
        {
            Int32 idNhomQuyen = Int32.Parse(RadTreeViewNhomQuyen.SelectedNode.Value);
            Int32 idChucNang = Int32.Parse(RadTreeViewChucNang.SelectedNode.Value);
            LoadQuyen(idNhomQuyen, idChucNang);
            GridUserQuyen.Rebind();
            Session["nhomQuyen"] = RadTreeViewNhomQuyen.SelectedNode.Value;
            if (GridUserQuyen.Items.Count > 0)
            {
                GridUserQuyen.Items[0].Selected = true;
                GridDataItem item = GridUserQuyen.Items[0];
                Session["idNvPq"] = Int32.Parse(item["IDNhanVien"].Text);
            }
        }


        protected void btnSaveQuyen_Click(object sender, EventArgs e)
        {
            Int32 idNhomQuyen = Int32.Parse(RadTreeViewNhomQuyen.SelectedNode.Value);
            Int32 idChucNang = Int32.Parse(RadTreeViewChucNang.SelectedNode.Value);
            _entities.DeletePhanQuyenByIDNhomQuyenIDChucNang(idNhomQuyen, idChucNang);
            foreach ( ListItem i in cblQuyen.Items)
            {
                if (i.Selected)
                {
                    Aits_Hrm.Model.PhanQuyen pq = new Aits_Hrm.Model.PhanQuyen();
                    pq.IDNhomQuyen = Int32.Parse(RadTreeViewNhomQuyen.SelectedNode.Value);
                    pq.IDChucNang = Int32.Parse(RadTreeViewChucNang.SelectedNode.Value);
                    pq.IDQuyen = Int32.Parse(i.Value);
                    pq.NguoiCapNhat = (int)Session["userID"];
                    pq.NguoiTao = (int)Session["userID"];
                    pq.NgayCapNhat = DateTime.Now;
                    pq.NgayTao = DateTime.Now;
                    _entities.AddToPhanQuyens(pq);
                }
                _entities.SaveChanges();
            }
         
        }

        protected void LoadQuyen(Int32 idNhom, Int32 idChucNang)
        {
            ArrayList list = new ArrayList();
            list.AddRange(_entities.GetQuyenByIDNhomIDChucNang(idNhom,idChucNang).ToArray());
            foreach (ListItem i in cblQuyen.Items)
            {
                i.Selected =  list.Contains(Int32.Parse(i.Value));
            }
        }

        protected void Grid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            var dt = _entities.GetUserByIdNhomQuyen(Int32.Parse(RadTreeViewNhomQuyen.SelectedNode.Value));
            GridUserQuyen.DataSource = dt;
        }

        protected void AjaxManager_Request(object sender, AjaxRequestEventArgs e)
        {
             switch (e.Argument)
             {
                 case "removeUser":
                     Int32 idNV = (Int32)Session["idNvPq"];
                     Int32 nhomQuyen = Int32.Parse(Session["nhomQuyen"].ToString());
                     var dt = _entities.NhanVien_NhomQuyen.Where(x => x.IDNhanVien == idNV && x.IDNhomQuyen == nhomQuyen).First();
                     _entities.NhanVien_NhomQuyen.DeleteObject(dt);
                     _entities.SaveChanges();
                     GridUserQuyen.Rebind();
                     break;
                 case "RebindGrid":
                     GridUserQuyen.Rebind();
                     var dsNhom = _entities.NhomQuyens;
                    RadTreeViewNhomQuyen.DataSource = dsNhom;
                    RadTreeViewNhomQuyen.DataBind();
                     break;
                 default:
                     break;
              }
        }


        protected void Grid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "RowClick")
            {
                GridDataItem item = (GridDataItem)e.Item;
                Session["idNvPq"] = Int32.Parse(item["IDNhanVien"].Text);
            }
        }
    }
}