package views.observe.map
{
   import flash.display.Sprite;
   import flash.geom.Point;
   import tmx.MapEidtLayer;
   import tmx.MapSprite;
   import tmx.StarlingMap;
   import utils.PointUtils;
   
   public class FinalMap extends Sprite
   {
      
      private var _bottomTextureSprite:Sprite;
      
      private var _topTextureSprite:Sprite;
      
      private var maskSprite:Sprite;
      
      private var _url:String;
      
      private var _bitmapAlats:BitmapAlats;
      
      private var _map:StarlingMap;
      
      private var _draw:MapEidtLayer;
      
      private var _offsetX:int = 0;
      
      private var _offsetY:int = 0;
      
      public function FinalMap(param1:StarlingMap, param2:MapEidtLayer, param3:String, param4:int = 0, param5:int = 0)
      {
         super();
         this._map = param1;
         this._draw = param2;
         this._bitmapAlats = new BitmapAlats(param3);
         this._bitmapAlats.back = this.onLoaded;
         this._offsetX = param4;
         this._offsetY = param5;
      }
      
      private function onLoaded(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:MapSprite = null;
         var _loc5_:MapSprite = null;
         var _loc6_:Vector.<Vector.<Point>> = null;
         var _loc7_:Object = null;
         if(param1)
         {
            this._bottomTextureSprite = new Sprite();
            this.addChild(this._bottomTextureSprite);
            this._topTextureSprite = new Sprite();
            this.addChild(this._topTextureSprite);
            this.maskSprite = new Sprite();
            this.addChild(this.maskSprite);
            _loc2_ = this._draw.numChildren - 1;
            while(_loc2_ >= 0)
            {
               _loc4_ = this._draw.getChildAt(_loc2_) as MapSprite;
               if(_loc4_)
               {
                  _loc5_ = _loc4_.copy();
                  _loc5_.mouseEnabled = false;
                  _loc5_.pointVisible = false;
                  this.maskSprite.addChild(_loc5_);
                  _loc6_ = _loc4_.lines;
                  if(_loc4_.drawMode == "auto")
                  {
                     if(_loc6_.length != 0)
                     {
                        for(_loc7_ in _loc6_)
                        {
                           this.drawPoint(_loc6_[_loc7_],_loc4_.x,_loc4_.y,_loc4_.currentMinX,_loc4_.currentMinY,true);
                        }
                     }
                     else
                     {
                        this.drawPoint(_loc4_.points,_loc4_.x,_loc4_.y,_loc4_.currentMinX,_loc4_.currentMinY);
                     }
                  }
               }
               _loc2_--;
            }
            _loc3_ = this._draw.layer.properties.get("wenli");
            if(_loc3_ == null)
            {
               _loc3_ = "";
            }
            this._bottomTextureSprite.graphics.beginBitmapFill(this._bitmapAlats.getBitmapData(_loc3_ == "" ? "wenli.png" : _loc3_),null,true,true);
            this._bottomTextureSprite.graphics.drawRect(0,0,this._map.getWidth(),this._map.getHeight());
            this._bottomTextureSprite.graphics.endFill();
            this._bottomTextureSprite.mask = this.maskSprite;
         }
      }
      
      public function drawPoint(param1:Vector.<Point>, param2:int, param3:int, param4:int, param5:int, param6:Boolean = true) : void
      {
         var _loc7_:Vector.<Point> = PointUtils.getMinXPoints(param6 ? PointUtils.getClockwisePoints(param1) : param1);
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_.length)
         {
            if(_loc7_[_loc9_].y < _loc7_[_loc8_].y)
            {
               _loc8_ = _loc9_;
            }
            _loc9_++;
         }
         var _loc10_:Vector.<Point> = this.getTopRoundPoints(_loc7_,_loc8_);
         this.drawTopTexture(_loc10_,param2,param3,param4,param5);
      }
      
      private function drawTopTexture(param1:Vector.<Point>, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:DrawImage = null;
         var _loc14_:DrawImage = null;
         var _loc8_:Number = -1;
         var _loc9_:Boolean = true;
         var _loc10_:int = 0;
         while(_loc10_ < param1.length)
         {
            if(_loc10_ == 0)
            {
               _loc6_ = param1[_loc10_];
            }
            else
            {
               _loc7_ = param1[_loc10_];
               _loc11_ = Math.atan2(_loc7_.y - _loc6_.y,_loc7_.x - _loc6_.x);
               _loc12_ = this.rad2deg(_loc11_);
               if(Math.abs(_loc12_) < 80)
               {
                  _loc13_ = new DrawImage(this._bitmapAlats.getBitmapData("dipi.png"));
                  _loc13_.align("left");
                  this._topTextureSprite.addChild(_loc13_);
                  _loc13_.x = param2 + _loc6_.x - param4 + this._offsetX;
                  _loc13_.y = param3 + _loc6_.y - param5 + this._offsetY;
                  _loc13_.width = Point.distance(_loc6_,_loc7_);
                  _loc13_.rotation = _loc12_;
                  if(_loc10_ != param1.length - 1)
                  {
                     _loc14_ = new DrawImage(this._bitmapAlats.getBitmapData("bian.png"));
                     _loc14_.align();
                     _loc14_.x = param2 + _loc7_.x - param4 + this._offsetX;
                     _loc14_.y = param3 + _loc7_.y - param5 + this._offsetY;
                     _loc14_.rotation = _loc12_;
                     this._topTextureSprite.addChild(_loc14_);
                  }
                  if(_loc9_)
                  {
                     _loc9_ = false;
                  }
                  _loc8_ = _loc11_;
               }
               _loc6_ = _loc7_;
            }
            _loc10_++;
         }
      }
      
      private function getTopRoundPoints(param1:Vector.<Point>, param2:int) : Vector.<Point>
      {
         var _loc3_:Vector.<Point> = new Vector.<Point>();
         _loc3_.push(param1[param2]);
         _loc3_ = _loc3_.concat(this.getRoundPoint(param1,param2,1));
         return this.getRoundPoint(param1,param2,-1).concat(_loc3_);
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
   }
}

