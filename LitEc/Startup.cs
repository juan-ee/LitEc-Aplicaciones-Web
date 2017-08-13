using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LitEc.Startup))]
namespace LitEc
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
