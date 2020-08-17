package dao;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerIDao {
    public List<Customer> selectAllCustomer() throws SQLException;

    public void updateCustomer(Customer customer) throws SQLException;

    public void createCustomer(Customer customer) throws SQLException;

    public void deleteCustomer(int customerId) throws  SQLException;

    public Customer getByCustomerId(int customerId) throws SQLException;

    public List<Customer> getByCustomerName(String customerName) throws SQLException;
}
