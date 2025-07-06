using System;
using System.Data.SqlClient;

namespace WebBanHang
{
    public partial class lienhe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGuiLienHe_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BanHangConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = @"INSERT INTO LienHe (HoTen, Email, TieuDe, NoiDung, NgayGui) 
                                    VALUES (@HoTen, @Email, @TieuDe, @NoiDung, GETDATE())";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@HoTen", txtHoTen.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@TieuDe", txtTieuDe.Text);
                    cmd.Parameters.AddWithValue("@NoiDung", txtNoiDung.Text);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        lblThongBao.Text = "Gửi liên hệ thành công! Chúng tôi sẽ phản hồi sớm nhất.";
                        lblThongBao.CssClass = "success-message";

                        // Xóa nội dung form sau khi gửi thành công
                        txtHoTen.Text = "";
                        txtEmail.Text = "";
                        txtTieuDe.Text = "";
                        txtNoiDung.Text = "";
                    }
                    catch (Exception ex)
                    {
                        lblThongBao.Text = "Lỗi khi gửi liên hệ: " + ex.Message;
                        lblThongBao.CssClass = "error-message";
                    }
                }
            }
        }
    }
}