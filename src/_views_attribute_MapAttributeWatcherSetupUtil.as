package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import views.attribute.MapAttribute;
   
   public class _views_attribute_MapAttributeWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _views_attribute_MapAttributeWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MapAttribute.watcherSetupUtil = new _views_attribute_MapAttributeWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

