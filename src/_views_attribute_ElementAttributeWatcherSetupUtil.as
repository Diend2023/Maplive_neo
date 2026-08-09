package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import views.attribute.ElementAttribute;
   
   public class _views_attribute_ElementAttributeWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _views_attribute_ElementAttributeWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ElementAttribute.watcherSetupUtil = new _views_attribute_ElementAttributeWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("radioBtnGroup",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[1].updateParent(param1);
      }
   }
}

