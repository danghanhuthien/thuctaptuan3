table 50115 TableSanPham
{
    Caption = 'Sản phẩm';
    DataClassification = ToBeClassified;
    InherentPermissions = RIMDX;
    fields
    {
        field(1; idsp; Integer)
        {
            Caption = 'Mã sản phẩm';
            AutoIncrement = true;
            Editable = false;
        }
        field(2; tensp; Text[50])
        {
            Caption = 'Tên sản phẩm';
        }
        field(3; dongia; Integer)
        {
            Caption = 'Đơn giá';
        }
        field(4; mota; Text[200])
        {
            Caption = 'Mô tả';
        }
        field(5; xuatxu; Text[200])
        {
            Caption = 'Xuất xứ';
        }
        field(6; hinhanh; Media)
        {
            Caption = 'Hình ảnh';
            DataClassification = ToBeClassified;

        }
        field(7; hinhanhblob; Blob)
        {
            Caption = 'Hình ảnh';
            Subtype = Bitmap;
        }

    }
    keys
    {
        key(PK; idsp)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; idsp, tensp, dongia, hinhanh)
        {
        }
    }

    trigger OnInsert()
    var
        OrderCoppy: Record TableSanPhamCoppy;
    begin
        OrderCoppy.Init();
        OrderCoppy.idsp := Rec.idsp;
        OrderCoppy.tensp := rec.tensp;
        OrderCoppy.dongia := rec.dongia;
        OrderCoppy.mota := rec.mota;
        OrderCoppy.hinhanh := rec.hinhanh;
        OrderCoppy.hinhanhblob := hinhanhblob;
        OrderCoppy.xuatxu := rec.xuatxu;
        OrderCoppy.HinhThuc := 'Insert';
        OrderCoppy.NgayGio := CurrentDateTime;
        OrderCoppy.Insert();
    end;

    trigger OnDelete()
    var
        OrderCoppy: Record TableSanPhamCoppy;
    begin
        OrderCoppy.Init();
        OrderCoppy.idsp := Rec.idsp;
        OrderCoppy.tensp := rec.tensp;
        OrderCoppy.dongia := rec.dongia;
        OrderCoppy.mota := rec.mota;
        OrderCoppy.hinhanh := rec.hinhanh;
        OrderCoppy.hinhanhblob := hinhanhblob;
        OrderCoppy.xuatxu := rec.xuatxu;
        OrderCoppy.HinhThuc := 'Delete';
        OrderCoppy.NgayGio := CurrentDateTime;
        OrderCoppy.Insert();
    end;

    trigger OnModify()
    var
        OrderCoppy: Record TableSanPhamCoppy;
    begin
        OrderCoppy.Init();
        OrderCoppy.idsp := Rec.idsp;
        OrderCoppy.tensp := rec.tensp;
        OrderCoppy.dongia := rec.dongia;
        OrderCoppy.mota := rec.mota;
        OrderCoppy.hinhanh := rec.hinhanh;
        OrderCoppy.xuatxu := rec.xuatxu;
        OrderCoppy.hinhanhblob := hinhanhblob;
        OrderCoppy.HinhThuc := 'Update';
        OrderCoppy.NgayGio := CurrentDateTime;
        OrderCoppy.Insert();
    end;
}