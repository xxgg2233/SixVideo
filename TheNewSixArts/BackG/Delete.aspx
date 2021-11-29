<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="BackG_Delete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新闻添加删除页</title>
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
                        <th>标题</th>
                        <th class="auto-style1">内容</th>
                        <th>发布时间</th>
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
                        <td ><%=dr["nId"] %></td>
                        <td><%=dr["nTitle"] %></td>
                        <td class="auto-style3"><%=dr["nMessage"] %></td>
                        <td><%=dr["nTime"] %></td>
                        <td>
                            <input type="submit" value="删除信息" class="btn btn-default" onclick="setOpear(<%=dr["nId"]%>,2)" />
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
                            <input id="title" type="text" class="auto-style2" runat="server"/></td>
                        <td>
                            <input id="nmessage" type="text" class="auto-style1" runat="server"/></td>
                        <td>
                            <input id="time" type="date" class="auto-style1" runat="server"/></td>
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
