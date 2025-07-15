using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanHang
{
    public partial class QLThue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
            public static string LoadPendingOrders()
            {
                try
                {
                    // 1. Lấy danh sách đơn hàng chờ tính thuế từ DB
                    // var orders = OrderService.GetPendingTaxOrders();

                    // 2. Chuyển sang JSON
                    // return JsonConvert.SerializeObject(orders);

                    // Ví dụ dữ liệu mẫu:
                    var orders = new List<object> {
            new { id = 1, code = "DH001", orderDate = DateTime.Now.AddDays(-2),
                 customerName = "Nguyễn Văn A", totalAmount = 1500000 },
            new { id = 2, code = "DH002", orderDate = DateTime.Now.AddDays(-1),
                 customerName = "Trần Thị B", totalAmount = 2300000 }
        };
                    return new JavaScriptSerializer().Serialize(orders);
                }
                catch (Exception ex)
                {
                    // Ghi log lỗi
                    return "[]";
                }
            }
            public static bool UpdateTaxRate(double newTaxRate)
            {
                try
                {
                    // 1. Validate dữ liệu
                    if (newTaxRate < 0 || newTaxRate > 100) return false;

                    // 2. Lưu tỷ lệ thuế mới vào DB/config
                    // TaxConfigService.UpdateTaxRate(newTaxRate);

                    return true;
                }
                catch
                {
                    return false;
                }
            }
            public static bool ApplyTax(string orderId, double taxRate)
            {
                try
                {
                    // 1. Validate dữ liệu
                    if (string.IsNullOrEmpty(orderId)) return false;

                    // 2. Lấy đơn hàng từ DB
                    // var order = OrderService.GetOrderById(orderId);

                    // 3. Tính toán thuế
                    // decimal taxAmount = order.Subtotal * (decimal)(taxRate / 100);
                    // decimal totalWithTax = order.Subtotal + taxAmount;

                    // 4. Cập nhật đơn hàng
                    // order.TaxRate = taxRate;
                    // order.TaxAmount = taxAmount;
                    // order.TotalAmount = totalWithTax;
                    // order.Status = OrderStatus.TaxApplied;

                    // 5. Lưu vào database
                    // OrderService.UpdateOrder(order);

                    return true;
                }
                catch
                {
                    return false;
                }
            }
            public class Order
            {
                public int Id { get; set; }
                public string Code { get; set; }
                public DateTime OrderDate { get; set; }
                public string CustomerName { get; set; }
                public decimal Subtotal { get; set; }
                public double TaxRate { get; set; }
                public decimal TaxAmount { get; set; }
                public decimal TotalAmount { get; set; }
                public string Status { get; set; }
            }


        }
    }
