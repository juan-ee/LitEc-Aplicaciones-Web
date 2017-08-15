using LitEc.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LitEc.Controllers
{
    public class CarritoController : Controller
    {
        DataBaseModelContainer db = new DataBaseModelContainer();
        public ActionResult Index()
        {
            return View();
        }
        
        public ActionResult AgregarAlCarrito(int idLibro)
        { 
            ((CarritoCompras)Session["CarritoCompras"]).AddItem(db.LibroSet.Find(idLibro));            
            return View("Index");

        }

        public ActionResult QuitarDelCarrito(int idLibro)
        {
            ((CarritoCompras)Session["CarritoCompras"]).RemoveItem(db.LibroSet.Find(idLibro));
            return View("Index");
        }

        public ActionResult RealizarCompra()
        {
            

            var usuario = db.UsuarioSet.Where(us => us.userName == User.Identity.Name).First();
            int idUsuario = usuario.idUsuario;
            db.Entry(usuario).State = EntityState.Detached;
            var carrito = ((CarritoCompras)Session["CarritoCompras"]);
            db.Database.ExecuteSqlCommand(
                "insert into CompraSet (total,subtotal,iva,Usuario_idUsuario) values ({0},{1},{2},{3})",
                carrito.sumaTotal, carrito.sumaTotal * 0.12m, carrito.sumaTotal * 0.88m,idUsuario
                );
            var compra = db.CompraSet.ToList().FindLast(comp => comp.Usuario.idUsuario == idUsuario);            
            var idCompra = compra.idCompra;
            db.Entry(compra).State = EntityState.Detached;

            foreach (Libro libr in carrito.Items.Values.ToList())
            {
                db.Database.ExecuteSqlCommand(
                "insert into CompraLibro values ({0},{1})",
                idCompra, libr.idLibro
                );

            }
            carrito.Items.Clear();
            return RedirectToAction("Index", "Manage");

            //db.Entry(usuario).State = EntityState.Modified;            
            //return RedirectToAction("Index","Manage");

        }

    }
}

/*
 CON EL PUTO USUAIO
 var usuario = db2.UsuarioSet.Where(us => us.userName == User.Identity.Name).Include(us=>us.Compra).First();                
                var carrito = ((CarritoCompras)Session["CarritoCompras"]);
                var libros = carrito.Items.Values.ToList();
                Compra compra = new Compra
                {
                    total = carrito.sumaTotal,
                    iva = carrito.sumaTotal * 0.12m,
                    subtotal = carrito.sumaTotal * 0.88m,
                    Libro = libros,
                    Usuario = usuario
                };
                            
                db2.Entry(usuario).Entity.Compra.Add(compra);                                
                db2.Entry(usuario).State = EntityState.Modified;
                db2.SaveChanges();
     */
