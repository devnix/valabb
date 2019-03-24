using Valum;
using VSGI;

namespace ValaBB.Controller
{
	class IndexController : Router
	{
		construct {
			get ("/", index);
			get ("/test", test);
			get("/user", view);
			rule (Method.GET | Method.POST, "/user/<int:id>", edit);
		}


		int counter = 0;

		public bool index(Request request, Response response, NextCallback next, Context context) throws Error
		{
			return response.expand_utf8("/");
		}

		public bool test(Request request, Response response, NextCallback next, Context context) throws Error
		{
			return response.expand_utf8("/test");
		}

		public bool view(Request request, Response response, NextCallback next, Context context) throws Error
		{
			return response.expand_utf8("view: %s".printf(this.counter++.to_string()));
		}

		public bool edit(Request request, Response response, NextCallback next, Context context) throws Error
		{
			return response.expand_utf8("edit: %s".printf(this.counter++.to_string()));
		}
	}
}