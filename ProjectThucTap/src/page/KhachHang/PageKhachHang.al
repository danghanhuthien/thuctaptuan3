page 50118 PageKhachHang
{
    ApplicationArea = All;
    Caption = 'Khách Hàng';
    PageType = List;
    SourceTable = "TableKhachHang";
    UsageCategory = Lists;
    CardPageId = 50121;
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
                        PageKhachHangDetails: Page "PageKhachHangDetails";
                    begin
                        PageKhachHangDetails.SetRecord(Rec);
                        PageKhachHangDetails.Run();
                    end;
                }
                field(tenkh; Rec.tenkh)
                {
                    ToolTip = 'Specifies the value of the tenkh field.', Comment = '%';
                    NotBlank = true;
                }
                field(sdt; Rec.sdt)
                {
                    ToolTip = 'Specifies the value of the sdt field.', Comment = '%';
                }
                field(diachi; Rec.diachi)
                {
                    ToolTip = 'Specifies the value of the diachi field.', Comment = '%';
                }
                field(hinhanhblob; Rec.hinhanhblob)
                {
                    ToolTip = 'Specifies the value of the hinhanhblob field.', Comment = '%';

                }

            }

        }

    }
    actions
    {
        area(processing)
        {
            action("View Detailss")
            {
                ApplicationArea = All;
                Caption = 'Import Excel';
                Image = PrintChecklistReport;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    OrderCard: Page PageImportKHWorksheet;
                begin
                    OrderCard.Run();
                end;

            }
        }
    }
    // actions
    // {
    //     area(processing)
    //     {
    //         action("View Details")
    //         {
    //             ApplicationArea = All;
    //             RunObject = Page "PageKhachHangDetails";
    //             Caption = 'Thêm mới';
    //             Image = View;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //         }
    //     }
    // }

}
