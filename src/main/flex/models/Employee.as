package models
{
    import com.riadvice.activeaircord.Model;

    import conf.DBConf;

    [Bindable]
    /**
     * Database model class for Employee.
     */
    public dynamic class Employee extends Model
    {
        //--------------------------------------------------------------------------
        //
        //  ActiveAIRCord Class Registration
        //
        //--------------------------------------------------------------------------

        staticInitializer(prototype.constructor);

        //--------------------------------------------------------------------------
        //
        //  Class Constants : Model
        //
        //--------------------------------------------------------------------------

        public static const tableName : String = "Employees";
        public static const connection : String = DBConf.CONNECTION_EMPLOYEES;

        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------

        public function Employee( attributes : Object = null, guardAttributes : Boolean = true, instantiatingViaFind : Boolean = false, newRecord : Boolean = true )
        {
            super(attributes, guardAttributes, instantiatingViaFind, newRecord);
        }
    }
}
