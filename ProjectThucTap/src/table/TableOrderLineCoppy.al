table 50121 TableOrderLineCoppy
{
    Caption = 'Lịch Sử Chi Tiết';
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
            Caption = 'Mã số chi tiết';
        }
        field(2; OrderID; Integer)
        {
            Caption = 'Mã đơn hàng';

        }
        field(3; ProductID; Integer)
        {
            Caption = 'Mã sản phẩm';
        }
        field(4; ProductName; Text[100])
        {
            caption = 'Tên sản phẩm';
        }
        field(5; Quantity; Integer)
        {
            Caption = 'Số lượng';
        }
        field(6; thanhtien; Decimal)
        {
            Caption = 'Thành tiền';
            Editable = false;
        }
        field(7; TongTien; Decimal)
        {
            Caption = 'Tổng tiền';
        }
        field(8; HinhThuc; Text[20])
        {
            Caption = 'Hình Thức';
            Editable = false;
        }
        field(9; NgayGio; DateTime)
        {
            Caption = 'Ngày Giờ';
            Editable = false;
        }
    }
    keys
    {

        key(KeyC; idcoppy)
        {
            Clustered = true;
        }
        key(PK; id, OrderID, ProductID)
        {
            Clustered = false;
        }

    }
    procedure GetNoSeriesCode(): Code[20]
    begin
        // Cung cấp mã số sê-ri phù hợp cho bảng mở rộng
        exit('ORDER'); // Thay 'YOUR_SERIES_CODE' bằng mã số sê-ri thực tế
    end;
}
