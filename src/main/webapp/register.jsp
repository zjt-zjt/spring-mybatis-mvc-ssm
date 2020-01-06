<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCUMENT HTML>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="/static/css/register.css">
</head>
<body>

<div class="register_warp">
    <div class="top">
        <img src="/static/img/sms_reg_title.png">
    </div>

    <div class="content">
        <!-- onsubmit是表单提交事件，可以在里面做一些表单校验
            里面接收一个布尔类型返回值，true代表提交表单，false代表不提交表单
        -->
        <form action="/user/register" method="post" onsubmit="return checkForm();">
            <input type="hidden" name="action" value="register">
            <div>
            <label for="nick_name">昵称&nbsp;:</label>
            <!-- name属性的值必须和User对象中的属性名一样，否则Spring无法自动封装参数 -->
            <input id="nick_name" name="nickName" required>
        </div>
            <div>
                <label for="username">用户名&nbsp;:</label>
                <input id="username" name="username" required>
            </div>
            <div>
                <label for="password">密码&nbsp;:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div>
                <label for="re_password">确认密码&nbsp;:</label>
                <input type="password" id="re_password" required>
            </div>
            <div><span class="error"></span></div>
            <div>
                <label for="email">邮箱&nbsp;:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="submit_btn">
                <input type="image" src="/static/img/sms_btn_reg.png">
                <button type="reset"></button>
            </div>
        </form>

        <div style="text-align: center">
            <!-- 这里不能写/login.jsp，因为我们配置的DispatcherServlet拦截路径是"/"，不包含*.jsp
                这样请求会直接交给Tomcat处理，Tomcat会在项目根路径下寻找login.jsp，找不到返回404
             -->
            <a href="/login.jsp"><img src="/static/img/sms_btn_goback.png"></a>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    // 负责提交表单之前做校验
    function checkForm() {
        var pwdVal = password.value;
        var rePwdVal = re_password.value;
        if(pwdVal === rePwdVal) {
            return true;
        } else {
            // 两次密码输入不一致，取消表单提交，并提示用户
            var errSpan = document.querySelector(".error");
            errSpan.innerHTML = "两次密码输入不一致";
            return false;
        }
    }
</script>
</html>
