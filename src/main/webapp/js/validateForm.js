/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function ()
{
    $('.form_register').submit(function () {

        // BƯỚC 1: Lấy dữ liệu từ form
        var username = $.trim($('#username').val());
        var password = $.trim($('#password').val());
        var re_password = $.trim($('#re_password').val());
     //   var email = $.trim($('#profile.email').val());
     //   var phone = $.trim($('#profile.phone').val());
        //var firstname = $.trim($('#profile.firstname').val());
        // BƯỚC 2: Validate dữ liệu
        // Biến cờ hiệu
        var flag = true;
        // Username
        if (username == '' || username.length < 4) {
            $('#username_error').text('Tên đăng nhập phải lớn hơn 4 ký tự');
            flag = false;
        } else {
            $('#username_error').text('');
        }

        // Password
        if ( password.length < 4) {
            $('#password_error').text('Bạn phải nhập mật khẩu lớn hơn 4 chữ số');
            flag = false;
        } else {
            $('#password_error').text('');
        }

        // Re password
        if (password != re_password) {
            $('#re_password_error').text('Mật khẩu nhập lại không đúng');
            flag = false;
        } else {
            $('#re_password_error').text('');
        }

      /*  var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
        if (phone !== '') {
            if (vnf_regex.test(mobile) == false)
            {
                 $('#phone_error').text('Nhập không đúng định dạng số điện thoại');
                 flag = false;
            } else {
                $('#phone_error').text('');
            }
        } else {
            $('#phone_error').text('Bạn chưa điền số điện thoại!');
             flag = false;
        };*/
        
        return flag;
    });
});