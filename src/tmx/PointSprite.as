package tmx
{
   import flash.display.Sprite;
   import flash.geom.Point;
   import utils.RightUtils;
   
   public class PointSprite extends Sprite
   {
      
      private var _point:Point;
      
      public function PointSprite(param1:Point, param2:uint)
      {
         super();
         this._point = param1;
         this.graphics.beginFill(param2,0.5);
         this.graphics.drawCircle(0,0,5);
         this.graphics.endFill();
         this.x = param1.x;
         this.y = param1.y;
         RightUtils.onRightClick(this,"pointSprite");
      }
      
      public function onMove() : void
      {
         this._point.x = this.x;
         this._point.y = this.y;
      }
      
      public function onReset() : void
      {
         this.x = this._point.x;
         this.y = this._point.y;
      }
      
      public function get point() : Point
      {
         return this._point;
      }
   }
}

