using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sixartVideo_li : System.Web.UI.Page
{
    string infoType = "";
    Operation operation = new Operation(); //业务类对象
    protected DataRowCollection drs = null;////绑定页面数据的全局变量

    int id = 0;
    string a;//获取路径
    string vname;//获取标题
    string vtitle = "默认播放，请选择列表";
    string videoUrl = "video/六艺1.mp4";//默认路径
    protected void Page_Load(object sender, EventArgs e)
    {
        //验证用户是否登录
        if (Session["username"] == null && Session["adminname"] == null)
        {
            WebMessageBox.Show("查看内容请先登录!", "../Login.aspx");
        }

        //查看是否原标题下跳转
        if (Request["tp"].ToString() == "self")
            infoType = Session["infot"].ToString();
        else
        {
            infoType = Request["tp"].ToString();
            Session.Add("infot", infoType);
        }

        string opearID = null, opearState = null;
        //验证成功表示用户点击了页面上的操作按钮
        if ((opearID = Request.Form["opearID"]) != null && opearID != "")
        {
            opearState = Request.Form["opearState"];
            if (opearState == "2")//验证成功表示用户点击了播放列表
            {
                id = int.Parse(opearID);
                a = (string)operation.SelectVideoPath(id).Tables[0].Rows[0]["videoPath"];
                vname = (string)operation.SelectVideoPath(id).Tables[0].Rows[0]["vTitle"];
                getUrl();
            }
            if (infoType != null && infoType != "")
            {
                DataBind(infoType, 1);//重新绑定页面数据
            }
        }
        if (!IsPostBack)
        {
            if (infoType != null && infoType != "")
            {
                DataBind(infoType, 1);//页面第一次加载绑定页面数据
            }
        }
    }

    /// <summary>
    /// 绑定视频信息到GridViev控件
    /// </summary>
    /// <param name="type">视频信息类别</param>
    private void DataBind(string type, int PageIndex)
    {
        int PageSize = 5;//定义每页数据总数
        //查询数据
        DataSet ds = operation.SelectVideo(type, PageIndex, PageSize);
        if (ds != null && ds.Tables.Count > 0)
        {
            int Count = 0;
            int.TryParse(ds.Tables[0].Rows[0][0].ToString(), out Count);//获取总数据条数
            drs = ds.Tables[1].Rows;
            //计算分页数据
            int GetTotalPageIndex = (Count / PageSize) + ((Count % PageSize) > 0 ? 1 : 0);
            this.TotalPageIndex.Text = GetTotalPageIndex.ToString();
            this.CurPageIndex.Text = PageIndex.ToString();
            if (PageIndex == 1 && PageIndex == GetTotalPageIndex || GetTotalPageIndex == 0)
            {
                SetPageState(0);//如果当前总页数共为1页时调用的样式
            }
            else if (PageIndex == 1)
            {
                SetPageState(1);//如果当前为第一页时调用的样式
            }
            else if (PageIndex == GetTotalPageIndex)
            {
                SetPageState(2);//如果当前为最后一页时调用的样式
            }
            else
            {
                SetPageState(3);//如果当前为除第一页和最后一页外的其他页数时调用的样式
            }
        }
    }

    //获取播放路径
    public string getUrl()
    {
        if (a != null)
            videoUrl = a;
        return videoUrl;
    }

    //获取播放标题
    public string getTitle()
    {
        if (vname != null)
            vtitle = vname;
        return vtitle;
    }

    /// <summary>
    /// 上一页处理方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void UpPage_Click(object sender, EventArgs e)
    {
        //取出当前页码
        int CurIndex = Convert.ToInt32(this.CurPageIndex.Text);
        CurIndex--;//将当前页码减1
        DataBind(infoType, CurIndex);//绑定数据
    }
    /// <summary>
    /// 下一页处理方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void DownPage_Click(object sender, EventArgs e)
    {
        //取出当前页码
        int CurIndex = Convert.ToInt32(this.CurPageIndex.Text);
        CurIndex++;//将当前页码加1
        DataBind(infoType, CurIndex);//绑定数据
    }
    /// <summary>
    /// 设置分页样式
    /// </summary>
    /// <param name="SetIndex"></param>
    public void SetPageState(int SetIndex)
    {
        //根据不同的页码设置不同的样式
        if (SetIndex == 0)
        {
            this.UpPage.Enabled = false;
            this.DownPage.Enabled = false;
            this.UpPage.Style["color"] = "#808080";
            this.DownPage.Style["color"] = "#808080";
        }
        else if (SetIndex == 1)
        {
            this.UpPage.Enabled = false;
            this.DownPage.Enabled = true;
            this.UpPage.Style["color"] = "#808080";
            this.DownPage.Style["color"] = "#23527c";
        }
        else if (SetIndex == 2)
        {
            this.UpPage.Enabled = true;
            this.DownPage.Enabled = false;
            this.UpPage.Style["color"] = "#23527c";
            this.DownPage.Style["color"] = "#808080";
        }
        else
        {
            this.UpPage.Enabled = true;
            this.DownPage.Enabled = true;
            this.UpPage.Style["color"] = "#23527c";
            this.DownPage.Style["color"] = "#23527c";
        }
    }
}