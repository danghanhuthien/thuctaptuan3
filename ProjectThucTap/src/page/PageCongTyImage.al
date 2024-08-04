page 50142 PageCongTyImage
{
    ApplicationArea = All;
    Caption = 'PageCongTyImage';
    PageType = CardPart;
    SourceTable = TableCongTy;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                ShowCaption = false;
                field(logo; Rec.logo)
                {
                    ToolTip = 'Specifies the value of the Logo field.', Comment = '%';
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
                        if Rec.logo.Count > 0 then begin
                            mediaId := Rec.logo.Item(1);
                            if Rec.logo.Remove(mediaId) then
                                Rec.Modify();
                        end;
                        Rec.logo.ImportStream(InStream, FileName);


                        Rec.logoblob.CreateOutStream(OutStream);
                        CopyStream(OutStream, InStream);
                        Rec.Modify();
                        CurrPage.Update();
                    end;
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
                    if Rec.logo.Count > 0 then begin
                        mediaid := Rec.logo.Item(1);
                        if rec.logo.Remove(mediaid) then
                            rec.Modify();
                    end;
                    Rec.logoblob.CreateOutStream(OutStr);
                    OutStr.WriteText('');
                    Rec.Modify();
                    CurrPage.Update();
                end;
            }
        }
    }
}
