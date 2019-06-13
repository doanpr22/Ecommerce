
$(document).ready(function () {
    $("#login-close").click(function () {
        $("#form-login").hide();
    });


    $("#dangnhap").click(function () {
        $("#form-login").toggle();
    });

    var role = $('#role').val();
    if (role === "ROLE_CUSTOMER") {
        $('#li-dangnhap').hide();
        $('#taikhoan-customer').show();
    }
    if(role==="ROLE_USER"){
        $('#nav-index').hide();
        $('#nav-quan-ly').show();
    }
    if(role==="ROLE_ADMIN"){
        $('#nav-index').hide();
        $('#nav-quan-ly').show();
        
    }



});