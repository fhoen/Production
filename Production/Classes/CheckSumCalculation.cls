public  with sharing class CheckSumCalculation  {

	public static Integer calculateWithMod10(String barcode){

		if (barcode.isNumeric()==false)
		{
			return 0;
		}

		Boolean multiplyWith3=true;
		Integer weightedSum=0;
		
		List<String> characters=barcode.split('');
		
		for (Integer i = characters.size()-1; i > 0; i--)
		{
			String currentCharacter=characters[i];
			if (currentCharacter!=null && currentCharacter!='')
			{
				Integer currentNumber=Integer.valueOf(currentCharacter);
				if (multiplyWith3==true)
				{
					currentNumber=currentNumber*3;
					multiplyWith3=false;
				}
				else
				{
					multiplyWith3=true;
				}
				weightedSum=weightedSum+currentNumber;
			}
		}
		String weightedSumString=String.valueOf(weightedSum);
		String modString=weightedSumString.right(1);
		Integer mod=Integer.valueOf(modString);
		
		if (mod==0)
		{
			return 0;
		}

		return 10-mod;
	}
 }