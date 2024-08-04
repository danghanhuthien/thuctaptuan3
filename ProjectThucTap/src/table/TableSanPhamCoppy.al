table 50123 TableSanPhamCoppy
{
    Caption = 'Lịch Sử Sản Phẩm';
    DataClassification = ToBeClassified;
    InherentPermissions = RIMDX;
    fields
    {
        field(7; idcoppy; Integer)
        {
            Caption = 'Mã sản phẩm';
            AutoIncrement = true;
            Editable = false;
        }
        field(1; idsp; Integer)
        {
            Caption = 'Mã sản phẩm';
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
        field(10; hinhanhblob; Blob)
        {
            Caption = 'Hình ảnh';
            Subtype = Bitmap;
        }
        field(8; HinhThuc; Text[20])
        {
            Caption = 'Hình thức';
            Editable = false;

        }
        field(9; NgayGio; DateTime)
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
        key(PKC; idsp)
        {
            Clustered = false;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; idsp, tensp, dongia, hinhanh)
        {
        }
    }
}
