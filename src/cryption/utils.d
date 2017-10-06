module cryption.utils;

import std.bigint;
import std.array;
import std.algorithm.mutation;
import std.conv;
import std.datetime;
import std.random;

struct BigIntHelper
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

struct RandomGenerator
{
    private static Mt19937 generator;

    static this()
    {
        generator.seed(Clock.currTime().second);
    }

	uint next()
	{
		uint v = generator.front;
		generator.popFront();
		
		return v;
	}
}