package tmx
{
   import events.RightClickEvent;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import io.arkeus.tiled.TiledObject;
   import io.arkeus.tiled.TiledObjectLayer;
   import mx.controls.Alert;
   import utils.PointUtils;
   import utils.RightUtils;
   
   public class MapSprite extends Sprite
   {
      
      private var _data:TiledObject;
      
      private var _root:TiledObjectLayer;
      
      private var _pointSprite:Vector.<PointSprite>;
      
      private var _spr:Sprite;
      
      private var _mapspr:Shape;
      
      private var _lineSpr:Sprite;
      
      public var currentMinX:int = 0;
      
      public var currentMinY:int = 0;
      
      public var pointVisible:Boolean = true;
      
      private var _mode:String = "not_penetrate";
      
      private var _lines:Vector.<Vector.<Point>>;
      
      public function MapSprite(param1:TiledObjectLayer, param2:TiledObject)
      {
         var root:TiledObjectLayer = param1;
         var data:TiledObject = param2;
         super();
         this._root = root;
         this._mapspr = new Shape();
         this.addChild(this._mapspr);
         this._spr = new Sprite();
         this._lineSpr = new Sprite();
         this.addChild(this._spr);
         this._spr.addChild(this._lineSpr);
         this._spr.visible = false;
         this._pointSprite = new Vector.<PointSprite>();
         this._data = data;
         this._mode = data.properties.get("mode");
         this._lines = new Vector.<Vector.<Point>>();
         this.pasringLineData(this._data.properties.get("lines"));
         this.createDefalutLine();
         if(!this._mode)
         {
            this._mode = MapSpriteMode.NOT_PENETRATE;
         }
         this.addEventListener(Event.ADDED_TO_STAGE,function(param1:Event):void
         {
            onDraw();
         });
         RightUtils.onRightClick(this,"mapSprite");
         this.addEventListener(RightClickEvent.CLICK,this.onClick);
      }
      
      public function onClick(param1:RightClickEvent) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Vector.<Point> = null;
         var _loc4_:int = 0;
         var _loc5_:PointSprite = null;
         switch(param1.clickTag)
         {
            case "新建节点":
               _loc2_ = new Point(this.mouseX + this.currentMinX,this.mouseY + this.currentMinY);
               _loc3_ = this.findLine(_loc2_);
               _loc4_ = int(this.points.indexOf(_loc3_[0]));
               this.points.insertAt(_loc4_ + 1,_loc2_);
               _loc5_ = new PointSprite(_loc2_,MapSpriteMode.getColor(this.mode));
               this._spr.addChild(_loc5_);
               this._pointSprite.push(_loc5_);
               this.hasLine(_loc3_[0],_loc3_[1],true);
               this.onDraw();
               break;
            case "删除节点":
               if(this.points.length > 3)
               {
                  this.points.removeAt(this.points.indexOf((param1.target as PointSprite).point));
                  this.hasLineOr((param1.target as PointSprite).point,true);
                  // this._pointSprite.removeAt(this._pointSprite.indexOf(param1.target));
                  this._pointSprite.removeAt(this._pointSprite.indexOf(param1.target as PointSprite)); //
                  (param1.target as DisplayObject).parent.removeChild(param1.target as DisplayObject);
                  this.onDraw();
                  break;
               }
               Alert.show("多边形有效点已不足","提示");
         }
      }
      
      public function pasringLineData(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         var _loc5_:Vector.<Point> = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         if(param1)
         {
            _loc2_ = JSON.parse(param1) as Array;
            for(_loc3_ in _loc2_)
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new Vector.<Point>();
               for(_loc6_ in _loc4_)
               {
                  for(_loc7_ in this.points)
                  {
                     if(this.points[_loc7_].x == _loc4_[_loc6_].x && this.points[_loc7_].y == _loc4_[_loc6_].y)
                     {
                        _loc5_.push(this.points[_loc7_]);
                     }
                  }
               }
               this._lines.push(_loc5_);
            }
         }
      }
      
      public function createDefalutLine() : void
      {
      }
      
      public function onUp(param1:MouseEvent) : void
      {
         var _loc2_:Vector.<Point> = null;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         if(param1.commandKey || param1.ctrlKey)
         {
            _loc2_ = this.findLine(new Point(this.mouseX + this.currentMinX,this.mouseY + this.currentMinY));
            _loc3_ = true;
            _loc4_ = int(this._lines.length - 1);
            while(_loc4_ >= 0)
            {
               if(this._lines[_loc4_][0] == _loc2_[0] && this._lines[_loc4_][1] == _loc2_[1])
               {
                  this._lines.splice(_loc4_,1);
                  _loc3_ = false;
                  break;
               }
               _loc4_--;
            }
            if(_loc3_)
            {
               this._lines.push(_loc2_);
            }
            this.onDraw();
            this._data.properties.set("lines",JSON.stringify(this._lines));
         }
      }
      
      public function hasLine(param1:Point, param2:Point, param3:Boolean = false) : Boolean
      {
         var _loc4_:int = int(this._lines.length - 1);
         while(_loc4_ >= 0)
         {
            if(this._lines[_loc4_][0] == param1 && this._lines[_loc4_][1] == param2)
            {
               if(param3)
               {
                  this._lines.removeAt(_loc4_);
               }
               return true;
            }
            _loc4_--;
         }
         return false;
      }
      
      public function hasLineOr(param1:Point, param2:Boolean = false) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = int(this._lines.length - 1);
         while(_loc4_ >= 0)
         {
            if(this._lines[_loc4_][0] == param1 || this._lines[_loc4_][1] == param1)
            {
               if(param2)
               {
                  this._lines.removeAt(_loc4_);
               }
               _loc3_ = true;
            }
            _loc4_--;
         }
         return _loc3_;
      }
      
      public function findLine(param1:Point) : Vector.<Point>
      {
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         var _loc7_:int = 0;
         var _loc2_:Vector.<Point> = new Vector.<Point>();
         var _loc5_:int = 9999;
         var _loc6_:int = 1;
         while(_loc6_ <= this.points.length)
         {
            if(_loc6_ == 1)
            {
               _loc3_ = this.points[0];
               _loc4_ = this.points[1];
            }
            else
            {
               _loc3_ = _loc4_;
               if(_loc6_ == this.points.length)
               {
                  _loc4_ = this.points[0];
               }
               else
               {
                  _loc4_ = this.points[_loc6_];
               }
            }
            _loc7_ = PointUtils.pointToLine(_loc3_,_loc4_,param1);
            if(_loc5_ > _loc7_)
            {
               _loc5_ = _loc7_;
               _loc2_[0] = _loc3_;
               _loc2_[1] = _loc4_;
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      public function onDraw() : void
      {
         var _loc3_:PointSprite = null;
         this.currentMinX = 0;
         this.currentMinY = 0;
         this._mapspr.graphics.clear();
         this._mapspr.graphics.beginFill(0,this.mode == MapSpriteMode.NOT_VISIBLE_STES ? 0.5 : 1);
         this._mapspr.graphics.lineStyle(1,MapSpriteMode.getColor(this.mode),1,false);
         this._lineSpr.graphics.clear();
         this._lineSpr.graphics.beginFill(65280,0.3);
         var _loc1_:int = 0;
         while(_loc1_ < this._data.points.length)
         {
            this._lineSpr.graphics.lineStyle(1,MapSpriteMode.getColor(this.mode),1,false);
            if(_loc1_ != 0)
            {
               this._lineSpr.graphics.lineTo(this._data.points[_loc1_].x,this._data.points[_loc1_].y);
               this._mapspr.graphics.lineTo(this._data.points[_loc1_].x,this._data.points[_loc1_].y);
            }
            else
            {
               this._lineSpr.graphics.moveTo(this._data.points[_loc1_].x,this._data.points[_loc1_].y);
               this._mapspr.graphics.moveTo(this._data.points[_loc1_].x,this._data.points[_loc1_].y);
            }
            if(this._data.points[_loc1_].x < this.currentMinX)
            {
               this.currentMinX = this._data.points[_loc1_].x;
            }
            if(this._data.points[_loc1_].y < this.currentMinY)
            {
               this.currentMinY = this._data.points[_loc1_].y;
            }
            if(_loc1_ > this._pointSprite.length - 1 && this.pointVisible)
            {
               _loc3_ = new PointSprite(this._data.points[_loc1_],MapSpriteMode.getColor(this.mode));
               this._pointSprite.push(_loc3_);
               this._spr.addChild(_loc3_);
            }
            _loc1_++;
         }
         this._mapspr.graphics.endFill();
         var _loc2_:int = 0;
         while(_loc2_ < this._lines.length)
         {
            if(this._lines[_loc2_].length > 1)
            {
               this._mapspr.graphics.lineStyle(5,MapSpriteMode.getColor(this.mode),1,false);
               this._mapspr.graphics.moveTo(this._lines[_loc2_][0].x,this._lines[_loc2_][0].y);
               this._mapspr.graphics.lineTo(this._lines[_loc2_][1].x,this._lines[_loc2_][1].y);
               this._mapspr.graphics.endFill();
            }
            _loc2_++;
         }
         this._mapspr.x = -this.currentMinX;
         this._mapspr.y = -this.currentMinY;
         this.x = this._data.x + this.currentMinX;
         this.y = this._data.y + this.currentMinY;
         this._spr.x = -this.currentMinX;
         this._spr.y = -this.currentMinY;
         this._data.properties.set("lines",JSON.stringify(this._lines));
      }
      
      public function onDrawPoint() : void
      {
         this._spr.visible = true;
      }
      
      public function closePointDraw() : void
      {
         this._spr.visible = false;
      }
      
      public function get isSelect() : Boolean
      {
         return this._spr.visible;
      }
      
      public function onMovePoint() : Boolean
      {
         var _loc1_:Object = null;
         if(int(this.x) != this._data.x + this.currentMinX || int(this.y) != this._data.y + this.currentMinY)
         {
            this._data.x = this.x - this.currentMinX;
            this._data.y = this.y - this.currentMinY;
            return true;
         }
         for(_loc1_ in this._pointSprite)
         {
            this._pointSprite[_loc1_].onMove();
         }
         this.onDraw();
         return false;
      }
      
      public function onResetPoints() : void
      {
         var _loc1_:Object = null;
         for(_loc1_ in this._pointSprite)
         {
            this._pointSprite[_loc1_].onReset();
         }
      }
      
      public function get points() : Vector.<Point>
      {
         return this._data.points;
      }
      
      public function get data() : TiledObject
      {
         return this._data;
      }
      
      public function trash() : void
      {
         this._root.objects.splice(this._root.objects.indexOf(this.data),1);
         this.parent.removeChild(this);
      }
      
      public function set layer(param1:TiledObjectLayer) : void
      {
         this._root = param1;
      }
      
      public function get layer() : TiledObjectLayer
      {
         return this._root;
      }
      
      public function set mode(param1:String) : void
      {
         this._mode = param1;
         this._data.properties.set("mode",param1);
         this.onDraw();
      }
      
      public function get mode() : String
      {
         return this._mode;
      }
      
      public function setPointScale(param1:Number) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._pointSprite.length)
         {
            this._pointSprite[_loc2_].scaleX = param1;
            this._pointSprite[_loc2_].scaleY = param1;
            _loc2_++;
         }
      }
      
      public function copy() : MapSprite
      {
         var _loc1_:MapSprite = new MapSprite(this._root,this._data);
         _loc1_.x = this.x;
         _loc1_.y = this.y;
         return _loc1_;
      }
      
      public function getDrawPoint() : Vector.<Point>
      {
         var _loc1_:Vector.<Point> = PointUtils.getMinXPoints(PointUtils.getClockwisePoints(this.points));
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.length)
         {
            if(_loc1_[_loc3_].y < _loc1_[_loc2_].y)
            {
               _loc2_ = _loc3_;
            }
            _loc3_++;
         }
         return this.getTopRoundPoints(_loc1_,_loc2_);
      }
      
      private function getTopRoundPoints(param1:Vector.<Point>, param2:int) : Vector.<Point>
      {
         var _loc3_:Vector.<Point> = new Vector.<Point>();
         _loc3_.push(param1[param2]);
         _loc3_ = _loc3_.concat(this.getRoundPoint(param1,param2,1));
         return this.getRoundPoint(param1,param2,-1).concat(_loc3_);
      }
      
      public function get lines() : Vector.<Vector.<Point>>
      {
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         var _loc1_:Vector.<Vector.<Point>> = new Vector.<Vector.<Point>>();
         var _loc2_:int = 0;
         while(_loc2_ < this._lines.length)
         {
            _loc3_ = true;
            _loc4_ = false;
            _loc5_ = -1;
            for(_loc6_ in _loc1_)
            {
               if(_loc1_[_loc6_][0].x == this._lines[_loc2_][1].x && _loc1_[_loc6_][0].y == this._lines[_loc2_][1].y)
               {
                  if(_loc4_)
                  {
                     _loc1_[_loc5_].pop();
                     _loc1_[_loc6_] = _loc1_[_loc5_].concat(_loc1_[_loc6_]);
                     _loc1_.removeAt(_loc5_);
                  }
                  else
                  {
                     _loc1_[_loc6_].insertAt(0,this._lines[_loc2_][0]);
                     _loc4_ = true;
                     _loc3_ = false;
                     _loc5_ = int(_loc6_);
                  }
               }
               else if(_loc1_[_loc6_][_loc1_[_loc6_].length - 1].x == this._lines[_loc2_][0].x && _loc1_[_loc6_][_loc1_[_loc6_].length - 1].y == this._lines[_loc2_][0].y)
               {
                  if(_loc4_)
                  {
                     _loc1_[_loc6_].pop();
                     _loc1_[_loc5_] = _loc1_[_loc6_].concat(_loc1_[_loc5_]);
                     _loc1_.removeAt(int(_loc6_));
                  }
                  else
                  {
                     _loc1_[_loc6_].push(this._lines[_loc2_][1]);
                     _loc4_ = true;
                     _loc3_ = false;
                     _loc5_ = int(_loc6_);
                  }
               }
            }
            if(_loc3_)
            {
               _loc1_.push(this._lines[_loc2_].concat());
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function rad2deg(param1:Number) : Number
      {
         return param1 / Math.PI * 180;
      }
      
      private function getRoundPoint(param1:Vector.<Point>, param2:int, param3:int) : Vector.<Point>
      {
         var _loc4_:Vector.<Point> = new Vector.<Point>();
         var _loc5_:Point = param1[param2];
         param2 += param3;
         while(!(param2 < 0 || param2 >= param1.length))
         {
            if(param3 == 1)
            {
               if(_loc5_.x >= param1[param2].x)
               {
                  break;
               }
               _loc4_.push(param1[param2]);
               _loc5_ = param1[param2];
            }
            else
            {
               if(_loc5_.x <= param1[param2].x)
               {
                  break;
               }
               _loc4_.splice(0,0,param1[param2]);
               _loc5_ = param1[param2];
            }
            param2 += param3;
         }
         return _loc4_;
      }
      
      public function get drawMode() : String
      {
         var _loc1_:String = this.data.properties.get("draw_mode");
         if(!_loc1_)
         {
            return "auto";
         }
         return _loc1_;
      }
   }
}

