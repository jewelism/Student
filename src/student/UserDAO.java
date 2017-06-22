package student;

//���� ��Ű���� import
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import util.DB;

//User Ŭ������ ���� ������ ���� Ŭ���� ����
public class UserDAO extends DAO {

	// 한글깨지는거 상과없
	private static User makeUser(ResultSet rs) throws Exception {
		User obj = new User();
		obj.setUserId(rs.getString("userId"));
		obj.setPasswd(rs.getString("passwd"));
		obj.setSec(rs.getInt("sec"));
		obj.setName(rs.getString("name"));
		obj.setSchool(rs.getString("school"));
		obj.setDepart(rs.getString("depart"));
		obj.setNum(rs.getString("num"));
		return obj;
	}

	// ��� job�� �����Ͽ� ��ȯ
	public static ArrayList<User> selectAll() throws Exception {
		String sql = "SELECT * FROM [student]";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = DB.getConnection();
			// �Ű������� �����Ƿ�, �ݵ�� PreparedStatement�� �̿��� �ʿ�� ����.
			// Statement�� ó���ϴ� �͵� �����ϴ�.
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			ArrayList<User> list = new ArrayList<User>();
			// ��� ���տ� �ϳ� �̻��� �����Ͱ� ���Ե� �� �����Ƿ�, list�� �ݺ������� ó���Ѵ�.
			while (rs.next())
				list.add(makeUser(rs));
			return list;
		} finally {
			close(con, stmt, rs);
		}
	}

	// ������ �Է�
	public static void insert(String userId,String passwd,int sec,String name,String school,String depart,String num) throws Exception {
		String sql = "INSERT INTO student(userId, passwd, sec, name, school, depart, num) VALUES (?, ?, ?, ?, ?, ? ,?)";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = DB.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, userId);
			stmt.setString(2, passwd);
			stmt.setInt(3, sec);
			stmt.setString(4, name);
			stmt.setString(5, school);
			stmt.setString(6, depart);
			stmt.setString(7, num);
			// ������ ���� DML�� ������ ���� �Ʒ� ������� �����Ѵ�.
			stmt.executeUpdate();
		} catch (SQLException e) {

			printError(e);
		} finally {
			close(con, stmt, rs);
		}
	}

	// ����
	public static void update(String userId,String passwd,int sec,String name,String school,String depart,String num) throws Exception {
		//System.out.println("userid:"+userId + " "+passwd + " "+sec + " "+name + " "+school + " "+depart + " "+num);
		String sql = "UPDATE [student].[dbo].[student] SET [passwd] = ?,[sec] = ?,[name] = ?,[school] = ?,[depart] = ?,[num] = ? WHERE userId=?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = DB.getConnection();
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, passwd);
			stmt.setInt(2, sec);
			stmt.setString(3, name);
			stmt.setString(4, school);
			stmt.setString(5, depart);
			stmt.setString(6, num);
			stmt.setString(7, userId);
			stmt.executeUpdate();
		} catch (SQLException e) {
			printError(e);
		} finally {
			close(con, stmt, rs);
		}
	}

	public static void delete(String userId) throws Exception {
		String sql = "delete from student WHERE userId=?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = DB.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, userId);
			stmt.executeUpdate();
		} catch (SQLException e) {
			printError(e);
		} finally {
			close(con, stmt, rs);
		}
	}
}
