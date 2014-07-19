package workers
{
    import com.riadvice.activeaircord.Model;

    import models.Employee;

    public class GetEmployeesWorker extends AIRCordRunnableBase
    {

        /**
         * Load employees from the database.
         */
        override public function run( args : Array ) : void
        {
            super.run(args);

            const employees : * = Employee[Model.FIND_BY_SQL]("SELECT FirstName, LastName FROM Employees GROUP BY EmployeeID");

            // Return the result to the caller Thread.
            dispatcher.dispatchResult(employees);
        }
    }
}
