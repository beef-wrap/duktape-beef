using System;
using System.Interop;

namespace duktape;

extension duktape
{
	struct va_list;

	typealias char = c_char;
	typealias size_t = uint;
	typealias ptrdiff_t = uint;

	public typealias duk_uint8_t = c_uchar;
	public typealias duk_int8_t = c_char;
	public typealias duk_uint16_t = c_uint;
	public typealias duk_int16_t = c_int;
	public typealias duk_uint32_t = c_uint;
	public typealias duk_int32_t = c_int;
	public typealias duk_uint64_t = c_ulong;
	public typealias duk_int64_t = c_long;

	/* A few types are assumed to always exist. */
	public typealias duk_size_t = size_t;
	public typealias duk_ptrdiff_t = ptrdiff_t;

	/* The best type for an "all around int" in Duktape internals is "at least
	* 32 bit signed integer" which is most convenient.  Same for unsigned type.
	* Prefer 'int' when large enough, as it is almost always a convenient type.
	*/
	public typealias duk_int_t = c_int;
	public typealias duk_uint_t = c_uint;

	/* Same as 'duk_int_t' but guaranteed to be a 'fast' variant if this
	* distinction matters for the CPU.  These types are used mainly in the
	* executor where it might really matter.
	*/
	// public typealias duk_int_fast_t = duk_int_fast32_t;
	// public typealias duk_uint_fast_t = duk_uint_fast32_t;

	/* Small integers (16 bits or more) can fall back to the 'int' type, but
	public * explicitly = have a typealias so they are marked "small" .
	*/
	public typealias duk_small_int_t = int;
	public typealias duk_small_uint_t = c_uint;

	/* Fast variants of small integers, again for really fast paths like the
	* executor.
	*/
	// public typealias duk_small_int_fast_t = duk_int_fast16_t;
	// public typealias duk_small_uint_fast_t = duk_uint_fast16_t;

	/* Boolean values are represented with the platform 'unsigned int'. */
	public typealias duk_bool_t = duk_small_uint_t;

	/* Signed boolean is useful in some internal use cases where negative
	* values can e.g. indicate "not found".
	*/
	public typealias duk_sbool_t = duk_small_int_t;

	/* Index values must have at least 32-bit signed range. */
	public typealias duk_idx_t = duk_int_t;

	/* Unsigned index variant. */
	public typealias duk_uidx_t = duk_uint_t;

	/* Array index values, could be exact 32 bits.
	* Currently no need for signed duk_arridx_t.
	*/
	public typealias duk_uarridx_t = duk_uint_t;

	/* Duktape/C function return value, platform int is enough for now to
	* represent 0, 1, or negative error code.  Must be compatible with
	* assigning truth values (e.g. duk_ret_t rc = (foo == bar);).
	*/
	public typealias duk_ret_t = duk_small_int_t;

	/* Error codes are represented with platform int.  High bits are used
	* for flags and such, so 32 bits are needed.
	*/
	public typealias duk_errcode_t = duk_int_t;

	/* Codepoint type.  Must be 32 bits or more because it is used also for
	* internal codepoints.  The type is signed because negative codepoints
	* are used as internal markers (e.g. to mark EOF or missing argument).
	* (X)UTF-8/CESU-8 encode/decode take and return an unsigned variant to
	* ensure duk_uint32_t casts back and forth nicely.  Almost everything
	* else uses the signed one.
	*/
	public typealias  duk_codepoint_t = duk_int_t;
	public typealias  duk_ucodepoint_t = duk_uint_t;

	/* IEEE float/double typedef. */
	public typealias  duk_float_t = float;
	public typealias  duk_double_t = double;

	public struct duk_context;
}