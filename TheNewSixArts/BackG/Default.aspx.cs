using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackG_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminname"] == null)
        {
            WebMessageBox.Show("请用管理员账号登录!", "../Login.aspx");
        }
        else
        {
            Label1.Text = Session["adminname"].ToString();
        }

    }


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //返回首页
        Response.Redirect("../Default.aspx");
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        //退出登录
        Session["adminname"] = null;
        WebMessageBox.Show("已退出登录!", "../Login.aspx");
    }
}