package workers
{
    import com.doublefx.as3.thread.api.CrossThreadDispatcher;
    import com.riadvice.activeaircord.Configuration;
    import com.riadvice.activeaircord.Model;

    import flash.display.Sprite;

    import conf.DBConf;

    import models.Employee;

    public class GetEmployeesWorker extends Sprite
    {

        /**
         * Mandatory declaration if you want your Worker be able to communicate.
         * This CrossThreadDispatcher is injected at runtime.
         */
        public var dispatcher : CrossThreadDispatcher;


        /**
         * Load employees from the database.
         */
        public function run( args : Array ) : void
        {
            // Reconfigure database connection because of the different application domain

            Configuration.presistencePackage = "models";
            // Use this key to decrypt the database
            Configuration.setEncryptionKeyFor(DBConf.CONNECTION_EMPLOYEES, DBConf.getEnryptionKey());
            Configuration.connections = {"employees": "sqlite://sqlite/employees.db?mode=read"}

            var employees : * = Employee[Model.FIND_BY_SQL]("SELECT FirstName, LastName FROM Employees GROUP BY EmployeeID");
        }
    }
}
