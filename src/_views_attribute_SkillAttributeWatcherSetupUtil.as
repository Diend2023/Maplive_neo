package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import views.attribute.SkillAttribute;
   
   public class _views_attribute_SkillAttributeWatcherSetupUtil implements IWatcherSetupUtil2
   {
      
      public function _views_attribute_SkillAttributeWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SkillAttribute.watcherSetupUtil = new _views_attribute_SkillAttributeWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}

