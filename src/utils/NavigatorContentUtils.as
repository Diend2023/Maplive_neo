package utils
{
   import flash.filesystem.File;
   import spark.components.NavigatorContent;
   import views.RefObserve;
   
   public class NavigatorContentUtils
   {
      
      public function NavigatorContentUtils()
      {
         super();
      }
      
      public static function applyFile(param1:NavigatorContent, param2:File) : NavigatorContent
      {
         param1.label = param2.name;
         if(param1 is RefObserve)
         {
            param1["readFile"](param2);
         }
         return param1;
      }
   }
}

