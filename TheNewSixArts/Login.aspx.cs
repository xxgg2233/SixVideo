using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    Operation operation = new Operation();　//声明业务类
    Random random = new Random();　　　　　//声明随机类对象
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (RadioButton1.Checked)//验证会员登录
        {
            string check = Convert.ToString(Request.Cookies["CheckCode"].Values);
            if (check != txtCheckCode.Text.Trim().ToUpper())    //判断验证码
            {
                WebMessageBox.Show("输入验证码不正确！", "Login.aspx");
            }
            if (operation.LogonCustomer(txtUser.Text.Trim(), txtPwd.Text.Trim()).Tables[0].Rows.Count > 0)  //判断用户是否合法。
            {
                Session.Add("username", txtUser.Text.Trim());                                       //将用户名称存储在Session中,用于判断非法用户进行后台。
                WebMessageBox.Show("欢迎会员登录，现在可以查看相关新六艺内容!", "../Default.aspx");  //用户名称或密码正确，进入后台首页
            }
            else
            {
                WebMessageBox.Show("用户名称或密码不正确！", "Login.aspx");
            }
        }
        else if (RadioButton2.Checked)//验证管理员登录
        {
            string check = Convert.ToString(Request.Cookies["CheckCode"].Values);
            if (check != txtCheckCode.Text.Trim().ToUpper())    //判断验证码
            {
                WebMessageBox.Show("输入验证码不正确！", "Login.aspx");
            }
            if (operation.LogonAdmin(txtUser.Text.Trim(), txtPwd.Text.Trim()).Tables[0].Rows.Count > 0)  //判断用户是否合法。
            {
                Session.Add("adminname", txtUser.Text.Trim());                                       //将用户名称存储在Session中,用于判断非法用户进行后台。
                WebMessageBox.Show("欢迎管理员登录，现在可以管理全部内容!", "BackG/Default.aspx");  //用户名称或密码正确，进入后台首页
            }
            else
            {
                WebMessageBox.Show("用户名称或密码不正确！", "Login.aspx");
            }
        }

    }
}