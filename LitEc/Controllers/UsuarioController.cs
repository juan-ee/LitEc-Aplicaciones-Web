using LitEc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LitEc.Controllers
{
    public class UsuarioController : Controller
    {
        // GET: Usuario
        public ActionResult Info()
        {
            using(DataBaseModelContainer db=new DataBaseModelContainer())
            {
                var usuario = db.UsuarioSet.Where(us => us.userName == User.Identity.Name).First();
                List<LibroViewModel> libros = new List<LibroViewModel>();
                foreach(Compra compra in usuario.Compra.ToList())
                {
                    foreach(Libro lib in compra.Libro.ToList())
                    {
                        libros.Add(new LibroViewModel {libro=lib,nombreAutor= lib.Autor.nombresAutor + " " + lib.Autor.apellidosAutor });                        
                    }
                }
                
                return View(libros);
            }            
        }
    }
}
