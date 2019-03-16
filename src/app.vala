using Valum;
using VSGI;

var app = new Router();

app.get("/", (req, res) => {
	res.headers.set_content_type("text/plain", null);
	return res.expand_utf8("Hello, ValaBB!");
});

Server.new("http", handler: app).run({"app", "--port", "3003"});
