package tmx
{
   import flash.geom.Point;
   
   public class RotatingTools extends BaseTools
   {
      
      public function RotatingTools(param1:SaveObject)
      {
         super(param1);
      }
      
      override public function onMath() : void
      {
         var _loc1_:Point = new Point(display.parent.mouseX,display.parent.mouseY);
         var _loc2_:Point = new Point(display.x,display.y);
         var _loc3_:Number = Math.atan2(_loc1_.y - _loc2_.y,_loc1_.x - _loc2_.x);
         var _loc4_:Number = Math.atan2(0 - this.x,0 - this.y);
         display.rotation = int(_loc3_ / Math.PI * 180 + _loc4_ / Math.PI * 180 - 180);
      }
   }
}

