module.exports = cds.service.impl( async function(){
  // get access of the database table/entity
    const {EmployeeSet} = this.entities;
    
    this.before('UPDATE', EmployeeSet, (req)=>{
// here we enter our logic that will trigger before data updation
   if(req.data.salaryAmount >= 100000){
    req.error(500,"the Salary is more than the initial quote");
   }
    });
});