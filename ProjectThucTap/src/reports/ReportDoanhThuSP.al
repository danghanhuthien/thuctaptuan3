report 50102 ReportDoanhThuSP
{
    ApplicationArea = All;
    Caption = 'ReportDoanhThuSP';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportDoanhThuSP.rdl';
    dataset
    {
        dataitem(TableSanPham; TableSanPham)
        {
            column(idsp; idsp)
            {
            }
            column(tensp; tensp)
            {
            }
            column(dongia; dongia)
            {
            }
            column(mota; mota)
            {
            }
            column(xuatxu; xuatxu)
            {
            }
            column(hinhanh; hinhanh)
            {
            }

            dataitem(TableOrder; TableOrder)
            {
                column(idhd; id)
                {

                }
                column(OrderDate; OrderDate)
                {

                }
            }
            dataitem(TableOrderDetails; TableOrderDetails)
            {
                column(idct; id)
                {

                }
                column(OrderID; OrderID)
                {

                }
                column(ProductID; ProductID)
                {

                }
                column(ProductName; ProductName)
                {

                }
                column(Quantity; Quantity)
                {

                }

                column(SoluongSanpham; GetTotalOrders(TableOrderDetails.ProductID))
                {

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
    local procedure GetTotalOrders(ProductID: Integer): Integer
    var
        OrderRec: Record TableOrderDetails;
        TotalQuantity: Integer;
    begin
        TotalQuantity := 0;

        // Đặt lại bản ghi đơn hàng để đảm bảo không có bộ lọc trước đó
        OrderRec.Reset();

        // Thiết lập phạm vi bộ lọc cho ProductID
        OrderRec.SetRange(ProductID, ProductID);

        // Duyệt qua tất cả các bản ghi và tính tổng số lượng
        if OrderRec.FindSet() then begin
            repeat
                TotalQuantity += OrderRec.Quantity;
            until OrderRec.Next() = 0;
        end;

        // Trả về tổng số lượng sản phẩm bán ra
        exit(TotalQuantity);
    end;

}
