module cryption.rsa.pkcs.pkcs1;

import std.bigint;

import cryption.rsa.pkcs.ipkcs;

class PKCS1 : iPKCS
{
	static string encodeKey(BigInt n, BigInt d_e)
	{
		return string.init;
	}
	
	static void decodeKey(string key, out BigInt n, out BigInt d_e)
	{
	}
}
