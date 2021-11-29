using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;

using System.Web.UI;


/// <summary>
/// Operation 网站业务流程类（封装所有业务方法）
/// </summary>
public class Operation
{
    public Operation()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    DataBase data = new DataBase();

    #region  添加新闻
    /// <summary>
    /// 添加新闻
    /// </summary>
    /// <param name="nType">新闻类别</param>
    /// <param name="nMessage">新闻内容</param>
    /// <param name="nTime">发布时间</param>
    /// <param name="nTitle">新闻标题</param>
    public void InsertInfo(string nType, string nTitle, string nMessage, string nTime)
    {
        data.RunProc("INSERT INTO tb_news (nType, nTitle, nMessage, nTime) VALUES ('"+nType+"','"+nTitle+"','"+nMessage+"','"+nTime+"')");
    }
    #endregion

    #region  修改新闻 
    /// <summary>
    /// 修改新闻信息
    /// </summary>
    /// <param name="nTitle">新闻标题</param>
    /// <param name="nTime">发布时间</param>
    /// <param name="nMessage">新闻内容</param>
    /// <param name="id">新闻id</param>
    public void UpdateInfo(int id, string nTitle, string nMessage, string nTime)
    {
        data.RunProc("UPDATE tb_news SET nTitle='" + nTitle + "', nMessage='" + nMessage + "', nTime='" + nTime + "' WHERE (nId = " + id + ")");
    }
    #endregion

    #region  删除新闻

    /// <summary>
    /// 删除指定的新闻
    /// </summary>
    /// <param name="id">新闻ID</param>
    public void DeleteInfo(string id)
    {
        int d = data.RunProc("Delete from tb_news where nId='" + id + "'");
    }

    #endregion

    #region  查询新闻

    /// <summary>
    /// 按类型进行分页查询新闻信息
    /// </summary>
    /// <param name="type">新闻信息类型</param>
    /// <returns>返回查询结果DataSet数据集</returns>
    public DataSet SelectInfo(string type, int PageIndex, int PageSize)
    {
        int StartIndex = ((PageIndex - 1) * PageSize) + 1;
        int EndIndex = PageIndex * PageSize;
        SqlParameter[] parms = { data.MakeInParam("@nType", SqlDbType.VarChar, 50, type) };
        return data.RunProcReturn("select count(1) from tb_news where nType=@nType;select * from(SELECT nId, nType, nTitle, nMessage, nTime,Row_Number() over(ORDER BY nTime DESC) as rowIndex FROM tb_news where nType=@nType) as Tab where rowIndex between " + StartIndex + " and " + EndIndex, parms, "tb_news");
    }

    /// <summary>
    /// 新闻快速检索
    /// </summary>
    /// <param name="infoSearch">搜索关键字</param>
    /// <param name="type">新闻类型</param>
    /// <returns>返回查询结果DataSet数据集</returns>
    public DataSet SelectInfo(string type, string infoSearch)
    {
        SqlParameter[] pars ={
            data.MakeInParam("@nType", SqlDbType.VarChar, 50, type) ,
            data.MakeInParam("@nMessage",SqlDbType.VarChar,500,"%"+infoSearch+"%")
        };
        return data.RunProcReturn("select * from tb_news where (nType=@nType) and (nMessage like @nMessage) ", pars, "tb_news");
    }
    #endregion

    #region  添加视频
    /// <summary>
    /// 添加视频
    /// </summary>
    /// <param name="typeNumber">视频编码</param>
    /// <param name="videoPath">视频路径</param>
    /// <param name="vTitle">视频标题</param>
    /// <param name="vType">视频类型</param>
    public void InsertVideo(string vType,string typeNumber, string vTitle, string videoPath)
    {
        data.RunProc("INSERT INTO tb_video (vType,vNumber, typeNumber, vTitle, videoPath) VALUES ('" + vType + "',1,'" + typeNumber + "','" + vTitle + "','" + videoPath + "')");
    }
    #endregion

    #region  修改视频 
    /// <summary>
    /// 修改视频信息
    /// </summary>
    /// <param name="vTitle">视频标题</param>
    /// <param name="videoPath">视频路径</param>
    /// <param name="typeNumber">视频类型编码</param>
    /// <param name="id">视频id</param>
    public void UpdateVideo(int id,string typeNumber, string vTitle, string videoPath)
    {
        data.RunProc("UPDATE tb_video SET typeNumber='" + typeNumber + "', vTitle='" + vTitle + "', videoPath='" + videoPath + "' WHERE (vId = " + id + ")");
    }
    #endregion

    #region  删除视频

    /// <summary>
    /// 删除指定的视频
    /// </summary>
    /// <param name="id">视频ID</param>
    public void DeleteVideo(string id)
    {
        int d = data.RunProc("Delete from tb_video where vId='" + id + "'");
    }

    #endregion

    #region  查询视频

    /// <summary>
    /// 按类型进行分页查询视频信息
    /// </summary>
    /// <param name="type">视频信息类型</param>
    /// <returns>返回查询结果DataSet数据集</returns>
    public DataSet SelectVideo(string type, int PageIndex, int PageSize)
    {
        int StartIndex = ((PageIndex - 1) * PageSize) + 1;
        int EndIndex = PageIndex * PageSize;
        SqlParameter[] parms = { data.MakeInParam("@vType", SqlDbType.VarChar, 50, type) };
        return data.RunProcReturn("select count(1) from tb_video where vType=@vType;select * from(SELECT vId,vNumber,typeNumber,vType,vTitle,videoPath,Row_Number() over(ORDER BY vId ASC) as rowIndex FROM tb_video where vType=@vType) as Tab where rowIndex between " + StartIndex + " and " + EndIndex, parms, "tb_video");
    }
    /// <summary>
    /// 按ID查询视频
    /// </summary>
    /// <param name="id">视频ＩＤ</param>
    /// <returns>返回查询结果DataSet数据集</returns>
    public DataSet SelectVideo(int id)
    {
        return data.RunProcReturn("SELECT vId,vNumber,typeNumber,vType,vTitle,videoPath FROM tb_video where vId=" + id + " ORDER BY vId ASC", "tb_video");
    }

    /// <summary>
    /// 视频快速检索
    /// </summary>
    /// <param name="type">信息类型</param>
    /// <param name="infoSearch">查询信息的关键字</param>
    /// <returns>返回查询结果DataSet数据集</returns>
    public DataSet SelectVideo(string vType, string infoSearch)
    {
        SqlParameter[] pars ={
            data.MakeInParam("@vType", SqlDbType.VarChar, 50, vType) ,
            data.MakeInParam("@vTitle",SqlDbType.VarChar,500,"%"+infoSearch+"%")
        };
        return data.RunProcReturn("select * from tb_video where (vType=@vType) and (vTitle like @vTitle) ", pars, "tb_video");
    }

    /// <summary>
    /// 按ID查询视频路径
    /// </summary>
    /// <param name="id">视频ＩＤ</param>
    /// <returns>返回查询结果DataSet数据集</returns>
    public DataSet SelectVideoPath(int id)
    {
        SqlParameter[] pars ={
            data.MakeInParam("@id", SqlDbType.VarChar, 50, id),
            data.MakeInParam("@vtitle", SqlDbType.VarChar, 50, id)
        };

        return data.RunProcReturn("SELECT videoPath,vTitle FROM tb_video where vId=@id",pars,"tb_video");
    }
    #endregion

    #region  添加会员
    /// <summary>
    /// 添加会员
    /// </summary>
    /// <param name="cname">姓名</param>
    /// <param name="loginname">登录名</param>
    /// <param name="loginpwd">登录密码</param>
    /// <param name="sex">性别</param>
    public void InsertCustomer(string cname, string sex, string loginname, string loginpwd)
    {
        data.RunProc("INSERT INTO tb_customer (cName, Sex, loginName, loginPwd) VALUES ('" + cname + "','" + sex + "','" + loginname + "','" + loginpwd + "')");
    }
    #endregion

    #region  修改会员 
    /// <summary>
    /// 修改会员
    /// </summary>
    /// <param name="sex">性别</param>
    /// <param name="loginpwd">登录密码</param>
    /// <param name="loginname">登录名</param>
    /// <param name="cname">姓名</param>
    /// <param name="id">会员id</param>
    public void UpdateCustomer(int id, string cname, string sex, string loginname, string loginpwd)
    {
        data.RunProc("UPDATE tb_customer SET cName='" + cname + "', Sex='" + sex + "', loginName='" + loginname + "', loginPwd='" + loginpwd + "' WHERE (cId = " + id + ")");
    }
    #endregion

    #region  删除会员

    /// <summary>
    /// 删除指定的会员
    /// </summary>
    /// <param name="id">会员ID</param>
    public void DeleteCustomer(string id)
    {
        int d = data.RunProc("Delete from tb_customer where cId='" + id + "'");
    }

    #endregion

    #region  查询会员

    /// <summary>
    /// 按id进行分页查询新闻信息
    /// </summary>
    /// <param name="id">会员id</param>
    /// <returns>返回查询结果DataSet数据集</returns>
    public DataSet SelectCustomer(int PageIndex, int PageSize)
    {
        int StartIndex = ((PageIndex - 1) * PageSize) + 1;
        int EndIndex = PageIndex * PageSize;
        return data.RunProcReturn("select * from(SELECT cId, cName, Sex, loginName, loginPwd,Row_Number() over(ORDER BY cId ASC) as rowIndex FROM tb_customer) as Tab where rowIndex between " + StartIndex + " and " + EndIndex, "tb_customer");
    }
    #endregion

    #region  分页设置绑定
    /// <summary>
    /// 绑定DataList控件，并且设置分页
    /// </summary>
    /// <param name="infoType">信息类型</param>
    /// <param name="infoKey">查询的关键字（如果为空，则查询所有）</param>
    /// <param name="currentPage">当前页</param>
    /// <param name="PageSize">每页显示数量</param>
    /// <returns>返回PagedDataSource对象</returns>
    public PagedDataSource PageDataListBind(string infoType, string infoKey, int currentPage, int PageSize)
    {
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = SelectInfo(infoType, infoKey).Tables[0].DefaultView; //将查询结果绑定到分页数据源上。
        pds.AllowPaging = true;　　　　　　　　　　//允许分页
        pds.PageSize = PageSize;　　　　　　　　 　//设置每页显示的页数
        pds.CurrentPageIndex = currentPage - 1;　  //设置当前页
        return pds;
    }
    #endregion

    #region 管理员登录
    /// <summary>
    /// 管理员登录
    /// </summary>
    /// <param name="pwd">管理员密码</param>
    /// <param name="user">管理员登录名</param>

    public DataSet LogonAdmin(string user, string pwd)
    {
        SqlParameter[] parms ={
            data.MakeInParam("@Name",SqlDbType.VarChar,20,user),
            data.MakeInParam("@PassWord",SqlDbType.VarChar,20,pwd)
        };
        return data.RunProcReturn("Select * from tb_admin where Name=@Name and PassWord=@PassWord", parms, "tb_admin");
    }
    #endregion

    #region 会员登录
    /// <summary>
    /// 会员登录
    /// </summary>
    /// <param name="user">会员登录名</param>
    /// <param name="pwd">会员登录密码</param>
    public DataSet LogonCustomer(string user, string pwd)
    {
        SqlParameter[] parms ={
            data.MakeInParam("@loginName",SqlDbType.VarChar,20,user),
            data.MakeInParam("@loginPwd",SqlDbType.VarChar,20,pwd)
        };
        return data.RunProcReturn("Select * from tb_customer where loginName=@loginName and loginPwd=@loginPwd", parms, "tb_admin");
    }
    #endregion
}
