using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication4
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebForm1.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        //其他方式登录
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            pal1.Visible = true;
        }
        //管理员登录
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            pal2.Visible = true;
            pal1.Visible = false;
            log.Visible = false;
        }
        //返回登录
        protected void bck_Click(object sender, EventArgs e)
        {
            pal2.Visible = false;
            pal1.Visible = false;
            log.Visible = true;
        }
        //普通用户登录 状态为1，封号状态为0
        protected void btnLog_Use_Click(object sender, EventArgs e)
        {
            try
            {
                string s = "select 用户状态 from 用户表 where 用户名='" + TextBox1.Text + "' and 密码='" + TextBox2.Text + "'";
                string userState = SqlText.ExecuteScalar(s, 0).ToString();
                if (userState == "1")
                {
                    Session["UserState"] = userState;
                    Session["UserName"] = TextBox1.Text;
                    Session["AdminState"] = null;
                    Session["AdminName"] = null;
                    Response.Redirect("~/WebForm1.aspx");
                }
                else if(userState=="0")
                {
                    Response.Write("<script>alert('此账号已被封禁，请重新注册！');window.history.back();</script>");
                }
                else
                {
                    Response.Write("<script>alert('未知错误！');window.history.back();</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('账号或密码错误！');window.history.back();</script>");
            }
        }
        //管理员登录 状态为-1 无法注册管理员，数据库添加
        protected void btnLog_Adm_Click(object sender, EventArgs e)
        {
            try
            {
                string s = "select 用户状态 from 用户表 where 用户名='" + TextBox3.Text + "' and 密码='" + TextBox4.Text + "'";
                string adminState = SqlText.ExecuteScalar(s, 0).ToString();
                if (adminState == "-1")
                {
                    Session["AdminState"] = adminState;
                    Session["AdminName"] = TextBox3.Text;
                    Session["UserState"] = null;
                    Session["UserName"] = null;
                    Response.Redirect("~/WebForm2.aspx");
                }
                else
                {
                    Response.Write("<script>alert('您不是管理员！');window.history.back();</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('请输入！');window.history.back();</script>");
            }
           
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }

    }
}