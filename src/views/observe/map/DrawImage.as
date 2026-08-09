package views.observe.map
{
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class DrawImage extends Sprite
   {
      
      private var _display:Shape;
      
      private var _bitmapData:BitmapData;
      
      private var _h:String;
      
      private var _v:String;
      
      public function DrawImage(param1:BitmapData, param2:int = 0, param3:int = 0)
      {
         super();
         this._display = new Shape();
         this.addChild(this._display);
         if(!param1)
         {
            return;
         }
         this._bitmapData = param1;
         this.width = param1.width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._display.graphics.clear();
         this._display.graphics.beginBitmapFill(this._bitmapData,null,true,true);
         this._display.graphics.drawRect(0,0,param1,this._bitmapData.height);
         this.align(this._h,this._v);
      }
      
      public function align(param1:String = "center", param2:String = "center") : void
      {
         this._h = param1;
         this._v = param2;
         switch(param1)
         {
            case "center":
               this._display.x = -this._display.width / 2;
               break;
            case "left":
               this._display.x = 0;
               break;
            case "right":
               this._display.x = -this._display.width;
         }
         switch(param2)
         {
            case "center":
               this._display.y = -this._display.height / 2;
               break;
            case "top":
               this._display.y = 0;
               break;
            case "bottom":
               this._display.y = -this._display.height;
         }
      }
   }
}

