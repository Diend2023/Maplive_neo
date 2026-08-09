package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   import views.attribute.child.MoveAttribute;
   
   public class _views_attribute_child_MoveAttributeWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _views_attribute_child_MoveAttributeWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MoveAttribute.watcherSetupUtil = new _views_attribute_child_MoveAttributeWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("stack",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}

