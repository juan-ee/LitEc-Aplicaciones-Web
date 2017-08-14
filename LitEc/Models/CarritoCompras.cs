using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LitEc.Models
{
   
    public class CarritoCompras
    {
        //public Dictionary<int, ItemCarrito> Items { get; private set; }
        public Dictionary<int, Libro> Items { get; private set; }
        public decimal sumaTotal { get; set; }

        public CarritoCompras()
        {
            //Items = new Dictionary<int, ItemCarrito>();
            Items = new Dictionary<int, Libro>();
            sumaTotal = 0;
        }
        //// Readonly properties can only be set in initialization or in a constructor
        //public static readonly CarritoCompras Instance;

        //// The static constructor is called as soon as the class is loaded into memory
        //static CarritoCompras()
        //{
        //    // If the cart is not in the session, create one and put it there
        //    // Otherwise, get it from the session
        //    if (HttpContext.Current.Session["ASPNETShoppingCart"] == null)
        //    {
        //        Instance = new CarritoCompras();
        //        Instance.Items = new Dictionary<int, ItemCarrito>();
        //        HttpContext.Current.Session["ASPNETShoppingCart"] = Instance;
        //    }
        //    else
        //    {
        //        Instance = (CarritoCompras) HttpContext.Current.Session["CarritoCompras"];
        //    }
        //}

        //// A protected constructor ensures that an object can't be created from outside
        //protected CarritoCompras() {

        //}

        public void AddItem(Libro libro)
        {
            //ItemCarrito item;
            //sumaTotal += libro.precioLibro;
            //if (Items.TryGetValue(libro.idLibro, out item))
            //{
            //    item.cantidad++;
            //    item.total += libro.precioLibro;                
            //}
            //else
            //{                
            //    Items[libro.idLibro] = new ItemCarrito { libro = libro, cantidad = 1, total = libro.precioLibro };
            //}

            Libro item;            
            if (!Items.TryGetValue(libro.idLibro, out item))
            {
                Items[libro.idLibro] = libro;
                sumaTotal += libro.precioLibro;
            }            
        }
        public void RemoveItem(Libro libro)
        {
            sumaTotal -= libro.precioLibro;
            Items.Remove(libro.idLibro);
        }

        //public class ItemCarrito
        //{
        //    public int cantidad { get; set; }
        //    public Libro libro { get; set; }
        //    public decimal total { get; set; }
        //}
    }
}