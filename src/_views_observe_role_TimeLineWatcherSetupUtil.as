package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import views.observe.role.TimeLine;
   
   public class _views_observe_role_TimeLineWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _views_observe_role_TimeLineWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TimeLine.watcherSetupUtil = new _views_observe_role_TimeLineWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("roles",{"propertyChange":true},[param4[0]],param2);
         param5[2] = new PropertyWatcher("actions",{"propertyChange":true},[param4[2]],param2);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
      }
   }
}

