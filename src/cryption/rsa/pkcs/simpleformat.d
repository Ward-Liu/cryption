module cryption.rsa.pkcs.simpleformat;

import std.bigint;
import std.bitmanip;
import std.base64;

import cryption.rsa.pkcs.ipkcs;
import cryption.rsa.bigint;

class SimpleFormat : iPKCS
{
	static string encodeKey(BigInt n, BigInt d_e)
	{
		ubyte[] n_bytes = BigIntHelper.bigIntToUByteArray(n);
		ubyte[] d_e_bytes = BigIntHelper.bigIntToUByteArray(d_e);
		
		ubyte[] buffer = new ubyte[4];
		
		buffer.write!int(cast(int)n_bytes.length, 0);
		buffer ~= n_bytes;
		buffer ~= d_e_bytes;
		
		return Base64.encode(buffer);
	}
	
	static void decodeKey(string key, out BigInt n, out BigInt d_e)
	{
		ubyte[] buffer = Base64.decode(key);
		int n_len = buffer.peek!int(0);
		ubyte[] n_bytes = buffer[4..4 + n_len];
		ubyte[] d_e_bytes = buffer[4 + n_len..$];
		
		n = BigIntHelper.bigIntFromUByteArray(n_bytes);
		d_e = BigIntHelper.bigIntFromUByteArray(d_e_bytes);
	}
}
