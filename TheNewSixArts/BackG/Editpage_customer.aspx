<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Editpage_customer.aspx.cs" Inherits="BackG_Editpage_customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>会员编辑页</title>
    <script type="text/javascript" src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/DataList.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: auto;
        }

        .auto-style2 {
            width: auto;
        }

        .auto-style3 {
            width: 250px;
        }

        .auto-style4 {
            width: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                        <th><%=dr["cId"] %></th>
                        <td><%=dr["cName"] %></td>
                        <td><%=dr["Sex"] %></td>
                        <td><%=dr["loginName"] %></td>
                        <td><%=dr["loginPwd"] %></td>
                        <td>
                            <input id="updataZhi0" hidden="hidden" runat="server" />
                            <input id="updataZhi1" hidden="hidden" runat="server" />
                            <input id="updataZhi2" hidden="hidden" runat="server" />
                            <input id="updataZhi3" hidden="hidden" runat="server" />
                            <input type="submit" id="wangcheng" hidden="hidden" />
                            <input type="button" id="bianji" class="btn btn-default" value="编辑" onclick="setOpear(<%=dr["cId"]%>,2)" />
                        </td>
                    </tr>
                    <% 
                            }
                        }
                    %>
                </tbody>
                <tfoot>
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
        <script>
            (function () {
                $('input[type="button"]').on('click', function () {
                    var $this = $(this),
                        edit_status = $this.attr('edit_status'),
                        status_value = edit_status && 1 == edit_status ? 0 : 1,
                        $td_arr = $this.parent().prevAll('td');
                    $this.val(1 == status_value ? '完成' : '编辑').attr('edit_status', status_value);
                    $.each($td_arr, function (i, mycars) {
                        var $td = $(this);
                        if (1 == status_value) {
                            $td.html('<input type="text" value="' + $td.html() + '">');
                        } else if (0 == status_value) {
                            var td = $td.find('input[type=text]').val();
                            if (td != null) {
                                mycars[i] = td;
                                document.getElementById("updataZhi" + i).value = mycars[i];
                                i++;
                            }
                            document.getElementById("wangcheng").click();
                        }
                    });
                });
            })();
        </script>
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
