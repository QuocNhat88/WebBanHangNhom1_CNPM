<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="lienhe.aspx.cs" Inherits="WebBanHang.lienhe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <style>
        .brand-grid {
    justify-content: center;
    display: flex;
    flex-wrap: nowrap; /* Không xuống dòng */
    gap: 10px;
    overflow-x: auto; /* Cuộn ngang khi tràn */
    padding: 10px 0;
}

    .brand-grid a {
        flex: 0 0 auto; /* Không co giãn */
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 6px 10px;
        width: 100px;
        border: 1px solid #ccc;
        border-radius: 6px;
        background-color: #fff;
        transition: transform 0.2s ease;
        height: 40px;
    }

        .brand-grid a:hover {
            transform: scale(1.05);
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }

    .brand-grid img {
        max-width: 60px;
        max-height: 30px;
        object-fit: contain;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="contact-container">
        <h2>Liên hệ với chúng tôi</h2>
        
        <div class="contact-info">
            <div class="contact-item">
                <i class="fas fa-map-marker-alt"></i>
                <h3>Địa chỉ</h3>
                <p>123 Đường ABC, Quận Hải Châu, TP.Đà Nẵng</p>
            </div>
            
            <div class="contact-item">
                <i class="fas fa-phone"></i>
                <h3>Điện thoại</h3>
                <p>(028) 1234 5678</p>
                <p>Hotline: 0909 123 456</p>
            </div>
            
            <div class="contact-item">
                <i class="fas fa-envelope"></i>
                <h3>Email</h3>
                <p>info@websitebanhang.com</p>
                <p>support@websitebanhang.com</p>
            </div>
        </div>
        
        <div class="contact-form">
            <h3>Gửi thông tin liên hệ</h3>
            <asp:Label ID="lblThongBao" runat="server" CssClass="success-message"></asp:Label>
            <div class="form-group">
                <asp:Label ID="lblHoTen" runat="server" Text="Họ tên" AssociatedControlID="txtHoTen"></asp:Label>
                <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control" placeholder="Nhập họ tên"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvHoTen" runat="server" ControlToValidate="txtHoTen" 
                    ErrorMessage="Vui lòng nhập họ tên" CssClass="error-message"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Email" AssociatedControlID="txtEmail"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Nhập email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                    ErrorMessage="Vui lòng nhập email" CssClass="error-message"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblTieuDe" runat="server" Text="Tiêu đề" AssociatedControlID="txtTieuDe"></asp:Label>
                <asp:TextBox ID="txtTieuDe" runat="server" CssClass="form-control" placeholder="Nhập tiêu đề"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblNoiDung" runat="server" Text="Nội dung" AssociatedControlID="txtNoiDung"></asp:Label>
                <asp:TextBox ID="txtNoiDung" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" 
                    placeholder="Nhập nội dung liên hệ"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNoiDung" runat="server" ControlToValidate="txtNoiDung" 
                    ErrorMessage="Vui lòng nhập nội dung" CssClass="error-message"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Button ID="btnGuiLienHe" runat="server" Text="Gửi liên hệ" OnClick="btnGuiLienHe_Click" CssClass="btn-submit" />
            </div>
        </div>
    </div>
</asp:Content>