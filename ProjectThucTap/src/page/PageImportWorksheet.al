page 50147 PageImportWorksheet
{
    ApplicationArea = All;
    Caption = 'Import Excel';
    PageType = Worksheet;
    SourceTable = TableSanPham;
    DelayedInsert = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    SaveValues = true;
    SourceTableView = sorting(idsp);
    UsageCategory = Tasks;
    layout
    {
        area(Content)
        {
            field(BatchName; BatchName)
            {
                Caption = 'Tên backkup sản phẩm';
                ApplicationArea = All;
            }
            repeater(General)
            {
                field(idsp; Rec.idsp)
                {
                    ToolTip = 'Specifies the value of the idsp field.', Comment = '%';
                }
                field(tensp; Rec.tensp)
                {
                    ToolTip = 'Specifies the value of the tensp field.', Comment = '%';
                }
                field(dongia; Rec.dongia)
                {
                    ToolTip = 'Specifies the value of the Xuất xứ field.', Comment = '%';
                }

                field(mota; Rec.mota)
                {
                    ToolTip = 'Specifies the value of the Mô tả field.', Comment = '%';
                }
                field(xuatxu; Rec.xuatxu)
                {
                    ToolTip = 'Specifies the value of the dongia field.', Comment = '%';
                }
                field(hinhanh; Rec.hinhanh)
                {
                    ToolTip = 'Specifies the image for the product.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Import")
            {
                Caption = '&Import';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'Import data from excel.';

                trigger OnAction()
                var
                begin
                    if BatchName = '' then
                        Error(BatchISBlankMsg);
                    ReadExcelSheet();
                    ImportExcelData();
                end;
            }

        }
    }

    var
        BatchName: Code[10];
        FileName: Text[100];
        SheetName: Text[100];

        TempExcelBuffer: Record "Excel Buffer" temporary;
        UploadExcelMsg: Label 'Please Choose the Excel file.';
        NoFileFoundMsg: Label 'No Excel file found!';
        BatchISBlankMsg: Label 'Batch name is blank';
        ExcelImportSucess: Label 'Excel is successfully imported.';

    // đọc excel
    local procedure ReadExcelSheet()
    var
        FileMgt: Codeunit "File Management";
        IStream: InStream;
        FromFile: Text[100];
    begin
        // chọn tệp
        UploadIntoStream(UploadExcelMsg, '', '', FromFile, IStream);
        if FromFile <> '' then begin
            // lấy tên file và sheet trong file
            FileName := FileMgt.GetFileName(FromFile);
            SheetName := TempExcelBuffer.SelectSheetsNameStream(IStream);
        end else
            Error(NoFileFoundMsg);
        // Xóa dữ liệu cũ và đọc dữ liệu mới từ file Excel
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(IStream, SheetName);
        TempExcelBuffer.ReadSheet();
    end;

    // lấy data excel impport vào table
    local procedure ImportExcelData()
    var
        SOImportBuffer: Record "TableSanPham";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRowNo: Integer;



    begin
        RowNo := 0;
        ColNo := 0;
        MaxRowNo := 0;
        LineNo := 0;
        SOImportBuffer.Reset();
        if SOImportBuffer.FindLast() then
            LineNo := SOImportBuffer.idsp;
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then begin
            MaxRowNo := TempExcelBuffer."Row No.";
        end;
        // Lặp qua từng hàng trong sheet Excel để nhập dữ liệu vào bảng
        for RowNo := 2 to MaxRowNo do begin
            LineNo := LineNo + 1000;
            SOImportBuffer.Init();
            Evaluate(SOImportBuffer.tensp, BatchName);
            SOImportBuffer.idsp := LineNo;
            Evaluate(SOImportBuffer.tensp, GetValueAtCell(RowNo, 1));
            Evaluate(SOImportBuffer.dongia, GetValueAtCell(RowNo, 2));
            Evaluate(SOImportBuffer.mota, GetValueAtCell(RowNo, 3));
            Evaluate(SOImportBuffer.xuatxu, GetValueAtCell(RowNo, 4));
            SOImportBuffer.Insert();
        end;
        Message(ExcelImportSucess);
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin

        TempExcelBuffer.Reset();
        If TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;
}
