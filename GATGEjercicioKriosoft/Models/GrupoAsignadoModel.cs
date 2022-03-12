using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web;
using System.Web.Mvc;

namespace GATGEjercicioKriosoft.Models
{
    public class GrupoAsignadoModel
    {
        public int ID { get; set; }

        [Required(ErrorMessage = "El campo Profesor es requerido")]
        [DisplayName("Profesor")]
        public int Profesor { get; set; }

        [Required(ErrorMessage = "El campo Grupo es requerido")]
        [DisplayName("Grupo")]
        public int Grupo { get; set; }

        public bool Eliminado { get; set; }

        public List<SelectListItem> ProfesoresDB { get; set; }
        public List<SelectListItem> GruposDeDB { get; set; }
    }
}