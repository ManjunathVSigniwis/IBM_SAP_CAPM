namespace purchaseorder.util;
using{Currency} from '@sap/cds/common';

type Gender :  String(1) enum{
    male = 'M';
    female = 'F';
    undisclosed = 'U';
};

type AmountT : Decimal(10,2)@(
Semantics.amount.currencycode : 'currency_code',
sap.unit : 'CURRENCY_CODE'

);

aspect Amount: { 
  CURRENCY : Currency;
  GROSS_AMOUNT : AmountT@(title:'{i18n>GrossAmount}');
  NET_AMOUNT : AmountT@(title:'{i18n>NetAmount}');
  TAX_AMOUNT : AmountT@(title:'{i18n>TaxAmount}');
  
}

type Guid: String(32);
type phoneNumber:String(30)@assert.format : '^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';
type email :String(255)@assert.format : '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
// type email :String(255);