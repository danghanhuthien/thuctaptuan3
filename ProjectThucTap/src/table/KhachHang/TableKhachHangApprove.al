table 50124 TableKhachHangApprove
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
            Editable = false;
            AutoIncrement = true;
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
        field(7; TrangThaiDuyet; Option)
        {
            Caption = 'Trạng thái duyệt';
            OptionMembers = "Chờ duyệt","Đã duyệt","Từ chối";
            OptionCaption = 'Chờ duyệt,Đã duyệt,Từ chối';
        }
        field(8; NgayTao; DateTime)
        {
            Caption = 'Ngày tạo';
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
    begin
        NgayTao := CurrentDateTime;
        TrangThaiDuyet := TrangThaiDuyet::"Chờ duyệt";
    end;

}
