using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace WebApplication4
{
    public partial class CHK : System.Web.UI.Page
    {
        private static bool imageBtnZ;
        private static bool imageBtnC;
        public int sumHF = 0;
        public string[] hfs ;//回复谁
        public string[] hfz ;//回复者
        public string[] hfnr;//回复内容
        public string[] hftime ;//回复时间
        public string[] hfzs ;//回复赞数
        public string[] hfcs;//回复踩数
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                imageBtnZ = true;
                imageBtnC = true;
                ImageButton1.ImageUrl = "~/image/点赞.png";
                ImageButton1.Width = 10;
                ImageButton2.ImageUrl = "~/image/踩.png";
                ImageButton2.Width = 10;
                Image1.ImageUrl = "~/image/用户名.png";
                if (Session["tzID"] != null)
                {
                    //string s = "UPDATE 帖子 SET [浏览次数] = ((Select 浏览次数 from 帖子 where 帖子ID=" + Session["tzID"] + ")+1) where 帖子ID=" + Session["tzID"] + "";
                    //SqlText.ExecuteNonQuery(s, 0);
                }
            }
            if (Session["tzID"] != null)
            {
                SqlConnection conn = new SqlConnection(@"Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=BBS;Data Source=MOREPHYLL");
                //获取用户名
                string SqlUserName = "select 发帖用户 from 帖子 where 帖子ID=" + Session["tzID"] + "";
                string userName = SqlText.ExecuteScalar(SqlUserName, 0).ToString();
                //获取性别  用户表获取
                string SqlSex = "select 性别 from 用户表 where 用户名='" + userName + "'";
                string userSex = SqlText.ExecuteScalar(SqlSex, 0).ToString();
                //获取年龄  用户表获取
                string SqlAge = "select 年龄 from 用户表 where 用户名='" + userName + "'";
                string userAge = SqlText.ExecuteScalar(SqlAge, 0).ToString();
                //获取发帖数
                string SqlFTS = "Select COUNT(*) from 帖子 where 发帖用户='" + userName + "'";
                string userFST = SqlText.ExecuteScalar(SqlFTS, 0).ToString();
                //获取板块
                string SqlBK = "select 话题 from 帖子 where 帖子ID=" + Session["tzID"] + "";
                string userBK = SqlText.ExecuteScalar(SqlBK, 0).ToString();
                //获取帖子标题
                string SqlTittle = "select 帖子标题 from 帖子 where 帖子ID=" + Session["tzID"] + "";
                string userTittle = SqlText.ExecuteScalar(SqlTittle, 0).ToString();
                //获取内容
                string SqlNR = "select 帖子内容 from 帖子 where 帖子ID=" + Session["tzID"] + "";
                string userNR = SqlText.ExecuteScalar(SqlNR, 0).ToString();
                //获取发表时间
                string SqlTime = "select 创建时间 from 帖子 where 帖子ID=" + Session["tzID"] + "";
                string userTime = SqlText.ExecuteScalar(SqlTime, 0).ToString();
                //获取浏览次数
                string SqlLook = "select 浏览次数 from 帖子 where 帖子ID=" + Session["tzID"] + "";
                string userLook = SqlText.ExecuteScalar(SqlLook, 0).ToString();
                //赞数
                string SqlZS = "select 赞数 from 帖子 where 帖子ID=" + Session["tzID"] + "";
                string userZS = SqlText.ExecuteScalar(SqlZS, 0).ToString();
                //踩数
                string SqlCS = "select 踩数 from 帖子 where 帖子ID=" + Session["tzID"] + "";
                string userCS = SqlText.ExecuteScalar(SqlCS, 0).ToString();

                UserName.Text = userName;
                Age.Text = userAge;
                Sex.Text = userSex;
                FTS.Text = userFST;
                HTS.Text = "0";
                BK.Text = userBK;
                Tittle.Text = userTittle;
                FTime.Text = userTime;
                NR.Text = userNR;
                tzZ.Text = userZS;
                tzC.Text = userCS;
                Label1.Text = "浏览次数：" + userLook;

                
                //帖子回复总数
                string Sqlnum = "Select COUNT(*) from 回帖 where 回复帖子ID=" + Session["tzID"] + "";
                string ce = SqlText.ExecuteScalar(Sqlnum, 0).ToString();
                if (ce != null)
                {
                    sumHF = Convert.ToInt32(ce);
                }
                hfs = new string[sumHF];//回复谁
                hfz = new string[sumHF];//回复者
                hfnr = new string[sumHF];//回复内容
                hftime = new string[sumHF];//回复时间
                hfzs = new string[sumHF];//回复赞数
                hfcs = new string[sumHF];//回复踩数
                //获取回复内容
                string SqlHFNR = " select 回复内容 from 回帖 where 回复帖子ID=" + Session["tzID"] + "";
                //SqlDataReader sdrNR = SqlText.ExecuteReader(SqlHFNR, 0);
                conn.Open();
                SqlCommand cmd = new SqlCommand(SqlHFNR, conn);
                SqlDataReader sdrNR = cmd.ExecuteReader();
                sdrNR.Read();
                for (int i = 0; i < sumHF; i++)
                {
                    hfnr[i] = sdrNR["回复内容"].ToString();
                }
                conn.Close();
                //获取回复时间
                string SqlHFTime = " select 回复时间 from 回帖 where 回复帖子ID=" + Session["tzID"] + "";
                conn.Open();
                SqlCommand cmd1 = new SqlCommand(SqlHFTime, conn);
                SqlDataReader sdrTime = cmd1.ExecuteReader();
                sdrTime.Read();
                for (int i = 0; i < sumHF; i++)
                {
                    hftime[i] = sdrTime["回复时间"].ToString();
                }
                conn.Close();
                //SqlDataReader sdrTime = SqlText.ExecuteReader(SqlHFTime, 0);
                //获取回复人
                string SqlHFUser = " select 回复者 from 回帖 where 回复帖子ID=" + Session["tzID"] + "";
                conn.Open();
                //SqlDataReader sdrUser = SqlText.ExecuteReader(SqlHFUser, 0);
                SqlCommand cmd2 = new SqlCommand(SqlHFUser, conn);
                SqlDataReader sdrUser = cmd2.ExecuteReader();
                sdrUser.Read();
                for (int i = 0; i < sumHF; i++)
                {
                    hfz[i] = sdrUser["回复者"].ToString();
                }
                conn.Close();
                //获取回复谁
                string SqlHFWho = " select 回复谁 from 回帖 where 回复帖子ID=" + Session["tzID"] + "";
                conn.Open();
                //SqlDataReader sdrWho = SqlText.ExecuteReader(SqlHFWho, 0);
                SqlCommand cmd3 = new SqlCommand(SqlHFWho, conn);
                SqlDataReader sdrWho = cmd3.ExecuteReader();
                sdrWho.Read();
                for (int i = 0; i < sumHF; i++)
                {
                    hfs[i] = sdrWho["回复谁"].ToString();
                }
                conn.Close();
                //获取赞数
                string SqlHFZS = " select 赞数 from 回帖 where 回复帖子ID=" + Session["tzID"] + "";
                //SqlDataReader sdrZS = SqlText.ExecuteReader(SqlHFZS, 0);
                conn.Open();
                SqlCommand cmd4 = new SqlCommand(SqlHFZS, conn);
                SqlDataReader sdrZS = cmd4.ExecuteReader();
                sdrZS.Read();
                for (int i = 0; i < sumHF; i++)
                {
                    hfzs[i] = sdrZS["赞数"].ToString();
                }
                conn.Close();
                //获取踩数
                string SqlHFCS = " select 踩数 from 回帖 where 回复帖子ID=" + Session["tzID"] + "";
                //SqlDataReader sdrCS = SqlText.ExecuteReader(SqlHFCS, 0);
                conn.Open();
                SqlCommand cmd5 = new SqlCommand(SqlHFCS, conn);
                SqlDataReader sdrCS = cmd5.ExecuteReader();
                sdrCS.Read();
                for (int i = 0; i < sumHF; i++)
                {
                    hfcs[i] = sdrCS["踩数"].ToString();
                }
                conn.Close();
                //Response.Write(sdrNR["回复内容"]);
                //Response.Write(ce);
                //Response.Write(Session["tzID"]);
                //sdrNR.Read();
                //Response.Write(sdrNR["回复内容"]);
            }
        }

        //赞加一
        protected void lbtnZ_Click(object sender, EventArgs e)
        {
            ZJY();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ZJY();
        }

        private void ZJY()
        {
            if (imageBtnZ)
            {
                ImageButton1.ImageUrl = "~/image/点赞_块.png";
                ImageButton1.Width = 10;
                imageBtnZ = false;
                if (Session["tzID"] != null)
                {
                    string s = "UPDATE 帖子 SET [赞数] = ((Select 赞数 from 帖子 where 帖子ID=" + Session["tzID"] + ")+1) where 帖子ID=" + Session["tzID"] + "";
                    SqlText.ExecuteNonQuery(s, 0);
                    string SqlZS = "select 赞数 from 帖子 where 帖子ID=" + Session["tzID"] + "";
                    tzZ.Text = SqlText.ExecuteScalar(SqlZS, 0).ToString();
                }
            }
            else
            {
                ImageButton1.ImageUrl = "~/image/点赞.png";
                ImageButton1.Width = 10;
                imageBtnZ = true;
                if (Session["tzID"] != null)
                {
                    string s = "UPDATE 帖子 SET [赞数] = ((Select 赞数 from 帖子 where 帖子ID=" + Session["tzID"] + ")-1) where 帖子ID=" + Session["tzID"] + "";
                    SqlText.ExecuteNonQuery(s, 0);
                    string SqlZS = "select 赞数 from 帖子 where 帖子ID=" + Session["tzID"] + "";
                    tzZ.Text = SqlText.ExecuteScalar(SqlZS, 0).ToString();
                }
            }
        }

        private void CJY()
        {
            if (imageBtnC)
            {
                ImageButton2.ImageUrl = "~/image/踩实心.png";
                ImageButton2.Width = 10;
                imageBtnC = false;
                if (Session["tzID"] != null)
                {
                    string s = "UPDATE 帖子 SET [踩数] = ((Select 踩数 from 帖子 where 帖子ID=" + Session["tzID"] + ")+1) where 帖子ID=" + Session["tzID"] + "";
                    SqlText.ExecuteNonQuery(s, 0);
                    string SqlCS = "select 踩数 from 帖子 where 帖子ID=" + Session["tzID"] + "";
                    tzC.Text = SqlText.ExecuteScalar(SqlCS, 0).ToString();
                }
            }
            else
            {
                ImageButton2.ImageUrl = "~/image/踩.png";
                ImageButton2.Width = 10;
                imageBtnC = true;
                if (Session["tzID"] != null)
                {
                    string s = "UPDATE 帖子 SET [踩数] = ((Select 踩数 from 帖子 where 帖子ID=" + Session["tzID"] + ")-1) where 帖子ID=" + Session["tzID"] + "";
                    SqlText.ExecuteNonQuery(s, 0);
                    string SqlCS = "select 踩数 from 帖子 where 帖子ID=" + Session["tzID"] + "";
                    tzC.Text = SqlText.ExecuteScalar(SqlCS, 0).ToString();
                }
            }
        }

        protected void lbtnC_Click(object sender, EventArgs e)
        {
            CJY();
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            CJY();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (Session["Ste"] != null)
            {
                if (Session["Ste"].ToString() == "Admin")
                {
                    Session["Ste"] = null;
                    Session["tzID"] = null;
                    Response.Redirect("~/WebForm2.aspx");
                }
                if (Session["Ste"].ToString() == "User")
                {
                    if (Session["path"] != null)
                    {
                        Session["Ste"] = null;
                        Session["tzID"] = null;
                        Session["pathGo"] = "1";
                        Response.Redirect("~/WebForm1.aspx");
                    }
                    else if (Session["BK"] != null)
                    {
                        Session["Ste"] = null;
                        Session["tzID"] = null;
                        Session["BKGo"] = Session["BK"].ToString();
                        Response.Redirect("~/WebForm1.aspx");
                    }
                    else
                    {
                        Session["Ste"] = null;
                        Session["tzID"] = null;
                        Response.Redirect("~/WebForm1.aspx");
                    }

                }
            }
            else
            {
                Session["Ste"] = null;
                Session["tzID"] = null;
                Response.Redirect("~/WebForm1.aspx");
            }

        }


    }
}