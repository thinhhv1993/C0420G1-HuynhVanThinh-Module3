package bo;

import dao.ServiceDao;
import dao.ServiceIDao;
import model.Service;

import java.sql.SQLException;
import java.util.List;

public class ServiceBo  implements ServiceIBo {
    ServiceIDao serviceIDao = new ServiceDao();

    @Override
    public List<Service> selectAllService() throws SQLException {
        return this.serviceIDao.selectAllService();
    }

    @Override
    public void updateService(Service service) throws SQLException {
        this.serviceIDao.updateService(service);
    }

    @Override
    public void createService(Service service) throws SQLException {
        this.serviceIDao.createService(service);
    }

    @Override
    public void deleteService(int serviceId) throws SQLException {
        this.serviceIDao.deleteService(serviceId);
    }

    @Override
    public Service getByServiceId(int serviceId) throws SQLException {
        return this.serviceIDao.getByServiceId(serviceId);
    }

    @Override
    public List<Service> getByServiceName(String serviceName) throws SQLException {
        return this.serviceIDao.getByServiceName(serviceName);
    }
}
