module cryption.rsa.prng.insecure;

import std.random;
import std.datetime;

import cryption.rsa.prng.d;

class InsecurePRNG : PRNG
{
    Mt19937 generator;

    uint current;
    uint pos;

    this()
    {
        generator.seed(Clock.currTime().second);
        pos = 0;
        current = 0;
    }

    override void nextBytes(ubyte[] buffer)
    {
        foreach(ref a; buffer)
        {
            if(pos == 0)
            {
                current = generator.front;
                generator.popFront();
            }
            
            a = cast(ubyte) (  current >> 8 * pos );  
            pos = (pos + 1) % uint.sizeof;
        }
    }
}