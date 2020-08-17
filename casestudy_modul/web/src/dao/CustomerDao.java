package dao;

import model.Customer;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDao implements CustomerIDao {

    BaseDao baseDao = new BaseDao();

    private static final String SELECT_ALL_CUSTOMER="{CALL get_customer()}";
    private static final String DELETE_CUSTOMER="{CALL delete_customer_by_id(?)}";
    private static final String GET_BY_CUSTOMERID="{CALL get_customer_by_id(?)}";
    private static final String GET_BY_CUSTOMERNAME="{CALL get_customer_by_name(?)}";
    private static final String UPDATE_CUSTOMER="{CALL update_customer(?,?,?,?,?,?,?,?,?)}";
    private static final String CREATE_CUSTOMER="{CALL insert_customer(?,?,?,?,?,?,?,?)}";

    @Override
    public List<Customer> selectAllCustomer() throws SQLException {
        Customer customer = null;
        List<Customer> customerList = new ArrayList<>();
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_CUSTOMER);) {
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Integer customerId = resultSet.getInt("c.customer_id");
                String customerName = resultSet.getString("c.customer_name");
                String customerBirth = resultSet.getString("c.customer_birthday");
                String customerGender = resultSet.getString("c.customer_gender");
                String customerIdCard = resultSet.getString("c.customer_id_card");
                String customerPhone = resultSet.getString("c.customer_phone");
                String customerEmail = resultSet.getString("c.customer_email");
                String customerAddress = resultSet.getString("c.customer_address");
                String customerTypeName = resultSet.getString("ct.customer_type_name");

                customer = new Customer(customerId, customerName, customerBirth, customerGender, customerIdCard,
                        customerPhone, customerEmail, customerAddress, customerTypeName);
                customerList.add(customer);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void updateCustomer(Customer customer) throws SQLException {
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(UPDATE_CUSTOMER);) {
            connection.setAutoCommit(false);
            callableStatement.setInt(1,customer.getCustomerId());
            callableStatement.setInt(2,customer.getCustomerTypeId());
            callableStatement.setString(3,customer.getCustomerName());
            callableStatement.setString(4,customer.getCustomerBirth());
            callableStatement.setString(5,customer.getCustomerGender());
            callableStatement.setString(6,customer.getCustomerIdCard());
            callableStatement.setString(7,customer.getCustomerPhone());
            callableStatement.setString(8,customer.getCustomerEmail());
            callableStatement.setString(9,customer.getCustomerAddress());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void createCustomer(Customer customer) throws SQLException {
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(CREATE_CUSTOMER);) {
            connection.setAutoCommit(false);
            callableStatement.setInt(1,customer.getCustomerTypeId());
            callableStatement.setString(2,customer.getCustomerName());
            callableStatement.setString(3,customer.getCustomerBirth());
            callableStatement.setString(4,customer.getCustomerGender());
            callableStatement.setString(5,customer.getCustomerIdCard());
            callableStatement.setString(6,customer.getCustomerPhone());
            callableStatement.setString(7,customer.getCustomerEmail());
            callableStatement.setString(8,customer.getCustomerAddress());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCustomer(int customerId) throws SQLException {
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(DELETE_CUSTOMER);) {
            callableStatement.setInt(1, customerId);
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Customer getByCustomerId(int customerId) throws SQLException {
        Customer customer = null;
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(GET_BY_CUSTOMERID);) {
            callableStatement.setInt(1,customerId);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                String customerName = resultSet.getString("c.customer_name");
                String customerBirth = resultSet.getString("c.customer_birthday");
                String customerGender = resultSet.getString("c.customer_gender");
                String customerIdCard = resultSet.getString("c.customer_id_card");
                String customerPhone = resultSet.getString("c.customer_phone");
                String customerEmail = resultSet.getString("c.customer_email");
                String customerAddress = resultSet.getString("c.customer_address");
                String customerTypeName = resultSet.getString("ct.customer_type_name");
                customer = new Customer(customerId, customerName, customerBirth, customerGender, customerIdCard,
                        customerPhone, customerEmail, customerAddress, customerTypeName);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public List<Customer> getByCustomerName(String customerName1) throws SQLException {
        Customer customer = null;
        List<Customer> customerList = new ArrayList<>();
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(GET_BY_CUSTOMERNAME );) {
            callableStatement.setString(1,customerName1);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Integer customerId = resultSet.getInt("c.customer_id");
                String customerName = resultSet.getString("c.customer_name");
                String customerBirth = resultSet.getString("c.customer_birthday");
                String customerGender = resultSet.getString("c.customer_gender");
                String customerIdCard = resultSet.getString("c.customer_id_card");
                String customerPhone = resultSet.getString("c.customer_phone");
                String customerEmail = resultSet.getString("c.customer_email");
                String customerAddress = resultSet.getString("c.customer_address");
                String customerTypeName = resultSet.getString("ct.customer_type_name");
                customer = new Customer(customerId, customerName, customerBirth, customerGender, customerIdCard,
                        customerPhone, customerEmail, customerAddress, customerTypeName);
                customerList.add(customer);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return customerList;
    }
}
