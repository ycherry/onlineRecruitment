package com.util;
import java.io.UnsupportedEncodingException;

public class ToUTF8 
{
   public static String toGBK(String strvalue)
   {
	   try {
           if (strvalue == null) {
               return "";
           } else {
               strvalue = new String(strvalue.getBytes("utf-8"),"utf-8");
               return strvalue;
           }
       } catch (Exception e) {
           return "";
       }
   }
	   
	

   public static void main(String args[])
   {
	   System.out.println("�ɸ��� ��ǣ���� ��ǣ����");
	   try {
		System.out.println(new String("�ɸ��� ��ǣ���� ��ǣ����".getBytes("utf-8"),"utf-8"));
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   System.out.println(ToUTF8.toGBK("�����Ƽ��ķۺ�ɫ"));
   }
}
