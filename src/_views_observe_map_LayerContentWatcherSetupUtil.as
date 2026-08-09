package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import views.observe.map.LayerContent;
   
   public class _views_observe_map_LayerContentWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _views_observe_map_LayerContentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         LayerContent.watcherSetupUtil = new _views_observe_map_LayerContentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

