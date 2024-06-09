using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TOKENUI.Startup))]
namespace TOKENUI
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
