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
            app.use(accept("text/plain"));
            app.use(accept("text/html"));

            app.get("/", (req, res, next, context) => {
                return res.expand_utf8("<p>Hello world!</p><p><a href=\"/login\">Login</a>");
            });

            app.get("/login", (req, res, next, context) => {
                return res.expand_utf8("Please, login here or <a href=\"/\">go back</a>");
            });


            return Server.@new("http", handler: app).run(args);
        }
    }
}
