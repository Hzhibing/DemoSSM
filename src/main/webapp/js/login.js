var form = $('#loginform');
var form2 = $('#registerform')
$(document).ready(function () {
    form.bootstrapValidator({
        message: '输入值不合法',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                message: '用户名不合法',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: '请输入3到30个字符'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\. \u4e00-\u9fa5 ]+$/,
                        message: '用户名只能由字母、数字、点、下划线和汉字组成 '
                    }
                }
            }, password: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    }, stringLength: {
                        min: 5,
                        max: 10,
                        message: '请输入5到10个字符'
                    }
                }
            }, captcha: {

                validators: {

                    notEmpty: {

                        message: '验证码不能为空'

                    }, stringLength: {

                        min: 4,

                        max: 4,

                        message: '请输入4个字符'

                    }

                }

            }
        }
    });

    form2.bootstrapValidator({

        message: '输入值不合法',

        feedbackIcons: {

            valid: 'glyphicon glyphicon-ok',

            invalid: 'glyphicon glyphicon-remove',

            validating: 'glyphicon glyphicon-refresh'

        },

        fields: {

            username: {

                message: '用户名不合法',

                validators: {

                    notEmpty: {

                        message: '用户名不能为空'

                    },

                    stringLength: {

                        min: 3,

                        max: 30,

                        message: '请输入3到30个字符'

                    },

                    regexp: {

                        regexp: /^[a-zA-Z0-9_\. \u4e00-\u9fa5 ]+$/,

                        message: '用户名只能由字母、数字、点、下划线和汉字组成 '

                    }

                }

            }, phone: {

                validators: {

                    notEmpty: {

                        message: '手机号不能为空'

                    },

                    regexp: {

                        regexp: "^([0-9]{11})?$",

                        message: '手机号码格式错误'

                    }

                }

            }, password: {

                validators: {

                    notEmpty: {

                        message: '密码不能为空'

                    }, stringLength: {

                        min: 5,

                        max: 10,

                        message: '请输入5到10个字符'

                    }

                }

            }

        }

    });
});

/*function changeImage() {
    $('#verifyCodeImage').attr('src', '${pageContext.request.contextPath}/getVerifyCode');
}*/
function changeCode() {
    document.getElementById("id_captcha").src = "servlet/google/kaptcha.jpg?index"
        + Math.random();
}