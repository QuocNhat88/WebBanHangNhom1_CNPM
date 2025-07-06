using System;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI.WebControls;

namespace WebBanHang
{
    public partial class QlyPhanHoi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPhanHoi();
            }
        }

        private void LoadPhanHoi()
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["BanHangConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM LienHe WHERE DaPhanHoi = 0 ORDER BY NgayGui DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvPhanHoi.DataSource = dt;
                gvPhanHoi.DataBind();
            }
        }

        protected void gvPhanHoi_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "TraLoi")
            {
                int lienHeId = Convert.ToInt32(e.CommandArgument);
                TraLoiPhanHoi(lienHeId);
                LoadPhanHoi();
            }
        }

        private void TraLoiPhanHoi(int lienHeId)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["BanHangConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM LienHe WHERE LienHeID = @LienHeID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@LienHeID", lienHeId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string email = reader["Email"].ToString();
                    string hoten = reader["HoTen"].ToString();
                    string tieuDe = reader["TieuDe"].ToString();
                    string noiDung = reader["NoiDung"].ToString();

                    reader.Close();

                    // Gửi email trả lời
                    try
                    {
                        MailMessage mail = new MailMessage();
                        mail.To.Add(email);
                        mail.From = new MailAddress("youremail@gmail.com", "Website Bán Hàng");
                        mail.Subject = "Phản hồi liên hệ từ Website Bán Hàng";
                        mail.Body = $"Xin chào {hoten},\n\nChúng tôi đã nhận được phản hồi của bạn với tiêu đề \"{tieuDe}\".\n\nNội dung bạn gửi: {noiDung}\n\nChúng tôi sẽ liên hệ lại sớm nhất.\n\nTrân trọng,\nWebBanHang Team";
                        mail.IsBodyHtml = false;

                        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                        smtp.Credentials = new System.Net.NetworkCredential("youremail@gmail.com", "your_app_password");
                        smtp.EnableSsl = true;
                        smtp.Send(mail);

                        // Cập nhật cờ đã phản hồi
                        SqlCommand updateCmd = new SqlCommand("UPDATE LienHe SET DaPhanHoi = 1 WHERE LienHeID = @LienHeID", conn);
                        updateCmd.Parameters.AddWithValue("@LienHeID", lienHeId);
                        updateCmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        // Có thể ghi log lỗi gửi email
                        throw new Exception("Lỗi gửi email: " + ex.Message);
                    }
                }
            }
        }
    }
}
