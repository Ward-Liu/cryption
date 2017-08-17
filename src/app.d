import std.stdio;

void main() {
}


unittest
{
	import base58;
	
	string str = Base58.encode(cast(byte[])"abcdef中文字符abc");
	writeln(str);
	byte[] buf = Base58.decode(str);
	writeln(cast(string)buf);
}

unittest
{
	import tea.xtea;
	
	ubyte[] data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
	int[4] key = [1, 2, 3, 4];
	int rounds = 64;
	
	ubyte[] buf = Xtea.encrypt(data, key, rounds);
	writeln(buf);
	buf = Xtea.decrypt(buf, key, rounds);
	writeln(buf);
}