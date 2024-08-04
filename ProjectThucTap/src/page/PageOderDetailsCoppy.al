page 50146 PageOderDetailsCoppy
{
    ApplicationArea = All;
    Caption = 'Lịch Sử Chi Tiết';
    PageType = ListPart;
    SourceTable = TableOrderLineCoppy;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.id)
                {
                    ToolTip = 'Specifies the value of the Mã số chi tiết field.', Comment = '%';
                }
                field(OrderID; Rec.OrderID)
                {
                    ToolTip = 'Specifies the value of the Mã đơn hàng field.', Comment = '%';
                }
                field(ProductID; Rec.ProductID)
                {
                    ToolTip = 'Specifies the value of the Mã sản phẩm field.', Comment = '%';
                }
                field(ProductName; Rec.ProductName)
                {
                    ToolTip = 'Specifies the value of the Tên sản phẩm field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Số lượng field.', Comment = '%';
                }
                field(thanhtien; Rec.thanhtien)
                {
                    ToolTip = 'Specifies the value of the Thành tiền field.', Comment = '%';
                }
                field(TongTien; Rec.TongTien)
                {
                    ToolTip = 'Specifies the value of the Tổng tiền field.', Comment = '%';
                }
                field("HỉnhThuc"; Rec.HinhThuc)
                {
                    ToolTip = 'Specifies the value of the Hình Thức field.', Comment = '%';
                }
                field(NgayGio; Rec.NgayGio)
                {
                    ToolTip = 'Specifies the value of the Ngày Giờ field.', Comment = '%';
                }
            }

        }
    }
}
