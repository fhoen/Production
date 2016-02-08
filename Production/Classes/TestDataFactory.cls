@isTest
public class TestDataFactory {

	public static List<Production__c> getProductions(Integer numnerOfProductions, Boolean updateDatabase){
		
		Product2 product=getProduct();
		List<Production__c> result=new List<Production__c>();
		
		for (Integer i = 0; i < numnerOfProductions; i++)
		{
			if (updateDatabase==true)
			{
				result.add(new Production__c(Name='910510' + String.valueOf(i) +'0', Quantity__c=i, Product__c=product.Id, Product__r=product));
			}
			else
			{
				result.add(new Production__c(Name=String.valueOf(i), Quantity__c=i, Product__c=product.Id, Product__r=product));
			}
			
		}
		
		if (updateDatabase==true)
		{
			insert result;
		}
		return result;
	}

	public static List<Product2> getProducts(Integer numberOfProdducts, Boolean updateDatabase){
		
		List<Product2> result=new List<Product2>();
		Account manufacturer=getManufacturer(true);
	
		for (Integer i = 0; i < numberOfProdducts; i++)
		{
			result.add(new Product2(Name=String.valueOf(i), Production_Quantity__c=0, Manufacturer__r=manufacturer,Manufacturer__c=manufacturer.Id));
		}
		
		if (updateDatabase==true)
		{
			insert result;
		}
		return result;
	}

	public static Product2 getProduct(){
		List<Product2> products= [SELECT Id FROM Product2 LIMIT 1];
		if (products.size()==0)
		{
			getProducts(1,true);
		}
		return [SELECT Name,Production_Quantity__c FROM Product2 LIMIT 1];
	}

	public static Account getManufacturer(Boolean updateDatabase){
		RecordType rt = [select id,Name from RecordType where SobjectType='Account' and Name='Manufacturer' Limit 1];
		Account manufacturer=new  Account(Name='Manufacturer 1', Production_Number_Prefix__c=9,recordtypeid=rt.Id);
		
		if(updateDatabase==true){
			insert manufacturer;
		}
		return manufacturer;
	}
}