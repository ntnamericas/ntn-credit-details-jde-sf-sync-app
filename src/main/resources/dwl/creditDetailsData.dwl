%dw 2.0
output application/json
fun julianDateToNormalDate(julianDate) = 
	(((19 + (julianDate[0] as Number))* 100) default "" 
	+ (julianDate[1 to 2] as Number) default "" ++ julianDate[3 to 5] default "")
	as Date {format: "yyyyDDD"} as Date {format:"yyyy-MM-dd"} default null
---
payload map ((item, index) -> 
 {
    "Account_Name__c": trim(item.AXDC),   //Id 
    "Amount__c": trim(item.SDAEXP)/100 default "",   //currency
    "Company_Number__c": trim(item.SDKCOO),   //string
    "Cost_when_parts_ship__c": trim(item.SDUNCS)/10000 default "",   //currency
    "Actual_Ship_Date__c": julianDateToNormalDate(trim(item.SDDGL))as Date default null,   //date
    "Customer_Part_Number__c": trim(item.IVCITM),   //string
    "IWD_Amount__c":
    ((((trim(item.BPUPRC))/10000) default null )*(trim(item.SDUORG))) default null,    //currency 
    "IWD_Price__c": (trim(item.BPUPRC )/10000)  default null, //currency
    "JDE_Account__c": trim(item.SDSHAN),   //string 
    "JDE_Order_Type__c": trim(item.SDDCTO),   //string
    "Line__c": (trim(item.SDVR01 ) )default "" ++ ":" ++ "(" ++ trim(item.SDDOCO) default "" ++ "-" ++ ((trim(item.SDLNID)/1000)) default null ++ ")" default null,   //string [EXTERNAL ID]

    "Line_Amount__c": trim(item.SDAEXP)/100 default null,   //currency
    "Line_Price__c": trim(item.SDUPRC)/10000 default null,   //currency

    "Net_Sales_Amount__c": ((((((trim(item.BPUPRC))/10000) default null )*(trim(item.SDUORG))) default null)- ((trim(item.SDAEXP)))) default null,   //currency
    "NTN_Part__c": trim(item.SDLITM),   //string
    "Order__c": trim(item.SDDOCO) as Number,   //number (0 dec)
    "Order_Line__c": (trim(item.SDLNID)/1000) as Number default null,   //number (3 dec)
    "Order_Line_Qty__c": trim(item.SDUORG) as Number,   //number (0 dec)
    "PO__c": trim(item.SDVR01),   //string
    "Product_Part__c": trim(item.IMDRAW) default "" ++ "-" ++ trim(item.IBPRP1) default "" ++ "-" ++ trim(item.IBSRP4) default "",   //string 
    "Quantity__c": trim(item.SDSOQS) as Number,   //number (0 dec)
    "Rebate_Number__c": if (trim(item.SDVR01) contains  "MCA") ((trim(item.SDVR01) splitBy  "MCA" )[1])[0 to 6] else if (trim(item.SDVR01) contains  "CPA") ((trim(item.SDVR01) splitBy  "CPA" )[1])[0 to 6] else "" , //lookup
    "Rebate_Type__c": trim(item.IMDRAW) default "" ++ "-" ++ trim(item.IBPRP1)default "" ++ "-" ++ trim(item.IBSRP4) default "",   //string
  
    "CurrencyIsoCode": trim(item.SDCRCD),   //string

    "Name":  trim(item.SDVR01) default "" ++ ":" ++ "(" ++ trim(item.SDDOCO) default "" ++ "-" ++ (trim(item.SDLNID)/1000) default "" ++ ")"  //string
  } )