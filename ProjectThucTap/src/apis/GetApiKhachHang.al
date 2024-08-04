page 50130 ApiKhachHangg
{
    APIGroup = 'apiGroup';
    APIPublisher = 'ProjectThucTap';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'apiKhachHang';
    DelayedInsert = true;
    EntityName = 'KhachHang';
    EntitySetName = 'KhachHangs';
    PageType = API;
    SourceTable = TableKhachHang;
    Permissions =
        tabledata TableKhachHang = RIMD;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(idkh; Rec.idkh)
                {
                    Caption = 'Mã khách hàng';
                }
                field(tenkh; Rec.tenkh)
                {
                    Caption = 'Tên khách hàng';
                }
                field(diachi; Rec.diachi)
                {
                    Caption = 'Địa chỉ';
                }
                field(sdt; Rec.sdt)
                {
                    Caption = 'Số điện thoại';
                }
                field(hinhanh; Rec.hinhanh)
                {
                    Caption = 'Hình ảnh';
                }
                field(hinhannhblob; Rec.hinhanhblob)
                {
                    Caption = 'Hình ảnh';
                }

            }
        }
    }
}
