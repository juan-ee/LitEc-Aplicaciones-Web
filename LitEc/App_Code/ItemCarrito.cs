using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LitEc.App_Code
{
    public class ItemCarrito
    {                
        public int cantidad { get; set; }
        public Libro libro { get; set; }
        public decimal total { get; set; }                        
    }
}