package utils
{
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class SpriteUtils
   {
      
      public function SpriteUtils()
      {
         super();
      }
      
      public static function createSelectSprite(param1:Sprite, param2:Rectangle) : void
      {
         param1.graphics.clear();
         param1.graphics.beginFill(16711680,0.5);
         param1.graphics.drawRect(0,0,param2.width,1);
         param1.graphics.drawRect(0,1,1,param2.height - 1);
         param1.graphics.drawRect(param2.width,1,1,param2.height - 1);
         param1.graphics.drawRect(1,param2.height,param2.width - 2,1);
         param1.graphics.endFill();
         param1.x = int(param2.x);
         param1.y = int(param2.y);
      }
   }
}

