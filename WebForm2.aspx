<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication4.WebForm2" Theme="主题1"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BBSConnectionStringmore %>" SelectCommand="SELECT * FROM [帖子]" DeleteCommand="DELETE FROM [帖子] WHERE [帖子ID] = @帖子ID" InsertCommand="INSERT INTO [帖子] ([发帖用户], [帖子标题], [帖子内容], [赞数], [踩数], [浏览次数], [创建时间], [更新时间], [话题], [帖子状态]) VALUES (@发帖用户, @帖子标题, @帖子内容, @赞数, @踩数, @浏览次数, @创建时间, @更新时间, @话题, @帖子状态)" UpdateCommand="UPDATE [帖子] SET [发帖用户] = @发帖用户, [帖子标题] = @帖子标题, [帖子内容] = @帖子内容, [赞数] = @赞数, [踩数] = @踩数, [浏览次数] = @浏览次数, [创建时间] = @创建时间, [更新时间] = @更新时间, [话题] = @话题, [帖子状态] = @帖子状态 WHERE [帖子ID] = @帖子ID">
                <DeleteParameters>
                    <asp:Parameter Name="帖子ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="发帖用户" Type="String" />
                    <asp:Parameter Name="帖子标题" Type="String" />
                    <asp:Parameter Name="帖子内容" Type="String" />
                    <asp:Parameter Name="赞数" Type="String" />
                    <asp:Parameter Name="踩数" Type="String" />
                    <asp:Parameter Name="浏览次数" Type="String" />
                    <asp:Parameter Name="创建时间" Type="DateTime" />
                    <asp:Parameter Name="更新时间" Type="DateTime" />
                    <asp:Parameter Name="话题" Type="String" />
                    <asp:Parameter Name="帖子状态" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="发帖用户" Type="String" />
                    <asp:Parameter Name="帖子标题" Type="String" />
                    <asp:Parameter Name="帖子内容" Type="String" />
                    <asp:Parameter Name="赞数" Type="String" />
                    <asp:Parameter Name="踩数" Type="String" />
                    <asp:Parameter Name="浏览次数" Type="String" />
                    <asp:Parameter Name="创建时间" Type="DateTime" />
                    <asp:Parameter Name="更新时间" Type="DateTime" />
                    <asp:Parameter Name="话题" Type="String" />
                    <asp:Parameter Name="帖子状态" Type="Int32" />
                    <asp:Parameter Name="帖子ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BBSConnectionStringmore %>" DeleteCommand="DELETE FROM [用户表] WHERE [用户ID] = @用户ID" InsertCommand="INSERT INTO [用户表] ([用户名], [密码], [性别], [年龄], [简介], [手机号], [邮箱], [用户状态]) VALUES (@用户名, @密码, @性别, @年龄, @简介, @手机号, @邮箱, @用户状态)" SelectCommand="SELECT * FROM [用户表]" UpdateCommand="UPDATE [用户表] SET [用户名] = @用户名, [密码] = @密码, [性别] = @性别, [年龄] = @年龄, [简介] = @简介, [手机号] = @手机号, [邮箱] = @邮箱, [用户状态] = @用户状态 WHERE [用户ID] = @用户ID">
                <DeleteParameters>
                    <asp:Parameter Name="用户ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="用户名" Type="String" />
                    <asp:Parameter Name="密码" Type="String" />
                    <asp:Parameter Name="性别" Type="String" />
                    <asp:Parameter Name="年龄" Type="String" />
                    <asp:Parameter Name="简介" Type="String" />
                    <asp:Parameter Name="手机号" Type="String" />
                    <asp:Parameter Name="邮箱" Type="String" />
                    <asp:Parameter Name="用户状态" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="用户名" Type="String" />
                    <asp:Parameter Name="密码" Type="String" />
                    <asp:Parameter Name="性别" Type="String" />
                    <asp:Parameter Name="年龄" Type="String" />
                    <asp:Parameter Name="简介" Type="String" />
                    <asp:Parameter Name="手机号" Type="String" />
                    <asp:Parameter Name="邮箱" Type="String" />
                    <asp:Parameter Name="用户状态" Type="Int32" />
                    <asp:Parameter Name="用户ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            您好！<asp:Label ID="Label1" runat="server" Text="管理员"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" Text="查看用户" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="查看帖子" OnClick="Button2_Click" />
            <asp:Panel ID="checkTZ" runat="server" Visible="False">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="帖子ID" DataSourceID="SqlDataSource1" EnableModelValidation="True" GridLines="Horizontal" AllowPaging="True" Height="100%" Width="100%" OnRowCommand="GridView1_RowCommand">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="帖子ID" HeaderText="帖子ID" InsertVisible="False" ReadOnly="True" SortExpression="帖子ID" >
                        </asp:BoundField>
                        <asp:BoundField DataField="发帖用户" HeaderText="发帖用户" SortExpression="发帖用户" >
                        </asp:BoundField>
                        <asp:BoundField DataField="帖子标题" HeaderText="帖子标题" SortExpression="帖子标题" >
                        </asp:BoundField>
                        <asp:BoundField DataField="帖子内容" HeaderText="帖子内容" SortExpression="帖子内容" >
                        </asp:BoundField>
                        <asp:BoundField DataField="赞数" HeaderText="赞数" SortExpression="赞数" >
                        </asp:BoundField>
                        <asp:BoundField DataField="踩数" HeaderText="踩数" SortExpression="踩数" >
                        </asp:BoundField>
                        <asp:BoundField DataField="浏览次数" HeaderText="浏览次数" SortExpression="浏览次数" >
                        </asp:BoundField>
                        <asp:BoundField DataField="创建时间" HeaderText="创建时间" SortExpression="创建时间" >
                        </asp:BoundField>
                        <asp:BoundField DataField="更新时间" HeaderText="更新时间" SortExpression="更新时间" >
                        </asp:BoundField>
                        <asp:BoundField DataField="话题" HeaderText="话题" SortExpression="话题" >
                        </asp:BoundField>
                        <asp:BoundField DataField="帖子状态" HeaderText="帖子状态" SortExpression="帖子状态" >
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Height="75px" Width="200px" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                </asp:GridView>
        </asp:Panel>
            <asp:Panel ID="checkUS" runat="server" Visible="False">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="用户ID" DataSourceID="SqlDataSource2" EnableModelValidation="True" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Height="250px" Width="100%" OnRowCommand="GridView2_RowCommand1">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="用户ID" HeaderText="用户ID" InsertVisible="False" ReadOnly="True" SortExpression="用户ID" >
                        </asp:BoundField>
                        <asp:BoundField DataField="用户名" HeaderText="用户名" SortExpression="用户名" >
                        </asp:BoundField>
                        <asp:BoundField DataField="密码" HeaderText="密码" SortExpression="密码" >
                        </asp:BoundField>
                        <asp:BoundField DataField="性别" HeaderText="性别" SortExpression="性别" >
                        </asp:BoundField>
                        <asp:BoundField DataField="年龄" HeaderText="年龄" SortExpression="年龄" >
                        </asp:BoundField>
                        <asp:BoundField DataField="简介" HeaderText="简介" SortExpression="简介" >
                        </asp:BoundField>
                        <asp:BoundField DataField="手机号" HeaderText="手机号" SortExpression="手机号" >
                        </asp:BoundField>
                        <asp:BoundField DataField="邮箱" HeaderText="邮箱" SortExpression="邮箱" >
                        </asp:BoundField>
                        <asp:BoundField DataField="用户状态" HeaderText="用户状态" SortExpression="用户状态">
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                </asp:GridView>
        </asp:Panel>
            <asp:Panel ID="LOOK" runat="server" Height="100%" Width="100%">
               
            </asp:Panel>
        </div>
    </form>
</body>
</html>
