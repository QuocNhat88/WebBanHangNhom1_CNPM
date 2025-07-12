<%@ Page Title="Liên hệ" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LienHe.aspx.cs" Inherits="WebBanHang.LienHe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .contact-form {
            max-width: 600px;
            margin: 30px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin: 6px 0 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .btn-submit {
            background-color: #007bff;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        .message-label {
            color: green;
            font-weight: bold;
        }

        table {
            width: 100%;
            margin-top: 30px;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
        }

        th {
            background-color: #eee;
        }

        .phan-hoi {
            background-color: #e6ffee;
            padding: 6px;
            border-radius: 6px;
            margin-top: 5px;
            font-style: italic;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="contact-form">
        <h3>Gửi liên hệ</h3>
        <asp:Label ID="lblThongBao" runat="server" CssClass="message-label"></asp:Label>

        <asp:TextBox ID="txtTieuDe" runat="server" CssClass="form-control" placeholder="Tiêu đề"></asp:TextBox>
        <asp:TextBox ID="txtNoiDung" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Nội dung liên hệ"></asp:TextBox>
        <asp:Button ID="btnGui" runat="server" Text="Gửi liên hệ" OnClick="btnGui_Click" CssClass="btn-submit" />

        <hr />
        <h4>Lịch sử liên hệ của bạn</h4>
        <asp:GridView ID="gvLichSu" runat="server" AutoGenerateColumns="False" EmptyDataText="Bạn chưa có liên hệ nào.">
            <Columns>
                <asp:BoundField DataField="TieuDe" HeaderText="Tiêu đề" />
                <asp:BoundField DataField="NoiDung" HeaderText="Nội dung đã gửi" />
                <asp:TemplateField HeaderText="Phản hồi">
                    <ItemTemplate>
                        <%# Eval("NoiDungPhanHoi").ToString() == "" ? "Chưa phản hồi" : "<div class='phan-hoi'>" + Eval("NoiDungPhanHoi") + "</div>" %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="NgayGui" HeaderText="Ngày gửi" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
