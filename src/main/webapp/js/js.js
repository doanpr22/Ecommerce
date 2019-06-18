
/* global order, login, productlist */

$(document).ready(function () {
    $("#login-close").click(function () {
        $("#form-login").hide();
    });


    $("#dangnhap").click(function () {
        $("#form-login").toggle();
    });

    $("#taikhoan-customer").click(function () {
        $("#taikhoan-customer-super").toggle();
    });
    $('#profile-customer').click(function () {
        $('.sp').hide();
        $('#profile').show();
    });

    var role = $('#role').val();
    if (role === "ROLE_CUSTOMER") {
        $('#li-dangnhap').hide();
        $('#taikhoan-customer').show();
    }
    if (role === "ROLE_USER") {
        $('#nav-index').hide();
        $('#nav-quan-ly').show();
    }
    if (role === "ROLE_ADMIN") {
        $('#nav-index').hide();
        $('#nav-quan-ly').show();
    }
    //Js cart
    var numberProduct = $('#product-number').val();
    if (numberProduct == 0) {
        $('#nullProduct').show();
        $('#notNullProduct').hide();
    }
    var error = $('#error').val();
    if (error === "403") {
        alert("ERROR: 403. Có vẽ như bạn truy cập không hợp lệ!!!");
    }
    var action = $('#action').val();
    if (action === "edit") {
        $('#anh-sp').hide();
    };


   
});