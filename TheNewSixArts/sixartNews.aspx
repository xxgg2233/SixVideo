<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="sixartNews.aspx.cs" Inherits="Li" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section id="content">
        <div class="zerogrid">
            <div class="row">
                <div class="col-sm-2 col-md-2">
                    <nav class="col-sm-12 col-md-12">
                        <ul>
                            <li><a href="../sixartNews.aspx?tp=self">&emsp;新闻</a></li>
                        </ul>
                    </nav>
                    <nav class="col-sm-12 col-md-12">
                        <ul>
                            <li><a href="../sixartVideo.aspx?tp=self">&emsp;视频</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="row">
                    <div class="main-content">
                        <asp:DataList ID="dlFree" runat="server">
                            <ItemTemplate>
                                <table class="custom-content-recommend">
                                    <tr>
                                        <td>
                                            <p>
                                                <span class="hongcu">『<%#DataBinder.Eval(Container.DataItem,"nType") %>』</span>
                                                <span class="chengse"><%#DataBinder.Eval(Container.DataItem,"nTitle") %></span>
                                            </p>
                                            <p>
                                                <span class="huise1"><%#DataBinder.Eval(Container.DataItem,"nTime") %></span>
                                            </p>
                                            <p>
                                                <span class="shenlan"><%#DataBinder.Eval(Container.DataItem,"nMessage") %></span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img alt="" class="auto-style2" src="../images/longline.gif" />
                                        </td>
                                    </tr>
                                    <tr style="color: #000000">
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>
            </div>
            <div class="row">
                <div style="text-align: center">
                    当前页码为［<asp:Label ID="lblCurrentPage" runat="server" Text="1"></asp:Label>］页
                    总页码［<asp:Label ID="lblSumPage" runat="server" Text="0"></asp:Label>］页
                    <asp:LinkButton ID="lnkBtnFirst" runat="server" OnClick="lnkBtnFirst_Click">第一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkBtnPrevious" runat="server" OnClick="lnkBtnPrevious_Click">上一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkBtnNext" runat="server" OnClick="lnkBtnNext_Click">下一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkBtnLast" runat="server" OnClick="lnkBtnLast_Click">末一页</asp:LinkButton>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

