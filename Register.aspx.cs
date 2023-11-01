using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication4
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s= "insert into 用户表(用户名,密码,性别,年龄,手机号,邮箱,简介) values('"+TextBox1.Text+"','"+TextBox2.Text+"','"+DropDownList1.SelectedValue+"','"+TextBox4.Text+"','"+TextBox5.Text+"','"+TextBox6.Text+"','"+TextBox7.Text+"')";
            int i = SqlText.ExecuteNonQuery(s, 0);
            if (i > 0)
            {
                Response.Write("<script>alert('注册成功，请前往登录！');window.location.href='Login.aspx';</script>");
            }
        }
    }
}