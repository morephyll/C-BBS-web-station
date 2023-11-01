<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CHK.aspx.cs" Inherits="WebApplication4.CHK" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .page {
            display: inline-block;
            border: 1px solid;
            font-size: 20px;
            width: 30px;
            height: 30px;
            background-color: #1faeff;
            text-align: center;
        }
        .container-fluid{
            padding-left:150px;
        }
        a, a:hover {
            text-decoration: none;
            color: #333;
        }

        .tbl {
            background: #e5edf2 none repeat scroll 0 0;
            border-right: 1px solid #c2d5e3;
            overflow: hidden;
            width: 160px;
        }

        .tbr {
            hyphens: auto;
            word-break: break-all;
        }

        .list-paddingleft-2 {
            padding-left: 36px;
        }
        .td{
            text-align:center;
            margin:0 auto;
        }
         .auto-style1 {
             background: #e5edf2 none repeat scroll 0 0;
             border-right: 1px solid #c2d5e3;
             overflow: hidden;
             width: 160px;
             height: 573px;
         }
         .auto-style2 {
             hyphens: auto;
             word-break: break-all;
             height: 573px;
         }
         .aa{
             float:right;
         }
         .bb{
            float:right;
            font-size:10px;
         }
         .cc:hover{
             color:red;
             text-decoration:underline;
         }
        .auto-style4 {
            height: 22px;
        }
    </style>
</head>
<body onload="decodeMessage()">
    <form id="form1" runat="server">
       <div class="container-fluid">
        <table class="table table-bordered">
            <tr>
                <td class="auto-style1">
                    <div style="text-align: center;margin:0;">
                        <p>楼主</p><asp:Image ID="Image1" runat="server" Height="100px" Width="100px" />
                    </div>
                    <table class="table" style="background-color:#e5edf2;">
                        <tr><td class="auto-style4">昵称:</td><td style="text-align: center" class="auto-style4">
                            <asp:Label ID="UserName" runat="server" Text="UserName"></asp:Label>
                            </td></tr>
                        <tr><td class="a">性别:</td><td style="text-align: center">
                            <asp:Label ID="Sex" runat="server" Text="Sex"></asp:Label>
                            </td></tr>
                        <tr><td class="a">年龄:</td><td style="text-align: center">
                            <asp:Label ID="Age" runat="server" Text="Age"></asp:Label>
                            </td></tr>
                        <tr><td class="a">发帖数:</td><td style="text-align: center">
                            <asp:Label ID="FTS" runat="server" Text="FTS"></asp:Label>
                            </td></tr>
                        <tr><td class="a">回帖数:</td><td style="text-align: center">
                            <asp:Label ID="HTS" runat="server" Text="HTS"></asp:Label>
                            </td></tr>
                    </table>
                </td>
                <td class="auto-style2">
                    <div style="height: 65px;padding-left: 20px;padding-top: 1px;">
                        <h3><small><a style="color: #ifaeff">[<asp:Label ID="BK" runat="server" Text="板块"></asp:Label>
                            &nbsp;</a></small><a style="color: #ifaeff"><asp:Label ID="Tittle" runat="server" Text="帖子标题"></asp:Label></a>&nbsp;
                            <asp:Label ID="Label1" runat="server" Text="浏览次数" CssClass="bb"></asp:Label>
                        </h3>
                    </div>
                    <div style="width:98%;height:1px;margin-bottom:10px;padding:0px;background-color:#D5D5D5;overflow:hidden;"></div>
                    <p class="text-right" style="padding-right: 90px;">
                        <span style="padding-right: 30px;">
                            <a style="color: #78BA00;">发表于:<asp:Label ID="FTime" runat="server" Text="时间"></asp:Label></a>|
                            <a style="color: #78BA00;">只看作者</a>|
                            <a style="color: #78BA00;">倒序查看</a>|
                            <a style="color: #78BA00;">共 <asp:Label ID="NUM1" runat="server" Text="NUM"></asp:Label> 层</a>
                        </span>
                        <span><input type="text" style="width: 32px;" id="floortext"> <a href="javascript:void(0)" style="color: #78BA00;" onclick="Onfloortext()"><span class="glyphicon glyphicon-screenshot" aria-hidden="true"></span>快速跳楼</a>&nbsp;&nbsp; <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="10pt" CssClass="cc" OnClick="LinkButton2_Click">&lt;-返回</asp:LinkButton></span>
                    </p>
                    <div style="width:98%;height:1px;margin-bottom:10px;padding:0px;background-color:#D5D5D5;overflow:hidden;"></div>
                    <div style="padding-top: 12px;min-height: 380px;">
                        <asp:Label ID="NR" runat="server" Text="内容"></asp:Label>
                    </div>
                    <div style="width:98%;height:1px;margin-bottom:10px;padding:0px;background-color:#D5D5D5;overflow:hidden;"></div>
                    <div style="padding-right: 90px;">
                        <p class="text-right" style="color: black;">
                            <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#F4B300" CssClass="aa">举报</asp:LinkButton>
                            <asp:LinkButton ID="lbtnZ" runat="server" OnClick="lbtnZ_Click">赞</asp:LinkButton>
                            <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" />
                            <asp:Label ID="tzZ" runat="server" Text="0"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:LinkButton ID="lbtnC" runat="server" OnClick="lbtnC_Click">踩</asp:LinkButton>
                            <asp:ImageButton ID="ImageButton2" runat="server" OnClick="ImageButton2_Click" />
                            <asp:Label ID="tzC" runat="server" Text="0"></asp:Label>
                        </p>
                    </div>
                </td>
            </tr>
         </table>
      </div>
    </form>
    <div>
        <label id="Content_div">ngnn</label>
    </div>
</body>
<script type="text/javascript">
        function decodeMessage() {
            var tmp = "";
            for (i = 0; i <4; i++) {
                tmp +=
                    "<div class='container-fluid'>" +
                    "<table class='table table-bordered'>" +
                    "<tr>" +
                    "<td class='auto-style1'>" +
                    "<div style='text-align: center;margin:0;'>" +
                    "<p>" + "楼主" + "</p>" +
                    "</div>" +
                    "<table class='table' style='background-color:#e5edf2;'>" +
                    "<tr>" + "<td class='a'>" + "昵称:" + "</td>" + "<td style='text-align: center'>" +
                    "XXX" +
                    "</td>" + "</tr>" +
                    "<tr>" + "<td class='a'>" + "性别:" + "</td>" + "<td style='text-align: center'>" +
                    "XXX " +
                    "</td>" + "</tr>" +
                    "<tr>" + "<td class='a'>" + "年龄:" + "</td>" + "<td style='text-align: center'>" +
                    "XXX" +
                    "</td>" + "</tr>" +
                    "<tr>" + "<td class='a''>" + "发帖数:" + "</td>" + "<td style='text-align: center'>" +
                    "XXX" +
                    "</td>" + "</tr>" +
                    "<tr>" + "<td class='a''>" + "回帖数:" + "</td>" + "<td style='text-align: center'>" +
                    "XXX" +
                    "</td>" + "</tr>" +
                    "</table>" +
                    "</td>" +
                    "<td class='auto-style2'>" +
                    "<div style='height: 65px;padding-left: 20px;padding-top: 1px;'>" +
                    "<h3>" + "<small>" + "<a style='color: #ifaeff'>" + "XXX" +
                    "&nbsp;" + "</a>" + "</small>" + "<a style='color: #ifaeff'>" + "XXX" + "</a>" + "&nbsp;" +
                    "XXX" +
                    "</h3>" +
                    "</div>" +
                    "<div style='width:98%;height:1px;margin-bottom:10px;padding:0px;background-color:#D5D5D5;overflow:hidden;'>" + "</div>" +
                    "<p class='text-right' style='padding-right: 90px;'>" +
                    "<span style='padding-right: 30px;'>" +
                    "<a style='color: #78BA00;'>" + "发表于:" + "XXX" + "</a>" + "|" +
                    "<a style='color: #78BA00;'>" + "只看作者" + "</a>" + "|" +
                    "<a style='color: #78BA00;'>" + "倒序查看" + "</a>" + "|" +
                    "<a style='color: #78BA00;'>" + "共 " + "XXX" + "层" + "</a>" +
                    "</span>" +
                    "<span>" + "<input type='text' style='width: 32px;' id='floortext'>" + "<a href='javascript:void(0)' style='color: #78BA00;'>" + "<span class='glyphicon glyphicon-screenshot' aria-hidden='true'>" + "</span>" + "快速跳楼" + "</a>" + "&nbsp;&nbsp; " + "XXX" + "</span>" +
                    "</p>" +
                    "<div style='width:98%;height:1px;margin-bottom:10px;padding:0px;background-color:#D5D5D5;overflow:hidden;'>" + "</div>" +
                    "<div style='padding-top: 12px;min-height: 380px;'>" +
                    "XXX" +
                    "</div>" +
                    "<div style='width:98%;height:1px;margin-bottom:10px;padding:0px;background-color:#D5D5D5;overflow:hidden;'>" + "</div>" +
                    "<div style='padding-right: 90px;'>" +
                    "<p class='text-right' style='color: black;'>" +
                    "XXX" +
                    "XXX" +
                    "XXX" +
                    "XXX" +
                    "XXX" +
                    "XXX" +
                    "XXX" +
                    "</p>" +
                    "</div>" +
                    "</td>" +
                    "</tr>" +
                    "</table>" +
                    "</div>";

            }
            document.getElementById("Content_div").innerHTML = tmp;
    }
<%--    alert(<%=sumHF%>);--%>

</script>
</html>
