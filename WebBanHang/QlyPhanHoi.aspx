<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="QlyPhanHoi.aspx.cs" Inherits="WebBanHang.QlyPhanHoi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .phanhoi-table {
            width: 100%;
            border-collapse: collapse;
            font-family: 'Segoe UI', sans-serif;
        }

        .phanhoi-table th, .phanhoi-table td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .phanhoi-table th {
            background-color: #f4f4f4;
            color: #333;
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
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .btn-phanhoi:hover {
            background-color: #218838;
        }

        .grid-wrapper {
            overflow-x: auto;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Quản lý phản hồi khách hàng</h2>
    <div class="grid-wrapper">
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
                        <asp:Button ID="btnTraLoi" runat="server" Text="Trả lời" CommandName="TraLoi" CommandArgument='<%# Eval("LienHeID") %>' CssClass="btn-phanhoi" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
