package tmx
{
   import flash.display.Bitmap;
   
   public class TargetPoint extends Scenery
   {
      
      public const targetClass:Class = TargetPoint_targetClass;
      
      public function TargetPoint()
      {
         this.drawCenterLine();
         super("target",null,Bitmap(new this.targetClass()).bitmapData,null);
         sprite.x = -sprite.width / 2;
         sprite.y = -sprite.height / 2;
      }
   }
}

