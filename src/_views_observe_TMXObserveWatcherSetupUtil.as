package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import views.observe.TMXObserve;
   
   public class _views_observe_TMXObserveWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _views_observe_TMXObserveWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TMXObserve.watcherSetupUtil = new _views_observe_TMXObserveWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("spritePool",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("toolView",{"propertyChange":true},[param4[1]],param2);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}

