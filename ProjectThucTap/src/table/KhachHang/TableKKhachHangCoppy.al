table 50122 TableKhachHangCoppy
{
    Caption = 'Lịch Sử Khách Hàng';
    DataClassification = ToBeClassified;
    Access = Public;
    InherentPermissions = RIMDX;
    fields
    {
        field(9; idcoppy; Integer)
        {
            Caption = 'Mã khách hàng';
            AutoIncrement = true;
            Editable = false;
        }
        field(1; idkh; Integer)
        {
            Caption = 'Mã khách hàng';
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
            Subtype = Bitmap;
        }
        field(7; HinhThuc; Text[20])
        {
            Caption = 'Hình thức';
            Editable = false;

        }
        field(8; NgayGio; DateTime)
        {
            Caption = 'Ngày giờ';
            Editable = false;

        }

    }
    keys
    {
        key(PK; idcoppy)
        {
            Clustered = true;
        }
        key(PKC; idkh)
        {
            Clustered = false;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; idkh, tenkh, sdt, diachi)
        {
        }
    }

    trigger OnInsert()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnModify()
    begin

    end;

}

