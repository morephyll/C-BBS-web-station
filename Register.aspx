<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication4.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 50%;
            border: 2px solid #99CCFF;
            margin:0 auto;
        }
        td {
           /*border:1px solid red;*/
            padding:10px 0px;
        }
        .auto-style2 {
            height: 37px;
        }
        #sub{
            border:none;
        }
       .rig{
/*            margin:0 40px;*/
            text-align:right;
            padding-right:40px;
            
        }
/*        .lef{
           text-align:center;
        }*/
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <asp:Label ID="Label1" runat="server" Text="用户注册" Font-Bold="True" Font-Size="20pt"></asp:Label>
            </center>
                <table cellpadding="0" class="auto-style1">
                    <tr>
                        <td class="rig">
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="用户名:"></asp:Label>
                        </td>
                        <td class="lef">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="2-10中文或2英文" ValidationExpression="[\u4e00-\u9fa5]{2,10}|[a-zA-Z]{2,20}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="rig">
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="密码:"></asp:Label>
                        </td>
                        <td class="lef" style="width: 300px">
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="rig">
                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="确认密码:"></asp:Label>
                        </td>
                        <td class="lef">
                            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="密码不一致"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="rig">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="性别:"></asp:Label>
                        </td>
                        <td class="lef">
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="rig">
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="年龄:"></asp:Label>
                        </td>
                        <td class="lef">
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox4" Display="Dynamic" EnableTheming="True" ErrorMessage="无效年龄" MaximumValue="100" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="rig">
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="手机号:"></asp:Label>
                        </td>
                        <td class="lef">
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="无效手机号码" ValidationExpression="^1[3-9][0-9]{9}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="rig">
                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="邮箱:"></asp:Label>
                        </td>
                        <td class="lef">
                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="无效邮箱" ValidationExpression="^\w+@\w+\.[a-zA-Z]+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="rig">
                            <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="简介:"></asp:Label>
                        </td>
                        <td class="lef">
                            <asp:TextBox ID="TextBox7" runat="server" TextMode="MultiLine" Width="174px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" id="sub" class="auto-style2" align="center">

                            <asp:Button ID="Button1" runat="server" Text="注册" Height="25px" Width="50px" class="btnsty" OnClick="Button1_Click"/>
                            &nbsp;
                            <asp:Button ID="Button2" runat="server" Text="取消" Height="25px" Width="50px" classs="btnsty" CausesValidation="False" PostBackUrl="~/WebForm1.aspx"/>

                        &nbsp;
                            <asp:Button ID="Button3" runat="server" CausesValidation="False" Height="25px" PostBackUrl="~/Register.aspx" Text="重置" Width="50px" />

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" id="sub" class="auto-style2" align="center" style="font-size: 10px">

                            已有账号？去<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" PostBackUrl="~/Login.aspx">登录</asp:LinkButton>

                        </td>
                    </tr>
                </table>
        </div>
    </form>
</body>
</html>
