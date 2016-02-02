public  with sharing class ProductionTriggerHandler {
	
	public static List<Production__c>  generateBarcode(List<Production__c> productions){

		for (Production__c p:productions)
		{
			p.Name+=String.valueOf(CheckSumCalculation.calculateWithMod10(p.Name));
		}

		return productions;
	
		
		
		
	}
 }