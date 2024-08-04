table 50118 TableKhachHang
{
    Caption = 'Khách hàng';
    DataClassification = ToBeClassified;
    Access = Public;
    InherentPermissions = RIMDX;
    fields
    {
        field(1; idkh; Integer)
        {
            Caption = 'Mã khách hàng';
            AutoIncrement = true;
            Editable = false;
        }
        field(2; tenkh; Text[50])
        {
            Caption = 'Tên khách hàng';
        }
        field(3; sdt; Text[10])
        {
            Caption = 'Số điện thoại';
            NotBlank = true;

        }
        field(4; diachi; Text[200])
        {
            Caption = 'Địa chỉ';
            NotBlank = true;

        }
        field(5; hinhanh; Media)
        {
            Caption = 'Hình ảnh';
        }
        field(6; hinhanhblob; Blob)
        {
            Caption = 'Hình ảnh';
            Subtype = Json;
        }


    }
    keys
    {
        key(PK; idkh)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; idkh, tenkh, sdt, diachi)
        {
        }
    }

    trigger OnInsert()
    var
        OrderCoppy: Record TableKhachHangCoppy;
    begin
        OrderCoppy.Init();
        OrderCoppy.idkh := Rec.idkh;
        OrderCoppy.tenkh := rec.tenkh;
        OrderCoppy.sdt := rec.sdt;
        OrderCoppy.diachi := rec.diachi;
        OrderCoppy.hinhanh := rec.hinhanh;
        OrderCoppy.hinhanhblob := rec.hinhanhblob;
        OrderCoppy.HinhThuc := 'Insert';
        OrderCoppy.NgayGio := CurrentDateTime;
        OrderCoppy.Insert();
    end;

    trigger OnDelete()
    var
        OrderCoppy: Record TableKhachHangCoppy;
    begin
        OrderCoppy.Init();
        OrderCoppy.idkh := Rec.idkh;
        OrderCoppy.tenkh := rec.tenkh;
        OrderCoppy.sdt := rec.sdt;
        OrderCoppy.diachi := rec.diachi;
        OrderCoppy.hinhanh := rec.hinhanh;
        OrderCoppy.hinhanhblob := rec.hinhanhblob;
        OrderCoppy.HinhThuc := 'Delete';
        OrderCoppy.NgayGio := CurrentDateTime;
        OrderCoppy.Insert();
    end;

    trigger OnModify()
    var
        OrderCoppy: Record TableKhachHangCoppy;
    begin
        OrderCoppy.Init();
        OrderCoppy.idkh := Rec.idkh;
        OrderCoppy.tenkh := rec.tenkh;
        OrderCoppy.sdt := rec.sdt;
        OrderCoppy.diachi := rec.diachi;
        OrderCoppy.hinhanh := rec.hinhanh;
        OrderCoppy.hinhanhblob := rec.hinhanhblob;
        OrderCoppy.HinhThuc := 'Update';
        OrderCoppy.NgayGio := CurrentDateTime;
        OrderCoppy.Insert();
    end;

}
