package util; 
import java.sql.Connection; 
import java.sql.DriverManager; //数据库连接工具类 
public class DBHelper { 
	private static final String driver = "oracle.jdbc.driver.OracleDriver"; //数据库驱动 
	//连接数据库的URL地址 
	private static final String url="jdbc:oracle:thin:@oracle.cise.ufl.edu:1521:orcl"; 
	private static final String username="hang";//数据库的用户名 
	private static final String password="Zy891110";//数据库的密码 
	private static Connection conn=null; //静态代码块负责加载驱动 
	static { 
		try { 
			Class.forName(driver); 
			} catch(Exception ex) { 
				ex.printStackTrace(); 
				} 
		} //单例模式返回数据库连接对象 
	public static Connection getConnection() throws Exception { 
		if(conn==null) { 
			conn = DriverManager.getConnection(url, username, password); 
			return conn; 
			} 
		return conn; 
			} 
	public static void main(String[] args) { 
		try { 
			Connection conn = DBHelper.getConnection(); 
			if(conn!=null) { 
				System.out.println("DB connect successful！"); 
				} 
			else { 
				System.out.println("DB connect fail！"); 
				} 
			} catch(Exception ex) { 
				ex.printStackTrace(); 
				} 
		} 
	}
