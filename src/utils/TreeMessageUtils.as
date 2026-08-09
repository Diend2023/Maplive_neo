package utils
{
   import mx.controls.Tree;
   
   public class TreeMessageUtils
   {
      
      public function TreeMessageUtils()
      {
         super();
      }
      
      public static function getLabel(param1:XML) : String
      {
         switch(param1.localName())
         {
            case "polt":
               return "剧情总览";
            case "m":
               return param1.@target + ":" + param1.@message;
            case "select":
               return "问题:" + param1.@message;
            case "s":
               return "选择:" + param1.@message;
            case "as3":
               return "脚本:\n" + param1.@message;
            default:
               return param1.localName() + " - " + param1.@message;
         }
      }
      
      public static function openTree(param1:Tree) : void
      {
         var _loc2_:XML = null;
         for each(_loc2_ in param1.dataProvider)
         {
            param1.expandChildrenOf(_loc2_,true);
         }
      }
   }
}

