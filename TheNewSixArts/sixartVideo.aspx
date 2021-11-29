<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="sixartVideo.aspx.cs" Inherits="sixartVideo_li" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="https://vjs.zencdn.net/7.11.4/video.min.js"></script>
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
                <div>

                    <p id="videotitle" style="font-size: 20px">
                        <script> document.getElementById('videotitle').innerHTML = "<%=getTitle()%>";</script>
                    </p>
                    <video class="col-2-3" id="my-video" controls preload="auto" width="600" height="350">
                        <source id="video1" src="?" type='video/mp4'><script> document.getElementById('video1').src = "<%=getUrl()%>";</script></video>
                </div>
                <div>
                    <table>
                        <thead>
                            <tr>
                                <th>视频列表</th>
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
                                <td>
                                    <input type="submit" value="<%=dr["vTitle"] %>" class="btn btn-default" onclick="setOpear(<%=dr["vId"]%>,2)" />
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
            </div>
        </div>

        <input type="hidden" id="opearID" name="opearID" value="" />
        <input type="hidden" id="opearState" name="opearState" value="" />
    </section>
    <script type="text/javascript">
        function setOpear(setID, setStateValue) {
            $("#opearID").val(setID);
            $("#opearState").val(setStateValue);
        }
    </script>
</asp:Content>

