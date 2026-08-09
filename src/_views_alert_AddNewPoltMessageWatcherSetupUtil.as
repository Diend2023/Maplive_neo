package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import views.alert.AddNewPoltMessage;
   
   public class _views_alert_AddNewPoltMessageWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _views_alert_AddNewPoltMessageWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AddNewPoltMessage.watcherSetupUtil = new _views_alert_AddNewPoltMessageWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("fx",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

