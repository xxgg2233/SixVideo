using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Li : System.Web.UI.Page
{
    Operation op = new Operation();
    static string infoType = "";
    static string infoKey = "";
    static PagedDataSource pds = new PagedDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null && Session["adminname"] == null)
        {
            WebMessageBox.Show("查看内容请先登录!", "../Login.aspx");
        }

        if (!IsPostBack)
        {//判断是否跳会本页
            if (Request["tp"].ToString() == "self")
                infoType = Session["infot"].ToString();
            else
            {
                infoType = Request["tp"].ToString();
                Session.Add("infot", infoType);
            }
            infoKey = Convert.ToString(Session["key"]);
            this.DataListBind();
        }
    }
    public void DataListBind()//绑定数据
    {
        pds = op.PageDataListBind(infoType, infoKey, Convert.ToInt32(lblCurrentPage.Text), 4);
        lblSumPage.Text = pds.PageCount.ToString();
        dlFree.DataSource = pds;
        dlFree.DataKeyField = "nId";
        dlFree.DataBind();
        lnkBtnFirst.Enabled = true;
        lnkBtnLast.Enabled = true;
        lnkBtnNext.Enabled = true;
        lnkBtnPrevious.Enabled = true;
        if (lblCurrentPage.Text == "1")
        {
            lnkBtnFirst.Enabled = false;
            lnkBtnPrevious.Enabled = false;
        }
        if (lblCurrentPage.Text == pds.PageCount.ToString())
        {
            lnkBtnLast.Enabled = false;
            lnkBtnNext.Enabled = false;
        }
    }

    protected void lnkBtnFirst_Click(object sender, EventArgs e)//当前页
    {
        lblCurrentPage.Text = "1";
        DataListBind();
    }

    protected void lnkBtnPrevious_Click(object sender, EventArgs e)//上一页
    {
        lblCurrentPage.Text = (Convert.ToUInt32(lblCurrentPage.Text) - 1).ToString();
        DataListBind();
    }

    protected void lnkBtnNext_Click(object sender, EventArgs e)//下一页
    {
        lblCurrentPage.Text = (Convert.ToUInt32(lblCurrentPage.Text) + 1).ToString();
        DataListBind();
    }

    protected void lnkBtnLast_Click(object sender, EventArgs e)//总页
    {
        lblCurrentPage.Text = lblSumPage.Text;
        DataListBind();
    }
}