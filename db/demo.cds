namespace bloremgroad;
//commons is the common data type lybrary created under the db folder.
using{ cap.comtyps as commons } from './commons';
using{cuid, managed,temporal} from'@sap/cds/common';

context master {
    entity car {
        key modelnumer : commons.guid;
            name       : String(82);
            brandname  : String(30);
            prodyear   : Date;
            shprice    : String(10);
            paint      : String(20);
            showroom : Association to plant; //forign key relationship between two tables

    }

    entity plant: commons.address {
        key plantid   : commons.guid;
            plantloc  : String(80);
            plantname : String(32);
            
    }

    entity parts {
        key partid : String(32);
            partname : localized String(80);

    }
}

context transaction{
entity customer: cuid,temporal,managed{
    car:Association to one master.car;
    part:Association to one master.parts;
}

}
