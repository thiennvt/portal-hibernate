//thêm mới nhân viên
function confirmDelete() {
    alert("Bạn chắc chắn muốn xóa không ?");
}
function password()
{
    var fpw = Document.getElementById("matKhau").value;
    var spw = Document.getElementById("cMatKhau").value;
    if (fpw.length < 6)
    {
        Document.getElementById('matKhau').innerHTML = "Mật khẩu phải nhiều hơn 6 kí tự";
    }
    if (fpw != spw) {
        Document.getElementById('cMatKhau').innerHTML = "Mật khẩu không trùng khớp";

    }
}