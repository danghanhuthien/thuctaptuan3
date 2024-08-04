page 50115 PageSanPham
{
    ApplicationArea = All;
    Caption = 'Sản Phẩm';
    PageType = List;
    SourceTable = TableSanPham;
    UsageCategory = Lists;
    CardPageId = 50119;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(idsp; Rec.idsp)
                {
                    ToolTip = 'Specifies the value of the idsp field.';
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        PageSanPhamDetails: Page "PageSanPhamDetailsCT";
                    begin
                        PageSanPhamDetails.SetRecord(Rec);
                        PageSanPhamDetails.Run();
                    end;
                }
                field(tensp; Rec.tensp)
                {
                    ToolTip = 'Specifies the value of the tensp field.';
                }
                field(dongia; Rec.dongia)
                {
                    ToolTip = 'Specifies the value of the dongia field.';
                }
                field(hinhanhblob; Rec.hinhanhblob)
                {
                    ToolTip = 'Specifies the image for the product.';
                    ApplicationArea = All;
                    Caption = 'Hình ảnh';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("View Detailss")
            {
                ApplicationArea = All;
                Caption = 'Import Excel';
                Image = PrintChecklistReport;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    OrderCard: Page PageImportWorksheet;
                begin
                    OrderCard.Run();
                end;
            }
            action("View Details")
            {
                ApplicationArea = All;
                Caption = 'Thêm bằng file.txt';
                Image = AddContacts;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    InStream: InStream;
                    OutStream: OutStream;
                    FileName: Text;
                    FileContent: Text;
                    Line: Text;
                    Product: Record TableSanPham;
                    ProcessedCount: Integer;
                begin
                    if UploadIntoStream('Chọn tệp văn bản', '', 'Text files (*.txt)|*.txt', FileName, InStream) then begin
                        TempBlob.CreateOutStream(OutStream);
                        CopyStream(OutStream, InStream);
                        TempBlob.CreateInStream(InStream);

                        // Đọc và hiển thị nội dung file
                        InStream.ReadText(FileContent);

                        // Reset InStream để đọc lại từ đầu
                        TempBlob.CreateInStream(InStream);

                        ProcessedCount := 0;

                        // Đọc từng dòng và xử lý
                        while not InStream.EOS do begin
                            InStream.ReadText(Line);
                            if ProcessLine(Line, Product) then
                                ProcessedCount += 1;
                        end;

                    end;
                end;

            }
        }
    }
    local procedure ProcessLine(Line: Text; var Product: Record TableSanPham): Boolean
    var
        Fields: List of [Text];
        TempInteger: Integer;
        TempDecimal: Decimal;
    begin
        Line := Line.Trim();
        if Line = '' then
            exit(false);

        Fields := Line.Split('|');
        if Fields.Count() < 5 then begin
            Message('Dòng không đủ dữ liệu: %1', Line);
            exit(false);
        end;

        Product.Init();
        if not Evaluate(TempInteger, Fields.Get(1)) then begin
            Message('Giá trị không hợp lệ cho idsp: %1', Fields.Get(1));
            exit(false);
        end;
        Product.idsp := TempInteger;

        Product.tensp := Fields.Get(2);

        if not Evaluate(TempDecimal, Fields.Get(3)) then begin
            Message('Giá trị không hợp lệ cho dongia: %1', Fields.Get(3));
            exit(false);
        end;
        Product.dongia := TempDecimal;

        Product.mota := Fields.Get(4);
        Product.xuatxu := Fields.Get(5);

        if Product.Insert() then begin
            Message('Đã thêm sản phẩm: %1', Product.tensp);
            exit(true);
        end else begin
            Message('Không thể thêm sản phẩm: %1. Có thể sản phẩm đã tồn tại.', Product.tensp);
            exit(false);
        end;
    end;
}
