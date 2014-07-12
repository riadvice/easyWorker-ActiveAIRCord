package conf
{
	import flash.utils.ByteArray;

	public class DBConf
	{

		/**
		 * Can't pass the AMF process
		 */
		[Embed(source = "/../resources/security/private.ppk", mimeType = "application/octet-stream")]
		public static var ENCRYPTION_KEY:Class;

		public static var CONNECTION_EMPLOYEES:String = "employees";

		public static function getEnryptionKey(sharable:Boolean=false):ByteArray
		{
			var assetKey:ByteArray = new ENCRYPTION_KEY() as ByteArray;
			var encryptionKey:ByteArray = new ByteArray();
			encryptionKey.shareable = sharable;
			encryptionKey.writeBytes(assetKey, 163, 16);
			return encryptionKey;
		}
	}
}
