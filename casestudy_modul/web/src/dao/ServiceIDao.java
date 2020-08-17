package dao;

import model.Service;

import java.sql.SQLException;
import java.util.List;

public interface ServiceIDao {

    public List<Service> selectAllService() throws SQLException;

    public void updateService(Service service) throws SQLException;

    public void createService(Service service) throws SQLException;

    public void deleteService(int serviceId) throws  SQLException;

    public Service getByServiceId(int serviceId) throws SQLException;
    public List<Service> getByServiceName(String serviceName) throws SQLException;
}
