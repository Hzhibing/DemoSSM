$(function(){
	 $(".form_datetime").datetimepicker({
		 format: 'yyyy-mm-dd hh:ii',
		   autoclose: true,
		   todayBtn: true,
		   pickerPosition: "bottom-left",
			language:'zh-CN'
		 });

    /*点击不同记录的编辑按钮，显示不同的信息，也就是当前编辑的模态框隐藏时清空本模态框的内容，相当于页面的刷新的效果*/
    $("#updateModal").on("hidden.bs.modal",function () {
		$(this).removeData("bs.modal");
    });
    /*批量删除*/
   $("#deleteUsers").on("click",function () {

       //获取到勾选了的复选框的dom对象
	   var checkboxs = $(".checkone:checked");
	   if(checkboxs.length==0){
           alert("至少选取一条记录");
	   }else {
	   		//获取到勾选中复选框的value值，也就是对应用户的id值
		   var userIds = new Array();
		   checkboxs.each(function () {
			   userIds.push(this.value)
           })
		   var data = JSON.stringify(userIds)
		   $.ajax({
			   url:'/DemoSSM/admin/deleteUsers.html',
			   type:'POST',
			   data: {
                 uid:data
			   },
			   success:function (rs) {
				   //删除成功后的回调函数
				   if(rs=="success"){
				   		$(location).attr("href","/DemoSSM/admin/user_manager.html?pageNum=1&pageSize=5");
				   }
               }
		   });
	   }
   });
    $("#searchBtn").on("click",function () {
        $("#search_form").submit();
    });




    var form = $('#addform');

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

                }

                , email: {

                    validators: {

                        notEmpty: {

                            message: 'email不能为空'

                        },

                        emailAddress: {

                            message: '请输入正确的邮件地址如：123@qq.com'

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
    /*添加用户表单的提交，因为提交按钮不在表单之内，所以要写他的单击事件再出发表单自动提交*/
    $("#btnadd").on("click",function () {
        $("#addform").submit();
    });

});
function checkall(){
	$(".checkone").prop("checked",$(".checkall").prop("checked"));
}

function checkone(){
	var flag = true;
	$(".checkone").each(function(index,el){
		if($(el).prop("checked")==false){
			flag=false;
		}
	});
	if(flag==true){
		$(".checkall").prop("checked",true);
	}
	else{
		$(".checkall").prop("checked",false);
	}
}
function submit() {
    $("#updateUserForm").submit();
}
function removeUser(id){
	if(confirm("确定要删除吗？"+id)){
		window.location="removeUser?id="+id;
	}
}