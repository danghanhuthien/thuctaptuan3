table 50119 TableCongTy
{
    Caption = 'TableCongTy';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; idcty; Integer)
        {
            Caption = 'Mã công ty';
        }
        field(2; tencty; Text[100])
        {
            Caption = 'Tên công ty';
        }
        field(3; diachicty; Text[500])
        {
            Caption = 'Địa chỉ';
        }
        field(4; sdtcty; Text[10])
        {
            Caption = 'Hotline1';
        }
        field(5; sdtcty2; Text[10])
        {
            Caption = 'Hotline2';
        }
        field(6; email; Text[500])
        {
            Caption = 'Email';
        }
        field(7; website; Text[500])
        {
            Caption = 'Website';
        }
        field(8; logo; MediaSet)
        {
            Caption = 'Logo';
        }
        field(9; logoblob; Blob)
        {
            Caption = 'Logo';
        }
        field(10; masothue; Text[500])
        {
            Caption = 'Mã số thuế';
        }
        field(11; Ngaythanhlap; DateTime)
        {
            Caption = 'Ngày thành lập';
        }
    }
    keys
    {
        key(PK; idcty)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; idcty, tencty, diachicty, sdtcty, sdtcty2)
        {

        }
    }
}
