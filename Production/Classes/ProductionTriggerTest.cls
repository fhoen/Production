@isTest
private class ProductionTriggerTest {

	@testSetup
	private static void setup(){
		TestDataFactory.getProducts(1,true);
	}

	private static testMethod void verifyProcutProuctionQuantityisChanged_whenInsertingNewProductions(){
		Product2 originalProduct=TestDataFactory.getProduct();
		List<Production__c> productionsToInsert=TestDataFactory.getProductions(3, false);

		Test.startTest();
		
		insert productionsToInsert;
			
		Product2 updatedProduct=TestDataFactory.getProduct();
		Test.stopTest();
		
		System.assertNotEquals(originalProduct.Production_Quantity__c, updatedProduct.Production_Quantity__c);

	}

	private static testMethod void verifyProcutProuctionQuantityisChanged_whenUpdatingProductions(){
	
		Product2 originalProduct=TestDataFactory.getProduct();
		List<Production__c> productionsToUpdate=TestDataFactory.getProductions(3,true);

		Test.startTest();
		
		update productionsToUpdate;
			
		Product2 updatedProduct=TestDataFactory.getProduct();
		Test.stopTest();
		
		System.assertNotEquals(originalProduct.Production_Quantity__c, updatedProduct.Production_Quantity__c);

	}

}