package tmx
{
   import flash.display.Bitmap;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import utils.RightUtils;
   
   public class Npc extends PoltDisplay
   {
      
      private var _data:SpriteBitmapData;
      
      private var _bitmap:Bitmap;
      
      private var _frame:int = 0;
      
      private var _spr:Sprite;
      
      private var _line:Shape;
      
      public function Npc(param1:SpriteBitmapData)
      {
         super();
         this._data = param1;
         this.mouseChildren = true;
         this._bitmap = new Bitmap(param1.targetBitmapData);
         this._spr = new Sprite();
         this.addChild(this._spr);
         this._spr.mouseEnabled = false;
         this._spr.addChild(this._bitmap);
         param1.drawBitmap(this._bitmap,0,this._spr);
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.beginFill(65280);
         _loc2_.graphics.drawRect(0,0,100,1);
         _loc2_.graphics.drawRect(0,0,1,100);
         _loc2_.graphics.drawRect(0,0,-100,1);
         _loc2_.graphics.drawRect(0,0,1,-100);
         this._line = _loc2_;
         this.addChild(_loc2_);
         RightUtils.onRightClick(this,"npcKey");
      }
      
      public function onFrame(param1:Boolean = true, param2:Boolean = false) : void
      {
         if(!param2)
         {
            return;
         }
         if(param1)
         {
            ++this._frame;
         }
         if(this._frame == this._data.length())
         {
            this._frame = 0;
         }
         this._data.drawBitmap(this._bitmap,this._frame,this._spr);
      }
      
      public function getData() : SpriteBitmapData
      {
         return this._data;
      }
      
      public function get bitmap() : Sprite
      {
         return this._spr;
      }
      
      public function set frame(param1:int) : void
      {
         this._frame = param1;
      }
      
      public function get frame() : int
      {
         return this._frame;
      }
      
      override public function getName() : String
      {
         return this.getData().targetName;
      }
      
      override public function getPath() : String
      {
         return this.getData().path;
      }
      
      override public function onSelect(param1:Boolean) : void
      {
         this.drawRect(param1 ? this._bitmap.getBounds(this) : null);
      }
      
      override public function set scaleX(param1:Number) : void
      {
         super.scaleX = param1;
         this._line.scaleX = 1 / param1;
      }
      
      override public function set scaleY(param1:Number) : void
      {
         super.scaleY = param1;
         this._line.scaleY = 1 / param1;
      }
      
      override public function get classBind() : String
      {
         if(this._data.targetXml["class"] != undefined)
         {
            return this._data.targetXml["class"];
         }
         return "<null>";
      }
      
      override public function get attribute() : Array
      {
         var _loc1_:Array = null;
         if(App.superSwf)
         {
            _loc1_ = App.superSwf.getAttributeList(this.classBind);
            if(_loc1_)
            {
               return _loc1_.concat("isCanHit","isThrough","liveRectEvent");
            }
         }
         return ["isCanHit","isThrough","liveRectEvent"];
      }
   }
}

