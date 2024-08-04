page 50138 GetApiSanPham
{
    APIGroup = 'apiGroup';
    APIPublisher = 'ProjectThucTap';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'getApiSanPham';
    DelayedInsert = true;
    EntityName = 'SanPham';
    EntitySetName = 'SanPhams';
    PageType = API;
    SourceTable = TableSanPham;


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(idsp; Rec.idsp)
                {
                    Caption = 'Mã sản phẩm';
                }
                field(tensp; Rec.tensp)
                {
                    Caption = 'Tên sản phẩm';
                }
                field(mota; Rec.mota)
                {
                    Caption = 'Mô tả';
                }
                field(xuatxu; Rec.xuatxu)
                {
                    Caption = 'Xuất xứ';
                }
                field(hinhanh; Rec.hinhanh)
                {
                    Caption = 'Hình ảnh';
                }
                field(dongia; Rec.dongia)
                {
                    Caption = 'Đơn giá';
                }
                field(hinhanhblob; Rec.hinhanhblob)
                {
                    Caption = 'Hình ảnh';
                }
            }
        }
    }
}
