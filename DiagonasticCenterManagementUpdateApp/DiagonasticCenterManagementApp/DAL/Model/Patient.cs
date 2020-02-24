using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiagonasticCenterManagementApp.DAL.Model
{
    [Serializable]
    public class Patient
    {
        public int Id { get;set; }
        public string Name { get; set; }
        public DateTime BirthDate { get; set; }

        public string PhoneNumber { get; set; }
        public double TotalFee { get; set; }
        public int BillNo { get; set; }
        public DateTime DueDate { get; set; }


        
    }
}