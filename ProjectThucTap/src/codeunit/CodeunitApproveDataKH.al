codeunit 50103 CodeunitApproveDataKH
{
    procedure DuyetKhachHang(idkhtemp: Integer)
    var
        KhachHangTemp: Record TableKhachHangApprove;
        KhachHang: Record Tablekhachhang;
    begin
        if KhachHangTemp.Get(idkhtemp) then begin
            if KhachHangTemp.TrangThaiDuyet = KhachHangTemp.TrangThaiDuyet::"Chờ duyệt" then begin
                KhachHang.Init();
                KhachHang.TransferFields(KhachHangTemp);
                if KhachHang.Insert(true) then begin
                    KhachHangTemp.TrangThaiDuyet := KhachHangTemp.TrangThaiDuyet::"Đã duyệt";
                    KhachHangTemp.Modify();
                    GhiLogKhachHang(KhachHang, 'Insert');
                end;
            end;
        end;
    end;

    procedure TuChoiKhachHang(idkhtemp: Integer)
    var
        KhachHangTemp: Record TableKhachHangApprove;

    begin
        If KhachHangTemp.Get(idkhtemp) then begin
            if KhachHangTemp.TrangThaiDuyet = KhachHangTemp.TrangThaiDuyet::"Chờ duyệt" then begin
                KhachHangTemp.TrangThaiDuyet := KhachHangTemp.TrangThaiDuyet::"Từ chối";
                KhachHangTemp.Modify();
            end;
        end;
    end;

    local procedure GhiLogKhachHang(KhachHang: Record TableKhachHang; HinhThuc: Text[10])
    var
        KhachHangCoppy: Record TableKhachHangCoppy;

    begin
        KhachHangCoppy.Init();
        KhachHangCoppy.TransferFields(KhachHang);
        KhachHangCoppy.HinhThuc := HinhThuc;
        KhachHangCoppy.NgayGio := CurrentDateTime;
        KhachHangCoppy.Insert();
    end;
}
