@isTest
private class ProductionBarcodeGeneratorTest { 

private static testmethod void lengthIs8WhenOriginalNameIsLengthOf7(){
		List<Production__c> productions=TestDataFactory.getProductions(1,true);
		Production__c originalProduction=productions[0];
		originalProduction.Name='1234567';
		
		List<Production__c> newProductions=ProductionBarcodeGenerator.generateBarcodes(productions);
		Production__c newProduction =newProductions[0];
		System.assertEquals(8,newProduction.Name.length());
	}

	private static testmethod void lengthIs8WhenOriginalNameIsEmpty(){
		List<Production__c> productions=TestDataFactory.getProductions(1,true);
		Production__c originalProduction=productions[0];
		originalProduction.Name='';
		
		List<Production__c> newProductions=ProductionBarcodeGenerator.generateBarcodes(productions);
		Production__c newProduction =newProductions[0];
		System.assertEquals(8,newProduction.Name.length());
	}

	private static testmethod void firstNumerIs9W_henProductsManufacturerProductionNumberPrefixIs9_andNameIsEmpty(){
		List<Production__c> productions=TestDataFactory.getProductions(1,true);
		Production__c originalProduction=productions[0];
		originalProduction.Name='';
		
		List<Production__c> newProductions=ProductionBarcodeGenerator.generateBarcodes(productions);
		Production__c newProduction =newProductions[0];
		System.assertEquals('9',newProduction.Name.left(1));
	}

}