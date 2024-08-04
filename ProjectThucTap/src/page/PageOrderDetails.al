page 50125 PageOrderDetails
{
    ApplicationArea = All;
    Caption = 'PageOrderDetails';
    PageType = Card;
    SourceTable = TableOrder;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Thông tin đơn hàng';

                field(id; Rec.id)
                {
                    ToolTip = 'Specifies the value of the Mã đơn hàng field.';
                    ApplicationArea = ALL;

                }
                field(CustomerID; Rec.CustomerID)
                {
                    ToolTip = 'Specifies the value of the Mã khách hàng field.';
                    AssistEdit = true;
                    trigger OnAssistEdit()
                    var
                        CustomerList: Page PageKhachHang;
                    begin
                        CustomerList.Run();
                    end;
                }
                field(CustomerName; Rec.CustomerName)
                {
                    ToolTip = 'Specifies the value of the Tên khách Hàng field.';
                }
                field(OrderDate; Rec.OrderDate)
                {
                    ToolTip = 'Specifies the value of the Ngày mua field.';
                }
            }
            group("Chi tiết đơn hàng")
            {
                part(addPageOrderLine; PageOrderLine)
                {
                    ApplicationArea = All;
                    SubPageLink = OrderID = FIELD(id); // Liên kết trang phụ với trang chính
                    Editable = true;
                    UpdatePropagation = Both;

                }
            }


        }
        area(FactBoxes)
        {

            part(TinhTongTiennn; PageTaoTongTien)
            {
                Caption = 'Tổng Tiền';
                SubPageLink = OrderID = FIELD(id);

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
                Caption = 'Xuất hóa đơn';
                Image = PrintChecklistReport;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    OrderCard: Report ReportBanHang;
                begin
                    OrderCard.Run();
                end;
            }
            action("Reload Page")
            {
                ApplicationArea = All;
                Caption = 'Tải lại trang';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    CurrPage.Update();
                end;
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        Podfhfhfu: Codeunit PageOrderXuLyData;
    begin

        Podfhfhfu.MergeDuplicateOrderDetails();
        CurrPage.Update();
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    var
        Podfhfhfu: Codeunit PageOrderXuLyData;
    begin
        Podfhfhfu.MergeDuplicateOrderDetails();
        CurrPage.Update(false);
        exit(true);
    end;
}
