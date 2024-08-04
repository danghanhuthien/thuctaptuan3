report 50101 ReportKhachHang
{
    ApplicationArea = All;
    Caption = 'ReportKhachHang';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'KhachHang.rdl';

    dataset
    {
        dataitem(TableOrder; TableOrder)
        {
            RequestFilterFields = CustomerID;
            column(idhd; id)
            {
            }
            column(CustomerID; CustomerID)
            {
            }
            column(CustomerName; CustomerName)
            {
            }
            column(OrderDate; OrderDate)
            {
            }
            dataitem(TableOrderLine; TableOrderDetails)
            {
                DataItemLink = OrderID = field(id);
                column(idct; id)
                {
                    IncludeCaption = true;
                }
                column(OrderID; OrderID)
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
