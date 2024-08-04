page 50140 GetApiOrderDetails
{
    APIGroup = 'apiGroup';
    APIPublisher = 'ProjectThucTap';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'getApiOrderDetails';
    DelayedInsert = true;
    EntityName = 'TableOrderDetail';
    EntitySetName = 'TableOrdersDetails';
    PageType = API;
    SourceTable = TableOrderDetails;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.id)
                {
                    Caption = 'Mã số chi tiết';
                }
                field(orderID; Rec.OrderID)
                {
                    Caption = 'Mã đơn hàng';
                }
                field(productID; Rec.ProductID)
                {
                    Caption = 'Mã sản phẩm';
                }
                field(productName; Rec.ProductName)
                {
                    Caption = 'Tên sản phẩm';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Số lượng';
                }
                field(thanhtien; Rec.thanhtien)
                {
                    Caption = 'Thành tiền';
                }
                field(tongTien; Rec.TongTien)
                {
                    Caption = 'Tổng tiền';
                }
            }
        }
    }
}
