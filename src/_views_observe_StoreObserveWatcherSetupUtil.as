package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import views.observe.StoreObserve;
   
   public class _views_observe_StoreObserveWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _views_observe_StoreObserveWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         StoreObserve.watcherSetupUtil = new _views_observe_StoreObserveWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

