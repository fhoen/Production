public without sharing class ProductionQuantityCalculation {
	
    public static void Recalculate(List<Production__c> productions){
        
        Set<Id> productIds=new Set<Id>();
        for(Production__c p:productions){
           productIds.add(p.Product__c);
        }
        
        List<Product2> productsToUpdate=[SELECT Production_Quantity__c FROM Product2 WHERE Id IN: productIds];
        
        for(Product2 p:productsToUpdate){
            	AggregateResult[] quantity =[SELECT Sum(Quantity__c) sum FROM Production__c where Product__c=:p.Id AND Status__c='In production'];
            	p.Production_Quantity__c=double.valueOf(quantity[0].get('sum'));
        }

        if(productsToUpdate.size()>0){
            update productsToUpdate;
        }
    }
}