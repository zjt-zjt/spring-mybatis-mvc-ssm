<%--
  Created by IntelliJ IDEA.
  User: 召回
  Date: 2019/6/4
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="/static/css/login.css">
</head>
<body>

<div class="register_warp">
    <div class="top">
        <img src="/static/img/sms_login_title.png">
    </div>
    <div class="content">
        <!-- 禁止表单同步提交 -->
        <form action="/user/login" method="post" onsubmit="return false;">
            <div>
                <label for="username">用户名&nbsp;:</label>
                <input id="username" name="username" required >
            </div>
            <div>
                <label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;:</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div>
                <input type="checkbox" id="rem">
                <label for="password">记住密码</label>
            </div>

            <div class="submit_btn">
                <input type="image" onclick="login();" src="/static/img/sms_btn_login.png">
                <a href="/register.jsp"><img alt="注册" src="/static/img/sms_btn_reg.png"></a>
            </div>
        </form>
    </div>
</div>
<!-- JavaScript代码 -->
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/js-cookie/latest/js.cookie.min.js"></script>
<script>
    $('#username').blur(function () {
        // 获取cookie
       var cookie = Cookies.get();
       // 获取用户名
       var username = $("#username").val();
       // 获取cookie中用户名对应的密码（如果有的话）
       var cPassword = cookie["sms_"+username];
       // 若cPassword不空为真
       if (cPassword) {
           // 将cookie中的密码设置到密码框内
           $("#password").val(cPassword);
       }
    });
</script>
<script type="text/javascript">
    function login() {
        // $("form").submit();
        // return false;

        // 通过js拿到表单上面设置的action属性的值
        var url = $("form").attr('action');
        // 也可以不在表单上设置action属性，直接将url定义在js中
        // var url = '/user/login';

        // 通过JQuery的serialize方法，将表单序列化
        var data = $("form").serialize();
        var isRem = $("#rem").is(":checked");
        console.log("isRem: " + isRem);
        if(isRem) {
            data += "&rem=on";
        }
        console.log(data);


        $.post(url, data, function(retJson){
            if(!retJson) {
                alert('登录失败，请重试');
                return;
            }
            var code = retJson.code;
            var msg = retJson.message;
            var href = retJson.data;
            if(code == '200') {
                window.location.href = href;
            } else {
                alert(msg);
            }
        }, "json");
    }
</script>
</body>
</html>
