package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import views.ScenarioSpritePool;
   
   public class _views_ScenarioSpritePoolWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _views_ScenarioSpritePoolWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ScenarioSpritePool.watcherSetupUtil = new _views_ScenarioSpritePoolWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("dataSprites",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

