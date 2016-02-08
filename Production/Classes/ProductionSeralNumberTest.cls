@isTest
private class ProductionSeralNumberTest { 

	private static testmethod void getNextNumber_is107WhenManufacturerIsManufacturer_1_AndLastSerialNumberIs106(){
		List<Production__c> productions=TestDataFactory.getProductions(7,true);
		Account manufacturer=TestDataFactory.getManufacturer(true);
		String result=ProductionSerialNumber.getNextNumber(manufacturer);
		System.assertEquals('107',result);
	} 

	private static testmethod void getNextNumber_is000WhenManufacturerIsManufacturer_1_AndNoProductionNumbersExist(){
		Account manufacturer=TestDataFactory.getManufacturer(true);
		String result=ProductionSerialNumber.getNextNumber(manufacturer);
		System.assertEquals('000',result);
	} 
}