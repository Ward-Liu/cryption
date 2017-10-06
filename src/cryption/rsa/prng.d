module cryption.rsa.prng;

import std.random;
import std.datetime;

struct PRNG
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