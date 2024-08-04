page 50122 PageKhachHangImage
{
    ApplicationArea = All;
    Caption = 'PageKhachHangImage';
    PageType = CardPart;
    SourceTable = TableKhachHang;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = ' ';

                field(hinhanh; Rec.hinhanh)
                {
                    ToolTip = 'Specifies the value of the Hình ảnh field.', Comment = '%';
                }

            }
        }
    }
    actions
    {
        area(processing)
        {
            action(UploadImage)
            {
                Caption = 'Tải ảnh lên';
                Image = Import;
                trigger OnAction()
                var
                    InStream: InStream;
                    FileName: Text;
                    mediaId: Guid;
                    OutStream: OutStream;
                begin
                    if UploadIntoStream('Chọn ảnh từ folder của bạn', '', 'All files (*.*)|*.*', FileName, InStream) then begin
                        Rec.hinhanh.ImportStream(InStream, FileName);
                        Rec.Modify();
                        CurrPage.Update();
                    end;
                    Rec.hinhanhblob.CreateOutStream(OutStream);
                    CopyStream(OutStream, InStream);
                    Rec.Modify();
                    CurrPage.Update();
                end;
            }
            action(deleteimg)
            {
                Caption = 'Xóa ảnh';
                Image = Delete;
                trigger OnAction()
                var
                    mediaid: guid;
                    OutStr: OutStream;
                begin
                    Clear(Rec.hinhanh);
                    rec.Modify(true);
                    Rec.hinhanhblob.CreateOutStream(OutStr);
                    OutStr.WriteText('');
                    Rec.Modify();
                    CurrPage.Update();
                end;

            }
        }
    }
}
