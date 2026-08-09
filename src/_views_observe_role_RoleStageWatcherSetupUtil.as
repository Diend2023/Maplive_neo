package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import views.observe.role.RoleStage;
   
   public class _views_observe_role_RoleStageWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _views_observe_role_RoleStageWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         RoleStage.watcherSetupUtil = new _views_observe_role_RoleStageWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("stack",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

