<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="css/style.css">
    <section class="featured">
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6 custom-login-middle">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-2">用户名：</div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtUser" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="* 必填项"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-2">密&nbsp; 码：</div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtPwd" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd" ErrorMessage="* 必填项"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-2">验证码：</div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtCheckCode" class="form-control" Width="150" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/CheckCode.aspx" />
                            </div>
                        </div>
                    </div>
                    <div>
                        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="a" Checked="true" />会员
                        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="a" />管理员
                    </div>
                    <div class="text-center">
                        <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" AlternateText="登录" ImageUrl="~/images/denglu.gif" />
                        &nbsp;&nbsp;
                        <asp:ImageButton ID="ImageButton2" runat="server" AlternateText="重置" ImageUrl="~/images/chongzhi.gif" />
                        &nbsp;&nbsp;&nbsp;         
                        <asp:HyperLink ID="HyperLink1" runat="server" class="btn-link" NavigateUrl="~/Default.aspx">[返回首页]</asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

