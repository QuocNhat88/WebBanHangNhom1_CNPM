<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="QlyPhanHoi.aspx.cs" Inherits="WebBanHang.QlyPhanHoi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .phanhoi-table {
            width: 100%;
            border-collapse: collapse;
            font-family: 'Segoe UI', sans-serif;
        }

        .phanhoi-table th, .phanhoi-table td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        .phanhoi-table th {
            background-color: #f4f4f4;
        }

        .phanhoi-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .phanhoi-table tr:hover {
            background-color: #f1f1f1;
        }

        .btn-phanhoi {
            background-color: #28a745;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
        }

        .phanhoi-form {
            margin-top: 30px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            background: #f8f8f8;
            width: 100%;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .phanhoi-form textarea {
            width: 100%;
            padding: 10px;
            min-height: 100px;
            margin-bottom: 10px;
        }

        .phanhoi-form button {
            background-color: #007bff;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Quản lý phản hồi khách hàng</h2>

    <asp:GridView ID="gvPhanHoi" runat="server" AutoGenerateColumns="False" CssClass="phanhoi-table" OnRowCommand="gvPhanHoi_RowCommand">
        <Columns>
            <asp:BoundField DataField="LienHeID" HeaderText="ID" />
            <asp:BoundField DataField="HoTen" HeaderText="Họ tên" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="TieuDe" HeaderText="Tiêu đề" />
            <asp:BoundField DataField="NoiDung" HeaderText="Nội dung" />
            <asp:BoundField DataField="NgayGui" HeaderText="Ngày gửi" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
            <asp:TemplateField HeaderText="Phản hồi">
                <ItemTemplate>
                    <asp:Button ID="btnTraLoi" runat="server" Text="Trả lời" CssClass="btn-phanhoi"
                        CommandName="TraLoi" CommandArgument='<%# Eval("LienHeID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Panel ID="pnlTraLoi" runat="server" Visible="false" CssClass="phanhoi-form">
        <asp:Label ID="lblEmailTraLoi" runat="server" Text="" Visible="false" />
        <asp:Label ID="lblHoTenTraLoi" runat="server" Text="" Visible="false" />
        <asp:TextBox ID="txtNoiDungTraLoi" runat="server" TextMode="MultiLine" Placeholder="Nhập nội dung phản hồi..."></asp:TextBox>
        <asp:Button ID="btnGuiPhanHoi" runat="server" Text="Gửi phản hồi" OnClick="btnGuiPhanHoi_Click" />
    </asp:Panel>
</asp:Content>
