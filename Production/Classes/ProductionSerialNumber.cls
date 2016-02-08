public with sharing class ProductionSerialNumber { 

	public static String getNextNumber(Account manufacturer){
		String prefix=String.valueOf(manufacturer.Production_Number_Prefix__c);
		String prefixSearchText=prefix +'%';
		List<Production__c> productions=[SELECT Name FROM Production__c WHERE Name LIKE :prefixSearchText ORDER BY CreatedDate DESC LIMIT 1];
		
		if (productions.size()==0)
		{
			return '000';
		}
		Production__c lastProduction=productions[0];
		String lastSerialNumber=lastProduction.Name.substring(4,7);
		Integer serialNumberInt=Integer.valueOf(lastSerialNumber)+1001;
		return String.valueOf(serialNumberInt).substring(1,4);
	}
}