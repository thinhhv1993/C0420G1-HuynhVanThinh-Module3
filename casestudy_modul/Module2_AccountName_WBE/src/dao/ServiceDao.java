package dao;

import model.Service;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceDao implements ServiceIDao {

    BaseDao baseDao = new BaseDao();

    private static final String SELECT_ALL_SERVICE="{CALL get_service()}";
    private static final String UPDATE_SERVICE="{CALL update_service(?,?,?,?,?,?,?,?,?,?,?)}";
    private static final String DELETE_SERVICE="{CALL delete_service_by_id(?)}";
    private static final String GET_BY_SERVICEID="{CALL get_service_by_id(?)}";
    private static final String CREATE_SERVICE="{CALL insert_service(?,?,?,?,?,?,?,?,?,?,?)}";


    @Override
    public List<Service> selectAllService() throws SQLException {
        Service service = null;
        List<Service> serviceList =new ArrayList<>();
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_SERVICE);){
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                Integer serviceId =resultSet.getInt("s.service_id");
                String serviceName = resultSet.getString("s.service_name");
                Integer serviceArea = resultSet.getInt("s.service_area");
                Double serviceCost = resultSet.getDouble("s.service_cost");
                Integer serviceMaxPeople = resultSet.getInt("s.service_max_people");
                String standardRoom = resultSet.getString("s.standard_room");
                String descriptionOtherConvenience = resultSet.getString("s.description_orther_conveniece");
                Double poolAre = resultSet.getDouble("s.pool_area");
                Integer numberOfFloors = resultSet.getInt("s.number_of_floors");
                String serviceTypeName = resultSet.getString("st.service_type_name");
                String rentTypeName = resultSet.getString("rt.rent_type_name");
                Double rentTypeCost = resultSet.getDouble("rt.rent_type_cost");
                service = new  Service( serviceId,  serviceName,  serviceArea,  serviceCost,
                 serviceMaxPeople,  standardRoom,  descriptionOtherConvenience,  poolAre,
                 numberOfFloors,  serviceTypeName,  rentTypeName,  rentTypeCost);
                serviceList.add(service);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return serviceList;
    }

    @Override
    public void updateService(Service service) throws SQLException {
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(UPDATE_SERVICE);) {
            connection.setAutoCommit(false);
            callableStatement.setInt(1, service.getServiceId());
            callableStatement.setString(2, service.getServiceName());
            callableStatement.setInt(3, service.getServiceArea());
            callableStatement.setDouble(4, service.getServiceCost());
            callableStatement.setInt(5, service.getServiceMaxPeople());
            callableStatement.setString(6, service.getStandardRoom());
            callableStatement.setString(7, service.getDescriptionOtherConvenience());
            callableStatement.setDouble(8, service.getPoolAre());
            callableStatement.setInt(9, service.getNumberOfFloors());
            callableStatement.setDouble(10, service.getRent_type_id());
            callableStatement.setDouble(11, service.getService_type_id());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void createService(Service service) throws SQLException {
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(CREATE_SERVICE);) {
            connection.setAutoCommit(false);
            callableStatement.setString(1, service.getServiceName());
            callableStatement.setInt(2, service.getServiceArea());
            callableStatement.setDouble(3, service.getServiceCost());
            callableStatement.setInt(4, service.getServiceMaxPeople());
            callableStatement.setString(5, service.getStandardRoom());
            callableStatement.setString(6, service.getDescriptionOtherConvenience());
            callableStatement.setDouble(7, service.getPoolAre());
            callableStatement.setInt(8, service.getNumberOfFloors());
            callableStatement.setDouble(9, service.getRent_type_id());
            callableStatement.setDouble(10, service.getService_type_id());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteService(int serviceId) throws SQLException {
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(DELETE_SERVICE);) {
            callableStatement.setInt(1, serviceId);
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Service getByServiceId(int serviceId) throws SQLException {
        Service service = null;
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(GET_BY_SERVICEID);){
            callableStatement.setInt(1,serviceId);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                String serviceName = resultSet.getString("s.service_name");
                Integer serviceArea = resultSet.getInt("s.service_area");
                Double serviceCost = resultSet.getDouble("s.service_cost");
                Integer serviceMaxPeople = resultSet.getInt("s.service_max_people");
                String standardRoom = resultSet.getString("s.standard_room");
                String descriptionOtherConvenience = resultSet.getString("s.description_orther_conveniece");
                Double poolAre = resultSet.getDouble("s.pool_area");
                Integer numberOfFloors = resultSet.getInt("s.number_of_floors");
                String serviceTypeName = resultSet.getString("st.service_type_name");
                String rentTypeName = resultSet.getString("rt.rent_type_name");
                Double rentTypeCost = resultSet.getDouble("rt.rent_type_cost");
                service = new  Service( serviceId,  serviceName,  serviceArea,  serviceCost,
                        serviceMaxPeople,  standardRoom,  descriptionOtherConvenience,  poolAre,
                        numberOfFloors,  serviceTypeName,  rentTypeName,  rentTypeCost);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return service;
    }
}
