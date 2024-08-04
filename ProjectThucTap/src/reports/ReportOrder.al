report 50100 ReportOrder
{
    ApplicationArea = All;
    Caption = 'ReportOrder';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'OrderList2.rdl';

    dataset
    {
        dataitem(TableOrder; TableOrder)
        {
            RequestFilterFields = id; // Thay đổi theo yêu cầu thực tế
            column(idvvv; id)
            {
                IncludeCaption = true;
            }
            column(CustomerID; CustomerID)
            {
                IncludeCaption = true;

            }
            column(CustomerName; CustomerName)
            {
                IncludeCaption = true;
            }
            column(OrderDate; OrderDate)
            {
                IncludeCaption = true;
            }
            dataitem(TableOrderLine; TableOrderDetails)
            {
                RequestFilterFields = OrderID;
                column(idct; id)
                {
                    IncludeCaption = true;
                }
                column(ProductID; ProductID)
                {
                    IncludeCaption = true;
                }
                column(ProductName; ProductName)
                {
                    IncludeCaption = true;
                }
                column(Quantity; Quantity)
                {
                    IncludeCaption = true;
                }
                column(thanhtien; thanhtien)
                {
                    IncludeCaption = true;
                }
                column(TongTien; TongTien)
                {
                    IncludeCaption = true;
                }
            }
        }

    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {

            }
        }
    }
}
