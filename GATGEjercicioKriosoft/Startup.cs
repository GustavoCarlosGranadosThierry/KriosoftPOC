using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GATGEjercicioKriosoft.Startup))]
namespace GATGEjercicioKriosoft
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
