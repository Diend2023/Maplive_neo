package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import views.observe.map.AddLayerView;
   
   public class _views_observe_map_AddLayerViewWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _views_observe_map_AddLayerViewWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AddLayerView.watcherSetupUtil = new _views_observe_map_AddLayerViewWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

