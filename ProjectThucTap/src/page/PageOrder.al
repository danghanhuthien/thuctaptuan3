page 50123 PageOrder
{
    ApplicationArea = All;
    Caption = 'Trang đặt hàng';
    PageType = List;
    SourceTable = TableOrder;
    UsageCategory = Lists;
    CardPageId = 50125;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.id)
                {
                    ToolTip = 'Specifies the value of the Mã đơn hàng field.', Comment = '%';
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        PageOrderLinessss: Page "PageOrderDetails";
                    begin
                        PageOrderLinessss.SetRecord(Rec);
                        PageOrderLinessss.Run();
                    end;
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
            }
        }
    }
}
