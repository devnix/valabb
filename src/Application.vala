using Valum;
using Valum.ContentNegotiation;
using VSGI;

namespace ValaBB
{
    public class Application : Object
    {
        public static int main (string[] args)
        {
            var app = new Router();

            app.use(basic());
            app.use(accept("text/html"));

            app.use(basepath("/admin", new ValaBB.Controller.Admin.IndexController().handle));
            app.use(basepath("", new ValaBB.Controller.IndexController().handle));

            var api = new Router ();

            api.get ("/<name>", (req, res, next, context) => {
                var name = context["name"].get_string ();
                return res.expand_utf8 (name);
            });

            app.use(basepath("/api", api.handle));

            return Server.@new("http", handler: app).run(args);
        }
    }
}
