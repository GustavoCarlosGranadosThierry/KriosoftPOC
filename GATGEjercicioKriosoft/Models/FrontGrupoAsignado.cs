using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web;
using System.Web.Mvc;

namespace GATGEjercicioKriosoft.Models
{
    public class FrontGrupoAsignado
    {
        public int ID { get; set; }

        public string Grupo { get; set; }

        public string Profesor { get; set; }

        [DisplayName("Cantidad Alumnos")]
        public int? CantidadAlumnos { get; set; }

    }
}