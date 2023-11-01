<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication4.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 40%;
            height: 100%;
            border: 2px solid #99CCFF;
            margin:0 auto;
        }
        td {
           /*border:1px solid red;*/
            padding:10px 0px;
        }
        .rig{
            text-align:right;
        }
        .lef{
           text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="log" runat="server">
                <center>
                <asp:Label ID="Label1" runat="server" Text="用户登录" Font-Bold="True" Font-Size="20pt"></asp:Label>
            </center>
                <table cellpadding="0" class="auto-style1">
                    <tr>
                        <td class="rig">
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="用户名:"></asp:Label>
                        </td>
                        <td class="lef">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="rig">
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="密码:"></asp:Label>
                        </td>
                        <td class="lef">
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" id="sub2" class="auto-style2" align="center">

                            <asp:Button ID="btnLog_Use" runat="server" Text="登录" Height="25px" Width="50px" class="btnsty" OnClick="btnLog_Use_Click"/>
                            &nbsp;
                            <asp:Button ID="Button2" runat="server" Text="取消" Height="25px" Width="50px" classs="btnsty" CausesValidation="False" PostBackUrl="~/WebForm1.aspx"/>

                        &nbsp;
                            <asp:Button ID="Button3" runat="server" CausesValidation="False" Height="25px" PostBackUrl="~/Login.aspx" Text="重置" Width="50px" OnClick="Button3_Click" />

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"id="sub1" class="auto-style2" align="center" style="font-size: 10px">

                            没有账号？去<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" PostBackUrl="~/Register.aspx">注册</asp:LinkButton>
                            <br />
                            其他<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClick="LinkButton2_Click">登录方式</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <center>
                <asp:Panel ID="pal1" runat="server" Visible="False">
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" OnClick="LinkButton3_Click">管理员登录</asp:LinkButton>
                </asp:Panel>
            </center>
            <asp:Panel ID="pal2" runat="server" Visible="False">
                <center>
                <asp:Label ID="Label4" runat="server" Text="管理员登录" Font-Bold="True" Font-Size="20pt"></asp:Label>
            </center>
                <table cellpadding="0" class="auto-style1">
                    <tr>
                        <td class="rig">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="用户名:"></asp:Label>
                        </td>
                        <td class="lef">
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="rig">
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="密码:"></asp:Label>
                        </td>
                        <td class="lef">
                            <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" id="sub3" class="auto-style2" align="center">

                            <asp:Button ID="btnLog_Adm" runat="server" Text="登录" Height="25px" Width="50px" class="btnsty" OnClick="btnLog_Adm_Click"/>
                            &nbsp;
                            <asp:Button ID="bck" runat="server" Text="返回" Height="25px" Width="50px" classs="btnsty" CausesValidation="False" OnClick="bck_Click"/>

                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
