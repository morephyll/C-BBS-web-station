using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["AdminState"]!=null)
            {
                Label1.Text = " " + Session["AdminState"] + "！您的身份为管理员";
                Label1.ForeColor = System.Drawing.Color.Blue;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            checkUS.Visible = false;
            checkTZ.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            checkUS.Visible = true;
            checkTZ.Visible = false;
        }
        
        
        protected void GridView2_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            //< asp:TemplateField HeaderText = "" >
            //         < ItemTemplate >
            //                   < asp:LinkButton ID = "lbtn" runat = "server" CommandName = "JF" CommandArgument = '<%#Eval("用户ID") %>' >
            //                                解封
            //                   </ asp:LinkButton >
            //          </ ItemTemplate >
            // </ asp:TemplateField >
            //解封
            if (e.CommandName == "JF")
            {
                GridViewRow drv = (GridViewRow)((LinkButton)(e.CommandSource)).Parent.Parent;
                string a = GridView2.Rows[drv.RowIndex].Cells[0].Text;
                string s = "UPDATE [用户表] SET [用户状态] = 1 WHERE [用户ID] = '" + a + "'";
                int i = SqlText.ExecuteNonQuery(s, 0);
                GridView2.DataBind();
            }
            //封禁用户
            if (e.CommandName == "FH")
            {
                GridViewRow drv = (GridViewRow)((LinkButton)(e.CommandSource)).Parent.Parent;
                string a = GridView2.Rows[drv.RowIndex].Cells[0].Text;
                string s = "UPDATE [用户表] SET [用户状态] = 0 WHERE [用户ID] = '" + a + "'";
                int i = SqlText.ExecuteNonQuery(s, 0);
                GridView2.DataBind();
            }
            //删除
            if (e.CommandName == "DEL")
            {
                GridViewRow drv = (GridViewRow)((LinkButton)(e.CommandSource)).Parent.Parent;
                string a = GridView2.Rows[drv.RowIndex].Cells[0].Text;
                string s = "delete from 用户表 where 用户ID=" + a + "";
                SqlText.ExecuteNonQuery(s, 0);
                GridView2.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //删除帖子
            if (e.CommandName == "DELTZ")
            {
                GridViewRow drv = (GridViewRow)((LinkButton)(e.CommandSource)).Parent.Parent;
                string a = GridView1.Rows[drv.RowIndex].Cells[0].Text;
                string s = "delete from 帖子 where 帖子ID=" + a + "";
                SqlText.ExecuteNonQuery(s, 0);
                GridView1.DataBind();
            }
                //查看帖子
            if (e.CommandName == "CEKTZ")
            {
                GridViewRow drv = (GridViewRow)((LinkButton)(e.CommandSource)).Parent.Parent;
                int a = Convert.ToInt32(GridView1.Rows[drv.RowIndex].Cells[0].Text);
                string s = "UPDATE 帖子 SET [浏览次数] = ((Select 浏览次数 from 帖子 where 帖子ID=" + a + ")+1) where 帖子ID=" + a + "";
                int i = SqlText.ExecuteNonQuery(s, 0);
                GridView2.DataBind();
                Session["tzID"] = a.ToString();
                Session["Ste"] = "Admin";
                Response.Redirect("~/CHK.aspx");
            }
        }
    }
}