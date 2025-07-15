<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="QLThue.aspx.cs" Inherits="WebBanHang.QLThue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <style>
        :root {
            --primary: #2a5ba6;
            --secondary: #ff9800;
            --success: #4caf50;
            --warning: #ffc107;
            --danger: #f44336;
            --light: #f8f9fa;
            --dark: #343a40;
            --gray: #6c757d;
        }
        
        .main-content {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .tax-container {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 25px;
            margin-top: 20px;
        }
        
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        
        .page-title {
            color: var(--primary);
            font-size: 24px;
            display: flex;
            align-items: center;
        }
        
        .page-title i {
            margin-right: 10px;
        }
        
        .tax-functions {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        
        .tax-btn {
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 8px;
            background-color: var(--primary);
            color: white;
        }
        
        .tax-btn:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }
        
        .tax-btn.secondary {
            background-color: var(--secondary);
        }
        
        .tax-btn.success {
            background-color: var(--success);
        }
        
        .tax-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }
        
        .tax-table th, .tax-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        
        .tax-table th {
            background-color: #f8fafc;
            font-weight: 600;
            color: var(--primary);
        }
        
        .tax-table tr:hover {
            background-color: #fafbff;
        }
        
        .status {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            display: inline-block;
        }
        
        .status-pending {
            background-color: rgba(255, 193, 7, 0.2);
            color: #b78a00;
        }
        
        .status-applied {
            background-color: rgba(76, 175, 80, 0.2);
            color: var(--success);
        }
        
        .select-row {
            cursor: pointer;
            transition: background-color 0.2s;
        }
        
        .select-row.selected {
            background-color: rgba(42, 91, 166, 0.1);
        }
        
        .action-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: #f0f4f8;
            color: var(--primary);
            cursor: pointer;
            transition: all 0.3s;
            border: none;
            margin-right: 5px;
        }
        
        .action-btn:hover {
            background: var(--primary);
            color: white;
        }
        
        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
        }
        
        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
            max-width: 600px;
            width: 90%;
            animation: modalopen 0.3s;
        }
        
        @keyframes modalopen {
            from {opacity:0; transform: translateY(-50px);}
            to {opacity:1; transform: translateY(0);}
        }
        
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        
        .modal-title {
            color: var(--primary);
            font-size: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .close-btn {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: var(--gray);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark);
        }
        
        .form-control {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        
        .tax-summary {
            background-color: #f8fafc;
            border-radius: 6px;
            padding: 15px;
            margin: 20px 0;
        }
        
        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px dashed #ddd;
        }
        
        .summary-item.total {
            font-weight: bold;
            font-size: 16px;
            color: var(--primary);
            border-bottom: none;
            margin-top: 10px;
            padding-top: 10px;
            border-top: 1px solid #ddd;
        }
        
        .btn-group {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
            margin-top: 20px;
        }
        
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn-primary {
            background-color: var(--primary);
            color: white;
        }
        
        .btn-secondary {
            background-color: var(--secondary);
            color: white;
        }
        
        .btn-success {
            background-color: var(--success);
            color: white;
        }
        
        .btn-cancel {
            background-color: #f0f4f8;
            color: var(--dark);
        }
        
        .alert {
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        
        .alert-warning {
            background-color: rgba(255, 193, 7, 0.2);
            border-left: 4px solid var(--warning);
            color: #b78a00;
        }
        
        .alert-danger {
            background-color: rgba(244, 67, 54, 0.2);
            border-left: 4px solid var(--danger);
            color: var(--danger);
        }
        
        .alert-success {
            background-color: rgba(76, 175, 80, 0.2);
            border-left: 4px solid var(--success);
            color: var(--success);
        }
        
        .report-container {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 25px;
            margin-top: 20px;
        }
        
        .report-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .report-title {
            color: var(--primary);
            font-size: 20px;
        }
        
        .period-selector {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        
        .period-option {
            flex: 1;
            min-width: 200px;
        }
        
        .report-summary {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }
        
        .summary-card {
            background: #f8fafc;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        
        .summary-card h3 {
            color: var(--gray);
            font-size: 16px;
            margin-bottom: 10px;
        }
        
        .summary-card .value {
            font-size: 24px;
            font-weight: bold;
            color: var(--primary);
        }
        
        .export-options {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
            margin-top: 20px;
        }
        
        @media (max-width: 768px) {
            .tax-functions {
                flex-direction: column;
            }
            
            .tax-table {
                font-size: 14px;
                overflow-x: auto;
                display: block;
            }
            
            .tax-table th, .tax-table td {
                padding: 8px 10px;
            }
            
            .period-selector {
                flex-direction: column;
            }
            
            .btn-group, .export-options {
                flex-wrap: wrap;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <div class="main-content">
        <div class="tax-container">
            <div class="page-header">
                <h2 class="page-title"><i class="fas fa-file-invoice-dollar"></i> Quản Lý Thuế</h2>
                <button class="tax-btn" onclick="openModal('updateTaxRateModal')">
                    <i class="fas fa-sync-alt"></i> Cập nhật tỷ lệ thuế
                </button>
            </div>

            <div class="alert alert-warning">
                <i class="fas fa-exclamation-circle"></i> Tỷ lệ thuế hiện tại: <span id="currentTaxRate">10%</span>
            </div>

            <h3><i class="fas fa-list"></i> Đơn hàng chờ tính thuế</h3>
            <asp:HiddenField ID="hdnSelectedOrder" runat="server" />
            <table class="tax-table">
                <thead>
                    <tr>
                        <th>Chọn</th>
                        <th>Mã đơn hàng</th>
                        <th>Ngày đặt</th>
                        <th>Khách hàng</th>
                        <th>Tổng tiền</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody id="tax-order-table-body">
                    <!-- Dữ liệu sẽ được tải từ server -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal cập nhật tỷ lệ thuế -->
    <div id="updateTaxRateModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title"><i class="fas fa-percentage"></i> Cập nhật tỷ lệ thuế</h3>
                <button class="close-btn" onclick="closeModal('updateTaxRateModal')">&times;</button>
            </div>
            <div class="form-group">
                <label for="newTaxRate">Tỷ lệ thuế mới (%)</label>
                <input type="number" id="newTaxRate" class="form-control" min="0" max="100" step="0.1" value="10" />
            </div>
            <div class="btn-group">
                <button class="btn btn-cancel" onclick="closeModal('updateTaxRateModal')">Hủy</button>
                <button class="btn btn-primary" onclick="updateTaxRate()">Cập nhật</button>
            </div>
        </div>
    </div>

    <!-- Modal áp dụng thuế -->
    <div id="applyTaxModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title"><i class="fas fa-calculator"></i> Áp dụng thuế cho đơn hàng</h3>
                <button class="close-btn" onclick="closeModal('applyTaxModal')">&times;</button>
            </div>
            <div class="form-group">
                <label for="orderInfo">Đơn hàng</label>
                <input type="text" id="orderInfo" class="form-control" readonly />
            </div>
            <div class="form-group">
                <label for="taxRate">Tỷ lệ thuế (%)</label>
                <input type="number" id="taxRate" class="form-control" value="10" min="0" max="100" step="0.1" />
            </div>
            <div class="tax-summary">
                <div class="summary-item">
                    <span>Tổng tiền hàng:</span>
                    <span id="subtotal">0 đ</span>
                </div>
                <div class="summary-item">
                    <span>Thuế (<span id="taxPercent">10</span>%):</span>
                    <span id="taxAmount">0 đ</span>
                </div>
                <div class="summary-item total">
                    <span>Tổng thanh toán:</span>
                    <span id="totalWithTax">0 đ</span>
                </div>
            </div>
            <div class="btn-group">
                <button class="btn btn-cancel" onclick="closeModal('applyTaxModal')">Hủy</button>
                <button class="btn btn-success" onclick="applyTax()">Áp dụng thuế</button>
            </div>
        </div>
    </div>

    <script>
        // Hàm tải dữ liệu đơn hàng
        function loadOrders() {
            PageMethods.LoadPendingOrders(onOrdersLoaded, onError);
        }

        // Hàm xử lý khi tải đơn hàng thành công
        function onOrdersLoaded(result) {
            const orders = JSON.parse(result);
            const tableBody = document.getElementById('tax-order-table-body');
            tableBody.innerHTML = '';

            if (orders.length === 0) {
                tableBody.innerHTML = `<tr><td colspan="7" class="text-center">Không có đơn hàng chờ tính thuế</td></tr>`;
                return;
            }

            orders.forEach(order => {
                const row = createOrderRow(order);
                tableBody.appendChild(row);
            });
        }

        // Tạo dòng dữ liệu cho bảng
        function createOrderRow(order) {
            const tr = document.createElement('tr');
            tr.className = 'select-row';
            tr.dataset.id = order.id;
            tr.onclick = () => selectOrder(order);

            tr.innerHTML = `
                <td><input type="radio" name="selectedOrder" value="${order.id}" /></td>
                <td>${order.code}</td>
                <td>${new Date(order.orderDate).toLocaleDateString()}</td>
                <td>${order.customerName}</td>
                <td>${order.totalAmount.toLocaleString()} đ</td>
                <td><span class="status status-pending">Chờ tính thuế</span></td>
                <td>
                    <button class="action-btn" title="Tính thuế" onclick="event.stopPropagation(); openApplyTaxModal(${order.id})">
                        <i class="fas fa-calculator"></i>
                    </button>
                </td>
            `;
            return tr;
        }

        // Chọn đơn hàng
        function selectOrder(order) {
            document.querySelectorAll('.select-row').forEach(row => {
                row.classList.remove('selected');
            });
            event.currentTarget.classList.add('selected');
            document.getElementById('<%= hdnSelectedOrder.ClientID %>').value = order.id;
        }

        // Mở modal áp dụng thuế
        function openApplyTaxModal(orderId) {
            // TODO: Gọi server để lấy thông tin chi tiết đơn hàng
            document.getElementById('orderInfo').value = `Đơn hàng #${orderId}`;
            document.getElementById('<%= hdnSelectedOrder.ClientID %>').value = orderId;
            openModal('applyTaxModal');
        }

        // Cập nhật tỷ lệ thuế
        function updateTaxRate() {
            const newTaxRate = parseFloat(document.getElementById('newTaxRate').value);
            PageMethods.UpdateTaxRate(newTaxRate, onTaxRateUpdated, onError);
        }

        function onTaxRateUpdated(result) {
            if (result) {
                alert('Cập nhật tỷ lệ thuế thành công!');
                document.getElementById('currentTaxRate').textContent = newTaxRate + '%';
                closeModal('updateTaxRateModal');
            } else {
                alert('Có lỗi xảy ra khi cập nhật tỷ lệ thuế');
            }
        }

        // Áp dụng thuế
        function applyTax() {
            const orderId = document.getElementById('<%= hdnSelectedOrder.ClientID %>').value;
            const taxRate = parseFloat(document.getElementById('taxRate').value);
            PageMethods.ApplyTax(orderId, taxRate, onTaxApplied, onError);
        }

        function onTaxApplied(result) {
            if (result) {
                alert('Áp dụng thuế thành công!');
                closeModal('applyTaxModal');
                loadOrders();
            } else {
                alert('Có lỗi xảy ra khi áp dụng thuế');
            }
        }

        // Hàm xử lý lỗi
        function onError(error) {
            console.error(error);
            alert('Có lỗi xảy ra: ' + error.get_message());
        }

        // Quản lý modal
        function openModal(modalId) {
            document.getElementById(modalId).style.display = 'block';
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        // Khởi động khi trang tải xong
        document.addEventListener('DOMContentLoaded', () => {
            loadOrders();
        });
    </script>
</asp:Content>
