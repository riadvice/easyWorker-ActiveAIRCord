/**
 * User: Frederic THOMAS Date: 12/07/2014 Time: 12:29
 */
package workers
{
	import com.doublefx.as3.thread.Thread;

	import flash.utils.ByteArray;

	public class AIRCordThread extends Thread
	{
		private static const extraDependencies:Vector.<String> = Vector.<String>([
																				 "models.Employee",
																				 "com.riadvice.activeaircord.*",
																				 "org.as3commons.lang.*",
																				 "org.osmf.utils::URL" ]);

		public function AIRCordThread(runnable:Class, name:String=null, encryptionKey:ByteArray=null)
		{
			super(runnable, name, true, extraDependencies);

			if (encryptionKey)
			{
				// Share the encryptionKey between Threads;
				setSharedProperty("ENCRYPTION_KEY", encryptionKey);
			}
		}
	}
}
