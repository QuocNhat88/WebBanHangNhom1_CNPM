<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="thanhtoan.aspx.cs" Inherits="WebBanHang.thanhtoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /* ===== TRANG THANH TOÁN ===== */
/* Container chính */
/*.checkout-container {
    max-width: 1000px;
    margin: 0 auto;
    padding: 20px;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

    .checkout-container h2 {
        color: #2c3e50;
        margin-bottom: 30px;
        display: flex;
        align-items: center;
        font-size: 24px;
    }

        .checkout-container h2 i {
            margin-right: 15px;
            color: #3498db;
        }*/

/* Các section */
/*.checkout-section {
    background: white;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

    .checkout-section h3 {
        color: #3498db;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
        font-size: 18px;
    }

        .checkout-section h3 i {
            margin-right: 10px;
        }*/

/* Bảng sản phẩm */
/*.checkout-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

    .checkout-table th {
        background-color: #3498db;
        color: white;
        padding: 12px;
        text-align: left;
    }

    .checkout-table td {
        padding: 12px;
        border-bottom: 1px solid #f1f1f1;
    }*/

/* Form thông tin */
/*.form-group {
    margin-bottom: 15px;
}

    .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: 500;
        color: #2c3e50;
    }

.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
}

    .form-control:focus {
        border-color: #3498db;
        outline: none;
        box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
    }*/

/* Phương thức thanh toán */
/*.payment-methods {
    padding: 10px;
}

.radio-list {
    list-style: none;
    padding: 0;
}

    .radio-list li {
        margin-bottom: 10px;
    }*/

/* Tổng kết */
/*.checkout-summary {
    background: #f8f9fa;
    border-radius: 8px;
    padding: 20px;
}

.summary-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
    padding-bottom: 10px;
    border-bottom: 1px dashed #ddd;
}

    .summary-row.total {
        font-weight: 600;
        font-size: 18px;
        color: #e74c3c;
        border-bottom: none;
    }*/

/* Nút hoàn tất */
/*.btn-complete {
    width: 100%;
    padding: 15px;
    background-color: #e74c3c;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    font-weight: 600;
    text-transform: uppercase;
    cursor: pointer;
    transition: all 0.3s;
    margin-top: 20px;
}

    .btn-complete:hover {
        background-color: #c0392b;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(231, 76, 60, 0.3);
    }

    .btn-complete:active {
        transform: translateY(0);
    }*/

/* Responsive */
/*@media (max-width: 768px) {
    .checkout-container {
        padding: 10px;
    }

    .checkout-section {
        padding: 15px;
    }

    .checkout-table th,
    .checkout-table td {
        padding: 8px;
        font-size: 14px;
    }
}*/

.checkout-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .checkout-steps {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
            position: relative;
        }
        
        .step {
            text-align: center;
            position: relative;
            z-index: 1;
        }
        
        .step-number {
            width: 40px;
            height: 40px;
            background-color: #e0e0e0;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 10px;
            font-weight: bold;
            color: #666;
        }
        
        .step.active .step-number {
            background-color: #3498db;
            color: white;
        }
        
        .step.completed .step-number {
            background-color: #2ecc71;
            color: white;
        }
        
        .step-title {
            font-size: 14px;
            color: #666;
        }
        
        .step.active .step-title {
            color: #3498db;
            font-weight: 500;
        }
        
        .step.completed .step-title {
            color: #2ecc71;
        }
        
        .checkout-steps:after {
            content: '';
            position: absolute;
            top: 20px;
            left: 0;
            right: 0;
            height: 2px;
            background-color: #e0e0e0;
            z-index: 0;
        }
        
        .checkout-row {
            display: flex;
            gap: 30px;
        }
        
        .checkout-col {
            flex: 1;
        }
        
        .checkout-box {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        
        .checkout-title {
            font-size: 18px;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
            color: #2c3e50;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: #555;
        }
        
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        
        .order-summary {
            width: 100%;
            border-collapse: collapse;
        }
        
        .order-summary th, .order-summary td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        
        .order-summary th {
            font-weight: 500;
            color: #555;
        }
        
        .order-summary .total-row {
            font-weight: 600;
            color: #e74c3c;
        }
        
        .payment-method {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        
        .payment-option {
            display: flex;
            align-items: center;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .payment-option:hover {
            border-color: #3498db;
        }
        
        .payment-option.active {
            border-color: #3498db;
            background-color: #f5f9ff;
        }
        
        .payment-icon {
            margin-right: 15px;
            font-size: 24px;
            color: #555;
        }
        
        .payment-info {
            flex: 1;
        }
        
        .payment-title {
            font-weight: 500;
            margin-bottom: 5px;
        }
        
        .payment-desc {
            font-size: 13px;
            color: #777;
        }
        
        .btn-confirm {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .btn-confirm:hover {
            background-color: #2980b9;
        }
        
        @media (max-width: 768px) {
            .checkout-row {
                flex-direction: column;
            }
            
            .checkout-steps {
                flex-wrap: wrap;
            }
            
            .step {
                width: 50%;
                margin-bottom: 20px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <%-- <div class="checkout-container">
        <h2><i class="fas fa-credit-card"></i> THANH TOÁN ĐƠN HÀNG</h2>
        
        <div class="checkout-steps">
            <!-- Thông tin giỏ hàng -->
            <div class="checkout-section">
                <h3><i class="fas fa-shopping-cart"></i> Sản phẩm đặt mua</h3>
                <asp:GridView ID="gvGioHang" runat="server" AutoGenerateColumns="False" CssClass="checkout-table">
                    <Columns>
                        <asp:BoundField DataField="TenSanPham" HeaderText="Tên sản phẩm" />
                        <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" DataFormatString="{0:N0} VNĐ" />
                        <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                        <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" DataFormatString="{0:N0} VNĐ" />
                    </Columns>
                </asp:GridView>
            </div>



            <!-- Thông tin khách hàng -->
            <div class="checkout-section">
                <h3><i class="fas fa-user"></i> Thông tin khách hàng</h3>
                <div class="form-group">
                    <label>Họ tên</label>
                    <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Số điện thoại</label>
                    <asp:TextBox ID="txtSoDT" runat="server" CssClass="form-control" required="true" TextMode="Phone"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required="true" TextMode="Email"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Địa chỉ nhận hàng</label>
                    <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control" required="true" TextMode="MultiLine" Rows="3"></asp:TextBox>
                </div>
            </div>
            
            <!-- Phương thức thanh toán -->
            <div class="checkout-section">
                <h3><i class="fas fa-money-bill-wave"></i> Phương thức thanh toán</h3>
                <div class="payment-methods">
                    <asp:RadioButtonList ID="rblPaymentMethod" runat="server" CssClass="radio-list">
                        <asp:ListItem Value="COD" Selected="True">Thanh toán khi nhận hàng (COD)</asp:ListItem>
                        <asp:ListItem Value="Bank">Chuyển khoản ngân hàng</asp:ListItem>
                        <asp:ListItem Value="Momo">Ví điện tử Momo</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            
            <!-- Tổng kết -->
            <div class="checkout-summary">
                <div class="summary-row">
                    <span>Tạm tính:</span>
                    <span><asp:Label ID="lblTamTinh" runat="server" Text="0"></asp:Label> VNĐ</span>
                </div>
                <div class="summary-row">
                    <span>Phí vận chuyển:</span>
                    <span><asp:Label ID="lblPhiVanChuyen" runat="server" Text="30,000"></asp:Label> VNĐ</span>
                </div>
                <div class="summary-row total">
                    <span>Tổng cộng:</span>
                    <span><asp:Label ID="lblTongCong" runat="server" Text="0"></asp:Label> VNĐ</span>
                </div>
                
                <asp:Button ID="btnHoanTat" runat="server" Text="HOÀN TẤT ĐƠN HÀNG" CssClass="btn btn-complete" />
            </div>
        </div>
    </div>--%>
    
    <div class="checkout-container">
        <div class="checkout-steps">
            <div class="step completed">
                <div class="step-number">1</div>
                <div class="step-title">Giỏ hàng</div>
            </div>
            <div class="step active">
                <div class="step-number">2</div>
                <div class="step-title">Thanh toán</div>
            </div>
            <div class="step">
                <div class="step-number">3</div>
                <div class="step-title">Hoàn tất</div>
            </div>
        </div>
        
        <div class="checkout-row">
            <div class="checkout-col">
                <div class="checkout-box">
                    <h3 class="checkout-title">Thông tin giao hàng</h3>
                    
                    <div class="form-group">
                        <label class="form-label">Họ tên</label>
                        <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control" 
                            Text='<%# Session["HoTen"] %>'></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Số điện thoại</label>
                        <asp:TextBox ID="txtDienThoai" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Địa chỉ</label>
                        <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control" 
                            TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" 
                            TextMode="Email"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Ghi chú</label>
                        <asp:TextBox ID="txtGhiChu" runat="server" CssClass="form-control" 
                            TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </div>
                </div>
                
                <div class="checkout-box">
                    <h3 class="checkout-title">Phương thức thanh toán</h3>
                    
                    <div class="payment-method">
                        <div class="payment-option active">
                            <i class="fas fa-money-bill-wave payment-icon"></i>
                            <div class="payment-info">
                                <div class="payment-title">Thanh toán khi nhận hàng (COD)</div>
                                <div class="payment-desc">Bạn chỉ thanh toán khi nhận được hàng</div>
                            </div>
                            <asp:RadioButton ID="rbCOD" runat="server" Checked="true" GroupName="PaymentMethod" />
                        </div>
                        
                        <div class="payment-option">
                            <i class="fas fa-credit-card payment-icon"></i>
                            <div class="payment-info">
                                <div class="payment-title">Chuyển khoản ngân hàng</div>
                                <div class="payment-desc">Chuyển khoản trước khi giao hàng</div>
                            </div>
                            <asp:RadioButton ID="rbBankTransfer" runat="server" GroupName="PaymentMethod" />
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="checkout-col">
                <div class="checkout-box">
                    <h3 class="checkout-title">Đơn hàng của bạn</h3>
                    
                    <asp:GridView ID="gvDonHang" runat="server" AutoGenerateColumns="False" 
                        CssClass="order-summary" ShowHeader="false" GridLines="None">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div style="display: flex; align-items: center;">
                                        <img src='<%# "images/" + Eval("AnhDaiDien") %>' style="width: 50px; height: 50px; object-fit: cover; margin-right: 10px;" />
                                        <div>
                                            <div><%# Eval("TenSanPham") %></div>
                                            <div style="font-size: 13px; color: #777;">x <%# Eval("SoLuong") %></div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:BoundField DataField="ThanhTien" DataFormatString="{0:N0} ₫" 
                                ItemStyle-CssClass="text-right" />
                        </Columns>
                    </asp:GridView>
                    
                    <table class="order-summary">
                        <tr>
                            <th>Tạm tính</th>
                            <td><asp:Label ID="lblTamTinh" runat="server" Text="0 ₫"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>Phí vận chuyển</th>
                            <td><asp:Label ID="lblPhiVanChuyen" runat="server" Text="30.000 ₫"></asp:Label></td>
                        </tr>
                        <tr class="total-row">
                            <th>Tổng cộng</th>
                            <td><asp:Label ID="lblTongCong" runat="server" Text="0 ₫"></asp:Label></td>
                        </tr>
                    </table>
                    
                    <asp:Button ID="btnXacNhan" runat="server" Text="XÁC NHẬN ĐƠN HÀNG" 
                        CssClass="btn-confirm" OnClick="btnXacNhan_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
