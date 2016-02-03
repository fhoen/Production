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

	private static testmethod void verifyProductionNameChangesWhenInsertingProductions(){
		
		List<Production__c> productions=TestDataFactory.getProductions(1,false);
		Production__c originalProduction=productions[0];
		Test.startTest();
		
		insert productions;
		Test.stopTest();
		Production__c insertedProduction=[SELECT Name FROM Production__c LIMIT 1];
		System.assertNotEquals(originalProduction.Name,insertedProduction.Name);
	}

	private static testmethod void verifyProductionNameIsUnchangesWhenUpdatingProductions(){
		
		List<Production__c> productions=TestDataFactory.getProductions(1,true);
		Production__c originalProduction=productions[0];
		Test.startTest();
		
		update productions;
		Test.stopTest();
		Production__c insertedProduction=[SELECT Name FROM Production__c LIMIT 1];
		System.assertEquals(originalProduction.Name,insertedProduction.Name);
	}

}