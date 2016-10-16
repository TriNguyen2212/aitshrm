using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Aits_Hrm.Model;
using Telerik.Web.UI;
namespace Aits_Hrm.CommonMethod
{
    public class Methods : System.Web.UI.Page
    {
        private QuanLyNhanSuEntities _entities = new QuanLyNhanSuEntities();
        public void LoadCombobox<T>(RadComboBox cbo,System.Data.Objects.ObjectSet<T> objs, String txtField, String txtvalueField) where T : class
        {            
            var lstObj = from o in objs select o;
            cbo.DataSource = lstObj;
            cbo.DataTextField = txtField;
            cbo.DataValueField = txtvalueField;
            cbo.DataBind();
        }

        public void CheckUserLoged()
        {
            if (Session["userID"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("../Login.aspx");                
            }
        }

        /// <summary>
        /// Ham tinh so ngay nghi con lai trong 1 nam
        /// </summary>
        /// <param name="_ngayBienChe">Ngay vao bien che</param>
        /// <param name="_ngayVaoHangKhong">Ngay vao hang khong</param>
        /// <param name="_soNgayDaNghi">So ngay da nghi trong nam</param>
        /// <param name="tongSoPhepNam">Tra ve tong so ngay phep trong nam</param>
        /// <returns>Tra ve so ngay nghi phep con lai</returns>
        public int RemainHoliday(DateTime? _ngayBienChe, DateTime? _ngayVaoHangKhong, int? _soNgayDaNghi, out int tongSoPhepNam)
        {
            tongSoPhepNam = 12; // Mac dinh 1 nam duoc nghi 12 ngay
            if (_ngayBienChe != null)
            {
                DateTime ngayBienChe = Convert.ToDateTime(_ngayBienChe);
                TimeSpan elapsed = DateTime.Now.Subtract(ngayBienChe);
                double daysAgo = elapsed.TotalDays;
                double intWorkYears = Math.Floor(daysAgo / 365.0);
                double addDays = Math.Floor(intWorkYears / 5.0);
                tongSoPhepNam = tongSoPhepNam + Convert.ToInt32(addDays);
            }

            DateTime ngayVaoHK = Convert.ToDateTime(_ngayVaoHangKhong);
            int soNgayPhepConLai;
            if (ngayVaoHK.Year == DateTime.Now.Year)
            {
                if (_soNgayDaNghi.HasValue)
                {
                    tongSoPhepNam = tongSoPhepNam - ngayVaoHK.Month + 1;
                    soNgayPhepConLai = tongSoPhepNam - (int)_soNgayDaNghi;
                }
                else
                {
                    soNgayPhepConLai = tongSoPhepNam = tongSoPhepNam - ngayVaoHK.Month + 1;
                }
            }
            else
            {
                if (_soNgayDaNghi.HasValue)
                {
                    soNgayPhepConLai = tongSoPhepNam - (int)_soNgayDaNghi;
                }
                else
                {
                    soNgayPhepConLai = tongSoPhepNam;
                }
            }
            return soNgayPhepConLai;
        }

        public string GetTenNVByID(int? idNhanVien)
        {
            var nv = _entities.HoSoNhanVien_UngVien.Where(x => x.IDNhanVien == idNhanVien).FirstOrDefault();
            if(nv!=null) return nv.TenNV;
            else return "";
        }
    }
}