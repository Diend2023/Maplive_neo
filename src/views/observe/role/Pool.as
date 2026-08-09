package views.observe.role
{
   import dragonBones.flash.FlashFactory;
   import flash.accessibility.*;
   import flash.data.*;
   import flash.debugger.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filesystem.*;
   import flash.geom.*;
   import flash.html.*;
   import flash.html.script.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.controls.Alert;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.mx_internal; //
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.VScrollBar;
   import tmx.BitmapDarw;
   import utils.FileUtils;
   
   public class Pool extends Group
   {

      use namespace mx_internal; //
      
      private var _98629247group:UIComponent;
      
      private var _1223677522onCreateDragon:Function;
      
      private var _1231375223onDragonLoaded:Function;
      
      private var _671402610onSelectFrame:Function;
      
      private var _907680051scroll:VScrollBar;
      
      private var _3619493view:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _xml:XML;
      
      private var _bitmapData:BitmapData;
      
      private var _batchIndex:int = -1;
      
      private var _file:File;
      
      private var _bitmapDataDict:Dictionary;
      
      private var _xmlDict:Dictionary;
      
      private var _list:Array;
      
      public var drgonData:FlashFactory;
      
      public var drgonSkeData:Object;
      
      public var selectId:int = -1;
      
      public var selectMoveId:int = -1;
      
      public function Pool()
      {
         super();
         mx_internal::_document = this;
         this.width = 400;
         this.height = 300;
         this.mxmlContent = [this._Pool_Group2_i(),this._Pool_VScrollBar1_i()];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function parsingDrgonBone(param1:File, param2:XML) : void
      {
         var tex:XMLList;
         var ske:XMLList;
         var texPath:String = null;
         var skePath:String = null;
         var file:File = param1;
         var xml:XML = param2;
         this._xml = xml;
         this.drgonData = new FlashFactory();
         tex = xml.content.child("tex");
         texPath = tex[0].@path;
         texPath = texPath.substr(0,texPath.lastIndexOf("."));
         ske = xml.content.child("ske");
         skePath = ske[0].@path;
         FileUtils.readImage(file.parent.parent.resolvePath(texPath + ".png"),function(param1:Event):void
         {
            _bitmapData = (param1.target.content as Bitmap).bitmapData;
            drgonSkeData = JSON.parse(FileUtils.readString(file.parent.parent.resolvePath(skePath)));
            drgonData.parseTextureAtlasData(JSON.parse(FileUtils.readString(file.parent.parent.resolvePath(texPath + ".json"))),_bitmapData);
            drgonData.parseDragonBonesData(drgonSkeData);
            onDragonLoaded();
            onCreateDragon(drgonData.buildArmature(drgonSkeData.armature[0].name).display);
         });
      }
      
      public function parsingAction(param1:XML) : void
      {
         var _loc3_:Object = null;
         var _loc4_:XML = null;
         var _loc5_:Array = null;
         var _loc6_:Object = null;
         var _loc7_:XML = null;
         var _loc8_:Array = null;
         var _loc9_:XMLList = null;
         var _loc10_:Object = null;
         var _loc11_:int = 0;
         var _loc2_:Array = this.drgonSkeData.armature;
         for(_loc3_ in _loc2_)
         {
            if(param1.child(_loc2_[_loc3_].name).length() == 0)
            {
               _loc4_ = new XML("<" + _loc2_[_loc3_].name + "><action/></" + _loc2_[_loc3_].name + ">");
               _loc5_ = _loc2_[_loc3_].animation;
               for(_loc6_ in _loc5_)
               {
                  _loc7_ = <act/>;
                  _loc7_.@name = _loc5_[_loc6_].name;
                  _loc4_.action.appendChild(_loc7_);
                  this.autoFrame(_loc7_,_loc5_[_loc6_].duration);
               }
               param1.appendChild(_loc4_);
            }
            else
            {
               _loc8_ = _loc2_[_loc3_].animation;
               _loc9_ = param1.child(_loc2_[_loc3_].name)[0].action[0].children();
               for(_loc10_ in _loc8_)
               {
                  _loc11_ = 0;
                  while(_loc11_ < _loc9_.length())
                  {
                     if(String(_loc9_[_loc11_].@name) == _loc8_[_loc10_].name)
                     {
                        this.autoDelFrame(_loc9_[_loc11_],_loc8_[_loc10_].duration);
                        break;
                     }
                     _loc11_++;
                  }
               }
            }
         }
      }
      
      private function autoDelFrame(param1:XML, param2:int) : void
      {
         param2--;
         var _loc3_:XMLList = param1.children();
         var _loc4_:int = _loc3_.length() - 1;
         while(_loc4_ >= 0)
         {
            if(_loc4_ <= param2)
            {
               break;
            }
            delete _loc3_[_loc4_];
            _loc4_--;
         }
      }
      
      private function autoFrame(param1:XML, param2:int) : void
      {
         var _loc4_:XML = null;
         var _loc3_:int = 0;
         while(_loc3_ < param2)
         {
            _loc4_ = <frame/>;
            _loc4_.@id = _loc3_;
            param1.appendChild(_loc4_);
            _loc3_++;
         }
      }
      
      public function parsing(param1:File) : void
      {
         var data:String = null;
         var xml:XML = null;
         var path:String = null;
         var file:File = param1;
         this._bitmapDataDict = new Dictionary();
         this._xmlDict = new Dictionary();
         try
         {
            data = FileUtils.readString(file);
            if(data.indexOf("?>") != -1)
            {
               data = data.substr(data.indexOf("?>") + 2,data.length);
            }
            xml = new XML(data);
         }
         catch(e:Error)
         {
            Alert.show("无法读取精灵表数据，请检查编码是否正确：" + e.message,"错误");
            return;
         }
         this._file = file;
         if(xml.@imagePath != undefined)
         {
            this._xml = xml;
            path = xml.@imagePath;
            FileUtils.readImage(file.parent.resolvePath(path),this.onReadImage);
         }
      }
      
      public function onReadImage(param1:Event) : void
      {
         var _loc7_:Rectangle = null;
         var _loc8_:Sprite = null;
         var _loc9_:Number = NaN;
         this._bitmapData = (param1.target.content as Bitmap).bitmapData;
         this._list = [];
         while(this.group.numChildren != 0)
         {
            this.group.removeChildAt(0);
         }
         var _loc2_:XMLList = this._xml.children();
         var _loc3_:int = int(this._xml.SubTexture.length());
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc7_ = this.getConfigRect(_loc6_);
            _loc8_ = this.createSprite(_loc7_);
            this.group.addChild(_loc8_);
            _loc9_ = 180 / _loc8_.width;
            if(_loc8_.width < 180)
            {
               _loc9_ = 1;
            }
            _loc8_.scaleX = _loc9_;
            _loc8_.scaleY = _loc9_;
            _loc8_.y = _loc4_;
            _loc8_.name = String(_loc2_[_loc6_].@name);
            _loc4_ += _loc8_.height;
            this._bitmapDataDict[String(_loc2_[_loc6_].@name)] = BitmapDarw.xmlForBitmapData(this._bitmapData,_loc2_[_loc6_]);
            this._xmlDict[String(_loc2_[_loc6_].@name)] = _loc2_[_loc6_];
            this._list.push({
               "id":_loc6_,
               "name":String(_loc2_[_loc6_].@name),
               "spr":_loc8_
            });
            _loc6_++;
         }
         this.group.addEventListener(MouseEvent.MOUSE_MOVE,this.onMove);
         this.group.addEventListener(MouseEvent.MOUSE_OUT,this.onOut);
         this.group.addEventListener(MouseEvent.MOUSE_DOWN,this.onDown);
         this.group.addEventListener(MouseEvent.MOUSE_UP,this.onUp);
         this.group.height = _loc4_;
         this.scroll.viewport = this.view;
      }
      
      public function getBitmapDataFormName(param1:String) : BitmapData
      {
         return this._bitmapDataDict[param1];
      }
      
      public function getFramePointFormName(param1:String) : Point
      {
         return new Point(this._xmlDict[param1].@frameX,this._xmlDict[param1].@frameY);
      }
      
      public function getPx() : int
      {
         return int(this._xml.@px);
      }
      
      public function getPy() : int
      {
         return int(this._xml.@py);
      }
      
      public function getIDFormName(param1:String) : int
      {
         var _loc2_:Object = null;
         for(_loc2_ in this._list)
         {
            if(this._list[_loc2_].name == param1)
            {
               return this._list[_loc2_].id;
            }
         }
         return -1;
      }
      
      private function onDown(param1:MouseEvent) : void
      {
         this.selectId = this.getIDFormName(param1.target.name);
         this.selectMoveId = this.selectId;
         this.select(this.selectId,this.selectMoveId);
      }
      
      private function onMove(param1:MouseEvent) : void
      {
         param1.target.alpha = 1;
         this.selectMoveId = this.getIDFormName(param1.target.name);
         this.select(this.selectId,this.selectMoveId);
      }
      
      private function onUp(param1:MouseEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:int = this.selectId;
         var _loc3_:int = this.selectMoveId;
         if(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_;
            while(_loc4_ <= _loc3_)
            {
               if(this._bitmapDataDict[this._list[_loc4_].name])
               {
                  this.onSelectFrame(this._list[_loc4_].name);
               }
               _loc4_++;
            }
         }
         else
         {
            _loc5_ = _loc2_;
            while(_loc5_ >= _loc3_)
            {
               if(this._bitmapDataDict[this._list[_loc5_].name])
               {
                  this.onSelectFrame(this._list[_loc5_].name);
               }
               _loc5_--;
            }
         }
         this.selectId = -1;
         this.select(-1,-1);
      }
      
      private function onOut(param1:MouseEvent) : void
      {
         param1.target.alpha = 0.5;
      }
      
      public function select(param1:int, param2:int) : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         for(_loc3_ in this._list)
         {
            this._list[_loc3_].spr.alpha = 0.5;
         }
         if(param1 == -1)
         {
            return;
         }
         if(param1 < param2)
         {
            _loc4_ = param1;
            while(_loc4_ <= param2)
            {
               this._list[_loc4_].spr.alpha = 1;
               _loc4_++;
            }
         }
         else
         {
            _loc5_ = param1;
            while(_loc5_ >= param2)
            {
               this._list[_loc5_].spr.alpha = 1;
               _loc5_--;
            }
         }
      }
      
      private function getConfigRect(param1:int) : Rectangle
      {
         var _loc2_:XML = this._xml.SubTexture[param1];
         var _loc3_:int = int(_loc2_.@x);
         var _loc4_:int = int(_loc2_.@y);
         var _loc5_:int = int(_loc2_.@width);
         var _loc6_:int = int(_loc2_.@height);
         return new Rectangle(_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      private function createSprite(param1:Rectangle) : Sprite
      {
         var _loc2_:Matrix = new Matrix();
         _loc2_.tx = -param1.x;
         _loc2_.ty = -param1.y;
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginBitmapFill(this._bitmapData,_loc2_);
         _loc3_.graphics.drawRect(0,0,param1.width,param1.height);
         _loc3_.alpha = 0.5;
         return _loc3_;
      }
      
      public function getBitmapData() : BitmapData
      {
         return this._bitmapData;
      }
      
      public function getXMLFrameByName(param1:String) : XML
      {
         var _loc3_:Object = null;
         var _loc2_:XMLList = this._xml.children();
         for(_loc3_ in _loc2_)
         {
            if(_loc2_[_loc3_].@name == param1)
            {
               return _loc2_[_loc3_];
            }
         }
         return null;
      }
      
      public function saveXML() : void
      {
      }
      
      public function clear() : void
      {
         this._bitmapData.dispose();
         this._bitmapData = null;
         System.disposeXML(this._xml);
      }
      
      public function getGPUUseMenemy() : int
      {
         var _loc1_:int = 0;
         if(this._bitmapData)
         {
            _loc1_ += mathGPU(this._bitmapData);
         }
         return _loc1_;
      }
      
      private function _Pool_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 10;
         _loc1_.right = 10;
         _loc1_.top = 10;
         _loc1_.bottom = 10;
         _loc1_.mxmlContent = [this._Pool_UIComponent1_i()];
         _loc1_.id = "view";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.view = _loc1_;
         BindingManager.executeBindings(this,"view",this.view);
         return _loc1_;
      }
      
      private function _Pool_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "group";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.group = _loc1_;
         BindingManager.executeBindings(this,"group",this.group);
         return _loc1_;
      }
      
      private function _Pool_VScrollBar1_i() : VScrollBar
      {
         var _loc1_:VScrollBar = new VScrollBar();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "scroll";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroll = _loc1_;
         BindingManager.executeBindings(this,"scroll",this.scroll);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get group() : UIComponent
      {
         return this._98629247group;
      }
      
      public function set group(param1:UIComponent) : void
      {
         var _loc2_:Object = this._98629247group;
         if(_loc2_ !== param1)
         {
            this._98629247group = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"group",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get onCreateDragon() : Function
      {
         return this._1223677522onCreateDragon;
      }
      
      public function set onCreateDragon(param1:Function) : void
      {
         var _loc2_:Object = this._1223677522onCreateDragon;
         if(_loc2_ !== param1)
         {
            this._1223677522onCreateDragon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"onCreateDragon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get onDragonLoaded() : Function
      {
         return this._1231375223onDragonLoaded;
      }
      
      public function set onDragonLoaded(param1:Function) : void
      {
         var _loc2_:Object = this._1231375223onDragonLoaded;
         if(_loc2_ !== param1)
         {
            this._1231375223onDragonLoaded = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"onDragonLoaded",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get onSelectFrame() : Function
      {
         return this._671402610onSelectFrame;
      }
      
      public function set onSelectFrame(param1:Function) : void
      {
         var _loc2_:Object = this._671402610onSelectFrame;
         if(_loc2_ !== param1)
         {
            this._671402610onSelectFrame = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"onSelectFrame",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scroll() : VScrollBar
      {
         return this._907680051scroll;
      }
      
      public function set scroll(param1:VScrollBar) : void
      {
         var _loc2_:Object = this._907680051scroll;
         if(_loc2_ !== param1)
         {
            this._907680051scroll = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scroll",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get view() : Group
      {
         return this._3619493view;
      }
      
      public function set view(param1:Group) : void
      {
         var _loc2_:Object = this._3619493view;
         if(_loc2_ !== param1)
         {
            this._3619493view = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"view",_loc2_,param1));
            }
         }
      }
   }
}

