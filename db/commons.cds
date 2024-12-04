namespace cap.comtyps;

// to reuse the data types in multiple files we are creating a separate file under DB folder;
// it's like a doman in abap to resue in the tables.
type guid : String(32);

// now will create a structure same as abap
// Structures in CAPM are created using the keyword ASPECT
// Let's create an address structure
aspect address {
houseNo: Int16;
landmark:String(80);
city:String(80);
country:String(2);
pincode:Int16;
}
