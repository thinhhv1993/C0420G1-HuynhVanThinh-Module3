package bo;

import dao.CustomerDao;
import dao.CustomerIDao;
import model.Customer;

import java.sql.SQLException;
import java.util.List;

public class CustomerBo implements CustomerIBo {
    CustomerIDao customerIDao = new CustomerDao();

    @Override
    public List<Customer> selectAllCustomer() throws SQLException {
        return this.customerIDao.selectAllCustomer();
    }

    @Override
    public void updateCustomer(Customer customer) throws SQLException {
        this.customerIDao.updateCustomer(customer);
    }

    @Override
    public void createCustomer(Customer customer) throws SQLException {
        this.customerIDao.createCustomer(customer);
    }

    @Override
    public void deleteCustomer(int customerId) throws SQLException {
        this.customerIDao.deleteCustomer(customerId);
    }

    @Override
    public Customer getByCustomerId(int customerId) throws SQLException {
        return this.customerIDao.getByCustomerId(customerId);
    }

    @Override
    public List<Customer> getByCustomerName(String customerName) throws SQLException {
        return this.customerIDao.getByCustomerName(customerName);
    }
}
