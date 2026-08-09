package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import views.tools.MapRectTools;
   
   public class _views_tools_MapRectToolsWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _views_tools_MapRectToolsWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MapRectTools.watcherSetupUtil = new _views_tools_MapRectToolsWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("toolView",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

