page 50151 PageKhachHangCoppy
{
    ApplicationArea = All;
    Caption = 'Lịch Sử Khách Hàng';
    PageType = List;
    SourceTable = TableKhachHangCoppy;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(idcoppy; Rec.idcoppy)
                {
                    ToolTip = 'Specifies the value of the Mã khách hàng field.', Comment = '%';
                }
                field(idkh; Rec.idkh)
                {
                    ToolTip = 'Specifies the value of the Mã khách hàng field.', Comment = '%';
                }
                field(tenkh; Rec.tenkh)
                {
                    ToolTip = 'Specifies the value of the Tên khách hàng field.', Comment = '%';
                }
                field(sdt; Rec.sdt)
                {
                    ToolTip = 'Specifies the value of the Số điện thoại field.', Comment = '%';
                }
                field(diachi; Rec.diachi)
                {
                    ToolTip = 'Specifies the value of the Địa chỉ field.', Comment = '%';
                }
                field(hinhanh; Rec.hinhanh)
                {
                    ToolTip = 'Specifies the value of the Hình ảnh field.', Comment = '%';
                }
                field(hinhanhblob; Rec.hinhanhblob)
                {
                    ToolTip = 'Specifies the value of the Hình ảnh field.', Comment = '%';
                }
                field(HinhThuc; Rec.HinhThuc)
                {
                    ToolTip = 'Specifies the value of the Hình thức field.', Comment = '%';
                }
                field(NgayGio; Rec.NgayGio)
                {
                    ToolTip = 'Specifies the value of the Ngày giờ field.', Comment = '%';
                }

            }
        }
    }
}
