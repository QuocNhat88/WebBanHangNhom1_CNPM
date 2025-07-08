using System;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;

namespace WebBanHang
{
    public partial class QlyPhanHoi : System.Web.UI.Page
    {
        private string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["BanHangConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPhanHoi();
            }
        }

        private void LoadPhanHoi()
        {
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

        protected void gvPhanHoi_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "TraLoi")
            {
                int lienHeId = Convert.ToInt32(e.CommandArgument);
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT * FROM LienHe WHERE LienHeID = @LienHeID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@LienHeID", lienHeId);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        lblEmailTraLoi.Text = reader["Email"].ToString();
                        lblHoTenTraLoi.Text = reader["HoTen"].ToString();
                        ViewState["LienHeID"] = lienHeId;
                        pnlTraLoi.Visible = true;
                    }
                }
            }
        }

        protected void btnGuiPhanHoi_Click(object sender, EventArgs e)
        {
            string email = lblEmailTraLoi.Text;
            string hoten = lblHoTenTraLoi.Text;
            string noiDungTraLoi = txtNoiDungTraLoi.Text;

            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(email);
                mail.From = new MailAddress("youremail@gmail.com", "Website Bán Hàng");
                mail.Subject = "Phản hồi từ Website Bán Hàng";
                mail.Body = $"Xin chào {hoten},\n\n{noiDungTraLoi}\n\nTrân trọng,\nWebBanHang Team";
                mail.IsBodyHtml = false;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new System.Net.NetworkCredential("youremail@gmail.com", "your_app_password");
                smtp.EnableSsl = true;
                smtp.Send(mail);

                // Đánh dấu đã phản hồi
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("UPDATE LienHe SET DaPhanHoi = 1 WHERE LienHeID = @LienHeID", conn);
                    cmd.Parameters.AddWithValue("@LienHeID", ViewState["LienHeID"]);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                pnlTraLoi.Visible = false;
                LoadPhanHoi();
            }
            catch (Exception ex)
            {
                throw new Exception("Lỗi gửi email: " + ex.Message);
            }
        }
    }
}
