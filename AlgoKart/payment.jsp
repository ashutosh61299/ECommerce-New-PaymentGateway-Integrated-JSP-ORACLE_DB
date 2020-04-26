<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<%@page import="com.paytm.pg.merchant.CheckSumServiceHelper" %>
<%@page import="java.util.*" %>


<%!
public class PaytmConstants{

	public static final String MID="" //enter your MID--go to paytm and Generate one.
	public static final String MERCHANT_KEY="";
	public static final String INDUSTRY_TYPE_ID="";
	public static final String CHANNEL_ID="";
	public static final String WEBSITE="";

	public static final String PAYTM_URL="https://securegw-stage.paytm.in/order/process";


}

%>


<%
 String orderid=(String)request.getParameter("phone");
    int ii=(int)(Math.random()*((1000-1)+1))+1;
    String foid="ALGO-2020"+orderid+"-"+ii;
    session.setAttribute("oid",foid);
String email=request.getParameter("email");
String location=request.getParameter("location");

session.setAttribute("email",email);
session.setAttribute("location",location);

/* initialize a TreeMap object */
TreeMap<String, String> paytmParams = new TreeMap<String, String>();

/* Find your MID in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys */
paytmParams.put("MID", PaytmConstants.MID);
System.out.println(PaytmConstants.MID);
/* Find your WEBSITE in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys */
paytmParams.put("WEBSITE", PaytmConstants.WEBSITE);
System.out.println(PaytmConstants.WEBSITE);
/* Find your INDUSTRY_TYPE_ID in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys */
paytmParams.put("INDUSTRY_TYPE_ID", PaytmConstants.INDUSTRY_TYPE_ID);
System.out.println(PaytmConstants.INDUSTRY_TYPE_ID);
/* WEB for website and WAP for Mobile-websites or App */
paytmParams.put("CHANNEL_ID", PaytmConstants.CHANNEL_ID);
System.out.println(PaytmConstants.CHANNEL_ID);
/* Enter your unique order id */
paytmParams.put("ORDER_ID",(String)session.getAttribute("oid"));
System.out.println((String)session.getAttribute("oid"));
/* unique id that belongs to your customer */
paytmParams.put("CUST_ID", (String)session.getAttribute("id"));
System.out.println((String)session.getAttribute("id"));
/* customer's mobile number */
paytmParams.put("MOBILE_NO", request.getParameter("phone"));
System.out.println(request.getParameter("phone"));
/* customer's email */
paytmParams.put("EMAIL", request.getParameter("email"));
System.out.println(request.getParameter("email"));
/**
* Amount in INR that is payble by customer
* this should be numeric with optionally having two decimal points
*/
String price=(String)session.getAttribute("price");
		String p="";
		char[] arr=price.toCharArray();
		for(int i=0;i<arr.length;i++){
			
			if(arr[i]!=',')
				p=p+arr[i];
		}
		
		int pp=Integer.parseInt(p);
		String finPrice=pp+"";

paytmParams.put("TXN_AMOUNT", finPrice);
System.out.println(finPrice);
/* on completion of transaction, we will send you the response on this URL */
paytmParams.put("CALLBACK_URL", "http://localhost:7001/AlgoKart/paymentRes.jsp");

/**
* Generate checksum for parameters we have
* You can get Checksum JAR from https://developer.paytm.com/docs/checksum/
* Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys 
*/
System.out.println("checksummmmmm");
String checksum = CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum(PaytmConstants.MERCHANT_KEY, paytmParams);

System.out.println("checksummmmmm doneeeee:"+checksum);
/* for Staging */
String url = "https://securegw-stage.paytm.in/order/process";

/* for Production */
// String url = "https://securegw.paytm.in/order/process";

/* Prepare HTML Form and Submit to Paytm */
%>
<%
StringBuilder outputHtml = new StringBuilder();
outputHtml.append("<html>");
outputHtml.append("<head>");
outputHtml.append("<title>Merchant Checkout Page</title>");
outputHtml.append("</head>");
outputHtml.append("<body>");
outputHtml.append("<center><h1>Please do not refresh this page...</h1></center>");
outputHtml.append("<form method='post' action='" + url + "' name='paytm_form'>");

for(Map.Entry<String,String> entry : paytmParams.entrySet()) {
    outputHtml.append("<input type='hidden' name='" + entry.getKey() + "' value='" + entry.getValue() + "'>");
}

outputHtml.append("<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>");
outputHtml.append("</form>");
outputHtml.append("<script type='text/javascript'>");
outputHtml.append("document.paytm_form.submit();");
outputHtml.append("</script>");
outputHtml.append("</body>");
outputHtml.append("</html>");
out.println(outputHtml);
%>
</body>
</html>