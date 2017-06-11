/**
 * User: Frederic THOMAS Date: 12/07/2014 Time: 12:36
 */
package workers
{
    import com.doublefx.as3.thread.api.CrossThreadDispatcher;
    import com.doublefx.as3.thread.api.Runnable;
    import com.riadvice.activeaircord.Configuration;

    import flash.utils.ByteArray;

    public class AIRCordRunnableBase implements Runnable
    {

        /**
         * Mandatory declaration if you want your Worker be able to communicate.
         * This CrossThreadDispatcher is injected at runtime.
         */
        public var dispatcher : CrossThreadDispatcher;

        protected function configureDB() : void
        {
            // Reconfigure database connection because of the different application domain

            Configuration.persistencePackage = "models";

            // Use this key to decrypt the database
            // SQLLite doesn't like shared ByteArray, so, copy it into an unshared one.
            const sharedProperty : ByteArray = dispatcher.getSharedProperty("ENCRYPTION_KEY") as ByteArray;
            const ba : ByteArray = new ByteArray();
            sharedProperty.readBytes(ba);

            Configuration.setEncryptionKeyFor("employees", ba);

            Configuration.connections = {"employees": "sqlite://sqlite/employees.db?mode=read"};
        }

        public function run( args : Array ) : void
        {
            configureDB();
        }
    }
}
