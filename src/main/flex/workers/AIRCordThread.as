/**
 * User: Frederic THOMAS Date: 12/07/2014 Time: 12:29
 */
package workers
{
    import com.doublefx.as3.thread.Thread;

    import flash.utils.ByteArray;

    public class AIRCordThread extends Thread
    {
        private static const extraDependencies : Vector.<String> = Vector.<String>([
            "com.riadvice.activeaircord.*",
            "org.as3commons.lang.*",
            "org.osmf.utils::URL"]);

        /**
         * Create a new AIRCord Thread.
         *
         * @param runnable the Runnable to run
         * @param name Name of the Thread.
         * @param encryptionKey The encryption key to use if any.
         * @param models The BD Model the runnable need to use.
         */
        public function AIRCordThread( runnable : Class, name : String = null, encryptionKey : ByteArray = null, models : Vector.<String> = null )
        {
            super(runnable, name, true, extraDependencies.concat(models));

            if (encryptionKey)
            {
                // Share the encryptionKey between Threads;
                setSharedProperty("ENCRYPTION_KEY", encryptionKey);
            }
        }
    }
}
