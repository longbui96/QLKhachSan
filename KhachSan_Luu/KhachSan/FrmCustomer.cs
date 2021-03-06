﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using HotelDTO;
using HotelBUS;
using System.Data.SqlClient;

namespace KhachSan
{
    public partial class FrmCustomer : Form
    {
        public Button btChonPhong = new Button();
        public int MaNV;
        public FrmCustomer()
        {
            InitializeComponent();
        }

        private List<Customer> GetCustomer()
        {
            string sql = "Select * From KhachHang";
            return new CustomerBUS().GetCustomer(sql);
        }

        private void LoadData()
        {
            try
            {
                dtgCus.DataSource = GetCustomer();
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void FrmCustomer_Load(object sender, EventArgs e)
        {
            btPhong.Visible = btChonPhong.Visible;
            LoadData();

            txtMaKH.DataBindings.Add("Text", dtgCus.DataSource, "MaKH");
            txtHoKH.DataBindings.Add("Text", dtgCus.DataSource, "HoKH");
            txtTenKH.DataBindings.Add("Text", dtgCus.DataSource, "TenKH");
            txtGioiTinh.DataBindings.Add("Text", dtgCus.DataSource, "GioiTinh");
            txtSDTKH.DataBindings.Add("Text", dtgCus.DataSource, "SDT");
            txtCMNDKH.DataBindings.Add("Text", dtgCus.DataSource, "CMND");
            txtGhiChu.DataBindings.Add("Text", dtgCus.DataSource, "GhiChu");
        }

        private void btAdd_Click(object sender, EventArgs e)
        {
            int CMND = 0, SDT = 0;
            string HoKH = "", TenKH = "", GioiTinh = "", GhiChu = "";

            HoKH = txtHoKH.Text.Trim();
            TenKH = txtTenKH.Text.Trim();
            GioiTinh = txtGioiTinh.Text.Trim();
            GhiChu = txtGhiChu.Text.Trim();

            try
            {
                CMND = int.Parse(txtCMNDKH.Text);
                SDT = int.Parse(txtSDTKH.Text);
            }
            catch (FormatException)
            {
                MessageBox.Show("CMND hoặc SDT chưa nhập hoặc không hợp lệ, nếu thêm thành công mặc định giá trị này bằng 0");
            }

            Customer cus = new Customer(HoKH, TenKH, GioiTinh, CMND, SDT, GhiChu);
            try
            {
                int i = new CustomerBUS().Add(cus);
                switch (i)
                {
                    case -1:
                        MessageBox.Show("Lỗi, không thể thêm dữ liệu");
                        break;
                    case -2:
                        MessageBox.Show("Phải nhập đầy đủ họ, tên và giới tính");
                        break;
                    default:
                        MessageBox.Show("Đã thêm một khách hàng ở mã " + i);
                        break;
                }
                LoadData();

            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
                //throw;
            }
        }

        private void btDel_Click(object sender, EventArgs e)
        {
            int MaKH;
            if (txtMaKH.Text == "")
                MaKH = 0;
            else
                MaKH = int.Parse(txtMaKH.Text);
            try
            {
                int i = new CustomerBUS().Delete(MaKH);
                switch (i)
                {
                    case -1:
                        MessageBox.Show("Lỗi, không thể xóa dữ liệu");
                        break;
                    case -2:
                        MessageBox.Show("Phải nhập mã để xóa");
                        break;
                    case -6:
                        MessageBox.Show("Không tìm thấy mã để xóa");
                        break;
                    default:
                        MessageBox.Show("Đã xóa một khách hàng ở mã " + i);
                        break;
                }
                LoadData();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btUpd_Click(object sender, EventArgs e)
        {
            int MaKH = 0, CMND = 0, SDT = 0;
            string HoKH = "", TenKH = "", GioiTinh = "", GhiChu = "Đã sửa";

            HoKH = txtHoKH.Text.Trim();
            TenKH = txtTenKH.Text.Trim();
            GioiTinh = txtGioiTinh.Text.Trim();
            GhiChu = txtGhiChu.Text.Trim();

            try
            {
                MaKH = int.Parse(txtMaKH.Text);
                CMND = int.Parse(txtCMNDKH.Text);
                SDT = int.Parse(txtSDTKH.Text);
            }
            catch (FormatException)
            {
                MessageBox.Show("Mã khách hàng hoặc CMND hoặc SDT chưa nhập hoặc không hợp lệ, nếu sửa thành công mặc định giá trị này bằng 0");
            }

            Customer cus = new Customer(MaKH, HoKH, TenKH, GioiTinh, CMND, SDT, GhiChu);
            try
            {
                int i = new CustomerBUS().Update(cus);
                switch (i)
                {
                    case -1:
                        MessageBox.Show("Lỗi, không thể sửa dữ liệu");
                        break;
                    case -2:
                        MessageBox.Show("Phải nhập đầy đủ mã, họ, tên và chức vụ");
                        break;
                    case -6:
                        MessageBox.Show("Không tìm thấy mã để sửa");
                        break;
                    default:
                        MessageBox.Show("Đã sửa một khách hàng ở mã " + i);
                        break;
                }
                LoadData();

            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
                //throw;
            }
        }

        private void btPhong_Click(object sender, EventArgs e)
        {
            FrmChiTietPhong frm = new FrmChiTietPhong();
            frm.MaNV = MaNV;
            frm.ShowDialog();
        }
    }
}
