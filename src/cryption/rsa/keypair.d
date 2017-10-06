module cryption.rsa.keypair;

struct RSAKeyPair
{
	string privateKey;
	string publicKey;
	
	this(string privateKey, string publicKey)
	{
		this.privateKey = privateKey;
		this.publicKey = publicKey;
	}
}