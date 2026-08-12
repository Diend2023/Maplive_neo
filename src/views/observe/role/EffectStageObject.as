package views.observe.role
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.filesystem.File;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.system.System;
   import tmx.BitmapDarw;
   import utils.FileUtils;
   import utils.RightUtils;
   import utils.SpriteUtils;
   import views.observe.role.frame.EffectData;
   import views.observe.role.frame.Frame;
   
   public class EffectStageObject extends StageObject
   {
      
      private var _bitmapData:BitmapData;
      
      private var _xml:XML;
      
      private var _bitmap:Bitmap;
      
      private var _select:Sprite;
      
      private var _sSprite:Sprite;
      
      private var _name:String;
      
      public var frame:Frame;
      
      public var data:EffectData;
      
      public var color:uint;
      
      public var isTouch:Boolean = false;
      
      public var isLoaded:Boolean = false;
      
      public var xmlFile:File;
      
      public var atFrame:Frame;
      
      public var selected:Boolean = false;
      
      private var _lastIndex:int = -1;

      private static var _cache:Object = {};   // 特效位图缓存（按名去重，跨角色复用）

      private static var _pending:Object = {};   // 特效名 -> 等待该特效加载完成的EffectStageObject数组
      
      public function EffectStageObject(param1:Object = null)
      {
         super();
         this._name = param1.name;
         this.data = new EffectData(this._name);
         if(param1)
         {
            this.data.initData(param1);
         }
         this._bitmap = new Bitmap(); // 从下面移动到这里
         this._select = new Sprite(); //
         this._sSprite = new Sprite(); //
         this._select.mouseEnabled = false; //
         this.addChild(this._select); //
         this.addChild(this._sSprite); //
         if(_cache[this._name] != null)   // 缓存命中：复用位图，只加载XML
         { //
            this._bitmapData = _cache[this._name]; //
            this._loadEffectXml(); //
         } //
         else if(_pending[this._name] != null)   // 加载中：挂入等待队列
         { //
            _pending[this._name].push(this); //
            this._bitmapData = null; //
         } //
         else   // 缓存未命中：正常加载PNG
         { //
            _pending[this._name] = [this]; //
            var _loc2_:Loader = new Loader();
            var _loc3_:File = App.projectFile.resolvePath("effect/" + this._name + ".png");
            _loc2_.load(new URLRequest(_loc3_.url));
            _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onComplete);
            _loc2_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         } //
         // this._bitmap = new Bitmap();
         // this._select = new Sprite();
         // this._sSprite = new Sprite();
         // this._select.mouseEnabled = false;
         // this.addChild(this._select);
         // this.addChild(this._sSprite);
         RightUtils.onRightClick(this,"effect");
      }
      
      private function onError(param1:IOErrorEvent) : void
      {
      }

      private function onComplete(param1:Event) : void
      {
         this._bitmapData = param1.target.content.bitmapData;
         _cache[this._name] = this._bitmapData;   // 存入缓存
         // 通知所有等待该特效的实例复用位图
         var pendingList:Array = _pending[this._name]; //
         if(pendingList) //
         { //
            for each(var eo:EffectStageObject in pendingList) //
            { //
               if(eo != this) //
               { //
                  eo._bitmapData = this._bitmapData; // 复用共享位图
                  eo._loadEffectXml(); // 加载XML并显示
               } //
            } //
         } //
         delete _pending[this._name]; // 清理等待队列
         var _loc2_:File = new File((param1.target as LoaderInfo).url);
         _loc2_ = _loc2_.parent.resolvePath(_loc2_.name.substr(0,_loc2_.name.length - 4) + ".xml");
         if(_loc2_.exists)
         {
            this.onDataComplete(FileUtils.readString(_loc2_));
         }
         this.xmlFile = _loc2_;
      }
      
      private function _loadEffectXml() : void //
      { //
         var f:File = App.projectFile.resolvePath("effect/" + this._name + ".xml"); //
         if(f.exists) //
         { //
            this.onDataComplete(FileUtils.readString(f)); //
         } //
         else //
         { //
            this.isLoaded = true; //
         } //
      } //
      
      public function get bitmapData() : BitmapData
      {
         return this._bitmapData;
      }
      
      private function onDataComplete(param1:String) : void
      {
         if(param1.indexOf("?>") != -1)
         {
            param1 = param1.substr(param1.indexOf("?>") + 2,param1.length);
         }
         this._xml = new XML(param1);
         if(!this._bitmap)   // 复用构造时创建的_bitmap，避免被覆盖
         { //
            this._bitmap = new Bitmap();
         } //
         if(this._bitmap.parent == null)   // 未挂到显示列表才addChild
         { //
            this.addChild(this._bitmap);
         } //
         this.isLoaded = true;
         this.draw(this.frame,0);
      }
      
      public function draw(param1:Frame, param2:Number) : void
      {
         if(param1)
         {
            this.atFrame = param1;
         }
         if(!this.isLoaded || !this.atFrame)
         {
            return;
         }
         var _loc3_:int = this.indexAt;
         if(_loc3_ < 0 || _loc3_ >= this._xml.children().length() + this.data.time)
         {
            this.visible = false;
            this.select(false);
            return;
         }
         if(!this.visible)
         {
            if(this._xml.@sound != undefined)
            {
               FileUtils.playSound(App.projectFile.resolvePath("sound/" + this._xml.@sound + ".mp3"));
            }
            this.visible = true;
         }
         this._lastIndex = _loc3_;
         var _loc4_:* = 1;
         this.scaleX = this.data.scaleX * _loc4_;
         this.scaleY = this.data.scaleY;
         if(this.data.isLockAction && Boolean(this.atFrame))
         {
            this.x = this.atFrame.gox * _loc4_ + this.data.x * _loc4_;
            this.y = this.atFrame.goy + this.data.y;
         }
         else
         {
            this.x = this.frame.gox * _loc4_ + this.data.x * _loc4_ + _loc3_ * this.data.getMoveX() * _loc4_ + this.data.getMoveX() * _loc4_ * param2;
            this.y = this.frame.goy + this.data.y + _loc3_ * this.data.getMoveY() * _loc4_ + this.data.getMoveY() * _loc4_ * param2;
         }
         var _loc5_:int = _loc3_;
         if(_loc5_ >= this._xml.children().length())
         {
            _loc5_ = this._xml.length() - 1;
         }
         var _loc6_:XML = this._xml.SubTexture[_loc5_];
         if(this._bitmap.bitmapData)   // 释放上一帧位图，避免播放时持续膨胀
         { //
            this._bitmap.bitmapData.dispose(); //
         } //
         var _loc7_:BitmapData = BitmapDarw.xmlForBitmapData(this._bitmapData,_loc6_);
         this._bitmap.bitmapData = _loc7_;
         this.rotation = this.data.rotation;
         this._bitmap.x = int(this._xml.@px - int(_loc6_.@frameX));
         this._bitmap.y = int(this._xml.@py - int(_loc6_.@frameY));
         if(this.selected)
         {
            this.select(this.selected);
         }
      }
      
      public function get indexAt() : int
      {
         return this.atFrame.at - this.frame.at;
      }
      
      public function get datax() : int
      {
         return this.x - this.frame.gox - this.indexAt * this.data.getMoveX();
      }
      
      public function get datay() : int
      {
         return this.y - this.frame.goy - this.indexAt * this.data.getMoveY();
      }
      
      override public function select(param1:Boolean) : void
      {
         this.selected = param1;
         this._select.graphics.clear();
         this._sSprite.graphics.clear();
         if(param1)
         {
            SpriteUtils.createSelectSprite(this._select,new Rectangle(this._bitmap.x,this._bitmap.y,this._bitmap.width,this._bitmap.height));
            this._sSprite.graphics.beginFill(255);
            this._sSprite.graphics.drawRect(0,0,100,1);
            this._sSprite.graphics.drawRect(0,0,1,100);
            this._sSprite.graphics.drawRect(0,0,-100,1);
            this._sSprite.graphics.drawRect(0,0,1,-100);
            this._sSprite.graphics.endFill();
            this.addChild(this._select);
            this.addChild(this._sSprite);
         }
      }
      
      public function getName() : String
      {
         return this._name;
      }
      
      override public function onAttributeGroup() : void
      {
      }
      
      public function removeFrame() : void
      {
         this.frame.removeEffect(this);
      }
      
      public function removeSelf() : void
      {
         this.parent.removeChild(this);
      }
      
      public function get wFight() : int
      {
         var _loc5_:Object = null;
         var _loc6_:XML = null;
         var _loc7_:int = 0;
         if(!this._xml)
         {
            return 0;
         }
         if(this.data.unhit)
         {
            return 0;
         }
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc2_ = this.data.wFight;
         if(this.data.wFight == 0 && this.data.mFight == 0)
         {
            _loc2_ = 100;
         }
         else if(this.data.wFight == 0)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:XMLList = this._xml.children();
         for(_loc5_ in _loc4_)
         {
            _loc6_ = _loc4_[_loc5_];
            if(_loc6_.@hitPoint != undefined && _loc6_.@hitPoint != "")
            {
               _loc7_ = int(_loc6_.@hitEffect) / int(_loc6_.@hurtInterval);
               if(_loc7_ == 0)
               {
                  _loc7_ = 1;
               }
               _loc1_ += _loc7_ * _loc2_;
            }
         }
         return _loc1_;
      }
      
      public function get mFight() : int
      {
         var _loc5_:Object = null;
         var _loc6_:XML = null;
         var _loc7_:int = 0;
         if(!this._xml)
         {
            return 0;
         }
         if(this.data.unhit)
         {
            return 0;
         }
         var _loc1_:int = 0;
         var _loc2_:int = this.data.mFight;
         if(_loc2_ == 0)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:XMLList = this._xml.children();
         for(_loc5_ in _loc4_)
         {
            _loc6_ = _loc4_[_loc5_];
            if(_loc6_.@hitPoint != undefined && _loc6_.@hitPoint != "")
            {
               _loc7_ = int(_loc6_.@hitEffect) / int(_loc6_.@hurtInterval);
               if(_loc7_ == 0)
               {
                  _loc7_ = 1;
               }
               _loc1_ += _loc7_ * _loc2_;
            }
         }
         return _loc1_;
      }
      
      public function clear() : void
      {
         // if(!this._bitmapData)
         // {
         //    this._bitmapData.dispose();
         // }
         this._bitmapData = null;
         if(this._xml)
         {
            System.disposeXML(this._xml);
         }
         this._xml = null;
      }
      
      public function setColor(param1:int) : void
      {
      }
   }
}

