@isTest
private class ProductionQuantityCalculationTest {
	
    @testSetup
    private static void testDataFactory(){
        Product2 testProduct=new Product2(Production_Quantity__c=10, Name='Product 1');
        insert testProduct;
        
        Production__c  existingProduction=new Production__c(Name='123', Quantity__c=10,  Product__c=testProduct.Id, Status__c='In production');
        insert existingProduction;
        
        Production__c newProduction=new Production__c(Name='456', Quantity__c=2,  Product__c=testProduct.Id, Status__c='In production');
        insert newProduction;
    }

    private static testMethod void valueOfProductionQuantityIsChangedFrom10To12_WhenNewProductionWithQuantityOf2(){
        Product2 product=[SELECT Production_Quantity__c FROM Product2 LIMIT 1];
        
        List<Production__c> productions=[SELECT Name, Quantity__c,Product__c, Status__c FROM Production__c WHERE Name='456'];
        
        Test.startTest();
        ProductionQuantityCalculation.Recalculate(productions);
        
         Product2 result=[SELECT Production_Quantity__c FROM Product2 LIMIT 1];
        System.assertEquals(12, result.Production_Quantity__c);
        Test.stopTest();

      
    }
}