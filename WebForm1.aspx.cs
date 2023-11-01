using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RadioButton1.Checked = true;
            TimeNow.Text = DateTime.Now.ToString();
            if (Session["UserState"] != null)
            {
                welCom.Text = " " + Session["UserName"] + "！您的身份为普通会员";
                welCom.ForeColor = System.Drawing.Color.Blue;
            }
            if (Session["pathGo"] != null)
            {
                fst.Visible = false;
                TZSH.Visible = false;
                myTZ.Visible = true;
                SZ.Visible = false;
                fTZ.Visible = false;
                SqlDataSource2.SelectCommand = "SELECT [发帖用户], [帖子标题], [帖子内容], [浏览次数], [踩数], [赞数], [创建时间], [更新时间], [帖子ID] FROM [帖子] WHERE 发帖用户='" + Session["UserName"] + "'";
                GridView2.DataSourceID = "SqlDataSource2";
            }
            if (Session["BKGo"] != null)
            {
                if (Session["BKGo"].ToString() == "生活")
                {
                    setSH();
                }
                if (Session["BKGo"].ToString() == "宠物")
                {
                    setCW();
                }
                if (Session["BKGo"].ToString() == "游戏")
                {
                    setYX();
                }
                if (Session["BKGo"].ToString() == "音乐")
                {
                    setYY();
                }
            }
        }
        //返回
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            fst.Visible = true;
            TZSH.Visible = false;
            myTZ.Visible = false;
            SZ.Visible = false;
            fTZ.Visible = false;
            Session["pathGo"] = null;
            Session["path"] = null;
        }
        //首页
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            fst.Visible = true;
            TZSH.Visible = false;
            myTZ.Visible = false;
            SZ.Visible = false;
            fTZ.Visible = false;
            Session["pathGo"] = null;
            Session["path"] = null;
        }
        //搜索
        protected void btnSel_Click(object sender, EventArgs e)
        {
            fst.Visible = false;
            TZSH.Visible = true;
            myTZ.Visible = false;
            SZ.Visible = false;
            fTZ.Visible = false;
            SqlDataSource1.SelectCommand ="SELECT [发帖用户], [帖子标题], [帖子内容], [浏览次数], [赞数], [踩数], [创建时间], [更新时间], [帖子ID] FROM [帖子] WHERE [帖子标题] LIKE '%"+txtSel.Text+"%'";
            GridView1.DataSourceID = "SqlDataSource1";
        }
        //生活板块
        private void setSH()
        {
            fst.Visible = false;
            TZSH.Visible = true;
            myTZ.Visible = false;
            SZ.Visible = false;
            fTZ.Visible = false;
            SqlDataSource1.SelectCommand = "SELECT [发帖用户], [帖子标题], [帖子内容], [浏览次数], [赞数], [踩数], [创建时间], [更新时间], [帖子ID] FROM [帖子] WHERE [话题]='生活'";
            GridView1.DataSourceID = "SqlDataSource1";
        }
        protected void btnSH_Click(object sender, EventArgs e)
        {
            setSH();
        }
        //宠物板块
        private void setCW()
        {
            fst.Visible = false;
            TZSH.Visible = true;
            myTZ.Visible = false;
            SZ.Visible = false;
            fTZ.Visible = false;
            SqlDataSource1.SelectCommand = "SELECT [发帖用户], [帖子标题], [帖子内容], [浏览次数], [赞数], [踩数], [创建时间], [更新时间], [帖子ID] FROM [帖子] WHERE [话题]='宠物'";
            GridView1.DataSourceID = "SqlDataSource1";
        }
        protected void btnCW_Click(object sender, EventArgs e)
        {
            setCW();
            
        }
        //游戏板块
        private void setYX()
        {
            fst.Visible = false;
            TZSH.Visible = true;
            myTZ.Visible = false;
            SZ.Visible = false;
            fTZ.Visible = false;
            SqlDataSource1.SelectCommand = "SELECT [发帖用户], [帖子标题], [帖子内容], [浏览次数], [赞数], [踩数], [创建时间], [更新时间], [帖子ID] FROM [帖子] WHERE [话题]='游戏'";
            GridView1.DataSourceID = "SqlDataSource1";
        }
        protected void btnYX_Click(object sender, EventArgs e)
        {
            setYX();
        }
        //音乐板块
        private void setYY()
        {
            fst.Visible = false;
            TZSH.Visible = true;
            myTZ.Visible = false;
            SZ.Visible = false;
            fTZ.Visible = false;
            SqlDataSource1.SelectCommand = "SELECT [发帖用户], [帖子标题], [帖子内容], [浏览次数], [赞数], [踩数], [创建时间], [更新时间], [帖子ID] FROM [帖子] WHERE [话题]='音乐'";
            GridView1.DataSourceID = "SqlDataSource1";
        }
        protected void btnYY_Click(object sender, EventArgs e)
        {
            setYY();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName== "CEKTZ")
            {
                GridViewRow drv = (GridViewRow)((LinkButton)(e.CommandSource)).Parent.Parent;
                int a = Convert.ToInt32(GridView1.DataKeys[drv.RowIndex].Value.ToString());
                string s = "UPDATE 帖子 SET [浏览次数] = ((Select 浏览次数 from 帖子 where 帖子ID=" + a + ")+1) where 帖子ID=" + a + "";
                SqlText.ExecuteNonQuery(s, 0);
                GridView1.DataBind();
                string getBK = "select 话题 from 帖子 where 帖子ID=" + a + "";
                string BK = SqlText.ExecuteScalar(getBK, 0).ToString();
                Session["BK"] = BK;
                Session["tzID"] = a.ToString();
                Session["Ste"] = "User";
                Response.Redirect("~/CHK.aspx");
            }
        }
        //我的帖子
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                myTZ.Visible = true;
                TZSH.Visible = false;
                fst.Visible = false;
                SZ.Visible = false;
                fTZ.Visible = false;
                SqlDataSource2.SelectCommand = "SELECT [发帖用户], [帖子标题], [帖子内容], [浏览次数], [踩数], [赞数], [创建时间], [更新时间], [帖子ID] FROM [帖子] WHERE 发帖用户='" + Session["UserName"] + "'";
                GridView2.DataSourceID = "SqlDataSource2";
            }
            else
            {
                Response.Write("<script>alert('未登录，请先登录！');window.history.back();</script>");
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //查看帖子
            if (e.CommandName == "CEKMYTZ")
            {
                GridViewRow drv = (GridViewRow)((LinkButton)(e.CommandSource)).Parent.Parent;
                int a = Convert.ToInt32(GridView2.DataKeys[drv.RowIndex].Value.ToString());
                string s = "UPDATE 帖子 SET [浏览次数] = ((Select 浏览次数 from 帖子 where 帖子ID=" + a + ")+1) where 帖子ID=" + a + "";
                SqlText.ExecuteNonQuery(s, 0);
                GridView2.DataBind();
                Session["tzID"] = a.ToString();
                Session["Ste"] = "User";
                Session["path"] = "1";
                Response.Redirect("~/CHK.aspx");
            }
            if (e.CommandName == "DELMYTZ")
            {
                GridViewRow drv = (GridViewRow)((LinkButton)(e.CommandSource)).Parent.Parent;
                int a = Convert.ToInt32(GridView2.DataKeys[drv.RowIndex].Value.ToString());
                string s = "delete from 帖子 where 帖子ID=" + a + "";
                SqlText.ExecuteNonQuery(s, 0);
                GridView2.DataBind();
            }
        }
        //用户设置
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                myTZ.Visible = false;
                TZSH.Visible = false;
                fst.Visible = false;
                SZ.Visible = true;
                fTZ.Visible = false;
                string sP = "select 密码 from 用户表 where 用户名='" + Session["UserName"].ToString() + "'";
                string sS = "select 性别 from 用户表 where 用户名='" + Session["UserName"].ToString() + "'";
                string sA = "select 年龄 from 用户表 where 用户名='" + Session["UserName"].ToString() + "'";
                string sPh = "select 手机号 from 用户表 where 用户名='" + Session["UserName"].ToString() + "'";
                string sE = "select 邮箱 from 用户表 where 用户名='" + Session["UserName"].ToString() + "'";
                string sI = "select 简介 from 用户表 where 用户名='" + Session["UserName"].ToString() + "'";
                txtUser.Text=Session["UserName"].ToString();
                txtPwd.Text = SqlText.ExecuteScalar(sP, 0).ToString();
                txtSex.Text = SqlText.ExecuteScalar(sS, 0).ToString();
                txtAge.Text = SqlText.ExecuteScalar(sA, 0).ToString();
                txtPhone.Text = SqlText.ExecuteScalar(sPh, 0).ToString();
                txtEmail.Text = SqlText.ExecuteScalar(sE, 0).ToString();
                txtInstr.Text = SqlText.ExecuteScalar(sI, 0).ToString();
                
            }
            else
            {
                Response.Write("<script>alert('未登录，请先登录！');window.history.back();</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('敬请期待！');window.history.back();</script>");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('敬请期待！');window.history.back();</script>");
        }

        protected void sendTZ_Click(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                fTZ.Visible = true;
                myTZ.Visible = false;
                TZSH.Visible = false;
                fst.Visible = false;
                SZ.Visible = false;
            }
            else
            {
                Response.Write("<script>alert('未登录，请先登录！');window.history.back();</script>");
            }
        }
        //发布
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                string Bk = DropDownList1.SelectedValue;
                string BT = TextBox1.Text;
                string NR = TextBox2.Text;
                string CrTime = DateTime.Now.ToString();
                string SqlIn = "insert into 帖子(发帖用户,帖子标题,帖子内容,创建时间,更新时间,话题) values('" + Session["UserName"] + "','" + BT + "','" + NR + "','" + CrTime + "','" + CrTime + "','" + Bk + "')";
                int i = SqlText.ExecuteNonQuery(SqlIn, 0);
                if (i > 0)
                {
                     Response.Write("<script>alert('发布成功！');window.location.href='WebForm1.aspx';</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('未登录，请先登录！');window.history.back();</script>");
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}