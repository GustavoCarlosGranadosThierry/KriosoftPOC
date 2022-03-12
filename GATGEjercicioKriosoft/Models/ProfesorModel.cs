using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web;
using System.Web.Mvc;

namespace GATGEjercicioKriosoft.Models
{
    public class ProfesorModel
    {
        public int ID { get; set; }

        [Required(ErrorMessage = "El campo Nombre Profesor es requerido")]
        [DisplayName("Nombre Profesor")]
        public string NombreProfesor { get; set; }

        [Required(ErrorMessage = "El campo Edad es requerido")]
        public int Edad { get; set; }

        [Required(ErrorMessage = "El campo Fecha de nacimiento es requerido")]
        [DisplayName("Fecha de Nacimiento")]
        public DateTime FechaNacimiento { get; set; }

        public bool Eliminado { get; set; }
    }
}