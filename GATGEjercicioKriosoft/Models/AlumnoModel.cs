using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web;
using System.Web.Mvc;

namespace GATGEjercicioKriosoft.Models
{
    public class AlumnoModel
    {
        public int ID { get; set; }

        [Required(ErrorMessage = "El campo Nombre Alumno es requerido")]
        [DisplayName("Nombre Alumno")]
        public string NombreAlumno { get; set; }
        public int? Edad { get; set; }
        [Required(ErrorMessage = "El campo Fecha de nacimiento es requerido")]
        [DisplayName("Fecha de Nacimiento")]
        public DateTime? FechaNacimiento { get; set; }
        [Required(ErrorMessage = "El campo Padre o tutor es requerido")]
        [DisplayName("Padre o Tutor")]
        public string PadreTutor { get; set; }
        public bool? Eliminado { get; set; }
    }
}