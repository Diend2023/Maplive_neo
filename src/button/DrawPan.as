package button
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class DrawPan extends Sprite
   {
      
      private var bmd:Bitmap;
      
      private var _tips:Sprite;
      
      public function DrawPan()
      {
         super();
         this.bmd = new Bitmap();
         this.addChild(this.bmd);
         this._tips = new Sprite();
         this.addChild(this._tips);
         this._tips.graphics.beginFill(65280);
         this._tips.graphics.drawRect(0,0,1,100);
         this._tips.graphics.drawRect(0,0,1,-100);
         this._tips.graphics.drawRect(0,0,100,1);
         this._tips.graphics.drawRect(0,0,-100,1);
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         this.bmd.bitmapData = param1;
         this.bmd.y = -this.bmd.height;
      }
      
      public function get bitmapData() : BitmapData
      {
         return this.bmd.bitmapData;
      }
      
      override public function set alpha(param1:Number) : void
      {
         this.bmd.alpha = param1;
      }
      
      public function get bitmap() : Bitmap
      {
         return this.bmd;
      }
      
      override public function set width(param1:Number) : void
      {
         this.bmd.width = param1;
      }
   }
}

