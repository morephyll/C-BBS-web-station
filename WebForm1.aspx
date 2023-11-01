<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication4.WebForm1" Theme="主题1"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 646px;
        }
        .auto-style3 {
            width: 50%;
            background-color: #E7E7FF;
        }
        .auto-style4 {
            width: 100%;
            background-color: #E7E7FF;
        }
        /**/
        .rig{
            text-align:right;
            width: 169px;
            padding-right: 30px;
        }
        .lef{
                padding: 20px 30px 20px 0px;
        }
        .cen{
            text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style2">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BBSConnectionStringmore %>" DeleteCommand="DELETE FROM [帖子] WHERE [帖子ID] = @帖子ID" InsertCommand="INSERT INTO [帖子] ([发帖用户], [帖子标题], [帖子内容], [浏览次数], [赞数], [踩数], [创建时间], [更新时间]) VALUES (@发帖用户, @帖子标题, @帖子内容, @浏览次数, @赞数, @踩数, @创建时间, @更新时间)" SelectCommand="SELECT [发帖用户], [帖子标题], [帖子内容], [浏览次数], [赞数], [踩数], [创建时间], [更新时间], [帖子ID] FROM [帖子]" UpdateCommand="UPDATE [帖子] SET [发帖用户] = @发帖用户, [帖子标题] = @帖子标题, [帖子内容] = @帖子内容, [浏览次数] = @浏览次数, [赞数] = @赞数, [踩数] = @踩数, [创建时间] = @创建时间, [更新时间] = @更新时间 WHERE [帖子ID] = @帖子ID" OnSelecting="SqlDataSource1_Selecting">
                <DeleteParameters>
                    <asp:Parameter Name="帖子ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="发帖用户" Type="String" />
                    <asp:Parameter Name="帖子标题" Type="String" />
                    <asp:Parameter Name="帖子内容" Type="String" />
                    <asp:Parameter Name="浏览次数" Type="String" />
                    <asp:Parameter Name="赞数" Type="String" />
                    <asp:Parameter Name="踩数" Type="String" />
                    <asp:Parameter Name="创建时间" Type="DateTime" />
                    <asp:Parameter Name="更新时间" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="发帖用户" Type="String" />
                    <asp:Parameter Name="帖子标题" Type="String" />
                    <asp:Parameter Name="帖子内容" Type="String" />
                    <asp:Parameter Name="浏览次数" Type="String" />
                    <asp:Parameter Name="赞数" Type="String" />
                    <asp:Parameter Name="踩数" Type="String" />
                    <asp:Parameter Name="创建时间" Type="DateTime" />
                    <asp:Parameter Name="更新时间" Type="DateTime" />
                    <asp:Parameter Name="帖子ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BBSConnectionString4 %>" SelectCommand="SELECT [发帖用户], [帖子标题], [帖子内容], [浏览次数], [踩数], [赞数], [创建时间], [更新时间], [帖子ID] FROM [帖子]"></asp:SqlDataSource>
            <table align="center" class="auto-style1" style="border-top-style: solid; border-bottom-style: solid">
                <tr>
                    <td style="text-align: center; background-color: #FFFF00;">
            <asp:Label ID="TimeNow" runat="server" Font-Bold="False" Font-Overline="False" Font-Size="Medium" Text="NowTime"></asp:Label>
                    </td>
                    <td>
                        <table align="center" class="auto-style1">
                            <tr>
                                <td style="text-align: center; width: auto; background-color: #CCCCFF;">
                                    <asp:LinkButton ID="LinkButton2" runat="server" ToolTip="返回首页" CausesValidation="False" OnClick="LinkButton2_Click">首    页</asp:LinkButton>
                                </td>
                                <td style="text-align: center; width: auto;">
            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" PostBackUrl="~/Login.aspx" ToolTip="点击登录" >登    录</asp:LinkButton>
                                </td>
                                <td style="text-align: center; width: auto; background-color: #CCCCFF;">
                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" OnClick="LinkButton3_Click">我的贴子</asp:LinkButton>
                                </td>
                                <td style="text-align: center; width: auto;">
                                    <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" PostBackUrl="~/Register.aspx">注    册</asp:LinkButton>
                                </td>
                                <td style="text-align: center; width: auto; background-color: #CCCCFF;">
                                    <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" OnClick="LinkButton5_Click">设  置</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td>
                        欢迎
            <asp:Label ID="welCom" runat="server" Text="游客！"></asp:Label>

                    </td>
                    <td style="text-align: right">
                        <asp:Label ID="Label2" runat="server" Text="关键字 : "></asp:Label>
                        <asp:TextBox ID="txtSel" runat="server" Height="25px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSel" ErrorMessage="*"></asp:RequiredFieldValidator>
&nbsp;<asp:RadioButton ID="RadioButton1" runat="server" GroupName="Sel" Text="模糊" />
&nbsp;<asp:RadioButton ID="RadioButton2" runat="server" GroupName="Sel" Text="精准" />
&nbsp;<asp:Button ID="btnSel" runat="server" Text="搜索" OnClick="btnSel_Click" />
&nbsp;
                        <asp:Button ID="sendTZ" runat="server" CausesValidation="False" Text="发帖" OnClick="sendTZ_Click" />
&nbsp; </td>
                </tr>
            </table>
            <asp:Panel ID="TZSH" runat="server" Height="100%" Width="100%" Visible="False" Font-Bold="True">
                <asp:LinkButton ID="LinkButton6" runat="server" CausesValidation="False" OnClick="LinkButton6_Click">&lt;-返回</asp:LinkButton>
                <br />
                帖子<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="帖子ID" DataSourceID="SqlDataSource1" EnableModelValidation="True" GridLines="Horizontal" Height="250px" PageSize="5" Width="100%" OnRowCommand="GridView1_RowCommand">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="发帖用户" HeaderText="发帖用户" SortExpression="发帖用户">
                        </asp:BoundField>
                        <asp:BoundField DataField="帖子标题" HeaderText="帖子标题" SortExpression="帖子标题">
                        </asp:BoundField>
                        <asp:BoundField DataField="帖子内容" HeaderText="帖子内容" SortExpression="帖子内容">
                        </asp:BoundField>
                        <asp:BoundField DataField="浏览次数" HeaderText="浏览次数" SortExpression="浏览次数">
                        </asp:BoundField>
                        <asp:BoundField DataField="赞数" HeaderText="赞数" SortExpression="赞数">
                        </asp:BoundField>
                        <asp:BoundField DataField="踩数" HeaderText="踩数" SortExpression="踩数">
                        </asp:BoundField>
                        <asp:BoundField DataField="创建时间" HeaderText="创建时间" SortExpression="创建时间">
                        </asp:BoundField>
                        <asp:BoundField DataField="更新时间" HeaderText="更新时间" SortExpression="更新时间">
                        </asp:BoundField>
                        <asp:BoundField DataField="帖子ID" HeaderText="帖子ID" InsertVisible="False" ReadOnly="True" SortExpression="帖子ID" />
                    </Columns>
                    <EditRowStyle HorizontalAlign="Center" />
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                </asp:GridView>
            </asp:Panel>

        </div>
            
        <asp:Panel ID="fst" runat="server" Font-Bold="True">
            <br />
            版块<br /> 
            <table align="center" class="auto-style4">
                <tr>
                    <td style="text-align: center">
                        <asp:Button ID="btnSH" runat="server" CausesValidation="False" Font-Bold="True" Font-Size="28pt" Height="125px" OnClick="btnSH_Click" Text="生活" Width="100%" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Button ID="btnCW" runat="server" CausesValidation="False" Font-Bold="True" Font-Size="28pt" Height="125px" OnClick="btnCW_Click" Text="宠物" Width="100%" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Button ID="btnYX" runat="server" CausesValidation="False" Font-Bold="True" Font-Size="28pt" Height="125px" OnClick="btnYX_Click" Text="游戏" Width="100%" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Button ID="btnYY" runat="server" CausesValidation="False" Font-Bold="True" Font-Size="28pt" Height="120px" OnClick="btnYY_Click" Text="音乐" Width="100%" />
                    </td>
                </tr>
            </table>
            <table class="auto-style3">
            </table>
        </asp:Panel>
            
        <asp:Panel ID="myTZ" runat="server" Visible="False">
            <asp:LinkButton ID="LinkButton7" runat="server" CausesValidation="False" OnClick="LinkButton6_Click">&lt;-返回</asp:LinkButton>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="帖子ID" DataSourceID="SqlDataSource2" EnableModelValidation="True" GridLines="Horizontal" Width="100%" OnRowCommand="GridView2_RowCommand">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="发帖用户" HeaderText="发帖用户" SortExpression="发帖用户">
                    </asp:BoundField>
                    <asp:BoundField DataField="帖子标题" HeaderText="帖子标题" SortExpression="帖子标题">
                    </asp:BoundField>
                    <asp:BoundField DataField="帖子内容" HeaderText="帖子内容" SortExpression="帖子内容">
                    </asp:BoundField>
                    <asp:BoundField DataField="浏览次数" HeaderText="浏览次数" SortExpression="浏览次数">
                    </asp:BoundField>
                    <asp:BoundField DataField="踩数" HeaderText="踩数" SortExpression="踩数">
                    </asp:BoundField>
                    <asp:BoundField DataField="赞数" HeaderText="赞数" SortExpression="赞数">
                    </asp:BoundField>
                    <asp:BoundField DataField="创建时间" HeaderText="创建时间" SortExpression="创建时间">
                    </asp:BoundField>
                    <asp:BoundField DataField="更新时间" HeaderText="更新时间" SortExpression="更新时间">
                    </asp:BoundField>
                     <asp:BoundField DataField="帖子ID" HeaderText="帖子ID" InsertVisible="False" ReadOnly="True" SortExpression="帖子ID" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            </asp:GridView>
        </asp:Panel>
        <asp:Panel ID="SZ" runat="server" Visible="False">
             <asp:LinkButton ID="LinkButton8" runat="server" CausesValidation="False" OnClick="LinkButton6_Click">&lt;-返回</asp:LinkButton>
            <center>
                <asp:Label runat="server" Text="用户设置" Font-Bold="True" Font-Size="20pt"></asp:Label>
            </center>
            <table align="center" class="auto-style5">
                <tr>
                    <td class="rig">用户名：</td>
                    <td class="lef">
                        <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="rig">密码：</td>
                    <td class="lef">
                        <asp:TextBox ID="txtPwd" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="rig">性别：</td>
                    <td class="lef">
                        <asp:TextBox ID="txtSex" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="rig">年龄：</td>
                    <td class="lef">
                        <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                    </td >
                </tr>
                <tr>
                    <td class="rig">手机号：</td>
                    <td class="lef">
                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="rig">邮箱：</td>
                    <td class="lef">
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="rig">简介：</td>
                    <td class="lef">
                        <asp:TextBox ID="txtInstr" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="cen" colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="修改" CausesValidation="False" OnClick="Button1_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="取消" CausesValidation="False" OnClick="Button2_Click" />
                    </td>
                </tr>
            </table>
            
        </asp:Panel>
        <asp:Panel ID="fTZ" runat="server" Visible="False">
            <div>
                <asp:LinkButton ID="LinkButton9" runat="server" CausesValidation="False" OnClick="LinkButton6_Click">&lt;-返回</asp:LinkButton>
                <table class="auto-style3" algin="center">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="选择板块"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>生活</asp:ListItem>
                            <asp:ListItem>游戏</asp:ListItem>
                            <asp:ListItem>宠物</asp:ListItem>
                            <asp:ListItem>音乐</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="标题"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="内容"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Height="118px" Width="412px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <p>
                        <asp:Button ID="Button3" runat="server" Text="发布" CausesValidation="False" OnClick="Button3_Click" />
                        <asp:Button ID="Button4" runat="server" Text="返回" CausesValidation="False" />
                    </p>
        </asp:Panel>
    </form>
</body>
</html>
