package dao;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDao {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public  List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public User getUserById(int id);

    public List<User> getUser();

    public void insertUserStore(User user) throws SQLException;

    public void addUserTransaction(User user, int[] permision);

    public void insertUpdateWithoutTransaction() throws SQLException;

    public boolean UpdateWithoutTransaction(User user)throws SQLException;

    public boolean DeleteWithoutTransaction(int id)throws SQLException;
}
