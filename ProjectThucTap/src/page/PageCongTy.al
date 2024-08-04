page 50141 PageCongTy
{
    ApplicationArea = All;
    Caption = 'Công ty';
    PageType = List;
    SourceTable = TableCongTy;
    UsageCategory = Lists;
    CardPageId = 50143;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
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

            }
        }
    }
}
