<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="BackG_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>“新六艺”视频教学网「后台管理」</title>
    <script type="text/javascript" src="../Scripts/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/BackGround-Default.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #iframe1 {
            height: 600px;
            width: 690px;
        }

        .auto-style1 {
            width: 793px;
            height: 413px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-right custom-header">
                    <!-- 添加"退出登录"、"网站首页按钮" -->
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/admin_shouye.png" OnClick="ImageButton1_Click" Height="24px" Width="65px" />
                    &emsp;
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/admin_exit.png" OnClick="ImageButton2_Click" Height="24px" Width="65px" />
                </div>
            </div>
            <div class="row">
                <div class="col-xs-3 col-sm-3 col-md-3 custom-menu">
                    <div class="custom-menu-title"></div>
                    <div class="custom-menu-content">
                        <!-- 添加TreeView控件 -->
                        <asp:TreeView ID="TreeView1" runat="server">
                            <Nodes>
                                <asp:TreeNode Text="礼" Value="礼">
                                    <asp:TreeNode Text="新闻管理" Value="新闻管理">
                                        <asp:TreeNode NavigateUrl="~/BackG/Delete.aspx?tp=礼" Target="mainFrame" Text="删除/添加" Value="删除/添加"></asp:TreeNode>
                                        <asp:TreeNode Text="编辑" Value="编辑" NavigateUrl="~/BackG/Editpage.aspx?tp=礼" Target="mainFrame"></asp:TreeNode>
                                    </asp:TreeNode>
                                    <asp:TreeNode Target="mainFrame" Text="视频管理" Value="视频管理">
                                        <asp:TreeNode NavigateUrl="~/BackG/Delete_video.aspx?tp=礼" Target="mainFrame" Text="删除/添加" Value="删除/添加"></asp:TreeNode>
                                        <asp:TreeNode NavigateUrl="~/BackG/Editpage_video.aspx?tp=礼" Target="mainFrame" Text="编辑" Value="编辑"></asp:TreeNode>
                                    </asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="乐" Value="乐">
                                    <asp:TreeNode Text="新闻管理" Value="新闻管理">
                                        <asp:TreeNode NavigateUrl="~/BackG/Delete.aspx?tp=乐" Target="mainFrame" Text="删除/添加" Value="删除/添加"></asp:TreeNode>
                                        <asp:TreeNode Text="编辑" Value="编辑" NavigateUrl="~/BackG/Editpage.aspx?tp=乐" Target="mainFrame"></asp:TreeNode>
                                    </asp:TreeNode>
                                    <asp:TreeNode Text="视频管理" Value="视频管理">
                                        <asp:TreeNode NavigateUrl="~/BackG/Delete_video.aspx?tp=乐" Target="mainFrame" Text="删除/添加" Value="删除/添加"></asp:TreeNode>
                                        <asp:TreeNode NavigateUrl="~/BackG/Editpage_video.aspx?tp=乐" Target="mainFrame" Text="编辑" Value="编辑"></asp:TreeNode>
                                    </asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="射" Value="射">
                                    <asp:TreeNode Target="mainFrame" Text="新闻管理" Value="新闻管理">
                                        <asp:TreeNode NavigateUrl="~/BackG/Delete.aspx?tp=射" Target="mainFrame" Text="删除/添加" Value="删除/添加"></asp:TreeNode>
                                        <asp:TreeNode Text="编辑" Value="编辑" NavigateUrl="~/BackG/Editpage.aspx?tp=射" Target="mainFrame"></asp:TreeNode>
                                    </asp:TreeNode>
                                    <asp:TreeNode Target="mainFrame" Text="视频管理" Value="视频管理">
                                        <asp:TreeNode NavigateUrl="~/BackG/Delete_video.aspx?tp=射" Target="mainFrame" Text="删除/添加" Value="删除/添加"></asp:TreeNode>
                                        <asp:TreeNode NavigateUrl="~/BackG/Editpage_video.aspx?tp=射" Target="mainFrame" Text="编辑" Value="编辑"></asp:TreeNode>
                                    </asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="御" Value="御">
                                    <asp:TreeNode Target="mainFrame" Text="新闻管理" Value="新闻管理">
                                        <asp:TreeNode NavigateUrl="~/BackG/Delete.aspx?tp=御" Target="mainFrame" Text="删除/添加" Value="删除/添加"></asp:TreeNode>
                                        <asp:TreeNode Text="编辑" Value="编辑" NavigateUrl="~/BackG/Editpage.aspx?tp=御" Target="mainFrame"></asp:TreeNode>
                                    </asp:TreeNode>
                                    <asp:TreeNode Target="mainFrame" Text="视频管理" Value="视频管理">
                                        <asp:TreeNode NavigateUrl="~/BackG/Delete_video.aspx?tp=御" Target="mainFrame" Text="删除/添加" Value="删除/添加"></asp:TreeNode>
                                        <asp:TreeNode NavigateUrl="~/BackG/Editpage_video.aspx?tp=御" Target="mainFrame" Text="编辑" Value="编辑"></asp:TreeNode>
                                    </asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="书" Value="书">
                                    <asp:TreeNode Text="新闻管理" Value="新闻管理">
                                        <asp:TreeNode NavigateUrl="~/BackG/Delete.aspx?tp=书" Target="mainFrame" Text="删除/添加" Value="删除/添加"></asp:TreeNode>
                                        <asp:TreeNode Text="编辑" Value="编辑" NavigateUrl="~/BackG/Editpage.aspx?tp=书" Target="mainFrame"></asp:TreeNode>
                                    </asp:TreeNode>
                                    <asp:TreeNode Text="视频管理" Value="视频管理">
                                        <asp:TreeNode NavigateUrl="~/BackG/Delete_video.aspx?tp=书" Target="mainFrame" Text="删除/添加" Value="删除/添加"></asp:TreeNode>
                                        <asp:TreeNode NavigateUrl="~/BackG/Editpage_video.aspx?tp=书" Target="mainFrame" Text="编辑" Value="编辑"></asp:TreeNode>
                                    </asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="数" Value="数">
                                    <asp:TreeNode Text="新闻管理" Value="新闻管理">
                                        <asp:TreeNode NavigateUrl="~/BackG/Delete.aspx?tp=数" Target="mainFrame" Text="删除/添加" Value="删除/添加"></asp:TreeNode>
                                        <asp:TreeNode Text="编辑" Value="编辑" NavigateUrl="~/BackG/Editpage.aspx?tp=数" Target="mainFrame"></asp:TreeNode>
                                    </asp:TreeNode>
                                    <asp:TreeNode Text="视频管理" Value="视频管理" Target="mainFrame">
                                        <asp:TreeNode NavigateUrl="~/BackG/Delete_video.aspx?tp=数" Target="mainFrame" Text="删除/添加" Value="删除/添加"></asp:TreeNode>
                                        <asp:TreeNode NavigateUrl="~/BackG/Editpage_video.aspx?tp=数" Target="mainFrame" Text="编辑" Value="编辑"></asp:TreeNode>
                                    </asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="会员管理" Value="会员管理">
                                    <asp:TreeNode NavigateUrl="~/BackG/Delete_customer.aspx" Target="mainFrame" Text="添加/删除" Value="添加/删除"></asp:TreeNode>
                                    <asp:TreeNode NavigateUrl="~/BackG/Editpage_customer.aspx" Target="mainFrame" Text="编辑" Value="编辑"></asp:TreeNode>
                                </asp:TreeNode>
                            </Nodes>
                        </asp:TreeView>
                    </div>
                </div>
                <div class="col-xs-9 col-sm-9 col-md-9 custom-list">
                    <div class="custom-list-title">欢迎[<asp:Label ID="Label1" runat="server" ForeColor="#3399FF"></asp:Label>]登录，您现在的位置："新六艺"视频教学网站 &gt; <span class="hong">后台管理系统</span> <span id="curNode" runat="server"></span></div>
                    <!-- 添加iframe框架 -->
                    <iframe name="mainFrame" id="iframe1" frameborder="0" class="auto-style1"></iframe>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
