%dw 2.0
output application/json
var sfId = vars.salesforceId[0].Id
---
{ 
  "compositeRequest": 
  [
    {
         "method": if (isEmpty(sfId))
                     "POST" 
                else 
                     "PATCH",
      "referenceId": "refUpdateCreditDetails",
      "url": if (isEmpty(sfId)) 
                    "/services/data/v57.0/sobjects/Rebate_Credit_Summary__c" 
               else 
                     "/services/data/v57.0/sobjects/Rebate_Credit_Summary__c/$(sfId)",
       "body": if (isEmpty(sfId)) {
      	
    "Account_Name__c": if(!isEmpty(payload.Account_Name__c))(payload.Account_Name__c) else if(!isEmpty(vars.refAccId))((vars.refAccId)[0].Id) else "",
    "Amount__c": payload.Amount__c,
    "Company_Number__c": payload.Company_Number__c,
    "Cost_when_parts_ship__c": payload.Cost_when_parts_ship__c,
    "Actual_Ship_Date__c": payload.Actual_Ship_Date__c,
    "Customer_Part_Number__c": payload.Customer_Part_Number__c,
    "IWD_Amount__c": payload.IWD_Amount__c,
    "IWD_Price__c": payload.IWD_Price__c,
    "JDE_Account__c":payload.JDE_Account__c,
    "JDE_Order_Type__c": payload.JDE_Order_Type__c,
    "Line__c": payload.Line__c,
    "Line_Amount__c": payload.Line_Amount__c,
    "Line_Price__c": payload.Line_Price__c,
    "Net_Sales_Amount__c": payload.Net_Sales_Amount__c,
    "NTN_Part__c": payload.NTN_Part__c,
    "Order__c": payload.Order__c,
    "Order_Line__c": payload.Order_Line__c,
    "Order_Line_Qty__c": payload.Order_Line_Qty__c,
    "PO__c": payload.PO__c,
    "Product_Part__c": payload.Product_Part__c,
    "Quantity__c": payload.Quantity__c,
    "Rebate_Number__c": if(!isEmpty(payload.Rebate_Number__c))((vars.refRebateId)[0].Id) else "",      
    "Rebate_Type__c": payload.Rebate_Type__c,                
    "CurrencyIsoCode": payload.CurrencyIsoCode,
    "Name": payload.Name
      }
	  else
	  {
      	
    "Account_Name__c": if(!isEmpty(payload.Account_Name__c))(payload.Account_Name__c) else if(!isEmpty(vars.refAccId))((vars.refAccId)[0].Id) else "",
    "Amount__c": payload.Amount__c,
    "Company_Number__c": payload.Company_Number__c,
    "Cost_when_parts_ship__c": payload.Cost_when_parts_ship__c,
    "Actual_Ship_Date__c": payload.Actual_Ship_Date__c,
    "Customer_Part_Number__c": payload.Customer_Part_Number__c,
    "IWD_Amount__c": payload.IWD_Amount__c,
    "IWD_Price__c": payload.IWD_Price__c,
    "JDE_Account__c":payload.JDE_Account__c,
    "JDE_Order_Type__c": payload.JDE_Order_Type__c,
    //"Line__c": payload.Line__c,
    "Line_Amount__c": payload.Line_Amount__c,
    "Line_Price__c": payload.Line_Price__c,
    "Net_Sales_Amount__c": payload.Net_Sales_Amount__c,
    "NTN_Part__c": payload.NTN_Part__c,
    "Order__c": payload.Order__c,
    "Order_Line__c": payload.Order_Line__c,
    "Order_Line_Qty__c": payload.Order_Line_Qty__c,
    "PO__c": payload.PO__c,
    "Product_Part__c": payload.Product_Part__c,
    "Quantity__c": payload.Quantity__c,
    //"Rebate_Number__c": if(!isEmpty(payload.Rebate_Number__c)) ((vars.refRebateId)[0].Id) else "",      
    "Rebate_Type__c": payload.Rebate_Type__c,                
    "CurrencyIsoCode": payload.CurrencyIsoCode,
    //"Name": payload.Name
      }
    }]
}