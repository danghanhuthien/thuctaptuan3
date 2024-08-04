report 50103 ReportBanHang
{
    ApplicationArea = All;
    Caption = 'Report Bán Hàng';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'DatHang.rdl';

    dataset
    {
        dataitem("Company Information"; "Company Information")
        {
            RequestFilterFields = "Primary Key";
            column(Name; Name)
            {

            }
            column(Address; Address)
            {

            }
            column(Phone_No_; "Phone No.")
            {

            }
            column(VAT_Registration_No_; "VAT Registration No.")
            {

            }
            column(City; City)
            {

            }
            column(Post_Code; "Post Code")
            {

            }
            column(Picture; Picture)
            {

            }
            column(Primary_Key; "Primary Key")
            {

            }
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
