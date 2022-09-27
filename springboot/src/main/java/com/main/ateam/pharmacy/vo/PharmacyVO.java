package com.main.ateam.pharmacy.vo;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Data
public class PharmacyVO {
	private int pnum, openCode, loadPostalCode,postalCode,detailSales, classificationCode, municipalityCode, designatedDay,authorizationDate, delAuthorizationDate,reopeningDate, roadPostalCode, locationPostalCode, salesCode, detailSalesCode, closeDate, startCloseTemporarily, endCloseTemporarily;
	private String openService, renewData, openId, managementNumber, businessType, businessStatus, sales,  shopNumber, address, dataUpdateClassification, latestDate,dataUpdateClassificationDay, fullAddress, classification, roadAddress, shopName, locationArea, renewDataDay;
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getOpenCode() {
		return openCode;
	}
	public void setOpenCode(int openCode) {
		this.openCode = openCode;
	}
	public int getLoadPostalCode() {
		return loadPostalCode;
	}
	public void setLoadPostalCode(int loadPostalCode) {
		this.loadPostalCode = loadPostalCode;
	}
	public int getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(int postalCode) {
		this.postalCode = postalCode;
	}
	public int getDetailSales() {
		return detailSales;
	}
	public void setDetailSales(int detailSales) {
		this.detailSales = detailSales;
	}
	public int getClassificationCode() {
		return classificationCode;
	}
	public void setClassificationCode(int classificationCode) {
		this.classificationCode = classificationCode;
	}
	public int getMunicipalityCode() {
		return municipalityCode;
	}
	public void setMunicipalityCode(int municipalityCode) {
		this.municipalityCode = municipalityCode;
	}
	public int getDesignatedDay() {
		return designatedDay;
	}
	public void setDesignatedDay(int designatedDay) {
		this.designatedDay = designatedDay;
	}
	public int getAuthorizationDate() {
		return authorizationDate;
	}
	public void setAuthorizationDate(int authorizationDate) {
		this.authorizationDate = authorizationDate;
	}
	public int getDelAuthorizationDate() {
		return delAuthorizationDate;
	}
	public void setDelAuthorizationDate(int delAuthorizationDate) {
		this.delAuthorizationDate = delAuthorizationDate;
	}
	public int getReopeningDate() {
		return reopeningDate;
	}
	public void setReopeningDate(int reopeningDate) {
		this.reopeningDate = reopeningDate;
	}
	public int getRoadPostalCode() {
		return roadPostalCode;
	}
	public void setRoadPostalCode(int roadPostalCode) {
		this.roadPostalCode = roadPostalCode;
	}
	public int getLocationPostalCode() {
		return locationPostalCode;
	}
	public void setLocationPostalCode(int locationPostalCode) {
		this.locationPostalCode = locationPostalCode;
	}
	public int getSalesCode() {
		return salesCode;
	}
	public void setSalesCode(int salesCode) {
		this.salesCode = salesCode;
	}
	public int getDetailSalesCode() {
		return detailSalesCode;
	}
	public void setDetailSalesCode(int detailSalesCode) {
		this.detailSalesCode = detailSalesCode;
	}
	public int getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(int closeDate) {
		this.closeDate = closeDate;
	}
	public int getStartCloseTemporarily() {
		return startCloseTemporarily;
	}
	public void setStartCloseTemporarily(int startCloseTemporarily) {
		this.startCloseTemporarily = startCloseTemporarily;
	}
	public int getEndCloseTemporarily() {
		return endCloseTemporarily;
	}
	public void setEndCloseTemporarily(int endCloseTemporarily) {
		this.endCloseTemporarily = endCloseTemporarily;
	}
	public String getOpenService() {
		return openService;
	}
	public void setOpenService(String openService) {
		this.openService = openService;
	}
	public String getRenewData() {
		return renewData;
	}
	public void setRenewData(String renewData) {
		this.renewData = renewData;
	}
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public String getManagementNumber() {
		return managementNumber;
	}
	public void setManagementNumber(String managementNumber) {
		this.managementNumber = managementNumber;
	}
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public String getBusinessStatus() {
		return businessStatus;
	}
	public void setBusinessStatus(String businessStatus) {
		this.businessStatus = businessStatus;
	}
	public String getSales() {
		return sales;
	}
	public void setSales(String sales) {
		this.sales = sales;
	}
	public String getShopNumber() {
		return shopNumber;
	}
	public void setShopNumber(String shopNumber) {
		this.shopNumber = shopNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDataUpdateClassification() {
		return dataUpdateClassification;
	}
	public void setDataUpdateClassification(String dataUpdateClassification) {
		this.dataUpdateClassification = dataUpdateClassification;
	}
	public String getLatestDate() {
		return latestDate;
	}
	public void setLatestDate(String latestDate) {
		this.latestDate = latestDate;
	}
	public String getDataUpdateClassificationDay() {
		return dataUpdateClassificationDay;
	}
	public void setDataUpdateClassificationDay(String dataUpdateClassificationDay) {
		this.dataUpdateClassificationDay = dataUpdateClassificationDay;
	}
	public String getFullAddress() {
		return fullAddress;
	}
	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getLocationArea() {
		return locationArea;
	}
	public void setLocationArea(String locationArea) {
		this.locationArea = locationArea;
	}
	public String getRenewDataDay() {
		return renewDataDay;
	}
	public void setRenewDataDay(String renewDataDay) {
		this.renewDataDay = renewDataDay;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getOperatingArea() {
		return operatingArea;
	}
	public void setOperatingArea(double operatingArea) {
		this.operatingArea = operatingArea;
	}
	private double longitude, latitude , operatingArea;
	
}
