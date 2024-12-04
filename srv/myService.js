const cds = require("@sap/cds");

module.exports = (srv)=>{ // srv is the servce object that will be received once the server is running
    // Implementation for myService.cds definition
    srv.on('hello',(req)=>{
        let sName = req.data.name;
        return "Hello "+ sName;
    });
}