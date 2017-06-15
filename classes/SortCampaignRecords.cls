public class SortCampaignRecords {
	
	public static void sortAscending()
	{
	List<Campaign> campaignrecord=new List<Campaign>([select id,Name,Status,IsActive from Campaign order by Name ASC LIMIT 10]);
	for(Campaign c:campaignrecord)
	{
		System.debug(c);
	}
	
	}
	
	public static void sortdescending()
	{
	List<Campaign> campaignrecord=new List<Campaign>([select id,Name,Status,IsActive from Campaign order by Name DESC LIMIT 10]);
	for(Campaign c:campaignrecord)
	{
		System.debug(c);
	}
	
	}
    
}