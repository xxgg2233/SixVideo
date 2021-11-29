<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Delete_customer.aspx.cs" Inherits="BackG_Delete_customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>会员添加删除页</title>
    <script type="text/javascript" src="../Scripts/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/DataList.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

        .auto-style1{
            width:100%;
        }

        .auto-style2 {
            width:100px;
        }

         .auto-style3 {
            width: 250px
        }

    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div class="container">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>登录名</th>
                        <th>登录密码</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (drs != null)
                        {
                            foreach (System.Data.DataRow dr in drs)
                            {
                    %>
                    <tr>
                        <td ><%=dr["cId"] %></td>
                        <td><%=dr["cName"] %></td>
                        <td><%=dr["Sex"] %></td>
                        <td><%=dr["loginName"] %></td>
                        <td><%=dr["loginPwd"] %></td>
                        <td>
                            <input type="submit" value="删除信息" class="btn btn-default" onclick="setOpear(<%=dr["cId"]%>,2)" />
                        </td>
                    </tr>
                    <% 
                            }
                        }
                    %>
                </tbody>
                <tfoot>
                    <tr>
                        <td></td>
                        <td>
                            <input id="cname" type="text" class="auto-style1" runat="server"/></td>
                        <td>
                            <input id="sex" type="text" class="auto-style1" runat="server"/></td>
                        <td>
                            <input id="loginname" type="text" class="auto-style1" runat="server"/></td>
                        <td>
                            <input id="loginpwd" type="text" class="auto-style1" runat="server"/></td>
                        <td><input  type="submit" value="添加" class="btn btn-default" onclick="setOpear(2)"/></td>
                    </tr>
                    <tr>
                        <td colspan="6">共<asp:Label ID="TotalPageIndex" runat="server" Text="1"></asp:Label>页&nbsp;
                            当前第<asp:Label ID="CurPageIndex" runat="server" Text="1"></asp:Label>页&nbsp;
                            <asp:LinkButton ID="UpPage" runat="server" OnClick="UpPage_Click">上一页</asp:LinkButton>
                            <asp:LinkButton ID="DownPage" runat="server" OnClick="DownPage_Click">下一页</asp:LinkButton>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
        <script type="text/javascript">
            function setOpear(setID, setStateValue) {
                $("#opearID").val(setID);
                $("#opearState").val(setStateValue);
            }
        </script>

        <input type="hidden" id="opearID" name="opearID" value="" />
        <input type="hidden" id="opearState" name="opearState" value="" />
    </form>
</body>
</html>
