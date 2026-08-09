package tmx
{
   import flash.display.Sprite;
   
   public class BaseTools extends Sprite
   {
      
      private var _ob:SaveObject;
      
      public function BaseTools(param1:SaveObject)
      {
         super();
         this._ob = param1;
      }
      
      public function get display() : SaveObject
      {
         return this._ob;
      }
      
      public function onMath() : void
      {
      }
   }
}

