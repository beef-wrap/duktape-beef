/*
*  Duktape public API for Duktape 2.99.99.
*
*  See the API reference for documentation on call semantics.  The exposed,
*  supported API is between the "BEGIN PUBLIC API" and "END PUBLIC API"
*  comments.  Other parts of the header are Duktape internal and related to
*  e.g. platform/compiler/feature detection.
*
*  Git commit 50af773b1b32067170786c2b7c661705ec7425d4 (v2.5.0-419-g50af773b).
*  Git branch master.
*
*  See Duktape AUTHORS.rst and LICENSE.txt for copyright and
*  licensing information.
*/

/* LICENSE.txt */
/*
*  The MIT License (MIT)
*  
*  Copyright (c) 2013-present, Duktape authors (see AUTHORS.rst)
*  
*  Permission is hereby granted, free of charge, to any person obtaining a copy
*  of this software and associated documentation files (the "Software"), to deal
*  in the Software without restriction, including without limitation the rights
*  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
*  copies of the Software, and to permit persons to whom the Software is
*  furnished to do so, subject to the following conditions:
*  
*  The above copyright notice and this permission notice shall be included in
*  all copies or substantial portions of the Software.
*  
*  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
*  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
*  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
*  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
*  THE SOFTWARE.
*/

/* AUTHORS.rst */
/*
*  ===============
*  Duktape authors
*  ===============
*  
*  Copyright
*  =========
*  
*  Duktape copyrights are held by its authors.  Each author has a copyright
*  to their contribution, and agrees to irrevocably license the contribution
*  under the Duktape ``LICENSE.txt``.
*  
*  Authors
*  =======
*  
*  Please include an e-mail address, a link to your GitHub profile, or something
*  similar to allow your contribution to be identified accurately.
*  
*  The following people have contributed code, website contents, or Wiki contents,
*  and agreed to irrevocably license their contributions under the Duktape
*  ``LICENSE.txt`` (in order of appearance):
*  
*  * Sami Vaarala <sami.vaarala@iki.fi>
*  * Niki Dobrev
*  * Andreas \u00d6man <andreas@lonelycoder.com>
*  * L\u00e1szl\u00f3 Lang\u00f3 <llango.u-szeged@partner.samsung.com>
*  * Legimet <legimet.calc@gmail.com>
*  * Karl Skomski <karl@skomski.com>
*  * Bruce Pascoe <fatcerberus1@gmail.com>
*  * Ren\u00e9 Hollander <rene@rene8888.at>
*  * Julien Hamaide (https://github.com/crazyjul)
*  * Sebastian G\u00f6tte (https://github.com/jaseg)
*  * Tomasz Magulski (https://github.com/magul)
*  * \D. Bohdan (https://github.com/dbohdan)
*  * Ond\u0159ej Jirman (https://github.com/megous)
*  * Sa\u00fal Ibarra Corretg\u00e9 <saghul@gmail.com>
*  * Jeremy HU <huxingyi@msn.com>
*  * Ole Andr\u00e9 Vadla Ravn\u00e5s (https://github.com/oleavr)
*  * Harold Brenes (https://github.com/harold-b)
*  * Oliver Crow (https://github.com/ocrow)
*  * Jakub Ch\u0142api\u0144ski (https://github.com/jchlapinski)
*  * Brett Vickers (https://github.com/beevik)
*  * Dominik Okwieka (https://github.com/okitec)
*  * Remko Tron\u00e7on (https://el-tramo.be)
*  * Romero Malaquias (rbsm@ic.ufal.br)
*  * Michael Drake <michael.drake@codethink.co.uk>
*  * Steven Don (https://github.com/shdon)
*  * Simon Stone (https://github.com/sstone1)
*  * \J. McC. (https://github.com/jmhmccr)
*  * Jakub Nowakowski (https://github.com/jimvonmoon)
*  * Tommy Nguyen (https://github.com/tn0502)
*  * Fabrice Fontaine (https://github.com/ffontaine)
*  * Christopher Hiller (https://github.com/boneskull)
*  * Gonzalo Diethelm (https://github.com/gonzus)
*  * Michal Kasperek (https://github.com/michalkas)
*  * Andrew Janke (https://github.com/apjanke)
*  * Steve Fan (https://github.com/stevefan1999)
*  * Edward Betts (https://github.com/edwardbetts)
*  * Ozhan Duz (https://github.com/webfolderio)
*  * Akos Kiss (https://github.com/akosthekiss)
*  * TheBrokenRail (https://github.com/TheBrokenRail)
*  * Jesse Doyle (https://github.com/jessedoyle)
*  * Gero Kuehn (https://github.com/dc6jgk)
*  * James Swift (https://github.com/phraemer)
*  * Luis de Bethencourt (https://github.com/luisbg)
*  * Ian Whyman (https://github.com/v00d00)
*  * Rick Sayre (https://github.com/whorfin)
*  * Craig Leres (https://github.com/leres)
*  * Maurici Abad (https://github.com/mauriciabad)
*  * Nancy Li (https://github.com/NancyLi1013)
*  * William Parks (https://github.com/WilliamParks)
*  * Sam Hellawell (https://github.com/samhellawell)
*  * Vladislavs Sokurenko (https://github.com/sokurenko)
*  * Luca Boccassi (https://github.com/bluca)
*  * Radu Rendec (https://github.com/rrendec)
*  * tinywrkb (https://github.com/tinywrkb)
*  * Christoph Kaser (https://github.com/ChristophKaser)
*  * Jonne Ransijn <jonne@yyny.dev>
*  * Liu Xiang <liuxiang@loongson.cn>
*  
*  Other contributions
*  ===================
*  
*  The following people have contributed something other than code (e.g. reported
*  bugs, provided ideas, etc; roughly in order of appearance):
*  
*  * Greg Burns
*  * Anthony Rabine
*  * Carlos Costa
*  * Aur\u00e9lien Bouilland
*  * Preet Desai (Pris Matic)
*  * judofyr (http://www.reddit.com/user/judofyr)
*  * Jason Woofenden
*  * Micha\u0142 Przyby\u015b
*  * Anthony Howe
*  * Conrad Pankoff
*  * Jim Schimpf
*  * Rajaran Gaunker (https://github.com/zimbabao)
*  * Andreas \u00d6man
*  * Doug Sanden
*  * Josh Engebretson (https://github.com/JoshEngebretson)
*  * Remo Eichenberger (https://github.com/remoe)
*  * Mamod Mehyar (https://github.com/mamod)
*  * David Demelier (https://github.com/markand)
*  * Tim Caswell (https://github.com/creationix)
*  * Mitchell Blank Jr (https://github.com/mitchblank)
*  * https://github.com/yushli
*  * Seo Sanghyeon (https://github.com/sanxiyn)
*  * Han ChoongWoo (https://github.com/tunz)
*  * Joshua Peek (https://github.com/josh)
*  * Bruce E. Pascoe (https://github.com/fatcerberus)
*  * https://github.com/Kelledin
*  * https://github.com/sstruchtrup
*  * Michael Drake (https://github.com/tlsa)
*  * https://github.com/chris-y
*  * Laurent Zubiaur (https://github.com/lzubiaur)
*  * Neil Kolban (https://github.com/nkolban)
*  * Wilhelm Wanecek (https://github.com/wanecek)
*  * Andrew Janke (https://github.com/apjanke)
*  * Unamer (https://github.com/unamer)
*  * Karl Dahlke (eklhad@gmail.com)
*  * https://github.com/k3a
*  
*  If you are accidentally missing from this list, send me an e-mail
*  (``sami.vaarala@iki.fi``) and I'll fix the omission.
*/

using System;
using System.Interop;

namespace duktape;

public static class duktape
{
	/*
	*  Version and Git commit identification
	*/

	/* Duktape version, (major * 10000) + (minor * 100) + patch.  Allows C code
* to #if (DUK_VERSION >= NNN) against Duktape API version.  The same value
	* is also available to ECMAScript code in Duktape.version.  Unofficial
	* development snapshots have 99 for patch level (e.g. 0.10.99 would be a
	* development version after 0.10.0 but before the next official release).
	*/
	public const c_long DUK_VERSION                       = 29999L;

	/* Git commit, describe, and branch for Duktape build.  Useful for
	* non-official snapshot builds so that application code can easily log
	* which Duktape snapshot was used.  Not available in the ECMAScript
	* environment.
	*/
	public const c_char* DUK_GIT_COMMIT                    = "50af773b1b32067170786c2b7c661705ec7425d4";
	public const c_char* DUK_GIT_DESCRIBE                  = "v2.5.0-419-g50af773b";
	public const c_char* DUK_GIT_BRANCH                    = "master";

	/* External duk_config.h provides platform/compiler/OS dependent
	* typedefs and macros, and DUK_USE_xxx config options so that
	* the rest of Duktape doesn't need to do any feature detection.
	* DUK_VERSION is defined before including so that configuration
	* snippets can react to it.
	*/
	// #include "duk_config.h"

	/*
	*  Public API specific typedefs
	*
	*  Many types are wrapped by Duktape for portability to rare platforms
	*  where e.g. 'int' is a 16-bit type.  See practical typing discussion
	*  in Duktape web documentation.
	*/

	public function duk_ret_t duk_c_function(duk_context* ctx);
	public function void* duk_alloc_function(void* udata, duk_size_t size);
	public function void* duk_realloc_function(void* udata, void* ptr, duk_size_t size);
	public function void duk_free_function(void* udata, void* ptr);
	public function void duk_fatal_function(void* udata, char* msg);
	public function void duk_decode_char_function(void* udata, duk_codepoint_t codepoint);
	public function duk_codepoint_t duk_map_char_function(void* udata, duk_codepoint_t codepoint);
	public function duk_ret_t duk_safe_call_function(duk_context* ctx, void* udata);
	public function duk_size_t duk_debug_read_function(void* udata, char* buffer, duk_size_t length);
	public function duk_size_t duk_debug_write_function(void* udata, char* buffer, duk_size_t length);
	public function duk_size_t duk_debug_peek_function(void* udata);
	public function void duk_debug_read_flush_function(void* udata);
	public function void duk_debug_write_flush_function(void* udata);
	public function duk_idx_t duk_debug_request_function(duk_context* ctx, void* udata, duk_idx_t nvalues);
	public function void duk_debug_detached_function(duk_context* ctx, void* udata);

	struct duk_thread_state
	{
		/* XXX: Enough space to hold internal suspend/resume structure.
		* This is rather awkward and to be fixed when the internal
		* structure is visible for the public API header.
		*/
		char[128] data;
	}

	struct duk_memory_functions
	{
		duk_alloc_function alloc_func;
		duk_realloc_function realloc_func;
		duk_free_function free_func;
		void* udata;
	}

	struct duk_function_list_entry
	{
		char* key;
		duk_c_function value;
		duk_idx_t nargs;
	}

	struct duk_number_list_entry
	{
		char* key;
		duk_double_t value;
	}

	struct duk_time_components
	{
		duk_double_t year; /* year, e.g. 2016, ECMAScript year range */
		duk_double_t month; /* month: 1-12 */
		duk_double_t day; /* day: 1-31 */
		duk_double_t hours; /* hour: 0-59 */
		duk_double_t minutes; /* minute: 0-59 */
		duk_double_t seconds; /* second: 0-59 (in POSIX time no leap second) */
		duk_double_t milliseconds; /* may contain sub-millisecond fractions */
		duk_double_t weekday; /* weekday: 0-6, 0=Sunday, 1=Monday, ..., 6=Saturday */
	}

	/*
	*  Constants
	*/

	/* Duktape debug protocol version used by this build. */
	public const c_int DUK_DEBUG_PROTOCOL_VERSION        = 2;

	/* Used to represent invalid index; if caller uses this without checking,
	* this index will map to a non-existent stack entry.  Also used in some
	* API calls as a marker to denote "no value".
	*/
	public const c_int DUK_INVALID_INDEX                 = c_int.MinValue;

	/* Indicates that a native function does not have a fixed number of args,
	* and the argument stack should not be capped/extended at all.
	*/
	public const duk_int_t DUK_VARARGS                       = -1;;

	/* Number of value stack entries (in addition to actual call arguments)
	* guaranteed to be allocated on entry to a Duktape/C function.
	*/
	public const c_uint DUK_API_ENTRY_STACK               = 64U;

	/* Value types, used by e.g. duk_get_type() */
	public const c_uint DUK_TYPE_MIN                      = 0U;
	public const c_uint DUK_TYPE_NONE                     = 0U /* no value, e.g. invalid index */;
	public const c_uint DUK_TYPE_UNDEFINED                = 1U /* ECMAScript undefined */;
	public const c_uint DUK_TYPE_null                     = 2U /* ECMAScript null */;
	public const c_uint DUK_TYPE_BOOLEAN                  = 3U /* ECMAScript boolean: 0 or 1 */;
	public const c_uint DUK_TYPE_NUMBER                   = 4U /* ECMAScript number: double */;
	public const c_uint DUK_TYPE_STRING                   = 5U /* ECMAScript string: CESU-8 / extended UTF-8 encoded */;
	public const c_uint DUK_TYPE_OBJECT                   = 6U /* ECMAScript object: includes objects, arrays, functions, threads */;
	public const c_uint DUK_TYPE_BUFFER                   = 7U /* fixed or dynamic, garbage collected byte buffer */;
	public const c_uint DUK_TYPE_POINTER                  = 8U /* raw void pointer */;
	public const c_uint DUK_TYPE_LIGHTFUNC                = 9U /* lightweight function pointer */;
	public const c_uint DUK_TYPE_MAX                      = 9U;

	/* Value mask types, used by e.g. duk_get_type_mask() */
	public const c_uint DUK_TYPE_MASK_NONE                 = 1U << DUK_TYPE_NONE;
	public const c_uint DUK_TYPE_MASK_UNDEFINED            = 1U << DUK_TYPE_UNDEFINED;
	public const c_uint DUK_TYPE_MASK_null                 = 1U << DUK_TYPE_null;
	public const c_uint DUK_TYPE_MASK_BOOLEAN              = 1U << DUK_TYPE_BOOLEAN;
	public const c_uint DUK_TYPE_MASK_NUMBER               = 1U << DUK_TYPE_NUMBER;
	public const c_uint DUK_TYPE_MASK_STRING               = 1U << DUK_TYPE_STRING;
	public const c_uint DUK_TYPE_MASK_OBJECT               = 1U << DUK_TYPE_OBJECT;
	public const c_uint DUK_TYPE_MASK_BUFFER               = 1U << DUK_TYPE_BUFFER;
	public const c_uint DUK_TYPE_MASK_POINTER              = 1U << DUK_TYPE_POINTER;
	public const c_uint DUK_TYPE_MASK_LIGHTFUNC            = 1U << DUK_TYPE_LIGHTFUNC;
	public const c_uint DUK_TYPE_MASK_THROW                = 1U << 10 /* internal flag value: throw if mask doesn't match */;
	public const c_uint DUK_TYPE_MASK_PROMOTE              = 1U << 11 /* internal flag value: promote to object if mask matches */;

	/* Coercion hints */
	public const c_int DUK_HINT_NONE                     = 0; /* prefer number, unless input is a Date, in which
															* case prefer string (E5 Section 8.12.8)
															*/
	public const c_int DUK_HINT_STRING                   = 1; /* prefer string */
	public const c_int DUK_HINT_NUMBER                   = 2; /* prefer number */

	/* Enumeration flags for duk_enum() */
	public const c_uint DUK_ENUM_INCLUDE_NONENUMERABLE    = 1U << 0; /* enumerate non-numerable properties in addition to enumerable */
	public const c_uint DUK_ENUM_INCLUDE_HIDDEN           = 1U << 1; /* enumerate hidden symbols too (in Duktape 1.x called internal properties) */
	public const c_uint DUK_ENUM_INCLUDE_SYMBOLS          = 1U << 2; /* enumerate symbols */
	public const c_uint DUK_ENUM_EXCLUDE_STRINGS          = 1U << 3; /* exclude strings */
	public const c_uint DUK_ENUM_OWN_PROPERTIES_ONLY      = 1U << 4; /* don't walk prototype chain, only check own properties */
	public const c_uint DUK_ENUM_ARRAY_INDICES_ONLY       = 1U << 5; /* only enumerate array indices */
	/* XXX: misleading name */
	public const c_uint DUK_ENUM_SORT_ARRAY_INDICES       = 1U << 6; /* sort array indices (applied to full enumeration result, including inherited array indices); XXX: misleading name */
	public const c_uint DUK_ENUM_NO_PROXY_BEHAVIOR        = 1U << 7; /* enumerate a proxy object itself without invoking proxy behavior */

	/* Compilation flags for duk_compile() and duk_eval() */
	/* DUK_COMPILE_xxx bits 0-2 are reserved for an internal 'nargs' argument.
	*/
	public const c_uint DUK_COMPILE_EVAL                  = 1U << 3; /* compile eval code (instead of global code) */
	public const c_uint DUK_COMPILE_FUNCTION              = 1U << 4; /* compile function code (instead of global code) */
	public const c_uint DUK_COMPILE_STRICT                = 1U << 5; /* use strict (outer) context for global, eval, or function code */
	public const c_uint DUK_COMPILE_SHEBANG               = 1U << 6; /* allow shebang ('#! ...') comment on first line of source */
	public const c_uint DUK_COMPILE_SAFE                  = 1U << 7; /* (internal) catch compilation errors */
	public const c_uint DUK_COMPILE_NORESULT              = 1U << 8; /* (internal) omit eval result */
	public const c_uint DUK_COMPILE_NOSOURCE              = 1U << 9; /* (internal) no source string on stack */
	public const c_uint DUK_COMPILE_STRLEN                = 1U << 10; /* (internal) take strlen() of src_buffer (avoids double evaluation in macro) */
	public const c_uint DUK_COMPILE_NOFILENAME            = 1U << 11; /* (internal) no filename on stack */
	public const c_uint DUK_COMPILE_FUNCEXPR              = 1U << 12; /* (internal) source is a function expression (used for Function constructor) */

	/* Flags for duk_def_prop() and its variants; base flags + a lot of convenience shorthands */
	public const c_uint DUK_DEFPROP_WRITABLE              = 1U << 0; /* set writable (effective if DUK_DEFPROP_HAVE_WRITABLE set) */
	public const c_uint DUK_DEFPROP_ENUMERABLE            = 1U << 1; /* set enumerable (effective if DUK_DEFPROP_HAVE_ENUMERABLE set) */
	public const c_uint DUK_DEFPROP_CONFIGURABLE          = 1U << 2; /* set configurable (effective if DUK_DEFPROP_HAVE_CONFIGURABLE set) */
	public const c_uint DUK_DEFPROP_RESERVED3             = 1U << 3; /* INTERNAL: reserved, internally accessor flag */
	public const c_uint DUK_DEFPROP_RESERVED4             = 1U << 4; /* INTERNAL: reserved */
	public const c_uint DUK_DEFPROP_RESERVED5             = 1U << 5; /* INTERNAL: reserved */
	public const c_uint DUK_DEFPROP_RESERVED6             = 1U << 6; /* INTERNAL: reserved */
	public const c_uint DUK_DEFPROP_RESERVED7             = 1U << 7; /* INTERNAL: reserved */
	public const c_uint DUK_DEFPROP_HAVE_SHIFT_COUNT     =  8; /* INTERNAL */
	public const c_uint DUK_DEFPROP_HAVE_WRITABLE         = 1U << 8; /* set/clear writable */
	public const c_uint DUK_DEFPROP_HAVE_ENUMERABLE       = 1U << 9; /* set/clear enumerable */
	public const c_uint DUK_DEFPROP_HAVE_CONFIGURABLE     = 1U << 10; /* set/clear configurable */
	public const c_uint DUK_DEFPROP_HAVE_VALUE            = 1U << 11; /* set value (given on value stack) */
	public const c_uint DUK_DEFPROP_HAVE_GETTER           = 1U << 12; /* set getter (given on value stack) */
	public const c_uint DUK_DEFPROP_HAVE_SETTER           = 1U << 13; /* set setter (given on value stack) */
	public const c_uint DUK_DEFPROP_FORCE                 = 1U << 14; /* force change if possible, may still fail for e.g. virtual properties */
	public const c_uint DUK_DEFPROP_THROW                 = 1U << 15; /* INTERNAL: throw on errors */
	public const c_uint DUK_DEFPROP_SET_WRITABLE          = DUK_DEFPROP_HAVE_WRITABLE | DUK_DEFPROP_WRITABLE;
	public const c_uint DUK_DEFPROP_CLEAR_WRITABLE       =  DUK_DEFPROP_HAVE_WRITABLE;
	public const c_uint DUK_DEFPROP_SET_ENUMERABLE        = DUK_DEFPROP_HAVE_ENUMERABLE | DUK_DEFPROP_ENUMERABLE;
	public const c_uint DUK_DEFPROP_CLEAR_ENUMERABLE     =  DUK_DEFPROP_HAVE_ENUMERABLE;
	public const c_uint DUK_DEFPROP_SET_CONFIGURABLE      = DUK_DEFPROP_HAVE_CONFIGURABLE | DUK_DEFPROP_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_CLEAR_CONFIGURABLE   =  DUK_DEFPROP_HAVE_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_W                    =  DUK_DEFPROP_WRITABLE;
	public const c_uint DUK_DEFPROP_E                    =  DUK_DEFPROP_ENUMERABLE;
	public const c_uint DUK_DEFPROP_C                    =  DUK_DEFPROP_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_WE                    = DUK_DEFPROP_WRITABLE | DUK_DEFPROP_ENUMERABLE;
	public const c_uint DUK_DEFPROP_WC                    = DUK_DEFPROP_WRITABLE | DUK_DEFPROP_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_EC                    = DUK_DEFPROP_ENUMERABLE | DUK_DEFPROP_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_WEC                   = DUK_DEFPROP_WRITABLE | DUK_DEFPROP_ENUMERABLE | DUK_DEFPROP_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_HAVE_W               =  DUK_DEFPROP_HAVE_WRITABLE;
	public const c_uint DUK_DEFPROP_HAVE_E               =  DUK_DEFPROP_HAVE_ENUMERABLE;
	public const c_uint DUK_DEFPROP_HAVE_C               =  DUK_DEFPROP_HAVE_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_HAVE_WE               = DUK_DEFPROP_HAVE_WRITABLE | DUK_DEFPROP_HAVE_ENUMERABLE;
	public const c_uint DUK_DEFPROP_HAVE_WC               = DUK_DEFPROP_HAVE_WRITABLE | DUK_DEFPROP_HAVE_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_HAVE_EC               = DUK_DEFPROP_HAVE_ENUMERABLE | DUK_DEFPROP_HAVE_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_HAVE_WEC              = DUK_DEFPROP_HAVE_WRITABLE | DUK_DEFPROP_HAVE_ENUMERABLE | DUK_DEFPROP_HAVE_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_SET_W                =  DUK_DEFPROP_SET_WRITABLE;
	public const c_uint DUK_DEFPROP_SET_E                =  DUK_DEFPROP_SET_ENUMERABLE;
	public const c_uint DUK_DEFPROP_SET_C                =  DUK_DEFPROP_SET_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_SET_WE                = DUK_DEFPROP_SET_WRITABLE | DUK_DEFPROP_SET_ENUMERABLE;
	public const c_uint DUK_DEFPROP_SET_WC                = DUK_DEFPROP_SET_WRITABLE | DUK_DEFPROP_SET_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_SET_EC                = DUK_DEFPROP_SET_ENUMERABLE | DUK_DEFPROP_SET_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_SET_WEC               = DUK_DEFPROP_SET_WRITABLE | DUK_DEFPROP_SET_ENUMERABLE | DUK_DEFPROP_SET_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_CLEAR_W              =  DUK_DEFPROP_CLEAR_WRITABLE;
	public const c_uint DUK_DEFPROP_CLEAR_E              =  DUK_DEFPROP_CLEAR_ENUMERABLE;
	public const c_uint DUK_DEFPROP_CLEAR_C              =  DUK_DEFPROP_CLEAR_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_CLEAR_WE              = DUK_DEFPROP_CLEAR_WRITABLE | DUK_DEFPROP_CLEAR_ENUMERABLE;
	public const c_uint DUK_DEFPROP_CLEAR_WC              = DUK_DEFPROP_CLEAR_WRITABLE | DUK_DEFPROP_CLEAR_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_CLEAR_EC              = DUK_DEFPROP_CLEAR_ENUMERABLE | DUK_DEFPROP_CLEAR_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_CLEAR_WEC             = DUK_DEFPROP_CLEAR_WRITABLE | DUK_DEFPROP_CLEAR_ENUMERABLE | DUK_DEFPROP_CLEAR_CONFIGURABLE;
	public const c_uint DUK_DEFPROP_ATTR_W                = DUK_DEFPROP_HAVE_WEC | DUK_DEFPROP_W;
	public const c_uint DUK_DEFPROP_ATTR_E                = DUK_DEFPROP_HAVE_WEC | DUK_DEFPROP_E;
	public const c_uint DUK_DEFPROP_ATTR_C                = DUK_DEFPROP_HAVE_WEC | DUK_DEFPROP_C;
	public const c_uint DUK_DEFPROP_ATTR_WE               = DUK_DEFPROP_HAVE_WEC | DUK_DEFPROP_WE;
	public const c_uint DUK_DEFPROP_ATTR_WC               = DUK_DEFPROP_HAVE_WEC | DUK_DEFPROP_WC;
	public const c_uint DUK_DEFPROP_ATTR_EC               = DUK_DEFPROP_HAVE_WEC | DUK_DEFPROP_EC;
	public const c_uint DUK_DEFPROP_ATTR_WEC              = DUK_DEFPROP_HAVE_WEC | DUK_DEFPROP_WEC;

	/* Flags for duk_push_thread_raw() */
	public const c_int DUK_THREAD_NEW_GLOBAL_ENV         = 1U << 0; /* create a new global environment */

	/* Flags for duk_gc() */
	public const c_int DUK_GC_COMPACT                    = 1U << 0; /* compact heap objects */

	/* Error codes (must be 8 bits at most, see duk_error.h) */
	public const c_int DUK_ERR_NONE                     =  0; /* no error (e.g. from duk_get_error_code()) */
	public const c_int DUK_ERR_ERROR                    =  1; /* Error */
	public const c_int DUK_ERR_EVAL_ERROR               =  2; /* EvalError */
	public const c_int DUK_ERR_RANGE_ERROR              =  3; /* RangeError */
	public const c_int DUK_ERR_REFERENCE_ERROR          =  4; /* ReferenceError */
	public const c_int DUK_ERR_SYNTAX_ERROR             =  5; /* SyntaxError */
	public const c_int DUK_ERR_TYPE_ERROR               =  6; /* TypeError */
	public const c_int DUK_ERR_URI_ERROR                =  7; /* URIError */

	/* Return codes for C functions (shortcut for throwing an error) */
	public const c_int DUK_RET_ERROR                    =  -DUK_ERR_ERROR;
	public const c_int DUK_RET_EVAL_ERROR               =  -DUK_ERR_EVAL_ERROR;
	public const c_int DUK_RET_RANGE_ERROR              =  -DUK_ERR_RANGE_ERROR;
	public const c_int DUK_RET_REFERENCE_ERROR          =  -DUK_ERR_REFERENCE_ERROR;
	public const c_int DUK_RET_SYNTAX_ERROR             =  -DUK_ERR_SYNTAX_ERROR;
	public const c_int DUK_RET_TYPE_ERROR               =  -DUK_ERR_TYPE_ERROR;
	public const c_int DUK_RET_URI_ERROR                =  -DUK_ERR_URI_ERROR;

	/* Return codes for protected calls (duk_safe_call(), duk_pcall()) */
	public const c_int DUK_EXEC_SUCCESS                 =  0;
	public const c_int DUK_EXEC_ERROR                   =  1;

	/* Debug levels for DUK_USE_DEBUG_WRITE(). */
	public const c_int DUK_LEVEL_DEBUG                  =  0;
	public const c_int DUK_LEVEL_DDEBUG                 =  1;
	public const c_int DUK_LEVEL_DDDEBUG                =  2;

	/*
	*  If no variadic macros, __FILE__ and __LINE__ are passed through globals
	*  which is ugly and not thread safe.
	*/

#if !DUK_API_VARIADIC_MACROS
	typealias duk_api_global_filename = char*;
	typealias duk_api_global_line = duk_int_t;
#endif

	/*
	*  Context management
	*/

	[CLink] public static extern duk_context* duk_create_heap(duk_alloc_function alloc_func, duk_realloc_function realloc_func, duk_free_function free_func, void* heap_udata, duk_fatal_function fatal_handler);
	[CLink] public static extern void duk_destroy_heap(duk_context* ctx);

	[CLink] public static extern void duk_suspend(duk_context* ctx, duk_thread_state* state);
	[CLink] public static extern void duk_resume(duk_context* ctx, duk_thread_state* state);

	public static mixin duk_create_heap_default() { duk_create_heap(null, null, null, null, null) }

	/*
	*  Memory management
	*
	*  Raw functions have no side effects (cannot trigger GC).
	*/

	[CLink] public static extern void* duk_alloc_raw(duk_context* ctx, duk_size_t size);
	[CLink] public static extern void duk_free_raw(duk_context* ctx, void* ptr);
	[CLink] public static extern void* duk_realloc_raw(duk_context* ctx, void* ptr, duk_size_t size);
	[CLink] public static extern void* duk_alloc(duk_context* ctx, duk_size_t size);
	[CLink] public static extern void duk_free(duk_context* ctx, void* ptr);
	[CLink] public static extern void* duk_realloc(duk_context* ctx, void* ptr, duk_size_t size);
	[CLink] public static extern void duk_get_memory_functions(duk_context* ctx, duk_memory_functions* out_funcs);
	[CLink] public static extern void duk_gc(duk_context* ctx, duk_uint_t flags);

	/*
	*  Error handling
	*/

	[CLink] public static extern void duk_throw_raw(duk_context* ctx);

	public static mixin duk_throw(duk_context* ctx)
	{
		duk_throw_raw(ctx)
	}

	[CLink] public static extern void duk_fatal_raw(duk_context* ctx, char* err_msg);

	public static mixin duk_fatal(duk_context* ctx, char* err_msg)
	{
		duk_fatal_raw(ctx, err_msg)
	}

	[CLink] public static extern void duk_error_raw(duk_context* ctx, duk_errcode_t err_code, char* filename, duk_int_t line, char* fmt, ...);

#if DUK_API_VARIADIC_MACROS
	// public static mixin duk_error(duk_context* ctx, duk_errcode_t err_code, ...)  {
	//     duk_error_raw(ctx, err_code, DUK_FILE_MACRO, DUK_LINE_MACRO, __VA_ARGS__)
	// }
	// public static mixin duk_generic_error(duk_context* ctx, ...)  {
	//     duk_error_raw(ctx, DUK_ERR_ERROR, DUK_FILE_MACRO, DUK_LINE_MACRO, __VA_ARGS__)
	// }
	// public static mixin duk_eval_error(duk_context* ctx, ...)  {
	//     duk_error_raw(ctx, DUK_ERR_EVAL_ERROR, DUK_FILE_MACRO, DUK_LINE_MACRO, __VA_ARGS__)
	// }
	// public static mixin duk_range_error(duk_context* ctx, ...)  {
	//     duk_error_raw(ctx, DUK_ERR_RANGE_ERROR, DUK_FILE_MACRO, DUK_LINE_MACRO, __VA_ARGS__)
	// }
	// public static mixin duk_reference_error(duk_context* ctx, ...)  {
	//     duk_error_raw(ctx, DUK_ERR_REFERENCE_ERROR, DUK_FILE_MACRO, DUK_LINE_MACRO, __VA_ARGS__)
	// }
	// public static mixin duk_syntax_error(duk_context* ctx, ...)  {
	//     duk_error_raw(ctx, DUK_ERR_SYNTAX_ERROR, DUK_FILE_MACRO, DUK_LINE_MACRO, __VA_ARGS__)
	// }
	// public static mixin duk_type_error(duk_context* ctx, ...)  {
	//     duk_error_raw(ctx, DUK_ERR_TYPE_ERROR, DUK_FILE_MACRO, DUK_LINE_MACRO, __VA_ARGS__)
	// }
	// public static mixin duk_uri_error(duk_context* ctx, ...)  {
	//     duk_error_raw(ctx, DUK_ERR_URI_ERROR, DUK_FILE_MACRO, DUK_LINE_MACRO, __VA_ARGS__)
	// }
#else /* DUK_API_VARIADIC_MACROS */
	/* For legacy compilers without variadic macros a macro hack is used to allow
	* variable arguments.  While the macro allows "return duk_error(...)", it
	* will fail with e.g. "(void) duk_error(...)".  The calls are noreturn but
	* with a return value to allow the "return duk_error(...)" idiom.  This may
	* cause some compiler warnings, but without noreturn the generated code is
	* often worse.  The same approach as with variadic macros (using
	* "(duk_error(...), 0)") won't work due to the macro hack structure.
	*/

	[CLink] public static extern duk_ret_t duk_error_stash(duk_context* ctx, duk_errcode_t err_code, char* fmt, ...);
	[CLink] public static extern duk_ret_t duk_generic_error_stash(duk_context* ctx, char* fmt, ...);
	[CLink] public static extern duk_ret_t duk_eval_error_stash(duk_context* ctx, char* fmt, ...);
	[CLink] public static extern duk_ret_t duk_range_error_stash(duk_context* ctx, char* fmt, ...);
	[CLink] public static extern duk_ret_t duk_reference_error_stash(duk_context* ctx, char* fmt, ...);
	[CLink] public static extern duk_ret_t duk_syntax_error_stash(duk_context* ctx, char* fmt, ...);
	[CLink] public static extern duk_ret_t duk_type_error_stash(duk_context* ctx, char* fmt, ...);
	[CLink] public static extern duk_ret_t duk_uri_error_stash(duk_context* ctx, char* fmt, ...);

	// #define duk_error  \
	//     (duk_api_global_filename = (char* ) DUK_FILE_MACRO, \
	//     duk_api_global_line = (duk_int_t) DUK_LINE_MACRO, \
	//     duk_error_stash)  /* last value is func pointer, arguments follow in parens */
	// #define duk_generic_error  \
	//     (duk_api_global_filename = (char* ) DUK_FILE_MACRO, \
	//     duk_api_global_line = (duk_int_t) DUK_LINE_MACRO, \
	//     duk_generic_error_stash)
	// #define duk_eval_error  \
	//     (duk_api_global_filename = (char* ) DUK_FILE_MACRO, \
	//     duk_api_global_line = (duk_int_t) DUK_LINE_MACRO, \
	//     duk_eval_error_stash)
	// #define duk_range_error  \
	//     (duk_api_global_filename = (char* ) DUK_FILE_MACRO, \
	//     duk_api_global_line = (duk_int_t) DUK_LINE_MACRO, \
	//     duk_range_error_stash)
	// #define duk_reference_error  \
	//     (duk_api_global_filename = (char* ) DUK_FILE_MACRO, \
	//     duk_api_global_line = (duk_int_t) DUK_LINE_MACRO, \
	//     duk_reference_error_stash)
	// #define duk_syntax_error  \
	//     (duk_api_global_filename = (char* ) DUK_FILE_MACRO, \
	//     duk_api_global_line = (duk_int_t) DUK_LINE_MACRO, \
	//     duk_syntax_error_stash)
	// #define duk_type_error  \
	//     (duk_api_global_filename = (char* ) DUK_FILE_MACRO, \
	//     duk_api_global_line = (duk_int_t) DUK_LINE_MACRO, \
	//     duk_type_error_stash)
	// #define duk_uri_error  \
	//     (duk_api_global_filename = (char* ) DUK_FILE_MACRO, \
	//     duk_api_global_line = (duk_int_t) DUK_LINE_MACRO, \
	//     duk_uri_error_stash)
#endif /* DUK_API_VARIADIC_MACROS */ 

    [CLink] public static extern void duk_error_va_raw(duk_context* ctx, duk_errcode_t err_code, char* filename, duk_int_t line, char* fmt, va_list ap);

    /*#define duk_error_va(ctx,err_code,fmt,ap)  \
		(duk_error_va_raw((ctx), (duk_errcode_t) (err_code), (const char* ) (DUK_FILE_MACRO), (duk_int_t) (DUK_LINE_MACRO), (fmt), (ap)), (duk_ret_t) 0)
	#define duk_generic_error_va(ctx,fmt,ap)  \
		(duk_error_va_raw((ctx), (duk_errcode_t) DUK_ERR_ERROR, (const char* ) (DUK_FILE_MACRO), (duk_int_t) (DUK_LINE_MACRO), (fmt), (ap)), (duk_ret_t) 0)
	#define duk_eval_error_va(ctx,fmt,ap)  \
		(duk_error_va_raw((ctx), (duk_errcode_t) DUK_ERR_EVAL_ERROR, (const char* ) (DUK_FILE_MACRO), (duk_int_t) (DUK_LINE_MACRO), (fmt), (ap)), (duk_ret_t) 0)
	#define duk_range_error_va(ctx,fmt,ap)  \
		(duk_error_va_raw((ctx), (duk_errcode_t) DUK_ERR_RANGE_ERROR, (const char* ) (DUK_FILE_MACRO), (duk_int_t) (DUK_LINE_MACRO), (fmt), (ap)), (duk_ret_t) 0)
	#define duk_reference_error_va(ctx,fmt,ap)  \
		(duk_error_va_raw((ctx), (duk_errcode_t) DUK_ERR_REFERENCE_ERROR, (const char* ) (DUK_FILE_MACRO), (duk_int_t) (DUK_LINE_MACRO), (fmt), (ap)), (duk_ret_t) 0)
	#define duk_syntax_error_va(ctx,fmt,ap)  \
		(duk_error_va_raw((ctx), (duk_errcode_t) DUK_ERR_SYNTAX_ERROR, (const char* ) (DUK_FILE_MACRO), (duk_int_t) (DUK_LINE_MACRO), (fmt), (ap)), (duk_ret_t) 0)
	#define duk_type_error_va(ctx,fmt,ap)  \
		(duk_error_va_raw((ctx), (duk_errcode_t) DUK_ERR_TYPE_ERROR, (const char* ) (DUK_FILE_MACRO), (duk_int_t) (DUK_LINE_MACRO), (fmt), (ap)), (duk_ret_t) 0)
	#define duk_uri_error_va(ctx,fmt,ap)  \
		(duk_error_va_raw((ctx), (duk_errcode_t) DUK_ERR_URI_ERROR, (const char* ) (DUK_FILE_MACRO), (duk_int_t) (DUK_LINE_MACRO), (fmt), (ap)), (duk_ret_t) 0)*/
    
    /*
    *  Other state related functions
    */

    [CLink] public static extern duk_bool_t duk_is_strict_call(duk_context* ctx);
    [CLink] public static extern duk_bool_t duk_is_constructor_call(duk_context* ctx);

    /*
    *  Stack management
    */

    [CLink] public static extern duk_idx_t duk_normalize_index(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_idx_t duk_require_normalize_index(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_valid_index(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void duk_require_valid_index(duk_context* ctx, duk_idx_t idx);

    [CLink] public static extern duk_idx_t duk_get_top(duk_context* ctx);
    [CLink] public static extern void duk_set_top(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_idx_t duk_get_top_index(duk_context* ctx);
    [CLink] public static extern duk_idx_t duk_require_top_index(duk_context* ctx);

    /* Although extra/top could be an unsigned type here, using a signed type
    * makes the API more robust to calling code calculation errors or corner
    * cases (where caller might occasionally come up with negative values).
    * Negative values are treated as zero, which is better than casting them
    * to a large unsigned number.  (This principle is used elsewhere in the
    * API too.)
    */
    [CLink] public static extern duk_bool_t duk_check_stack(duk_context* ctx, duk_idx_t extra);
    [CLink] public static extern void duk_require_stack(duk_context* ctx, duk_idx_t extra);
    [CLink] public static extern duk_bool_t duk_check_stack_top(duk_context* ctx, duk_idx_t top);
    [CLink] public static extern void duk_require_stack_top(duk_context* ctx, duk_idx_t top);

    /*
    *  Stack manipulation (other than push/pop)
    */

    [CLink] public static extern void duk_swap(duk_context* ctx, duk_idx_t idx1, duk_idx_t idx2);
    [CLink] public static extern void duk_swap_top(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void duk_dup(duk_context* ctx, duk_idx_t from_idx);
    [CLink] public static extern void duk_dup_top(duk_context* ctx);
    [CLink] public static extern void duk_insert(duk_context* ctx, duk_idx_t to_idx);
    [CLink] public static extern void duk_pull(duk_context* ctx, duk_idx_t from_idx);
    [CLink] public static extern void duk_replace(duk_context* ctx, duk_idx_t to_idx);
    [CLink] public static extern void duk_copy(duk_context* ctx, duk_idx_t from_idx, duk_idx_t to_idx);
    [CLink] public static extern void duk_remove(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void duk_xcopymove_raw(duk_context* to_ctx, duk_context* from_ctx, duk_idx_t count, duk_bool_t is_copy);

    public static mixin duk_xmove_top(duk_context* to_ctx, duk_context* from_ctx, duk_idx_t count) {
        duk_xcopymove_raw(to_ctx, from_ctx, count, 0 /*is_copy*/)
    }

    public static mixin duk_xcopy_top(duk_context* to_ctx, duk_context* from_ctx, duk_idx_t count) {
        duk_xcopymove_raw(to_ctx, from_ctx, count, 1 /*is_copy*/)
    }

    /*
    *  Push operations
    *
    *  Push functions return the absolute (relative to bottom of frame)
    *  position of the pushed value for convenience.
    *
    *  Note: duk_dup() is technically a push.
    */

    [CLink] public static extern void duk_push_undefined(duk_context*ctx);
    [CLink] public static extern void duk_push_null(duk_context* ctx);
    [CLink] public static extern void duk_push_boolean(duk_context* ctx, duk_bool_t val);
    [CLink] public static extern void duk_push_true(duk_context* ctx);
    [CLink] public static extern void duk_push_false(duk_context* ctx);
    [CLink] public static extern void duk_push_number(duk_context* ctx, duk_double_t val);
    [CLink] public static extern void duk_push_nan(duk_context* ctx);
    [CLink] public static extern void duk_push_int(duk_context* ctx, duk_int_t val);
    [CLink] public static extern void duk_push_uint(duk_context* ctx, duk_uint_t val);
    [CLink] public static extern char* duk_push_string(duk_context* ctx, char* str);
    [CLink] public static extern char* duk_push_lstring(duk_context* ctx, char* str, duk_size_t len);
    [CLink] public static extern void duk_push_pointer(duk_context* ctx, void *p);
    [CLink] public static extern char* duk_push_sprintf(duk_context* ctx, char* fmt, ...);
    [CLink] public static extern char* duk_push_vsprintf(duk_context* ctx, char* fmt, va_list ap);

    /* duk_push_literal() may evaluate its argument (a C string literal) more than
    * once on purpose.  When speed is preferred, sizeof() avoids an unnecessary
    * strlen() at runtime.  Sizeof("foo") == 4, so subtract 1.  The argument
    * must be non-null and should not contain internal NUL characters as the
    * behavior will then depend on config options.
    */
#if DUK_USE_PREFER_SIZE
    public static mixin duk_push_literal(ctx,cstring)  { 
        duk_push_string(ctx, cstring) 
    }
#else
    [CLink] public static extern char* duk_push_literal_raw(duk_context* ctx, char* str, duk_size_t len);

    public static mixin duk_push_literal(duk_context* ctx, char* cstring) {
        duk_push_literal_raw(ctx, cstring, (.)scope String(cstring).Length - 1U)
    }
#endif

    [CLink] public static extern void duk_push_this(duk_context* ctx);
    [CLink] public static extern void duk_push_new_target(duk_context* ctx);
    [CLink] public static extern void duk_push_current_function(duk_context* ctx);
    [CLink] public static extern void duk_push_current_thread(duk_context* ctx);
    [CLink] public static extern void duk_push_global_object(duk_context* ctx);
    [CLink] public static extern void duk_push_heap_stash(duk_context* ctx);
    [CLink] public static extern void duk_push_global_stash(duk_context* ctx);
    [CLink] public static extern void duk_push_thread_stash(duk_context* ctx, duk_context* target_ctx);

    [CLink] public static extern duk_idx_t duk_push_object(duk_context* ctx);
    [CLink] public static extern duk_idx_t duk_push_bare_object(duk_context* ctx);
    [CLink] public static extern duk_idx_t duk_push_array(duk_context* ctx);
    [CLink] public static extern duk_idx_t duk_push_bare_array(duk_context* ctx);
    [CLink] public static extern duk_idx_t duk_push_c_function(duk_context* ctx, duk_c_function func, duk_idx_t nargs);
    [CLink] public static extern duk_idx_t duk_push_c_lightfunc(duk_context* ctx, duk_c_function func, duk_idx_t nargs, duk_idx_t length, duk_int_t magic);
    [CLink] public static extern duk_idx_t duk_push_thread_raw(duk_context* ctx, duk_uint_t flags);
    [CLink] public static extern duk_idx_t duk_push_proxy(duk_context* ctx, duk_uint_t proxy_flags);

    public static mixin duk_push_thread(duk_context* ctx){
        duk_push_thread_raw(ctx, 0 /*flags*/)
    }

    public static mixin duk_push_thread_new_globalenv(duk_context* ctx){
        duk_push_thread_raw(ctx, DUK_THREAD_NEW_GLOBAL_ENV /*flags*/)
    }

    [CLink] public static extern duk_idx_t duk_push_error_object_raw(duk_context* ctx, duk_errcode_t err_code, char* filename, duk_int_t line, char* fmt, ...);

#if DUK_API_VARIADIC_MACROS
    // #define duk_push_error_object(ctx, duk_errcode_t err_code, ...)  \
    //     duk_push_error_object_raw(ctx, err_code, (char* ) DUK_FILE_MACRO, (duk_int_t) DUK_LINE_MACRO, __VA_ARGS__)
#else
    [CLink] public static extern duk_idx_t duk_push_error_object_stash(duk_context* ctx, duk_errcode_t err_code, char* fmt, ...);
    /* Note: parentheses are required so that the comma expression works in assignments. */
    // #define duk_push_error_object  \
    //     (duk_api_global_filename = (char* ) DUK_FILE_MACRO, \
    //     duk_api_global_line = (duk_int_t) DUK_LINE_MACRO, \
    //     duk_push_error_object_stash)  /* last value is func pointer, arguments follow in parens */
#endif

    [CLink] public static extern duk_idx_t duk_push_error_object_va_raw(duk_context* ctx, duk_errcode_t err_code, char* filename, duk_int_t line, char* fmt, va_list ap);
    
    //#define duk_push_error_object_va(ctx,err_code,fmt,ap)  \
	//	duk_push_error_object_va_raw((ctx), (err_code), (const char* ) (DUK_FILE_MACRO), (duk_int_t) (DUK_LINE_MACRO), (fmt), (ap))

    public const c_int DUK_BUF_FLAG_DYNAMIC   = 1 << 0;    /* internal flag: dynamic buffer */
    public const c_int DUK_BUF_FLAG_EXTERNAL  = 1 << 1;    /* internal flag: external buffer */
    public const c_int DUK_BUF_FLAG_NOZERO    = 1 << 2;    /* internal flag: don't zero allocated buffer */

    [CLink] public static extern void *duk_push_buffer_raw(duk_context* ctx, duk_size_t size, duk_small_uint_t flags);

    public static mixin duk_push_buffer(duk_context* ctx, duk_size_t size, bool dynamic) {
        duk_push_buffer_raw(ctx, size, dynamic ? (.)DUK_BUF_FLAG_DYNAMIC : 0)
    }

    public static mixin duk_push_fixed_buffer(duk_context* ctx, duk_size_t size) {
        duk_push_buffer_raw(ctx, size, 0 /*flags*/)
    }

    public static mixin duk_push_dynamic_buffer(duk_context* ctx, duk_size_t size) {
        duk_push_buffer_raw(ctx, size, DUK_BUF_FLAG_DYNAMIC /*flags*/)
    }

    public static mixin duk_push_external_buffer(duk_context* ctx) {
        duk_push_buffer_raw(ctx, 0, DUK_BUF_FLAG_DYNAMIC | DUK_BUF_FLAG_EXTERNAL)
    }

    public const c_int DUK_BUFOBJ_ARRAYBUFFER         = 0;
    public const c_int DUK_BUFOBJ_NODEJS_BUFFER       = 1;
    public const c_int DUK_BUFOBJ_DATAVIEW            = 2;
    public const c_int DUK_BUFOBJ_INT8ARRAY           = 3;
    public const c_int DUK_BUFOBJ_UINT8ARRAY          = 4;
    public const c_int DUK_BUFOBJ_UINT8CLAMPEDARRAY   = 5;
    public const c_int DUK_BUFOBJ_INT16ARRAY          = 6;
    public const c_int DUK_BUFOBJ_UINT16ARRAY         = 7;
    public const c_int DUK_BUFOBJ_INT32ARRAY          = 8;
    public const c_int DUK_BUFOBJ_UINT32ARRAY         = 9;
    public const c_int DUK_BUFOBJ_FLOAT32ARRAY        = 10;
    public const c_int DUK_BUFOBJ_FLOAT64ARRAY        = 11;

    [CLink] public static extern void duk_push_buffer_object(duk_context* ctx, duk_idx_t idx_buffer, duk_size_t byte_offset, duk_size_t byte_length, duk_uint_t flags);

    [CLink] public static extern duk_idx_t duk_push_heapptr(duk_context* ctx, void *ptr);

    /*
    *  Pop operations
    */

    [CLink] public static extern void duk_pop(duk_context* ctx);
    [CLink] public static extern void duk_pop_n(duk_context* ctx, duk_idx_t count);
    [CLink] public static extern void duk_pop_2(duk_context* ctx);
    [CLink] public static extern void duk_pop_3(duk_context* ctx);

    /*
    *  Type checks
    *
    *  duk_is_none(), which would indicate whether index it outside of stack,
    *  is not needed; duk_is_valid_index() gives the same information.
    */

    [CLink] public static extern duk_int_t duk_get_type(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_check_type(duk_context* ctx, duk_idx_t idx, duk_int_t type);
    [CLink] public static extern duk_uint_t duk_get_type_mask(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_check_type_mask(duk_context* ctx, duk_idx_t idx, duk_uint_t mask);

    [CLink] public static extern duk_bool_t duk_is_undefined(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_null(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_nullish(duk_context* ctx, duk_idx_t idx);

    public static mixin  duk_is_null_or_undefined(duk_context* ctx, duk_idx_t idx) {duk_is_nullish(ctx, idx)}

    [CLink] public static extern duk_bool_t duk_is_boolean(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_number(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_nan(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_string(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_object(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_buffer(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_buffer_data(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_pointer(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_lightfunc(duk_context* ctx, duk_idx_t idx);

    [CLink] public static extern duk_bool_t duk_is_symbol(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_array(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_function(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_c_function(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_ecmascript_function(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_bound_function(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_thread(duk_context* ctx, duk_idx_t idx);

    public static mixin duk_is_callable(duk_context* ctx, duk_idx_t idx) { duk_is_function(ctx, idx) }
    
    [CLink] public static extern duk_bool_t duk_is_constructable(duk_context* ctx, duk_idx_t idx);

    [CLink] public static extern duk_bool_t duk_is_dynamic_buffer(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_fixed_buffer(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_is_external_buffer(duk_context* ctx, duk_idx_t idx);

    /* Buffers and lightfuncs are not considered primitive because they mimic
    * objects and e.g. duk_to_primitive() will coerce them instead of returning
    * them as is.  Symbols are represented as strings internally.
    */
    public static mixin _is_primitive(duk_context* ctx, duk_idx_t idx) {
        duk_check_type_mask(ctx, idx, DUK_TYPE_MASK_UNDEFINED | 
                                        DUK_TYPE_MASK_null | 
                                        DUK_TYPE_MASK_BOOLEAN | 
                                        DUK_TYPE_MASK_NUMBER | 
                                        DUK_TYPE_MASK_STRING | 
                                        DUK_TYPE_MASK_POINTER)
    }

    /* Symbols are object coercible, covered by DUK_TYPE_MASK_STRING. */
    public static mixin _is_object_coercible(duk_context* ctx, duk_idx_t idx) {
        duk_check_type_mask(ctx, idx, DUK_TYPE_MASK_BOOLEAN | 
                                        DUK_TYPE_MASK_NUMBER | 
                                        DUK_TYPE_MASK_STRING | 
                                        DUK_TYPE_MASK_OBJECT | 
                                        DUK_TYPE_MASK_BUFFER | 
                                        DUK_TYPE_MASK_POINTER | 
                                        DUK_TYPE_MASK_LIGHTFUNC)
                                    }

    [CLink] public static extern duk_errcode_t duk_get_error_code(duk_context* ctx, duk_idx_t idx);

    public static mixin duk_is_error(duk_context* ctx, duk_idx_t idx) { (duk_get_error_code(ctx, idx) != 0) }
    public static mixin duk_is_eval_error(duk_context* ctx, duk_idx_t idx) { (duk_get_error_code(ctx, idx) == DUK_ERR_EVAL_ERROR) }
    public static mixin duk_is_range_error(duk_context* ctx, duk_idx_t idx) { (duk_get_error_code(ctx, idx) == DUK_ERR_RANGE_ERROR) }
    public static mixin duk_is_reference_error(duk_context* ctx, duk_idx_t idx) { (duk_get_error_code(ctx, idx) == DUK_ERR_REFERENCE_ERROR) }
    public static mixin duk_is_syntax_error(duk_context* ctx, duk_idx_t idx) { (duk_get_error_code(ctx, idx) == DUK_ERR_SYNTAX_ERROR) }
    public static mixin duk_is_type_error(duk_context* ctx, duk_idx_t idx) { (duk_get_error_code(ctx, idx) == DUK_ERR_TYPE_ERROR) }
    public static mixin duk_is_uri_error(duk_context* ctx, duk_idx_t idx) { (duk_get_error_code(ctx, idx) == DUK_ERR_URI_ERROR) }

    /*
    *  Get operations: no coercion, returns default value for invalid
    *  indices and invalid value types.
    *
    *  duk_get_un)and duk_get_null() would be pointless and
    *  are not included.
    */

    [CLink] public static extern duk_bool_t duk_get_boolean(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_double_t duk_get_number(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_int_t duk_get_int(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_uint_t duk_get_uint(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern char* duk_get_string(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern char* duk_get_lstring(duk_context* ctx, duk_idx_t idx, duk_size_t *out_len);
    [CLink] public static extern void *duk_get_buffer(duk_context* ctx, duk_idx_t idx, duk_size_t *out_size);
    [CLink] public static extern void *duk_get_buffer_data(duk_context* ctx, duk_idx_t idx, duk_size_t *out_size);
    [CLink] public static extern void *duk_get_pointer(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_c_function duk_get_c_function(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_context* duk_get_context(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void *duk_get_heapptr(duk_context* ctx, duk_idx_t idx);

    /*
    *  Get-with-explicit default operations: like get operations but with an
    *  explicit default value.
    */

    [CLink] public static extern duk_bool_t duk_get_boolean_default(duk_context* ctx, duk_idx_t idx, duk_bool_t def_value);
    [CLink] public static extern duk_double_t duk_get_number_default(duk_context* ctx, duk_idx_t idx, duk_double_t def_value);
    [CLink] public static extern duk_int_t duk_get_int_default(duk_context* ctx, duk_idx_t idx, duk_int_t def_value);
    [CLink] public static extern duk_uint_t duk_get_uint_default(duk_context* ctx, duk_idx_t idx, duk_uint_t def_value);
    [CLink] public static extern char* duk_get_string_default(duk_context* ctx, duk_idx_t idx, char* def_value);
    [CLink] public static extern char* duk_get_lstring_default(duk_context* ctx, duk_idx_t idx, duk_size_t *out_len, char* def_ptr, duk_size_t def_len);
    [CLink] public static extern void *duk_get_buffer_default(duk_context* ctx, duk_idx_t idx, duk_size_t *out_size, void *def_ptr, duk_size_t def_len);
    [CLink] public static extern void *duk_get_buffer_data_default(duk_context* ctx, duk_idx_t idx, duk_size_t *out_size, void *def_ptr, duk_size_t def_len);
    [CLink] public static extern void *duk_get_pointer_default(duk_context* ctx, duk_idx_t idx, void *def_value);
    [CLink] public static extern duk_c_function duk_get_c_function_default(duk_context* ctx, duk_idx_t idx, duk_c_function def_value);
    [CLink] public static extern duk_context* duk_get_context_default(duk_context* ctx, duk_idx_t idx, duk_context* def_value);
    [CLink] public static extern void *duk_get_heapptr_default(duk_context* ctx, duk_idx_t idx, void *def_value);

    /*
    *  Opt operations: like require operations but with an explicit default value
    *  when value is undefined or index is invalid, null and non-matching types
    *  cause a TypeError.
    */

    [CLink] public static extern duk_bool_t duk_opt_boolean(duk_context* ctx, duk_idx_t idx, duk_bool_t def_value);
    [CLink] public static extern duk_double_t duk_opt_number(duk_context* ctx, duk_idx_t idx, duk_double_t def_value);
    [CLink] public static extern duk_int_t duk_opt_int(duk_context* ctx, duk_idx_t idx, duk_int_t def_value);
    [CLink] public static extern duk_uint_t duk_opt_uint(duk_context* ctx, duk_idx_t idx, duk_uint_t def_value);
    [CLink] public static extern char* duk_opt_string(duk_context* ctx, duk_idx_t idx, char* def_ptr);
    [CLink] public static extern char* duk_opt_lstring(duk_context* ctx, duk_idx_t idx, duk_size_t *out_len, char* def_ptr, duk_size_t def_len);
    [CLink] public static extern void *duk_opt_buffer(duk_context* ctx, duk_idx_t idx, duk_size_t *out_size, void *def_ptr, duk_size_t def_size);
    [CLink] public static extern void *duk_opt_buffer_data(duk_context* ctx, duk_idx_t idx, duk_size_t *out_size, void *def_ptr, duk_size_t def_size);
    [CLink] public static extern void *duk_opt_pointer(duk_context* ctx, duk_idx_t idx, void *def_value);
    [CLink] public static extern duk_c_function duk_opt_c_function(duk_context* ctx, duk_idx_t idx, duk_c_function def_value);
    [CLink] public static extern duk_context* duk_opt_context(duk_context* ctx, duk_idx_t idx, duk_context* def_value);
    [CLink] public static extern void *duk_opt_heapptr(duk_context* ctx, duk_idx_t idx, void *def_value);

    /*
    *  Require operations: no coercion, throw error if index or type
    *  is incorrect.  No defaulting.
    */

    public static mixin duk_require_type_mask(duk_context* ctx, duk_idx_t idx, duk_uint_t mask) {
		duk_check_type_mask(ctx, idx, mask | DUK_TYPE_MASK_THROW)
		}

    [CLink] public static extern void duk_require_undefined(duk_context*ctx, duk_idx_t idx);
    [CLink] public static extern void duk_require_null(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_require_boolean(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_double_t duk_require_number(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_int_t duk_require_int(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_uint_t duk_require_uint(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern char* duk_require_string(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern char* duk_require_lstring(duk_context* ctx, duk_idx_t idx, duk_size_t *out_len);
    [CLink] public static extern void duk_require_object(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void *duk_require_buffer(duk_context* ctx, duk_idx_t idx, duk_size_t *out_size);
    [CLink] public static extern void *duk_require_buffer_data(duk_context* ctx, duk_idx_t idx, duk_size_t *out_size);
    [CLink] public static extern void *duk_require_pointer(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_c_function duk_require_c_function(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_context* duk_require_context(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void duk_require_function(duk_context* ctx, duk_idx_t idx);
    public static mixin duk_require_callable(duk_context* ctx, duk_idx_t idx) { duk_require_function(ctx, idx) }
    [CLink] public static extern void duk_require_constructor_call(duk_context* ctx);
    [CLink] public static extern void duk_require_constructable(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void *duk_require_heapptr(duk_context* ctx, duk_idx_t idx);

    /* Symbols are object coercible and covered by DUK_TYPE_MASK_STRING. */
    public static mixin duk_require_object_coercible(duk_context* ctx, duk_idx_t idx) {
        duk_check_type_mask(ctx, idx, DUK_TYPE_MASK_BOOLEAN| DUK_TYPE_MASK_NUMBER| DUK_TYPE_MASK_STRING| DUK_TYPE_MASK_OBJECT| DUK_TYPE_MASK_BUFFER| DUK_TYPE_MASK_POINTER| DUK_TYPE_MASK_LIGHTFUNC| DUK_TYPE_MASK_THROW)
    }

    /*
    *  Coercion operations: in-place coercion, return coerced value where
    *  applicable.  If index is invalid, throw error.  Some coercions may
    *  throw an expected error (e.g. from a toString() or valueOf() call)
    *  or an internal error (e.g. from out of memory).
    */

    [CLink] public static extern void duk_to_undefined(duk_context*ctx, duk_idx_t idx);
    [CLink] public static extern void duk_to_null(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_bool_t duk_to_boolean(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_double_t duk_to_number(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_int_t duk_to_int(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_uint_t duk_to_uint(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_int32_t duk_to_int32(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_uint32_t duk_to_uint32(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_uint16_t duk_to_uint16(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern char* duk_to_string(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern char* duk_to_lstring(duk_context* ctx, duk_idx_t idx, duk_size_t *out_len);
    [CLink] public static extern void *duk_to_buffer_raw(duk_context* ctx, duk_idx_t idx, duk_size_t *out_size, duk_uint_t flags);
    [CLink] public static extern void *duk_to_pointer(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void duk_to_object(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void duk_to_primitive(duk_context* ctx, duk_idx_t idx, duk_int_t hint);

    public const c_int DUK_BUF_MODE_FIXED      = 0;   /* internal: request fixed buffer result */
    public const c_int DUK_BUF_MODE_DYNAMIC    = 1;   /* internal: request dynamic buffer result */
    public const c_int DUK_BUF_MODE_DONTCARE   = 2;   /* internal: don't care about fixed/dynamic nature */

    public static mixin duk_to_buffer(duk_context* ctx, duk_idx_t idx, duk_size_t *out_size) {
        duk_to_buffer_raw(ctx, idx, out_size, DUK_BUF_MODE_DONTCARE)
    }

    public static mixin duk_to_fixed_buffer(duk_context* ctx, duk_idx_t idx, duk_size_t *out_size) {
        duk_to_buffer_raw(ctx, idx, out_size, DUK_BUF_MODE_FIXED)
    }

    public static mixin duk_to_dynamic_buffer(duk_context* ctx, duk_idx_t idx, duk_size_t *out_size) {
        duk_to_buffer_raw(ctx, idx, out_size, DUK_BUF_MODE_DYNAMIC)
    }

    /* safe variants of a few coercion operations */
    [CLink] public static extern char* duk_safe_to_lstring(duk_context* ctx, duk_idx_t idx, duk_size_t *out_len);
    [CLink] public static extern char* duk_to_stacktrace(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern char* duk_safe_to_stacktrace(duk_context* ctx, duk_idx_t idx);

 	public static mixin duk_safe_to_string(duk_context* ctx, duk_idx_t idx)  {
		 duk_safe_to_lstring(ctx, idx, null)
	}


    /*
    *  Value length
    */

    [CLink] public static extern duk_size_t duk_get_length(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void duk_set_length(duk_context* ctx, duk_idx_t idx, duk_size_t len);

#if false
    /* duk_require_length()? */
    /* duk_opt_length()? */
#endif

    /*
    *  Misc conversion
    */

    [CLink] public static extern char* duk_base64_encode(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void duk_base64_decode(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern char* duk_hex_encode(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void duk_hex_decode(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern char* duk_json_encode(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void duk_json_decode(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void duk_cbor_encode(duk_context* ctx, duk_idx_t idx, duk_uint_t encode_flags);
    [CLink] public static extern void duk_cbor_decode(duk_context* ctx, duk_idx_t idx, duk_uint_t decode_flags);

    [CLink] public static extern char* duk_buffer_to_string(duk_context* ctx, duk_idx_t idx);

    /*
    *  Buffer
    */

    [CLink] public static extern void *duk_resize_buffer(duk_context* ctx, duk_idx_t idx, duk_size_t new_size);
    [CLink] public static extern void *duk_steal_buffer(duk_context* ctx, duk_idx_t idx, duk_size_t *out_size);
    [CLink] public static extern void duk_config_buffer(duk_context* ctx, duk_idx_t idx, void *ptr, duk_size_t len);

    /*
    *  Property access
    *
    *  The basic function assumes key is on stack.  The _(l)string variant takes
    *  a C string as a property name; the _literal variant takes a C literal.
    *  The _index variant takes an array index as a property name (e.g. 123 is
    *  equivalent to the key "123").  The _heapptr variant takes a raw, borrowed
    *  heap pointer.
    */

    [CLink] public static extern duk_bool_t duk_get_prop(duk_context* ctx, duk_idx_t obj_idx);
    [CLink] public static extern duk_bool_t duk_get_prop_string(duk_context* ctx, duk_idx_t obj_idx, char* key);
    [CLink] public static extern duk_bool_t duk_get_prop_lstring(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len);

#if DUK_USE_PREFER_SIZE
    public static mixin duk_get_prop_literal(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len) {
        duk_get_prop_string(ctx, obj_idx, key)
    } 
#else
    [CLink] public static extern duk_bool_t duk_get_prop_literal_raw(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len);
    public static mixin duk_get_prop_literal(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len) {
        duk_get_prop_literal_raw(ctx, obj_idx, key, (.)scope String(key).Length - 1U)
    } 
#endif

    [CLink] public static extern duk_bool_t duk_get_prop_index(duk_context* ctx, duk_idx_t obj_idx, duk_uarridx_t arr_idx);
    [CLink] public static extern duk_bool_t duk_get_prop_heapptr(duk_context* ctx, duk_idx_t obj_idx, void *ptr);
    [CLink] public static extern duk_bool_t duk_put_prop(duk_context* ctx, duk_idx_t obj_idx);
    [CLink] public static extern duk_bool_t duk_put_prop_string(duk_context* ctx, duk_idx_t obj_idx, char* key);
    [CLink] public static extern duk_bool_t duk_put_prop_lstring(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len);

#if DUK_USE_PREFER_SIZE
    public static mixin duk_put_prop_literal(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len) {
        duk_put_prop_string(ctx, obj_idx, key)
    } 
#else
    [CLink] public static extern duk_bool_t duk_put_prop_literal_raw(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len);
    public static mixin duk_put_prop_literal(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len) {
        duk_put_prop_literal_raw(ctx, obj_idx, key, (.)scope String(key).Length - 1U)
    } 
#endif

    [CLink] public static extern duk_bool_t duk_put_prop_index(duk_context* ctx, duk_idx_t obj_idx, duk_uarridx_t arr_idx);
    [CLink] public static extern duk_bool_t duk_put_prop_heapptr(duk_context* ctx, duk_idx_t obj_idx, void *ptr);
    [CLink] public static extern duk_bool_t duk_del_prop(duk_context* ctx, duk_idx_t obj_idx);
    [CLink] public static extern duk_bool_t duk_del_prop_string(duk_context* ctx, duk_idx_t obj_idx, char* key);
    [CLink] public static extern duk_bool_t duk_del_prop_lstring(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len);

#if DUK_USE_PREFER_SIZE
    public static mixin duk_del_prop_literal(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len) {
        duk_del_prop_string(ctx, obj_idx, key)
    } 
#else
    [CLink] public static extern duk_bool_t duk_del_prop_literal_raw(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len);
    public static mixin duk_del_prop_literal(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len) {
        duk_del_prop_literal_raw(ctx, obj_idx, key, (.)scope String(key).Length - 1U)
    } 
#endif

    [CLink] public static extern duk_bool_t duk_del_prop_index(duk_context* ctx, duk_idx_t obj_idx, duk_uarridx_t arr_idx);
    [CLink] public static extern duk_bool_t duk_del_prop_heapptr(duk_context* ctx, duk_idx_t obj_idx, void *ptr);
    [CLink] public static extern duk_bool_t duk_has_prop(duk_context* ctx, duk_idx_t obj_idx);
    [CLink] public static extern duk_bool_t duk_has_prop_string(duk_context* ctx, duk_idx_t obj_idx, char* key);
    [CLink] public static extern duk_bool_t duk_has_prop_lstring(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len);

#if DUK_USE_PREFER_SIZE
    public static mixin duk_has_prop_literal(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len) {
        duk_has_prop_string(ctx, obj_idx, key)
    } 
#else
    [CLink] public static extern duk_bool_t duk_has_prop_literal_raw(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len);
    public static mixin duk_has_prop_literal(duk_context* ctx, duk_idx_t obj_idx, char* key, duk_size_t key_len) {
        duk_has_prop_literal_raw(ctx, obj_idx, key, (.)scope String(key).Length - 1U)
    } 
#endif

    [CLink] public static extern duk_bool_t duk_has_prop_index(duk_context* ctx, duk_idx_t obj_idx, duk_uarridx_t arr_idx);
    [CLink] public static extern duk_bool_t duk_has_prop_heapptr(duk_context* ctx, duk_idx_t obj_idx, void *ptr);

    [CLink] public static extern void duk_get_prop_desc(duk_context* ctx, duk_idx_t obj_idx, duk_uint_t flags);
    [CLink] public static extern void duk_def_prop(duk_context* ctx, duk_idx_t obj_idx, duk_uint_t flags);

    [CLink] public static extern duk_bool_t duk_get_global_string(duk_context* ctx, char* key);
    [CLink] public static extern duk_bool_t duk_get_global_lstring(duk_context* ctx, char* key, duk_size_t key_len);

#if DUK_USE_PREFER_SIZE
    public static mixin duk_get_global_literal(duk_context* ctx, char* key) {
        duk_get_global_string(ctx, key)
    }
#else
    [CLink] public static extern duk_bool_t duk_get_global_literal_raw(duk_context* ctx, char* key, duk_size_t key_len);
    public static mixin duk_get_global_literal(duk_context* ctx, char* key) {
        duk_get_global_literal_raw(ctx, key, (.)scope String(key).Length - 1U)
    }
#endif

    [CLink] public static extern duk_bool_t duk_get_global_heapptr(duk_context* ctx, void *ptr);
    [CLink] public static extern duk_bool_t duk_put_global_string(duk_context* ctx, char* key);
    [CLink] public static extern duk_bool_t duk_put_global_lstring(duk_context* ctx, char* key, duk_size_t key_len);

#if DUK_USE_PREFER_SIZE
    public static mixin duk_put_global_literal(duk_context* ctx, char* key) {
        duk_put_global_string(ctx, key)
    }
#else
    [CLink] public static extern duk_bool_t duk_put_global_literal_raw(duk_context* ctx, char* key, duk_size_t key_len);
    public static mixin duk_put_global_literal(duk_context* ctx, char* key) {
        duk_put_global_literal_raw(ctx, key, (.)scope String(key).Length - 1U)
    }
#endif

    [CLink] public static extern duk_bool_t duk_put_global_heapptr(duk_context* ctx, void *ptr);

    /*
    *  Inspection
    */

    [CLink] public static extern void duk_inspect_value(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void duk_inspect_callstack_entry(duk_context* ctx, duk_int_t level);

    /*
    *  Object prototype
    */

    [CLink] public static extern void duk_get_prototype(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void duk_set_prototype(duk_context* ctx, duk_idx_t idx);

    /*
    *  Object finalizer
    */

    [CLink] public static extern void duk_get_finalizer(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void duk_set_finalizer(duk_context* ctx, duk_idx_t idx);

    /*
    *  Global object
    */

    [CLink] public static extern void duk_set_global_object(duk_context* ctx);

    /*
    *  Duktape/C function magic value
    */

    [CLink] public static extern duk_int_t duk_get_magic(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern void duk_set_magic(duk_context* ctx, duk_idx_t idx, duk_int_t magic);
    [CLink] public static extern duk_int_t duk_get_current_magic(duk_context* ctx);

    /*
    *  Module helpers: put multiple function or constant properties
    */

    [CLink] public static extern void duk_put_function_list(duk_context* ctx, duk_idx_t obj_idx, duk_function_list_entry *funcs);
    [CLink] public static extern void duk_put_number_list(duk_context* ctx, duk_idx_t obj_idx, duk_number_list_entry *numbers);

    /*
    *  Object operations
    */

    [CLink] public static extern void duk_compact(duk_context* ctx, duk_idx_t obj_idx);
    [CLink] public static extern void duk_enum(duk_context* ctx, duk_idx_t obj_idx, duk_uint_t enum_flags);
    [CLink] public static extern duk_bool_t duk_next(duk_context* ctx, duk_idx_t enum_idx, duk_bool_t get_value);
    [CLink] public static extern void duk_seal(duk_context* ctx, duk_idx_t obj_idx);
    [CLink] public static extern void duk_freeze(duk_context* ctx, duk_idx_t obj_idx);

    /*
    *  String manipulation
    */

    [CLink] public static extern void duk_concat(duk_context* ctx, duk_idx_t count);
    [CLink] public static extern void duk_join(duk_context* ctx, duk_idx_t count);
    [CLink] public static extern void duk_decode_string(duk_context* ctx, duk_idx_t idx, duk_decode_char_function callback, void *udata);
    [CLink] public static extern void duk_map_string(duk_context* ctx, duk_idx_t idx, duk_map_char_function callback, void *udata);
    [CLink] public static extern void duk_substring(duk_context* ctx, duk_idx_t idx, duk_size_t start_char_offset, duk_size_t end_char_offset);
    [CLink] public static extern void duk_trim(duk_context* ctx, duk_idx_t idx);
    [CLink] public static extern duk_codepoint_t duk_char_code_at(duk_context* ctx, duk_idx_t idx, duk_size_t char_offset);

    /*
    *  ECMAScript operators
    */

    [CLink] public static extern duk_bool_t duk_equals(duk_context* ctx, duk_idx_t idx1, duk_idx_t idx2);
    [CLink] public static extern duk_bool_t duk_strict_equals(duk_context* ctx, duk_idx_t idx1, duk_idx_t idx2);
    [CLink] public static extern duk_bool_t duk_samevalue(duk_context* ctx, duk_idx_t idx1, duk_idx_t idx2);
    [CLink] public static extern duk_bool_t duk_instanceof(duk_context* ctx, duk_idx_t idx1, duk_idx_t idx2);

    /*
    *  Random
    */

    [CLink] public static extern duk_double_t duk_random(duk_context* ctx);

    /*
    *  Function (method) calls
    */

    [CLink] public static extern void duk_call(duk_context* ctx, duk_idx_t nargs);
    [CLink] public static extern void duk_call_method(duk_context* ctx, duk_idx_t nargs);
    [CLink] public static extern void duk_call_prop(duk_context* ctx, duk_idx_t obj_idx, duk_idx_t nargs);
    [CLink] public static extern duk_int_t duk_pcall(duk_context* ctx, duk_idx_t nargs);
    [CLink] public static extern duk_int_t duk_pcall_method(duk_context* ctx, duk_idx_t nargs);
    [CLink] public static extern duk_int_t duk_pcall_prop(duk_context* ctx, duk_idx_t obj_idx, duk_idx_t nargs);
    [CLink] public static extern void duk_new(duk_context* ctx, duk_idx_t nargs);
    [CLink] public static extern duk_int_t duk_pnew(duk_context* ctx, duk_idx_t nargs);
    [CLink] public static extern duk_int_t duk_safe_call(duk_context* ctx, duk_safe_call_function func, void *udata, duk_idx_t nargs, duk_idx_t nrets);

    /*
    *  Thread management
    */

    /* There are currently no native functions to yield/resume, due to the internal
    * limitations on coroutine handling.  These will be added later.
    */

    /*
    *  Compilation and evaluation
    */

    [CLink] public static extern duk_int_t duk_eval_raw(duk_context* ctx, char* src_buffer, duk_size_t src_length, duk_uint_t flags);
    [CLink] public static extern duk_int_t duk_compile_raw(duk_context* ctx, char* src_buffer, duk_size_t src_length, duk_uint_t flags);

    /* plain */
    public static mixin duk_eval(duk_context* ctx) {
            duk_eval_raw(ctx, null, 0, 1 /*args*/ | DUK_COMPILE_EVAL | DUK_COMPILE_NOFILENAME)
    }

    public static mixin duk_eval_noresult(duk_context* ctx) {
            duk_eval_raw(ctx, null, 0, 1 /*args*/ | DUK_COMPILE_EVAL | DUK_COMPILE_NORESULT | DUK_COMPILE_NOFILENAME)
    }

    public static mixin duk_peval(duk_context* ctx) {
            (duk_eval_raw(ctx, null, 0, 1 /*args*/ | DUK_COMPILE_EVAL | DUK_COMPILE_SAFE | DUK_COMPILE_NOFILENAME))
    }

    public static mixin duk_peval_noresult(duk_context* ctx) {
            duk_eval_raw(ctx, null, 0, 1 /*args*/ | DUK_COMPILE_EVAL | DUK_COMPILE_SAFE | DUK_COMPILE_NORESULT | DUK_COMPILE_NOFILENAME)
    }

    public static mixin duk_compile(duk_context* ctx, duk_uint_t flags) {
            duk_compile_raw(ctx, null, 0, 2 /*args*/ | flags)
    }

    public static mixin duk_pcompile(duk_context* ctx, duk_uint_t flags) {
            (duk_compile_raw(ctx, null, 0, 2 /*args*/ | flags | DUK_COMPILE_SAFE))
    }

    /* string */
    public static mixin duk_eval_string(duk_context* ctx, char* src)  {
        duk_eval_raw(ctx, src, 0, 0 /*args*/ | DUK_COMPILE_EVAL | DUK_COMPILE_NOSOURCE | DUK_COMPILE_STRLEN | DUK_COMPILE_NOFILENAME)
    }

    public static mixin duk_eval_string_noresult(duk_context* ctx, char* src)  {
        duk_eval_raw(ctx, src, 0, 0 /*args*/ | DUK_COMPILE_EVAL | DUK_COMPILE_NOSOURCE | DUK_COMPILE_STRLEN | DUK_COMPILE_NORESULT | DUK_COMPILE_NOFILENAME)
    }

    public static mixin duk_peval_string(duk_context* ctx, char* src)  {
        (duk_eval_raw(ctx, src, 0, 0 /*args*/ | DUK_COMPILE_EVAL | DUK_COMPILE_SAFE | DUK_COMPILE_NOSOURCE | DUK_COMPILE_STRLEN | DUK_COMPILE_NOFILENAME))
    }

    public static mixin duk_peval_string_noresult(duk_context* ctx, char* src)  {
        (duk_eval_raw(ctx, src, 0, 0 /*args*/ | DUK_COMPILE_EVAL | DUK_COMPILE_SAFE | DUK_COMPILE_NOSOURCE | DUK_COMPILE_STRLEN | DUK_COMPILE_NORESULT | DUK_COMPILE_NOFILENAME))
    }

    public static mixin duk_compile_string(duk_context* ctx, duk_uint_t flags, char* src)  {
        duk_compile_raw(ctx, src, 0, 0 /*args*/ | flags | DUK_COMPILE_NOSOURCE | DUK_COMPILE_STRLEN | DUK_COMPILE_NOFILENAME)
    }

    public static mixin duk_compile_string_filename(duk_context* ctx, duk_uint_t flags, char* src)  {
        duk_compile_raw(ctx, src, 0, 1 /*args*/ | flags | DUK_COMPILE_NOSOURCE | DUK_COMPILE_STRLEN)
    }

    public static mixin duk_pcompile_string(duk_context* ctx, duk_uint_t flags, char* src)  {
        (duk_compile_raw(ctx, src, 0, 0 /*args*/ | flags | DUK_COMPILE_SAFE | DUK_COMPILE_NOSOURCE | DUK_COMPILE_STRLEN | DUK_COMPILE_NOFILENAME))
    }

    public static mixin duk_pcompile_string_filename(duk_context* ctx, duk_uint_t flags, char* src)  {
        (duk_compile_raw(ctx, src, 0, 1 /*args*/ | flags | DUK_COMPILE_SAFE | DUK_COMPILE_NOSOURCE | DUK_COMPILE_STRLEN))
    }

    /* lstring */
    public static mixin duk_eval_lstring(duk_context* ctx,char* buf, duk_size_t len) {
        duk_eval_raw(ctx, buf, len, 0 /*args*/ | DUK_COMPILE_EVAL | DUK_COMPILE_NOSOURCE | DUK_COMPILE_NOFILENAME)
    }

    public static mixin duk_eval_lstring_noresult(duk_context* ctx,char* buf, duk_size_t len) {
        duk_eval_raw(ctx, buf, len, 0 /*args*/ | DUK_COMPILE_EVAL | DUK_COMPILE_NOSOURCE | DUK_COMPILE_NORESULT | DUK_COMPILE_NOFILENAME)
    }

    public static mixin duk_peval_lstring(duk_context* ctx,char* buf, duk_size_t len) {
        (duk_eval_raw(ctx, buf, len, 0 /*args*/ | DUK_COMPILE_EVAL | DUK_COMPILE_NOSOURCE | DUK_COMPILE_SAFE | DUK_COMPILE_NOFILENAME))
    }

    public static mixin duk_peval_lstring_noresult(duk_context* ctx,char* buf, duk_size_t len) {
        (duk_eval_raw(ctx, buf, len, 0 /*args*/ | DUK_COMPILE_EVAL | DUK_COMPILE_SAFE | DUK_COMPILE_NOSOURCE | DUK_COMPILE_NORESULT | DUK_COMPILE_NOFILENAME))
    }

    public static mixin duk_compile_lstring(duk_context* ctx, duk_uint_t flags, char* buf, duk_size_t len) {
        duk_compile_raw(ctx, buf, len, 0 /*args*/ | flags | DUK_COMPILE_NOSOURCE | DUK_COMPILE_NOFILENAME)
    }

    public static mixin duk_compile_lstring_filename(duk_context* ctx, duk_uint_t flags, char* buf, duk_size_t len) {
        duk_compile_raw(ctx, buf, len, 1 /*args*/ | flags | DUK_COMPILE_NOSOURCE)
    }

    public static mixin duk_pcompile_lstring(duk_context* ctx, duk_uint_t flags, char* buf, duk_size_t len) {
        duk_compile_raw(ctx, buf, len, 0 /*args*/ | flags | DUK_COMPILE_SAFE | DUK_COMPILE_NOSOURCE | DUK_COMPILE_NOFILENAME)
    }

    public static mixin duk_pcompile_lstring_filename(duk_context* ctx, duk_uint_t flags, char* buf, duk_size_t len) {
        duk_compile_raw(ctx, buf, len, 1 /*args*/ | flags | DUK_COMPILE_SAFE | DUK_COMPILE_NOSOURCE)
    }

    /*
    *  Bytecode load/dump
    */

    [CLink] public static extern void duk_dump_function(duk_context* ctx);
    [CLink] public static extern void duk_load_function(duk_context* ctx);

    /*
    *  Debugging
    */

    [CLink] public static extern void duk_push_context_dump(duk_context* ctx);

    /*
    *  Debugger (debug protocol)
    */

    [CLink] public static extern void duk_debugger_attach(duk_context* ctx, duk_debug_read_function read_cb, duk_debug_write_function write_cb, duk_debug_peek_function peek_cb, duk_debug_read_flush_function read_flush_cb, duk_debug_write_flush_function write_flush_cb, duk_debug_request_function request_cb, duk_debug_detached_function detached_cb, void *udata);
    [CLink] public static extern void duk_debugger_detach(duk_context* ctx);
    [CLink] public static extern void duk_debugger_cooperate(duk_context* ctx);
    [CLink] public static extern duk_bool_t duk_debugger_notify(duk_context* ctx, duk_idx_t nvalues);
    [CLink] public static extern void duk_debugger_pause(duk_context* ctx);

    /*
    *  Time handling
    */

    [CLink] public static extern duk_double_t duk_get_now(duk_context* ctx);
    [CLink] public static extern void duk_time_to_components(duk_context* ctx, duk_double_t timeval, duk_time_components *comp);
    [CLink] public static extern duk_double_t duk_components_to_time(duk_context* ctx, duk_time_components *comp);

    /*
    *  Date provider related constants
    *
    *  NOTE: These are "semi public" - you should only use these if you write
    *  your own platform specific Date provider, see doc/datetime.rst.
    */

    /* Millisecond count constants. */
    public const c_long DUK_DATE_MSEC_SECOND         =  1000L;
    public const c_long DUK_DATE_MSEC_MINUTE          = 60L * 1000L;
    public const c_long DUK_DATE_MSEC_HOUR            = 60L * 60L * 1000L;
    public const c_long DUK_DATE_MSEC_DAY             = 24L * 60L * 60L * 1000L;

    /* ECMAScript date range is 100 million days from Epoch:
    * > 100e6 * 24 * 60 * 60 * 1000  // 100M days in millisecs
    * 8640000000000000
    * (= 8.64e15)
    */
    public const double DUK_DATE_MSEC_100M_DAYS         = 8.64e15;
    public const double DUK_DATE_MSEC_100M_DAYS_LEEWAY  = 8.64e15 + 24 * 3600e3;

    /* ECMAScript year range:
    * > new Date(100e6 * 24 * 3600e3).toISOString()
    * '+275760-09-13T00:00:00.000Z'
    * > new Date(-100e6 * 24 * 3600e3).toISOString()
    * '-271821-04-20T00:00:00.000Z'
    */
    public const c_long DUK_DATE_MIN_ECMA_YEAR     = -271821L;
    public const c_long DUK_DATE_MAX_ECMA_YEAR     = 275760L;

    /* Part indices for internal breakdowns.  Part order from DUK_DATE_IDX_YEAR
    * to DUK_DATE_IDX_MILLISECOND matches argument ordering of ECMAScript API
    * calls (like Date constructor call).  Some functions in duk_bi_date.c
    * depend on the specific ordering, so change with care.  16 bits are not
    * enough for all parts (year, specifically).
    *
    * Must be in-sync with configure tooling.
    */
    public const c_int DUK_DATE_IDX_YEAR           = 0;  /* year */
    public const c_int DUK_DATE_IDX_MONTH          = 1;  /* month: 0 to 11 */
    public const c_int DUK_DATE_IDX_DAY            = 2;  /* day within month: 0 to 30 */
    public const c_int DUK_DATE_IDX_HOUR           = 3;
    public const c_int DUK_DATE_IDX_MINUTE         = 4;
    public const c_int DUK_DATE_IDX_SECOND         = 5;
    public const c_int DUK_DATE_IDX_MILLISECOND    = 6;
    public const c_int DUK_DATE_IDX_WEEKDAY        = 7;  /* weekday: 0 to 6, 0=sunday, 1=monday, etc */
    public const c_int DUK_DATE_IDX_NUM_PARTS      = 8;

    /* Internal API call flags, used for various functions in duk_bi_date.c.
    * Certain flags are used by only certain functions, but since the flags
    * don't overlap, a single flags value can be passed around to multiple
    * functions.
    *
    * The unused top bits of the flags field are also used to pass values
    * to helpers (duk__get_part_helper() and duk__set_part_helper()).
    *
    * Must be in-sync with configure tooling.
    */

    /* NOTE: when writing a Date provider you only need a few specific
    * flags from here, the rest are internal.  Avoid using anything you
    * don't need.
    */

    public const c_int DUK_DATE_FLAG_NAN_TO_ZERO          = 1 << 0;  /* timeval breakdown: internal time value NaN -> zero */
    public const c_int DUK_DATE_FLAG_NAN_TO_RANGE_ERROR   = 1 << 1;  /* timeval breakdown: internal time value NaN -> RangeError (toISOString) */
    public const c_int DUK_DATE_FLAG_ONEBASED             = 1 << 2;  /* timeval breakdown: convert month and day-of-month parts to one-based (default is zero-based) */
    public const c_int DUK_DATE_FLAG_EQUIVYEAR            = 1 << 3;  /* timeval breakdown: replace year with equivalent year in the [1971,2037] range for DST calculations */
    public const c_int DUK_DATE_FLAG_LOCALTIME            = 1 << 4;  /* convert time value to local time */
    public const c_int DUK_DATE_FLAG_SUB1900              = 1 << 5;  /* getter: subtract 1900 from year when getting year part */
    public const c_int DUK_DATE_FLAG_TOSTRING_DATE        = 1 << 6;  /* include date part in string conversion result */
    public const c_int DUK_DATE_FLAG_TOSTRING_TIME        = 1 << 7;  /* include time part in string conversion result */
    public const c_int DUK_DATE_FLAG_TOSTRING_LOCALE      = 1 << 8;  /* use locale specific formatting if available */
    public const c_int DUK_DATE_FLAG_TIMESETTER           = 1 << 9;  /* setter: call is a time setter (affects hour, min, sec, ms); otherwise date setter (affects year, month, day-in-month) */
    public const c_int DUK_DATE_FLAG_YEAR_FIXUP           = 1 << 10; /* setter: perform 2-digit year fixup (00...99 -> 1900...1999) */
    public const c_int DUK_DATE_FLAG_SEP_T                = 1 << 11; /* string conversion: use 'T' instead of ' ' as a separator */
    public const c_int DUK_DATE_FLAG_VALUE_SHIFT          = 12;        /* additional values begin at bit 12 */

    /*
    *  ROM pointer compression
    */

    /* Support array for ROM pointer compression.  Only declared when ROM
    * pointer compression is active.
    */
#if DUK_USE_ROM_OBJECTS && DUK_USE_HEAPPTR16
    [CLink] public static extern void[] * duk_rom_compressed_pointers;
#endif

    /*
    *  Fuzzilli fuzzing integration
    */
#if DUK_USE_FUZZILLI
    [CLink] public static extern void duk_assert_wrapper(duk_int_t x);
#endif
}