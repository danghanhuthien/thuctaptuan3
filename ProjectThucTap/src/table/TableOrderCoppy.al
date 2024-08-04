table 50120 TableOrderCoppy
{
    Caption = 'Lịch Sử Hóa Đơn';
    DataClassification = ToBeClassified;
    TableType = Normal;

    fields
    {
        field(10; idcoppy; Integer)
        {
            Caption = 'Mã số coppy';
            AutoIncrement = true;
        }
        field(1; id; Integer)
        {
            Caption = 'Mã đơn hàng';
        }
        field(2; OrderDate; Date)
        {
            Caption = 'Ngày mua';
        }
        field(3; CustomerID; Integer)
        {
            Caption = 'Mã khách hàng';
        }
        field(7; CustomerName; Text[100])
        {
            Caption = 'Tên khách Hàng';
            Editable = false;
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
        key(KeyC; idcoppy)
        {
            Clustered = true;
        }
        key(PK; id, CustomerID)
        {
            Clustered = false;
        }

    }
}
