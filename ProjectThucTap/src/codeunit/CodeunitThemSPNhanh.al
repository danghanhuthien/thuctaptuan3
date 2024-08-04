codeunit 50102 CodeunitThemSPNhanh
{
    procedure importFileTxt(Filepath: Text)
    var
        InStream: InStream;
        TextLine: Text;
        Product: Record TableSanPham;
        File: file;
        Content: text;
        i: Integer;
        Line: Text;
        Lines: List of [Text];
        Fields: List of [Text];
        Base64Data: Text[999999999];
        ImageStr: InStream;
        TempBlob: Codeunit "Temp Blob";
        Buffer: Text;
        BufferLength: Integer;
        FileContent: Text;
        Base64convert: Codeunit "Base64 Convert";
        RecordRef: RecordRef;
        FieldRef: FieldRef;
        OutStream: OutStream;
        BlobInStream: InStream;

    begin
        if UploadIntoStream('Chọn tệp văn bản từ folder của bạn', '', 'Text files (*.txt)|*.txt', TextLine, InStream) then begin
            BufferLength := 1024;
            Buffer := '';
            repeat
                InStream.ReadText(Buffer, BufferLength);
                FileContent := FileContent + Buffer;
            until InStream.EOS;
            // tách nội dung thành các dòng
            Lines := Content.Split('\n');
            // duyệt qua
            foreach Line in lines do begin

                Fields := Line.Split('|');
                if Fields.Count() < 7 then
                    error('Quá 5 | trong tệp dữ liệu.');
                // gán dữ liệu cho từng field
                Product.Init();
                Evaluate(Product.idsp, Fields.get(1));
                Product.tensp := Fields.Get(2);
                Evaluate(Product.dongia, Fields.Get(3));
                Product.mota := Fields.Get(4);
                Product.xuatxu := Fields.Get(5);
                // setup và xử lý hình ảnh mediaset
                TempBlob.CreateOutStream(OutStream);
                Base64convert.FromBase64(Fields.Get(6), OutStream);
                Product.hinhanh.ImportStream(TempBlob.CreateInStream(), 'Hình ảnh');

                // setup xử lý hình ảnh blob
                Clear(TempBlob);
                TempBlob.CreateOutStream(OutStream);
                Base64convert.FromBase64(Fields.get(7), OutStream);
                TempBlob.CreateInStream(BlobInStream);
                RecordRef.GetTable(Product);
                FieldRef := RecordRef.Field(Product.FieldNo(hinhanh));
                FieldRef.Value(BlobInStream);
                RecordRef.SetTable(Product);

                //lưu vào bảng
                if Product.Insert() then
                    Message('Đã thêm sản phẩm: %1', Product.tensp)
                else
                    Error('Không thể thêm sản phẩm: %1. Có thể sản phẩm đã tồn tại.', Product.tensp);
            end;
        end;

    end;

}
