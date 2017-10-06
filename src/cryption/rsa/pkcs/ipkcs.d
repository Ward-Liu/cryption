module cryption.rsa.pkcs.ipkcs;

import std.bigint;

interface iPKCS
{
	static string encodeKey(BigInt n, BigInt d_e);
	static void decodeKey(string key, out BigInt n, out BigInt d_e);
}