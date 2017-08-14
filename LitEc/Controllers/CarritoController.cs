using LitEc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LitEc.Controllers
{
    public class CarritoController : Controller
    {        
        public ActionResult Index()
        {
            return View();
        }
        
        public ActionResult AgregarAlCarrito(int idLibro)
        { 
            ((CarritoCompras)Session["CarritoCompras"]).AddItem(new DataBaseModelContainer().LibroSet.Find(idLibro));            
            return View("Index");

        }

        public ActionResult QuitarDelCarrito(int idLibro)
        {
            ((CarritoCompras)Session["CarritoCompras"]).RemoveItem(new DataBaseModelContainer().LibroSet.Find(idLibro));
            return View("Index");
        }

    }
}
