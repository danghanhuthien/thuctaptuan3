page 50152 PageSanPhamCoppy
{
    ApplicationArea = All;
    Caption = 'Lịch Sử Sản Phẩm';
    PageType = List;
    SourceTable = TableSanPhamCoppy;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(idcoppy; Rec.idcoppy)
                {
                    ToolTip = 'Specifies the value of the Mã sản phẩm field.', Comment = '%';
                }
                field(idsp; Rec.idsp)
                {
                    ToolTip = 'Specifies the value of the Mã sản phẩm field.', Comment = '%';
                }
                field(tensp; Rec.tensp)
                {
                    ToolTip = 'Specifies the value of the Tên sản phẩm field.', Comment = '%';
                }
                field(dongia; Rec.dongia)
                {
                    ToolTip = 'Specifies the value of the Đơn giá field.', Comment = '%';
                }
                field(hinhanhblob; Rec.hinhanhblob)
                {
                    ToolTip = 'Specifies the value of the Hình ảnh field.', Comment = '%';
                }
                field(mota; Rec.mota)
                {
                    ToolTip = 'Specifies the value of the Mô tả field.', Comment = '%';
                }
                field(xuatxu; Rec.xuatxu)
                {
                    ToolTip = 'Specifies the value of the Xuất xứ field.', Comment = '%';
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
