page 50153 PageKhachHangApprove
{
    ApplicationArea = All;
    Caption = 'Duyệt Khách Hàng';
    PageType = List;
    SourceTable = TableKhachHangApprove;
    UsageCategory = Lists;
    CardPageId = 50154;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(idkh; Rec.idkh)
                {
                    ToolTip = 'Specifies the value of the idkh field.', Comment = '%';
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        PageKhachHangDetails: Page PageKhachHangDetailsApprove;
                    begin
                        PageKhachHangDetails.SetRecord(Rec);
                        PageKhachHangDetails.Run();
                    end;
                }
                field(tenkh; Rec.tenkh)
                {
                    ToolTip = 'Specifies the value of the Tên khách hàng field.', Comment = '%';
                }
                field(sdt; Rec.sdt)
                {
                    ToolTip = 'Specifies the value of the Số điện thoại field.', Comment = '%';
                }
                field(diachi; Rec.diachi)
                {
                    ToolTip = 'Specifies the value of the Địa chỉ field.', Comment = '%';
                }
                field(hinhanhblob; Rec.hinhanhblob)
                {
                    ToolTip = 'Specifies the value of the Hình ảnh field.', Comment = '%';
                }
                field(TrangThaiDuyet; Rec.TrangThaiDuyet)
                {
                    ApplicationArea = All;
                    Editable = False;
                }
                field(NgayTao; Rec.NgayTao)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("View Details")
            {
                ApplicationArea = All;
                Caption = 'Duyệt';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    PheDuyet: Codeunit CodeunitApproveDataKH;
                begin
                    PheDuyet.DuyetKhachHang(rec.idkh);
                    CurrPage.Update(False);
                end;
            }
            action("View Detailss")
            {
                ApplicationArea = All;
                Caption = 'Từ chối';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    PheDuyet: Codeunit CodeunitApproveDataKH;
                begin
                    if Confirm('Bạn có  chấc là từ chối khách hàng này?') then begin
                        PheDuyet.TuChoiKhachHang(Rec.idkh);
                        CurrPage.update(false);
                    end;
                end;

            }
        }
    }
    trigger OnOpenPage()
    begin
        rec.SetRange(TrangThaiDuyet, rec.TrangThaiDuyet::"Chờ duyệt");
    end;
}
