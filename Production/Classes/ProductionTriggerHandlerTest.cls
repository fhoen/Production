@isTest
private class ProductionTriggerHandlerTest {

	private static testmethod void generateBarcode_lengthIs8WhenOriginalNameIsLengthOf7(){
		List<Production__c> productions=TestDataFactory.getProductions(1,true);
		Production__c originalProduction=productions[0];
		originalProduction.Name='1234567';
		List<Production__c> newProductions=ProductionTriggerHandler.generateBarcode(productions);
		Production__c newProduction =newProductions[0];
		System.assertEquals(8,newProduction.Name.length());
	}
 }