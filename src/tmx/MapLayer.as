package tmx
{
   import flash.display.Sprite;
   
   public class MapLayer extends Sprite
   {
      
      public var type:String = "";
      
      public var nameString:String = null;
      
      public function MapLayer(param1:String)
      {
         super();
         this.type = param1;
      }
      
      public function getName() : String
      {
         return this.nameString ? this.nameString : name;
      }
   }
}

