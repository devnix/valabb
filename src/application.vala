using Valum;
using VSGI;

namespace ValaBB {
	public class Application : Object {
		public static void main (string[] args) {
			var app = new Router();

			app.use(basic());

			app.get ("/", (req, res, next, context) => {
			    return res.expand_utf8 ("Hello world!");
			});


			Server.@new("http", handler: app).run(args);
		}
	}
}
