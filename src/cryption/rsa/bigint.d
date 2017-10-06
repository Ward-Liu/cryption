module cryption.rsa.bigint;

import std.bigint;
import std.array;
import std.algorithm.mutation;
import std.conv;

class BigIntHelper
{
	static ubyte[] bigIntToUByteArray(BigInt v)
	{
		Appender!(ubyte[]) app;
		
		while (v > 0)
		{
			app.put((v - ((v >> 8) << 8)).to!ubyte);
			v >>= 8;
		}

		reverse(app.data);
		return app.data;
	}
	
	static BigInt bigIntFromUByteArray(ubyte[] buffer)
	{
		BigInt ret = BigInt("0");
		
		for (uint i; i < buffer.length; i++)
		{
			ret <<= 8;
			ret += buffer[i];
		}
		
		return ret;
	}
}