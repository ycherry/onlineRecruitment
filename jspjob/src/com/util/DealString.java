package com.util;
/**
 *×Ö·û´®´¦Àí¹«ÓÃÀà 
 */
public class DealString {
    /**
     * ×ª»»×Ö·û±àÂë ÓÉ¡°iso-8859-1¡±Î÷ÎÄ×ª»»Îª¼òÌåÖÐÎÄ
     */
	public static String toGb(String uniStr){
		String gbStr="";
		if(uniStr==null){
			uniStr="";
		}
		try{
			byte[] tempByte=uniStr.getBytes("iso-8859-1");
			gbStr=new String(tempByte,"utf-8");
			System.out.println("DealString被调用");
		}
		catch(Exception ex){
			System.out.println(ex.toString());
		}
		return gbStr;
	}
	/**
	 * °Ñ×Ö·û´®×ª»¯Îªuincode±àÂë
	 * @param gbStr
	 * @return
	 */
	public static String toUni(String gbStr){
		String uniStr="";
		if(gbStr==null){
			gbStr="";
		}
		try{
			byte[] tempByte=gbStr.getBytes("utf-8");
			uniStr=new String(tempByte,"utf-8");
			System.out.println("DealString被调用2");
		}
		catch(Exception ex){
			
		}
		return uniStr;
	}
	/**
	 * È¥µô×Ö·û´®µÄµ¥ÒýºÅ£¬ÀýÈç ÊäÈëa¡®s½«Êä³öa1sÒÔ±ã°Ñ°üº¬µ¥ÒýºÅµÄ×Ö·û´®²åÈëÊý¾Ý¿â
	 * ²»±¨´í
	 */
	public String dbEncode(String str){
		if(str==null){
			str="";
		}else{
			try{
				str=str.replace('\'',(char) 1).trim();
			}
			catch(Exception e){
				System.err.println(e.getMessage());
				e.printStackTrace();
				return str;
			}
		}
		return str;
	}
}
