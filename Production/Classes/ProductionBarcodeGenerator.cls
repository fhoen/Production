public with sharing class ProductionBarcodeGenerator {

public static List<Production__c>  generateBarcodes(List<Production__c> productions){
		for (Production__c p:productions)
		{
			if(p.Name.length()==0){
				List<Product2> products=[SELECT Manufacturer__r.Production_number_prefix__c FROM Product2];
			
				if(products.size()>0)
				{
					Decimal prefix=products[0].Manufacturer__r.Production_number_prefix__c;
					
					Date currentDate=Date.today();
					Integer currentMonthInt=currentDate.month()+100;
					String currentMonth=String.valueOf(currentMonthInt).substring(1,3);
					
					Integer currentYearInt=currentDate.year();
					String currentYear=String.valueOf(currentYearInt).right(1);

					String serialNumber=ProductionSerialNumber.getNextNumber(products[0].Manufacturer__r);
					p.name=string.valueof(prefix) + currentMonth + currentYear+serialNumber;
				}
				
			}
			
			p.Name+=String.valueOf(CheckSumCalculation.calculateWithMod10(p.Name));
			
		}

		return productions;
	}
 }