using{material_management.db} from '../db/datamodel';
using{cappo.cds}from '../db/CDSViews';

// service CatalogService @(path:'CatalogService'){
//     entity EmployeeSet as projection on master.employee;
// }

service CatalogService @(path:'CatalogService'){
    @Capabilities:{Insertable, Deletable: false}
    entity BusinessPartnerSet as projection on db.master.businesspartner;
    entity AddressSet as projection on db.master.address;
//   @readonly
    entity EmployeeSet as projection on db.master.employee;
    entity PurchaseOrderItems as projection on db.transaction.poitems;
    entity POs @(odata.draft.enabled:true) as projection on db.transaction.purchaseorder{
        *,
        case OVERALL_STATUS
            when 'N' then 'New'
            when 'P' then 'Paid'
            when 'B' then 'Blocked'
            else 'Delivered' end as OVERALL_STATUS: String(20),
        case OVERALL_STATUS
            when 'N' then 0
            when 'P' then 1
            when 'B' then 2
            else 3 end as Criticality: Integer,
            Items
    }actions{
        action boost();
        function largestOrder() returns array of POs;
    };

    entity  CProductValuesView as projection on cds.CDSView.CProductValuesView;
}