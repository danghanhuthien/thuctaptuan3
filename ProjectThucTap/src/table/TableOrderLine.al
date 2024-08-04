table 50116 TableOrderDetails
{
    Caption = 'Chi tiết hóa đơn';
    DataClassification = ToBeClassified;
    TableType = Normal;

    fields
    {
        field(1; id; Integer)
        {
            Caption = 'Mã số chi tiết';
            AutoIncrement = true;
            Editable = false;


        }
        field(2; OrderID; Integer)
        {
            Caption = 'Mã đơn hàng';
            TableRelation = TableOrder.id;
            Editable = false;

        }
        field(3; ProductID; Integer)
        {
            Caption = 'Mã sản phẩm';
            TableRelation = TableSanPham.idsp;
        }
        field(4; ProductName; Text[100])
        {
            caption = 'Tên sản phẩm';
            FieldClass = FlowField;
            CalcFormula = lookup(TableSanPham.tensp where(idsp = field(ProductID)));
            Editable = false;
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
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum(TableOrderDetails.thanhtien where(OrderID = field(OrderID)));
        }
    }
    keys
    {
        key(PK; id)
        {
            Clustered = true;
        }
        key(OrderProductKey; OrderID, ProductID)
        {
            Clustered = false;

        }
    }
    trigger OnInsert()
    var
        OrderCoppy: Record TableOrderLineCoppy;
    begin
        OrderCoppy.Init();
        OrderCoppy.id := Rec.id;
        OrderCoppy.OrderID := rec.OrderID;
        OrderCoppy.ProductID := rec.ProductID;
        OrderCoppy.ProductName := rec.ProductName;
        OrderCoppy.Quantity := rec.Quantity;
        OrderCoppy.thanhtien := rec.thanhtien;
        OrderCoppy.TongTien := rec.TongTien;
        OrderCoppy.HinhThuc := 'Insert';
        OrderCoppy.NgayGio := CurrentDateTime;
        OrderCoppy.Insert();
    end;

    trigger OnDelete()
    var
        OrderCoppy: Record TableOrderLineCoppy;
    begin
        OrderCoppy.Init();
        OrderCoppy.id := Rec.id;
        OrderCoppy.OrderID := rec.OrderID;
        OrderCoppy.ProductID := rec.ProductID;
        OrderCoppy.ProductName := rec.ProductName;
        OrderCoppy.Quantity := rec.Quantity;
        OrderCoppy.thanhtien := rec.thanhtien;
        OrderCoppy.TongTien := rec.TongTien;
        OrderCoppy.HinhThuc := 'Delete';
        OrderCoppy.NgayGio := CurrentDateTime;
        OrderCoppy.Insert();
    end;

    trigger OnModify()
    var
        OrderCoppy: Record TableOrderLineCoppy;
    begin
        OrderCoppy.Init();
        OrderCoppy.id := Rec.id;
        OrderCoppy.OrderID := rec.OrderID;
        OrderCoppy.ProductID := rec.ProductID;
        OrderCoppy.ProductName := rec.ProductName;
        OrderCoppy.Quantity := rec.Quantity;
        OrderCoppy.thanhtien := rec.thanhtien;
        OrderCoppy.TongTien := rec.TongTien;
        OrderCoppy.HinhThuc := 'Update';
        OrderCoppy.NgayGio := CurrentDateTime;
        OrderCoppy.Insert();
    end;

}
