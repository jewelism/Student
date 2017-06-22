package student;
//jdbc ���� ��Ű�� import
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

//�� DAO Ŭ�������� �������� ����� DAO Ŭ���� ����
//���� �ν��Ͻ��� ������ ���� �����̹Ƿ�, abstract Ŭ������ ����

public abstract class DAO {

//����� ���� connection, statement, resultset�� �����Ѵ�.
		static public void close(Connection c, Statement p, ResultSet r) throws Exception{
		if (c!=null)
			c.close();
		if (p!=null)
			p.close();
		if (r!=null)
			r.close();
	}

//������ �߻��� ���, exception�� ������ ����Ѵ�.
	static public void printError(SQLException ex) {
	    for (Throwable e : ex) {
	        if (e instanceof SQLException) {
	                e.printStackTrace(System.err);
	                System.err.println("SQLState: " +
	                    ((SQLException)e).getSQLState());
	
	                System.err.println("Error Code: " +
	                    ((SQLException)e).getErrorCode());
	
	                System.err.println("Message: " + e.getMessage());
	        }
	    }
	}
}
