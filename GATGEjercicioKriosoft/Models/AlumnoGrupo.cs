using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web;
using System.Web.Mvc;

namespace GATGEjercicioKriosoft.Models
{
    public class AlumnoGrupo
    {
        public int ID { get; set; }

        [Required(ErrorMessage = "El campo Alumno es requerido")]
        [DisplayName("Alumno")]
        public int Alumno { get; set; }

        [Required(ErrorMessage = "El campo Grupo es requerido")]
        [DisplayName("Grupo")]
        public int GrupoAsignado { get; set; }

        public bool Eliminado { get; set; }
    }
}