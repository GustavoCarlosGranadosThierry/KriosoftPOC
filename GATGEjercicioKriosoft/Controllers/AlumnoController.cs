using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GATGEjercicioKriosoft.Models;

namespace GATGEjercicioKriosoft.Controllers
{
    [Authorize]
    public class AlumnoController : Controller
    {
        // Obtenemos todos los alumnos para mostrar
        // Busqueda en DB y vaciado en un modelo custom para mostrar
        public ActionResult Index()
        {
            dbEjercicioDataContext db = new dbEjercicioDataContext();
            List<AlumnoModel> queryAlumnos = new List<AlumnoModel>();

            queryAlumnos = (from x in db.Alumnos
                where x.Eliminado == false
                select new GATGEjercicioKriosoft.Models.AlumnoModel()
                {
                    ID = x.ID,
                    NombreAlumno = x.NombreAlumno,
                    Edad = x.Edad,
                    FechaNacimiento = x.FechaNacimiento,
                    PadreTutor = x.PadreTutor,
                    Eliminado = x.Eliminado
                }).ToList();
           
            return View(queryAlumnos);
        }

        // Obtenemos un alumno en particular
        // Busqueda en DB y vaciado en un modelo custom para mostrar
        public ActionResult Details(int id)
        {
            dbEjercicioDataContext db = new dbEjercicioDataContext();
            AlumnoModel query = (from x in db.Alumnos
                where x.ID == id
                select new AlumnoModel()
                {
                    ID = x.ID,
                    NombreAlumno = x.NombreAlumno,
                    Edad = x.Edad,
                    FechaNacimiento = x.FechaNacimiento,
                    PadreTutor = x.PadreTutor,
                    Eliminado = x.Eliminado
                }).SingleOrDefault();
            return View(query);
        }

        // Función para mostrar la vista de creación
        public ActionResult Create()
        {
            return View();
        }

        // Función para guardar un alumno en la base de datos
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(GATGEjercicioKriosoft.Models.AlumnoModel postAlumno)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    dbEjercicioDataContext db = new dbEjercicioDataContext();
                    Alumno nuevoAlumno = new Alumno();
                    nuevoAlumno.NombreAlumno = postAlumno.NombreAlumno;
                    nuevoAlumno.FechaNacimiento = postAlumno.FechaNacimiento;
                    //calculamos la edad
                    int EdadActual = DateTime.Now.Year - postAlumno.FechaNacimiento.Value.Year;
                    if (postAlumno.FechaNacimiento.Value.Date > DateTime.Today.AddYears(-EdadActual)) EdadActual--;
                    nuevoAlumno.Edad = EdadActual;
                    nuevoAlumno.PadreTutor = postAlumno.PadreTutor;
                    nuevoAlumno.Eliminado = false;
                    db.Alumnos.InsertOnSubmit(nuevoAlumno);
                    db.SubmitChanges();

                    return RedirectToAction("Index");
                }

                return View();
            }
            catch
            {
                return View();
            }
        }

        // Función para editar al alumno
        // Carga la vista con el alumno que tenga el ID proporcionado
        public ActionResult Edit(int id)
        {
            dbEjercicioDataContext db = new dbEjercicioDataContext();
            AlumnoModel query = (from x in db.Alumnos
                where x.ID == id
                select new AlumnoModel()
                {
                    ID = x.ID,
                    NombreAlumno = x.NombreAlumno,
                    Edad = x.Edad,
                    FechaNacimiento = Convert.ToDateTime(x.FechaNacimiento.Value.ToShortDateString()),
                    PadreTutor = x.PadreTutor,
                    Eliminado = x.Eliminado
                }).SingleOrDefault();
            return View(query);
        }

        // Función para guardar el alumno solicitado (edición)
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, GATGEjercicioKriosoft.Models.AlumnoModel postAlumno)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    dbEjercicioDataContext db = new dbEjercicioDataContext();
                    Alumno queryAlumno = (from x in db.Alumnos where x.ID == id select x).SingleOrDefault();
                    if (queryAlumno != null)
                    {
                        queryAlumno.NombreAlumno = postAlumno.NombreAlumno;
                        queryAlumno.FechaNacimiento = postAlumno.FechaNacimiento;
                        queryAlumno.PadreTutor = postAlumno.PadreTutor;
                        //calculamos la edad
                        int EdadActual = DateTime.Now.Year - postAlumno.FechaNacimiento.Value.Year;
                        if (postAlumno.FechaNacimiento.Value.Date > DateTime.Today.AddYears(-EdadActual)) EdadActual--;
                        queryAlumno.Edad = EdadActual;
                        db.SubmitChanges();
                        return RedirectToAction("Index");
                    }
                    return View();
                }
                return View();
            }
            catch
            {
                return View();
            }
        }

        // Función para mostrar el alumno a borrar
        public ActionResult Delete(int id)
        {
            dbEjercicioDataContext db = new dbEjercicioDataContext();
            AlumnoModel query = (from x in db.Alumnos
                where x.ID == id
                select new AlumnoModel()
                {
                    ID = x.ID,
                    NombreAlumno = x.NombreAlumno,
                    Edad = x.Edad,
                    FechaNacimiento = Convert.ToDateTime(x.FechaNacimiento.Value.ToShortDateString()),
                    PadreTutor = x.PadreTutor,
                    Eliminado = x.Eliminado
                }).SingleOrDefault();
            return View(query);
        }

        // Función para borrar al alumno de la base de datos
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, GATGEjercicioKriosoft.Models.AlumnoModel postAlumno)
        {
            try
            {
                dbEjercicioDataContext db = new dbEjercicioDataContext();
                Alumno queryAlumno = (from x in db.Alumnos where x.ID == id select x).SingleOrDefault();
                if (queryAlumno != null)
                {
                    queryAlumno.Eliminado = true;
                    db.SubmitChanges();
                    return RedirectToAction("Index");
                }
                return View();
            }
            catch
            {
                return View();
            }
        }
    }
}
