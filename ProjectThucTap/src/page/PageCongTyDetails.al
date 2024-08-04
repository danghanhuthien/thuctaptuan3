page 50143 PageCongTyDetails
{
    ApplicationArea = All;
    Caption = 'PageCongTyDetails';
    PageType = Card;
    SourceTable = TableCongTy;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(idcty; Rec.idcty)
                {
                    ToolTip = 'Specifies the value of the Mã công ty field.', Comment = '%';
                }
                field(tencty; Rec.tencty)
                {
                    ToolTip = 'Specifies the value of the Tên công ty field.', Comment = '%';
                }
                field(sdtcty; Rec.sdtcty)
                {
                    ToolTip = 'Specifies the value of the Hotline1 field.', Comment = '%';
                }
                field(sdtcty2; Rec.sdtcty2)
                {
                    ToolTip = 'Specifies the value of the Hotline2 field.', Comment = '%';
                }
                field(email; Rec.email)
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field(diachicty; Rec.diachicty)
                {
                    ToolTip = 'Specifies the value of the Địa chỉ field.', Comment = '%';
                }
                field(website; Rec.website)
                {
                    ToolTip = 'Specifies the value of the Website field.', Comment = '%';
                }
                field(logo; Rec.logo)
                {
                    ToolTip = 'Specifies the value of the Logo field.', Comment = '%';
                }
                field(masothue; Rec.masothue)
                {
                    ToolTip = 'Specifies the value of the Mã số thuế field.', Comment = '%';
                }
                field(Ngaythanhlap; Rec.Ngaythanhlap)
                {
                    ToolTip = 'Specifies the value of the Ngày thành lập field.', Comment = '%';
                }
            }
        }
        area(FactBoxes)
        {
            part(InfoKhachHang; PageCongTyImage)
            {

                Caption = 'Hình ảnh công ty';
                ApplicationArea = All;
                SubPageLink = idcty = FIELD(idcty); // Liên kết trang phụ với trang chính
            }
        }
    }
}
