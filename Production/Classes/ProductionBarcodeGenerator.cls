public with sharing class ProductionBarcodeGenerator {

public static List<Production__c>  generateBarcodes(List<Production__c> productions){

		for (Production__c p:productions)
		{
			p.Name+=String.valueOf(CheckSumCalculation.calculateWithMod10(p.Name));
		}

		return productions;
	}
 }