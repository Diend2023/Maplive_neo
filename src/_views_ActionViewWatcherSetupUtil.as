package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import views.ActionView;
   
   public class _views_ActionViewWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _views_ActionViewWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ActionView.watcherSetupUtil = new _views_ActionViewWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

