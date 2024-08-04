page 50139 GetApiOrder
{
    APIGroup = 'apiGroup';
    APIPublisher = 'ProjectThucTap';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'getApiOrder';
    DelayedInsert = true;
    EntityName = 'TableOrder';
    EntitySetName = 'TableOrders';
    PageType = API;
    SourceTable = TableOrder;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.id)
                {
                    Caption = 'Mã đơn hàng';
                }
                field(customerID; Rec.CustomerID)
                {
                    Caption = 'Mã khách hàng';
                }
                field(customerName; Rec.CustomerName)
                {
                    Caption = 'Tên khách Hàng';
                }
                field(orderDate; Rec.OrderDate)
                {
                    Caption = 'Ngày mua';
                }
            }
        }
    }
}
