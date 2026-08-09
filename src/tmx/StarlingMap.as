package tmx
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import io.arkeus.tiled.TiledLayer;
   import io.arkeus.tiled.TiledMap;
   import io.arkeus.tiled.TiledObject;
   import io.arkeus.tiled.TiledObjectLayer;
   
   public class StarlingMap extends Sprite
   {
      
      private var _tmxData:TiledMap;
      
      private var _mapSprite:Dictionary;
      
      private var _index:int = 0;
      
      private var _bottomLayer:MapLayer;
      
      private var _mapLayer:MapEidtLayer;
      
      private var _topLayer:MapLayer;
      
      private var _npcLayer:MapLayer;
      
      private var _dataLayer:MapLayer;
      
      private var _unRight:Sprite;
      
      private var _eventSprite:MapLayer;
      
      public function StarlingMap(param1:XML)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this._tmxData = new TiledMap(param1);
         this._mapSprite = new Dictionary();
         this._mapLayer = new MapEidtLayer("map");
         this._mapLayer.layer = this.tmxObjectLayer;
         this.addChild(this._mapLayer);
         this._mapLayer.name = "_mapLayer";
         this._bottomLayer = new MapLayer("scenery");
         this.addChild(this._bottomLayer);
         this._bottomLayer.name = "_bottomLayer";
         this._npcLayer = new MapLayer("npc");
         this.addChild(this._npcLayer);
         this._npcLayer.name = "_npcLayer";
         this._topLayer = new MapLayer("scenery");
         this.addChild(this._topLayer);
         this._topLayer.name = "_topLayer";
         this._eventSprite = new MapLayer("event");
         this.addChild(this._eventSprite);
         this._eventSprite.name = "_eventSprite";
         this.drawMap();
         this._unRight = new Sprite();
         this._unRight.graphics.beginFill(16777215,0);
         this._unRight.graphics.drawRect(0,0,this.getWidth(),this.getHeight());
         this._unRight.visible = false;
         this._unRight.name = "_un";
         this.addChild(this._unRight);
         this._dataLayer = new MapLayer("data");
         this.addChild(this._dataLayer);
         this._dataLayer.name = "_dataLayer";
      }
      
      public function get tmx() : TiledMap
      {
         return this._tmxData;
      }
      
      private function drawMap() : void
      {
         var _loc2_:Object = null;
         var _loc3_:TiledObjectLayer = null;
         var _loc4_:Object = null;
         var _loc1_:Vector.<TiledLayer> = this._tmxData.layers.getObjectLayers();
         for(_loc2_ in _loc1_)
         {
            _loc3_ = _loc1_[_loc2_] as TiledObjectLayer;
            for(_loc4_ in _loc3_.objects)
            {
               this.parsing(_loc3_,_loc3_.objects[_loc4_]);
            }
         }
      }
      
      public function getLayerXML() : XML
      {
         var _loc3_:Object = null;
         var _loc4_:TiledObjectLayer = null;
         var _loc5_:XML = null;
         var _loc6_:XML = null;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc9_:XML = null;
         var _loc10_:XML = null;
         var _loc11_:XML = null;
         var _loc12_:String = null;
         var _loc13_:int = 0;
         var _loc1_:XML = <objectgroups/>;
         var _loc2_:Vector.<TiledLayer> = this._tmxData.layers.getObjectLayers();
         for(_loc3_ in _loc2_)
         {
            _loc4_ = _loc2_[_loc3_] as TiledObjectLayer;
            _loc5_ = <objectgroup/>;
            _loc5_.@name = _loc4_.name;
            _loc5_.@width = _loc4_.width;
            _loc5_.@height = _loc4_.height;
            _loc6_ = <properties/>;
            for(_loc7_ in _loc4_.properties.properties)
            {
               _loc9_ = <property/>;
               _loc9_.@name = _loc7_;
               _loc9_.@value = _loc4_.properties.properties[_loc7_];
               _loc6_.appendChild(_loc9_);
            }
            _loc5_.appendChild(_loc6_);
            for(_loc8_ in _loc4_.objects)
            {
               _loc10_ = <object/>;
               _loc10_.@x = _loc4_.objects[_loc8_].x;
               _loc10_.@y = _loc4_.objects[_loc8_].y;
               _loc11_ = <polygon/>;
               _loc12_ = "";
               _loc13_ = 0;
               while(_loc13_ < _loc4_.objects[_loc8_].points.length)
               {
                  _loc12_ += _loc4_.objects[_loc8_].points[_loc13_].x + "," + _loc4_.objects[_loc8_].points[_loc13_].y + " ";
                  _loc13_++;
               }
               _loc11_.@points = _loc12_.substr(0,_loc12_.length - 1);
               _loc6_ = <properties/>;
               for(_loc7_ in _loc4_.objects[_loc8_].properties.properties)
               {
                  _loc9_ = <property/>;
                  _loc9_.@name = _loc7_;
                  _loc9_.@value = _loc4_.objects[_loc8_].properties.properties[_loc7_];
                  _loc6_.appendChild(_loc9_);
               }
               _loc10_.appendChild(_loc6_);
               _loc10_.appendChild(_loc11_);
               _loc5_.appendChild(_loc10_);
            }
            _loc1_.appendChild(_loc5_);
         }
         return _loc1_;
      }
      
      private function parsing(param1:TiledObjectLayer, param2:TiledObject) : void
      {
         if(param2.points)
         {
            this.drawPointObject(param1,param2);
         }
      }
      
      private function drawPointObject(param1:TiledObjectLayer, param2:TiledObject) : void
      {
         var _loc3_:MapSprite = new MapSprite(param1,param2);
         var _loc4_:String = param1.name;
         var _loc5_:MapEidtLayer = _loc4_ == "hit_layer" ? this.mapNode : this.getChildByName(_loc4_) as MapEidtLayer;
         if(!_loc5_)
         {
            _loc5_ = new MapEidtLayer("map");
         }
         _loc5_.layer = param1;
         if(_loc5_.parent == null)
         {
            this.addChild(_loc5_);
         }
         _loc5_.name = _loc4_;
         _loc5_.addChild(_loc3_);
      }
      
      public function getWidth() : int
      {
         return this._tmxData.width * this._tmxData.tileWidth;
      }
      
      public function getHeight() : int
      {
         return this._tmxData.height * this._tmxData.tileHeight;
      }
      
      public function addAt(param1:DisplayObject, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this._bottomLayer.addChild(param1);
               break;
            case 1:
               this._mapLayer.addChild(param1);
               break;
            case 2:
               this._npcLayer.addChild(param1);
               break;
            case 3:
               this._topLayer.addChild(param1);
               break;
            case 4:
               this._eventSprite.addChild(param1);
         }
      }
      
      public function onFrame() : void
      {
         this.onNodeFrame(this._npcLayer);
      }
      
      public function onNodeFrame(param1:Sprite) : void
      {
         var _loc2_:int = param1.numChildren;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            try
            {
               param1.getChildAt(_loc3_)["onFrame"]();
            }
            catch(e:Error)
            {
            }
            _loc3_++;
         }
      }
      
      public function findRect(param1:Rectangle) : Vector.<SaveObject>
      {
         var _loc5_:MapLayer = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:SaveObject = null;
         var _loc9_:Rectangle = null;
         var _loc2_:Vector.<SaveObject> = new Vector.<SaveObject>();
         var _loc3_:int = this.numChildren;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this.getChildAt(_loc4_) as MapLayer;
            if(_loc5_)
            {
               _loc6_ = _loc5_.numChildren;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  _loc8_ = _loc5_.getChildAt(_loc7_) as SaveObject;
                  if(_loc8_)
                  {
                     _loc9_ = _loc8_.getBounds(_loc8_.parent).intersection(param1);
                     if(_loc9_.width != 0 && _loc9_.height != 0)
                     {
                        _loc2_.push(_loc8_);
                     }
                  }
                  _loc7_++;
               }
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function get npcNode() : Sprite
      {
         return this._npcLayer;
      }
      
      public function get topNode() : Sprite
      {
         return this._topLayer;
      }
      
      public function get bottomNode() : Sprite
      {
         return this._bottomLayer;
      }
      
      public function get eventNode() : Sprite
      {
         return this._eventSprite;
      }
      
      public function get mapNode() : MapEidtLayer
      {
         return this._mapLayer;
      }
      
      public function get dataNode() : Sprite
      {
         return this._dataLayer;
      }
      
      public function trash(param1:MapSprite) : void
      {
         param1.trash();
      }
      
      public function setWidth(param1:int) : void
      {
         this._tmxData.width = param1 / this._tmxData.tileWidth;
      }
      
      public function setHeight(param1:int) : void
      {
         this._tmxData.height = param1 / this._tmxData.tileHeight;
      }
      
      public function get tmxObjectLayer() : TiledObjectLayer
      {
         return this._tmxData.layers.getObjectLayers()[0] as TiledObjectLayer;
      }
      
      public function set rightEnble(param1:Boolean) : void
      {
         this._unRight.visible = !param1;
      }
      
      public function resetLayer() : void
      {
      }
   }
}

