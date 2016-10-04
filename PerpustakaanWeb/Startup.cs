using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PerpustakaanWeb.Startup))]
namespace PerpustakaanWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
