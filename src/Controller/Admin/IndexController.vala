using Valum;
using VSGI;

namespace ValaBB.Controller.Admin
{
	class IndexController : Router
	{
		construct
		{
			rule(Method.GET | Method.POST, "/", index);
			rule(Method.GET | Method.POST, "/test", test);
		}

		int counter = 0;

		public bool index(Request request, Response response, NextCallback next, Context context) throws Error
		{
			return response.expand_utf8("/admin");
		}

		public bool test(Request request, Response response, NextCallback next, Context context) throws Error
		{
			return response.expand_utf8("/admin/test");
		}
	}
}