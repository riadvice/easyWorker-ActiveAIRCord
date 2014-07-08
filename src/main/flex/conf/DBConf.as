package conf
{
    import flash.utils.ByteArray;

    public class DBConf
    {
        [Embed(source = "../resources/security/private.ppk", mimeType = "application/octet-stream")]
        public static const ENCRYPTION_KEY : Class

        public static const CONNECTION_EMPLOYEES : String = "employees";

        public static function getEnryptionKey() : ByteArray
        {
            var assetKey : ByteArray = new ENCRYPTION_KEY() as ByteArray;
            var encryptionKey : ByteArray = new ByteArray();
            encryptionKey.writeBytes(assetKey, 163, 16);
            return encryptionKey;
        }
    }
}
