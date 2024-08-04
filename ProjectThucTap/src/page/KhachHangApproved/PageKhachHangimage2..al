Page 50156 PageKhachHangImageApprove2
{
    ApplicationArea = All;
    Caption = 'PageKhachHangImage';
    PageType = CardPart;
    SourceTable = TableKhachHangApprove;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = ' ';
                field(hinhanhblob; Rec.hinhanhblob)
                {
                    ToolTip = 'Specifies the value of the Hình ảnh field.', Comment = '%';
                }
            }
        }
    }
}