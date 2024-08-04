page 50145 PageTableOrderCoppy
{
    ApplicationArea = All;
    Caption = 'Lịch Sử Đặt Hàng';
    PageType = List;
    SourceTable = TableOrderCoppy;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater("Thông tin")
            {
                field(id; Rec.id)
                {
                    ToolTip = 'Specifies the value of the Mã đơn hàng field.', Comment = '%';
                }
                field(CustomerID; Rec.CustomerID)
                {
                    ToolTip = 'Specifies the value of the Mã khách hàng field.', Comment = '%';
                }
                field(CustomerName; Rec.CustomerName)
                {
                    ToolTip = 'Specifies the value of the Tên khách Hàng field.', Comment = '%';
                }
                field(OrderDate; Rec.OrderDate)
                {
                    ToolTip = 'Specifies the value of the Ngày mua field.', Comment = '%';
                }
                field(HinhThuc; Rec.HinhThuc)
                {
                    ToolTip = 'Specifies the value of the Hình thức field.', Comment = '%';
                }
                field(NgayGio; Rec.NgayGio)
                {
                    ToolTip = 'Specifies the value of the Ngày giờ field.', Comment = '%';
                }
            }
            group("Chi tiết đơn hàng")
            {
                part(addPageOrderLine; PageOderDetailsCoppy)
                {
                    ApplicationArea = All;
                    SubPageLink = OrderID = FIELD(id); // Liên kết trang phụ với trang chính
                    Editable = true;
                }
            }
        }
    }
}
