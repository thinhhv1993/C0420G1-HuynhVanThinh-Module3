package model;

public class Contract {
    int contractId;
    String contractStarDate;
    String contractEndDate;
    double contractDeposit;
    double contractTotalMoney;
    int employeeId;
    int customerId;
    int serviceId;
    String employeeName;
    String customerName;
    String serviceName;

    public Contract(int contractId, String contractStarDate, String contractEndDate, double contractDeposit, double contractTotalMoney, String employeeName, String customerName, String serviceName) {
        this.contractId = contractId;
        this.contractStarDate = contractStarDate;
        this.contractEndDate = contractEndDate;
        this.contractDeposit = contractDeposit;
        this.contractTotalMoney = contractTotalMoney;
        this.employeeName = employeeName;
        this.customerName = customerName;
        this.serviceName = serviceName;
    }

    public Contract() {
    }

    public Contract(int contractId, String contractStarDate, String contractEndDate, double contractDeposit, double contractTotalMoney, int employeeId, int customerId, int serviceId) {
        this.contractId = contractId;
        this.contractStarDate = contractStarDate;
        this.contractEndDate = contractEndDate;
        this.contractDeposit = contractDeposit;
        this.contractTotalMoney = contractTotalMoney;
        this.employeeId = employeeId;
        this.customerId = customerId;
        this.serviceId = serviceId;
    }

    public Contract(String contractStarDate, String contractEndDate, Double contractDeposit, Double contractTotalMoney, Integer employeeId, Integer customerId, Integer serviceId) {
        this.contractStarDate = contractStarDate;
        this.contractEndDate = contractEndDate;
        this.contractDeposit = contractDeposit;
        this.contractTotalMoney = contractTotalMoney;
        this.employeeId = employeeId;
        this.customerId = customerId;
        this.serviceId = serviceId;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public String getContractStarDate() {
        return contractStarDate;
    }

    public void setContractStarDate(String contractStarDate) {
        this.contractStarDate = contractStarDate;
    }

    public String getContractEndDate() {
        return contractEndDate;
    }

    public void setContractEndDate(String contractEndDate) {
        this.contractEndDate = contractEndDate;
    }

    public double getContractDeposit() {
        return contractDeposit;
    }

    public void setContractDeposit(double contractDeposit) {
        this.contractDeposit = contractDeposit;
    }

    public double getContractTotalMoney() {
        return contractTotalMoney;
    }

    public void setContractTotalMoney(double contractTotalMoney) {
        this.contractTotalMoney = contractTotalMoney;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

}
