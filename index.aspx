<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="index.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
        用户名：<input type="text" name="username" id="username"><br>
    密码:<input type="password" name="password" id="password">
    <a href="javascript:chkUser();">登录</a>
     <div id="res"></div>
    </form>
</body>
<script>
   
    /**
   * 创建XMLHttpRequest对象
     */
   function createXMLHttpRequest(){
      //1、创建XMLHttpRequest对象
        if(window.XMLHttpRequest){
            //非IE内核浏览器
          return new XMLHttpRequest();  
        }else{
            //IE浏览器
           try{
                return new ActiveXObject("Msxml2.XMLHTTP"); 
             }catch(e){
               //IE低版本
                 return new ActiveXObject("Microsoft.XMLHTTP"); 
             }
         }
    }
     
     /**
     * 发送请求，用来检查用户名、密码是否正确
     */
     function chkUser(){
         
         //1、创建XMLHttpRequest
         var xhr = createXMLHttpRequest();
         
         //2、获得用户名、密码
         var username=document.getElementById("username").value;
         var password=document.getElementById("password").value;
         
         //3、与服务器建立连接：open
         var url="login?username="+username+"&password="+password;
         //方式1：get提交
         //xhr.open("GET",url,true);
         
         //方式2：post提交
         var url2="myajax.ashx";
         xhr.open("POST",url2,true);
         
 
 
 
 
         
         //4、设置回调函数，获得服务器响应的数据
         xhr.onreadystatechange=function(){
             /*
             readyState状态码：
             0：未初始化
             1：正在加载
             2：加载完成
             3：请求进行中
             4：请求完成
             */
             if(xhr.readyState==4){
                 //status,200表示响应正常
                 if(xhr.status==200){
                    //alert("从服务器返回的值为："+xhr.responseText);
                    var res=xhr.responseText;
                    debugger
                    if(res!='0'){
                        document.getElementById("res").innerHTML="登录成功";
                    }else{
                        document.getElementById("res").innerHTML="<font color='red'>登录失败</font>";
                    }
                    
                 }else{
                     alert("出现在了异常:"+xhr.response.Text);
                 }
                 
             }
         }
         //5、发送请求
         //方式1：get方式
         //xhr.send(null);
         
         //方式2:post方式：
         //Post提交需要设置http请求头
        
         xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
         xhr.send("username="+username+"&password="+password);
         
         
     }
</script>
</html>
