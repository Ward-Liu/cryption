module cryption.rsa.prng.d;

interface IRandom
{
    void nextBytes(ubyte[] buffer);
}

abstract class PRNG : IRandom
{
    abstract void nextBytes(ubyte[] buffer);
}