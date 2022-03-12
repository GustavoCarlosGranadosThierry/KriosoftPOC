using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web;
using System.Web.Mvc;

namespace GATGEjercicioKriosoft.Models
{
    public class GrupoModel
    {
        public int ID { get; set; }

        [Required(ErrorMessage = "El campo Nombre Materia es requerido")]
        [DisplayName("Nombre Materia")]
        public string NombreMateria { get; set; }

        [Required(ErrorMessage = "El campo Cantidad Alumnos es requerido")]
        [DisplayName("Cantidad Alumnos")]
        public int CantidadAlumnos  { get; set; }

        public bool Eliminado { get; set; }
    }
}