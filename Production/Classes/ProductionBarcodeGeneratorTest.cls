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
		
		List<Production__c> newProductions=ProductionBarcodeGenerator.generateBarcodes(getProductionWithEmtyName());
		Production__c newProduction =newProductions[0];
		System.assertEquals(8,newProduction.Name.length());
	}

	private static testmethod void firstNumerIs9_WhenProductsManufacturerProductionNumberPrefixIs9_andNameIsEmpty(){
		
		List<Production__c> newProductions=ProductionBarcodeGenerator.generateBarcodes(getProductionWithEmtyName());
		Production__c newProduction =newProductions[0];
		System.assertEquals('9',newProduction.Name.left(1));
	}

	private static testmethod void secondAndThirdNumerIsTheCurruntMonth_WhenNameIsEmpty(){
		
		List<Production__c> newProductions=ProductionBarcodeGenerator.generateBarcodes(getProductionWithEmtyName());
		Production__c newProduction =newProductions[0];
		Date currentDate=Date.today();
		Integer currentMonthInt=currentDate.month()+100;
		String currentMonth=String.valueOf(currentMonthInt).substring(1,3);
		
		System.assertEquals(currentMonth,newProduction.Name.substring(1,3));
	}

	private static testmethod void fourthNumerIsTheCurrentYear_WhenNameIsEmpty(){
		
		List<Production__c> newProductions=ProductionBarcodeGenerator.generateBarcodes(getProductionWithEmtyName());
		Production__c newProduction =newProductions[0];
		Date currentDate=Date.today();
		Integer currentYearInt=currentDate.year();
		String currentYear=String.valueOf(currentYearInt).right(1);
	
		System.assertEquals(currentYear,newProduction.Name.substring(3,4));
	}

	private static List<Production__c> getProductionWithEmtyName(){
		List<Production__c> productions=TestDataFactory.getProductions(1,true);
		Production__c originalProduction=productions[0];
		originalProduction.Name='';
		return productions;
	}

}