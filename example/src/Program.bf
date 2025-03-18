using System;
using System.Collections;
using System.Diagnostics;
using System.IO;
using System.Interop;
using System.Text;

using static duktape.duktape;

namespace example;

static class Program
{
	static duk_ret_t native_print(duk_context* ctx)
	{
		duk_push_string(ctx, " ");
		duk_insert(ctx, 0);
		duk_join(ctx, duk_get_top(ctx) - 1);
		Debug.WriteLine(StringView(duk_safe_to_string!(ctx, -1)));

		return 0;
	}

	static duk_ret_t native_adder(duk_context* ctx)
	{
		c_int i;
		c_int n = duk_get_top(ctx); /* #args */
		double res = 0.0;

		for (i = 0; i < n; i++)
		{
			res += duk_to_number(ctx, i);
		}

		duk_push_number(ctx, res);

		return 1; /* one return value */
	}

	static int Main(params String[] args)
	{
		duk_context* ctx = duk_create_heap_default!();
		defer duk_destroy_heap(ctx);

		duk_push_c_function(ctx, => native_print, DUK_VARARGS);
		duk_put_global_string(ctx, "print");

		duk_push_c_function(ctx, => native_adder, DUK_VARARGS);
		duk_put_global_string(ctx, "adder");

		duk_eval_string!(ctx, "print('Hello world!');");

		duk_eval_string!(ctx, "print('2+3=' + adder(2, 3));");
		duk_pop(ctx); /* pop eval result */

		return 0;
	}
}