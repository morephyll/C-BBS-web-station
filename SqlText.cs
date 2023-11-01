using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
namespace WebApplication4
{
    public class SqlText
    {
        private static readonly String Constr = @"Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=BBS;Data Source=MOREPHYLL";

        /// <summary>
        /// sql增删改语句,comType 0-正常 1-存储过程,paras 存储过程参数,非存储过程可不用
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="comType"></param>
        /// <param name="paras"></param>
        /// <returns></returns>
        public static int ExecuteNonQuery(string sql, int cmdType, params SqlParameter[] paras)
        {
            int count;
            using (SqlConnection conn = new SqlConnection(Constr))
            {
                SqlCommand cmd = GetSqlCommand(conn, sql, cmdType, paras);
                count = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                conn.Close();
            }
            return count;
        }
        /// <summary>
        /// 执行一条或存储过程查询语句,cmd 0-正常 1-存储过程
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="cmdType"></param>
        /// <param name="paras"></param>
        /// <returns></returns>
        public static object ExecuteScalar(string sql, int cmdType, params SqlParameter[] paras)
        {
            object TXT = null;
            using (SqlConnection conn = new SqlConnection(Constr))
            {
                SqlCommand cmd = GetSqlCommand(conn, sql, cmdType, paras);
                TXT = cmd.ExecuteScalar();
                cmd.Parameters.Clear();
                conn.Close();
            }
            return TXT;
        }
        /// <summary>
        /// 执行一条或存储过程查询语句,返回DataSet
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="cmdType"></param>
        /// <param name="paras"></param>
        /// <returns></returns>
        public static DataSet GetDataSet(string sql, int cmdType, params SqlParameter[] paras)
        {
            DataSet ds = new DataSet();
            using (SqlConnection conn = new SqlConnection(Constr))
            {
                SqlCommand cmd = GetSqlCommand(conn, sql, cmdType, paras);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
                conn.Close();
            }
            return ds;
        }
        /// <summary>
        /// 执行一条或存储过程查询语句,返回DataTable
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="cmdType"></param>
        /// <param name="paras"></param>
        /// <returns></returns>
        public static DataTable GetDataTable(string sql, int cmdType, params SqlParameter[] paras)
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(Constr))
            {
                SqlCommand cmd = GetSqlCommand(conn, sql, cmdType, paras);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                conn.Close();
            }
            return dt;
        }
        /// <summary>
        /// 创建一个SqlCommand
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="comType"></param>
        /// <param name="paras"></param>
        /// <returns></returns>
        public static SqlCommand GetSqlCommand(SqlConnection conn, string sql, int cmdType, params SqlParameter[] paras)
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (cmdType == 1)
                cmd.CommandType = CommandType.StoredProcedure;
            if (paras != null && paras.Length > 0)
                cmd.Parameters.AddRange(paras);
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            return cmd;
        }
        public static SqlDataReader ExecuteReader(string sql, int cmdType, params SqlParameter[] paras)
        {
            SqlDataReader dr = null;
            using (SqlConnection conn = new SqlConnection(Constr))
            {
                SqlCommand cmd = GetSqlCommand(conn, sql, cmdType, paras);
                dr = cmd.ExecuteReader();
                cmd.Parameters.Clear();
                conn.Close();
            }
            return dr;
        }
    }
}