using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GATGEjercicioKriosoft.Models;

namespace GATGEjercicioKriosoft.Controllers
{
    [Authorize]
    public class GrupoAsignadoController : Controller
    {
        // Funcion auxiliar para el llenado de grupos
        private List<SelectListItem> GetGrupos()
        {
            var options = new List<SelectListItem>();
            dbEjercicioDataContext db = new dbEjercicioDataContext();
            Grupo[] queryGrupos = (from x in db.Grupos where x.Eliminado == false select x).ToArray();
            if (queryGrupos.Length > 0)
            {
                for (int i = 0; i < queryGrupos.Length; i++)
                {
                    var o = new SelectListItem
                    {
                        Value = queryGrupos[i].ID.ToString(),
                        Text = queryGrupos[i].NombreMateria
                    };
                    options.Add(o);
                }
            }
            return options;
        }

        // Funcion auxiliar para el llenado de profesores
        private List<SelectListItem> GetProfesores()
        {
            var options = new List<SelectListItem>();
            dbEjercicioDataContext db = new dbEjercicioDataContext();
            Profesor[] queryProfesores = (from x in db.Profesors where x.Eliminado == false select x).ToArray();
            if (queryProfesores.Length > 0)
            {
                for (int i = 0; i < queryProfesores.Length; i++)
                {
                    var o = new SelectListItem
                    {
                        Value = queryProfesores[i].ID.ToString(),
                        Text = queryProfesores[i].NombreProfesor
                    };
                    options.Add(o);
                }
            }
            return options;
        }

        // Funcion para mostrar todas las asignaciones a grupo
        public ActionResult Index()
        {
            dbEjercicioDataContext db = new dbEjercicioDataContext();
            List<FrontGrupoAsignado> QueryList = new List<FrontGrupoAsignado>();
            QueryList = (from x in db.GrupoAsignados
                where x.Eliminado == false
                select new FrontGrupoAsignado()
                {
                    Grupo = x.Grupo1.NombreMateria,
                    Profesor = x.Profesor1.NombreProfesor,
                    CantidadAlumnos = x.Grupo1.CantidadAlumnos
                }).ToList();
            return View(QueryList);
        }


        // Función para crear una nueva asignación
        // se cargan los dropbox desde aqui
        public ActionResult Create()
        {
            var grupoAsignadoNuevo = new GATGEjercicioKriosoft.Models.GrupoAsignadoModel();
            grupoAsignadoNuevo.GruposDeDB = GetGrupos();
            grupoAsignadoNuevo.ProfesoresDB = GetProfesores();
            return View(grupoAsignadoNuevo);
        }

        // Función para guardar una nueva asignación
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(GATGEjercicioKriosoft.Models.GrupoAsignadoModel postModelo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    dbEjercicioDataContext db = new dbEjercicioDataContext();
                    GrupoAsignado queryAsignado =
                        (from x in db.GrupoAsignados
                            where x.Eliminado == false && x.Profesor == postModelo.Profesor &&
                                  x.Grupo == postModelo.Grupo
                            select x).SingleOrDefault();

                    if (queryAsignado == null)
                    {
                        queryAsignado = new GrupoAsignado();
                        queryAsignado.Profesor = postModelo.Profesor;
                        queryAsignado.Grupo = postModelo.Grupo;
                        queryAsignado.Eliminado = false;
                        db.GrupoAsignados.InsertOnSubmit(queryAsignado);
                        db.SubmitChanges();
                        return RedirectToAction("Index");
                    }
                }
                var grupoAsignadoNuevo = new GATGEjercicioKriosoft.Models.GrupoAsignadoModel();
                grupoAsignadoNuevo.GruposDeDB = GetGrupos();
                grupoAsignadoNuevo.ProfesoresDB = GetProfesores();
                return View(grupoAsignadoNuevo);
            }
            catch
            {
                return View();
            }
        }

    }
}
