package model;

public class ContractDetail {
    int contractDetailId;
    int contractId;
    int quantity;
    int attachServiceId;
    String attachServiceName;
    String attachServiceCost;
    String attachServiceUnit;
    String attachServiceStatus;

    public ContractDetail() {
    }

    public ContractDetail(int contractDetailId, int contractId, int quantity, String attachServiceName, String attachServiceCost, String attachServiceUnit, String attachServiceStatus) {
        this.contractDetailId = contractDetailId;
        this.contractId = contractId;
        this.quantity = quantity;
        this.attachServiceName = attachServiceName;
        this.attachServiceCost = attachServiceCost;
        this.attachServiceUnit = attachServiceUnit;
        this.attachServiceStatus = attachServiceStatus;
    }

    public ContractDetail(int contractDetailId, int contractId, String attachServiceName, int quantity) {
        this.contractDetailId = contractDetailId;
        this.contractId = contractId;
        this.quantity = quantity;
        this.attachServiceName = attachServiceName;
    }

    public ContractDetail(Integer contractId, Integer attachServiceId, Integer quantity) {
        this.attachServiceId = attachServiceId;
        this.contractId = contractId;
        this.quantity = quantity;
    }

    public ContractDetail(Integer contractDetailId, Integer contractId, Integer attachServiceId, Integer quantity) {
        this.contractDetailId = contractDetailId;
        this.contractId = contractId;
        this.quantity = quantity;
        this.attachServiceId = attachServiceId;
    }

    public int getContractDetailId() {
        return contractDetailId;
    }

    public void setContractDetailId(int contractDetailId) {
        this.contractDetailId = contractDetailId;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getAttachServiceName() {
        return attachServiceName;
    }

    public void setAttachServiceName(String attachServiceName) {
        this.attachServiceName = attachServiceName;
    }

    public String getAttachServiceCost() {
        return attachServiceCost;
    }

    public void setAttachServiceCost(String attachServiceCost) {
        this.attachServiceCost = attachServiceCost;
    }

    public String getAttachServiceUnit() {
        return attachServiceUnit;
    }

    public void setAttachServiceUnit(String attachServiceUnit) {
        this.attachServiceUnit = attachServiceUnit;
    }

    public String getAttachServiceStatus() {
        return attachServiceStatus;
    }

    public void setAttachServiceStatus(String attachServiceStatus) {
        this.attachServiceStatus = attachServiceStatus;
    }
    public int getAttachServiceId() {
        return attachServiceId;
    }

    public void setAttachServiceId(int attachServiceId) {
        this.attachServiceId = attachServiceId;
    }
}
