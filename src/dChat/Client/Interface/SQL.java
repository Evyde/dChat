/**
*@author 韩枫
*@version 1.0
*此接口对应类只适用于MySQL数据库。<br />
*关于数据库操作的类，
*使用JDBC，可以方便的获取数据库信息，
*但是需要给于用户名以及密码。<br />
*暂时只有几个简单的功能，
*如果某些类单独需要一些特殊查询功能，
*需要调用某些SQL语句，
*可以在此类中加入代码或者使用其中的一些直接执行SQL查询语句的方法。<br />
*说明：本接口对应的类应当在主逻辑中应当在首部进行实例化/setter，
*并设置为有数量实例化，
*可以考虑设置为final，
*或者禁止实例化，
*该做法有待商榷。<br />
*本接口对应类禁止提供getter方法。<br />
*注意：除constructor以及setter之外，此类中的任何方法签名中，
*不得要求以下参数：userName,userPassword,domainOfSQL,port
*如果需要，请使用this.xxx调用。
*/
package dChat.Server.Interface;
public interface SQL{
	/**
	*此处变量均为私有变量，作用可以在构造器中看到。
	*/
	private String userName,userPassword,domainOfSQL;
	private int port;

	/**
	*此处变量为实例当中临时用的，但为了封装，private。
	*/
	private String nameOfDatabase,nameOfTable;

	/**
	*无参数构造器，需要把私有变量设置为如下默认数值：
	*userName：root
	*userPassword：【空】
	*domainOfSQL：127.0.0.1/localhost
	*port：3306
	*nameOfDatabase：root
	*/
	public SQL();
	
	/**
	*带参数的构造器，需要根据参数设置私有变量。
	*@param userName 数据库用户名
	*@param userPassword 数据库密码
	*@param domainOfSQL 数据库域名，注意必须是域名，不是IP
	*@param port 数据库端口
	*@param nameOfDatabase 数据库名
	*/
	public SQL(String userName,String userPassword,String domainOfSQL,int port,String nameOfDatabase);
	
	/**
	*创建数据库，参数是数据库名
	*@param databaseName 欲创建的数据库名
	*@return 成功返回true，失败返回false
	*/
	public boolean creatDatabase(String databaseName);
	
	/**
	*创建表，参数是表名
	*/
	
}
