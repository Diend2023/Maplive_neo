package tmx
{
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class SaveObject extends Sprite
   {
      
      private var _selectSpr:Shape;
      
      private var _targetName:String;
      
      protected var _rTools:RotatingTools;
      
      protected var _sTools:ScaleTools;
      
      protected var _mTools:Shape;
      
      public var starlingBlendMode:String;
      
      public var instanceName:String = "";
      
      public var other:String = "";
      
      public var noChange:Boolean = false;
      
      private var _rect:Rectangle;
      
      private var _isSelect:Boolean = false;
      
      private var _selectTools:BaseTools;
      
      private var _pingpu:Boolean = false;
      
      public function SaveObject()
      {
         super();
         this._selectSpr = new Shape();
         this._sTools = new ScaleTools(this);
         this._rTools = new RotatingTools(this);
         this._mTools = new Shape();
         this.addChild(this._selectSpr);
         this.addChild(this._rTools);
         this.addChild(this._mTools);
      }
      
      public function toObject() : Object
      {
         return null;
      }
      
      public function onSelect(param1:Boolean) : void
      {
         this._isSelect = param1;
         if(!param1)
         {
            this.drawRect(null);
            return;
         }
         this.drawRect(this.getBounds(null));
      }
      
      public function drawRect(param1:Rectangle) : void
      {
         this._isSelect = param1 != null;
         this._mTools.graphics.clear();
         this._rTools.graphics.clear();
         this._sTools.graphics.clear();
         this._selectSpr.graphics.clear();
         if(!param1)
         {
            return;
         }
         if(isNaN(this.scaleX) || isNaN(this.scaleY))
         {
            return;
         }
         this._rect = param1;
         this._selectSpr.graphics.beginFill(16776960,1);
         this._selectSpr.graphics.drawRect(param1.x,param1.y,param1.width,param1.height);
         this._selectSpr.graphics.drawRect(param1.x + 1 / this.scaleX,param1.y + 1 / this.scaleY,param1.width - 2 / this.scaleX,param1.height - 2 / this.scaleY);
         this._selectSpr.graphics.endFill();
         this._rTools.graphics.beginFill(0);
         this._rTools.graphics.drawCircle(0,0,8);
         this._rTools.graphics.beginFill(16777215);
         this._rTools.graphics.drawCircle(0,0,7);
         this._rTools.graphics.endFill();
         this._rTools.graphics.beginFill(0);
         this._rTools.graphics.drawCircle(0,0,3);
         this._rTools.graphics.endFill();
         this._rTools.x = param1.x + param1.width;
         this._rTools.y = param1.y;
         this._rTools.scaleX = 1 / this.scaleX;
         this._rTools.scaleY = 1 / this.scaleY;
         this._sTools.graphics.beginFill(0);
         this._sTools.graphics.drawRect(0,0,14,14);
         this._sTools.graphics.beginFill(16777215);
         this._sTools.graphics.drawRect(1,1,12,12);
         this._sTools.graphics.endFill();
         this._sTools.graphics.beginFill(0);
         this._sTools.graphics.drawRect(4,4,6,6);
         this._sTools.x = param1.x + param1.width + 15;
         this._sTools.y = param1.y - 15;
         this._sTools.scaleX = 1 / this.scaleX;
         this._sTools.scaleY = 1 / this.scaleY;
         this._mTools.graphics.beginFill(0);
         this._mTools.graphics.drawCircle(0,0,5);
         this._mTools.graphics.beginFill(16777215);
         this._mTools.graphics.drawCircle(0,0,4);
         this._mTools.graphics.endFill();
         this._mTools.scaleX = 1 / this.scaleX;
         this._mTools.scaleY = 1 / this.scaleY;
      }
      
      override public function set scaleX(param1:Number) : void
      {
         super.scaleX = param1;
         if(this._isSelect && Boolean(this._rect))
         {
            this.drawRect(this._rect);
         }
      }
      
      override public function set scaleY(param1:Number) : void
      {
         super.scaleY = param1;
         if(this._isSelect && Boolean(this._rect))
         {
            this.drawRect(this._rect);
         }
      }
      
      public function set useTools(param1:BaseTools) : void
      {
         this._selectTools = param1;
      }
      
      public function get useTools() : BaseTools
      {
         return this._selectTools;
      }
      
      public function getName() : String
      {
         return this._targetName;
      }
      
      public function setName(param1:String) : void
      {
         this._targetName = param1;
      }
      
      public function get contentWidth() : int
      {
         return this._rect.width;
      }
      
      public function get contentHeight() : int
      {
         return this._rect.height;
      }
      
      public function get classBind() : String
      {
         return "<null>";
      }
      
      public function get attribute() : Array
      {
         return null;
      }
      
      public function clear() : void
      {
      }
      
      public function set pingpu(param1:Boolean) : void
      {
         this._pingpu = param1;
      }
      
      public function get pingpu() : Boolean
      {
         return this._pingpu;
      }
   }
}

