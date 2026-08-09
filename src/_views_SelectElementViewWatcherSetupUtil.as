package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import views.SelectElementView;
   
   public class _views_SelectElementViewWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _views_SelectElementViewWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SelectElementView.watcherSetupUtil = new _views_SelectElementViewWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

