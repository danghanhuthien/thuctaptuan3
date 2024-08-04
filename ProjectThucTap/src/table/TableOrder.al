table 50117 TableOrder
{
    Caption = 'Hóa đơn';
    DataClassification = ToBeClassified;
    TableType = Normal;

    fields
    {
        field(1; id; Integer)
        {
            Caption = 'Mã đơn hàng';
            AutoIncrement = true;

        }
        field(2; OrderDate; Date)
        {
            Caption = 'Ngày mua';
        }
        field(3; CustomerID; Integer)
        {
            Caption = 'Mã khách hàng';
            TableRelation = TableKhachHang.idkh;

        }
        field(7; CustomerName; Text[100])
        {
            Caption = 'Tên khách Hàng';
            FieldClass = FlowField;
            CalcFormula = lookup(TableKhachHang.tenkh where(idkh = field(CustomerID)));
            Editable = false;
        }
    }
    keys
    {
        key(PK; id)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; id, OrderDate, CustomerName)
        {
        }
    }
    trigger OnInsert()

    var
        OrderCoppy: Record TableOrderCoppy;
    begin
        OrderCoppy.Init();
        OrderCoppy.id := Rec.id;
        OrderCoppy.CustomerID := rec.CustomerID;
        OrderCoppy.CustomerName := rec.CustomerName;
        OrderCoppy.OrderDate := rec.OrderDate;
        OrderCoppy.HinhThuc := 'Insert';
        OrderCoppy.NgayGio := CurrentDateTime;
        OrderCoppy.Insert(true);
    end;

    trigger OnDelete()
    var
        OrderCoppy: Record TableOrderCoppy;
    begin
        OrderCoppy.Init();
        OrderCoppy.id := Rec.id;
        OrderCoppy.CustomerID := rec.CustomerID;
        OrderCoppy.CustomerName := rec.CustomerName;
        OrderCoppy.OrderDate := rec.OrderDate;
        OrderCoppy.HinhThuc := 'Delete';
        OrderCoppy.NgayGio := CurrentDateTime;
        OrderCoppy.Insert();
    end;

    trigger OnModify()
    var
        OrderCoppy: Record TableOrderCoppy;
    begin
        OrderCoppy.Init();
        OrderCoppy.id := Rec.id;
        OrderCoppy.CustomerID := rec.CustomerID;
        OrderCoppy.CustomerName := rec.CustomerName;
        OrderCoppy.OrderDate := rec.OrderDate;
        OrderCoppy.HinhThuc := 'Update';
        OrderCoppy.NgayGio := CurrentDateTime;
        OrderCoppy.Insert();
    end;
}
