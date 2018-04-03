<%@ WebHandler Language="C#" Class="myajax" %>

using System;
using System.Data;
using System.Web;

public class myajax : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        string name = context.Request.Form["username"];
        string pwd = context.Request.Form["password"];
        string sql = "select * from mH_admin where username='" + name + "' and userpwd='" + pwd + "'";
        DataSet ds = DBHelper.exeSql(sql);
        int i = ds.Tables[0].Rows.Count;
        context.Response.Write(i);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}