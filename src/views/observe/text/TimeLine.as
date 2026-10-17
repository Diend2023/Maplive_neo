package views.observe.text
{
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
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.mx_internal; //
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.BorderContainer;
   import spark.components.Group;
   import spark.components.Scroller; //
   
   public class TimeLine extends Group
   {

      use namespace mx_internal; //
      
      private var _544640655frameDarw:UIComponent;
      
      private var _1492388795onSelect:Function;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public const timeline:Class = TimeLine_timeline;
      
      private var _xml:XML;
      
      private var _frames:Vector.<TextSpriteFrame>;

      private var _frameScroller:Scroller; // 帧区滚动容器引用（横向滚动 + 切换帧定位）

      private var _ufwDeferCount:int = 0; // updateFrameWidth推迟重算次数：首帧未布局完时width=0，防死循环上限3次
      
      public var currentFrame:TextSpriteFrame;
      
      public function TimeLine()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.height = 32;
         this.mxmlContent = [this._TimeLine_BorderContainer1_c()];
         this.addEventListener("initialize",this.___TimeLine_Group1_initialize);
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
      
      protected function onInit(param1:FlexEvent) : void
      {
         this._frames = new Vector.<TextSpriteFrame>();
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginBitmapFill((new this.timeline() as Bitmap).bitmapData,null,true);
         _loc2_.graphics.drawRect(0,0,2048,120);
         _loc2_.graphics.endFill();
         _loc2_.alpha = 0.5;
         this.frameDarw.addChild(_loc2_);
         callLater(this.wrapFrameScroller); // 延后包裹：本组件是外层Scroller的viewport，初始化时序里initialize会重入/重复派发，当场移动frameDarw会#1009
      }
      
      private function wrapFrameScroller() : void // 把帧绘制区包进带横向滚动条的Scroller（onInit里时序不安全，callLater后执行）
      { //
         if(this._frameScroller != null) //
         { //
            return; // 已包裹过：initialize重复派发时防重入
         } //
         var _loc3_:DisplayObjectContainer = this.frameDarw.parent; // frameDarw的实际父级是BorderContainer皮肤里的contentGroup（SkinnableContainer的MXML子对象加在皮肤上，不是容器实例），按BorderContainer找必然为null
         if(_loc3_ == null) //
         { //
            return; // 父容器尚未就绪，放弃包裹
         } //
         var _loc4_:Group = new Group(); // 滚动视口：帧多出可视范围时由 Scroller 提供横向滚动条
         _loc4_.percentWidth = 100; //
         _loc4_.percentHeight = 100; //
         _loc4_.addElement(this.frameDarw); // 把帧绘制区移入视口（自动从原容器移除），Group 必须用 addElement
         var _loc5_:Scroller = new Scroller(); //
         _loc5_.percentWidth = 100; //
         _loc5_.percentHeight = 100; //
         _loc5_.viewport = _loc4_; //
         _loc5_.addEventListener(Event.RESIZE,this.onFrameScrollerResize); // 滚动区尺寸变化（窗口缩放/首次布局）时重算：非最大化/缩放是原有调用点覆盖不到的场景
         var _loc6_:Group = _loc3_ as Group; // 父级是皮肤contentGroup（spark Group）必须用addElement，addChild会抛"not available"错
         if(_loc6_ != null) //
         { //
            _loc6_.addElement(_loc5_); //
         } //
         else //
         { //
            _loc3_.addChild(_loc5_); //
         } //
         this.frameDarw.percentHeight = 100; //
         this._frameScroller = _loc5_; //
         this.updateFrameWidth(this._frames.length); // 包裹后补一次宽度：若setXml在包裹前已跑过，这里补上滚动范围
      } //

      public function setXml(param1:XML) : void
      {
         var _loc3_:Object = null;
         var _loc4_:TextSpriteFrame = null;
         this._xml = param1;
         var _loc2_:XMLList = this._xml.children();
         for(_loc3_ in _loc2_)
         {
            _loc4_ = new TextSpriteFrame(_loc2_[_loc3_]);
            this.frameDarw.addChild(_loc4_);
            _loc4_.x = 8 * int(_loc3_);
            _loc4_.select(_loc3_ == 0);
            _loc4_.id = int(_loc3_);
            this._frames.push(_loc4_);
         }
         this.currentFrame = this._frames[0];
         this.updateEff();
         this.onSelect(this._frames[0]);
         this.updateFrameWidth(_loc2_.length()); // 帧多时扩展绘制区宽度以显示横向滚动条
      }
      
      public function set frame(param1:int) : void
      {
         if(param1 < 0 || param1 > this._frames.length - 1)
         {
            return;
         }
         this.currentFrame.select(false);
         this._frames[param1].select(true);
         this.currentFrame = this._frames[param1];
         this.ensureVisible(param1); // 切换帧时滚动到对应位置
      }
      
      public function get frame() : int
      {
         return this.currentFrame.id;
      }
      
      protected function onDown(param1:MouseEvent) : void
      {
         if(param1.target is TextSpriteFrame)
         {
            this.onSelect(param1.target as TextSpriteFrame);
         }
      }
      
      public function updateEff() : void
      {
         var _loc2_:TextSpriteFrame = null;
         var _loc1_:int = -1;
         var _loc3_:int = 0;
         while(_loc3_ < this._frames.length)
         {
            if(this._frames[_loc3_].isHitPoint())
            {
               _loc1_ = _loc3_ + this._frames[_loc3_].live;
               _loc2_ = this._frames[_loc3_];
            }
            else if(_loc1_ >= _loc3_)
            {
               this._frames[_loc3_].hitFrameReference = _loc2_;
               this._frames[_loc3_].hitPointReference = _loc2_.hitPointReference;
            }
            else
            {
               this._frames[_loc3_].hitFrameReference = null;
               this._frames[_loc3_].hitPointReference = null;
            }
            this._frames[_loc3_].draw();
            _loc3_++;
         }
         this.currentFrame.select(true);
      }
      
      private function updateFrameWidth(param1:int) : void // 帧过多时扩展绘制区宽度，使 Scroller 出现横向滚动条
      { //
         if(this.frameDarw == null) //
         { //
            return; //
         } //
         var _loc3_:Scroller = this._frameScroller; //
         if(_loc3_ != null && !isNaN(_loc3_.width) && _loc3_.width <= 0 && this._ufwDeferCount < 3) // Scroller首帧可能还没布局完(width=0)：此时"帧少铺满"分支按0算，任何帧数都会被误判成需要滚动条、高度错误抬高；推迟到布局后重算
         { //
            this._ufwDeferCount++; //
            callLater(this.updateFrameWidth,[param1]); // 绑定方法引用+参数数组（与callLater(this.wrapFrameScroller)同款）；内联闭包里写this.xxx在本工程会报#1006
            return; //
         } //
         this._ufwDeferCount = 0; //
         var _loc2_:Number = param1 * 8 + 16; // 帧宽 8 + 右侧余量
         if(_loc3_ != null && !isNaN(_loc3_.width)) //
         { //
            _loc2_ = Math.max(_loc2_, _loc3_.width); // 帧少时至少铺满视口，避免无帧区域鼠标失效
         } //
         this.frameDarw.width = _loc2_; //
         var _loc7_:Boolean = _loc3_ != null && !isNaN(_loc3_.width) && _loc2_ > _loc3_.width; // 内容宽超过视口宽时Scroller才会显示横向滚动条
         this.height = _loc7_ ? 48 : 32; // 动态高度：有滚动条时+16让它占独立一条（不与帧条平分），无滚动条时保持32不留空白
         var _loc4_:Group = _loc3_ != null ? (_loc3_.viewport as Group) : null; //
         if(_loc4_ != null) //
         { //
            _loc4_.invalidateSize(); // 帧区改宽不会自动触发父布局重新测量：不强制的话Scroller的contentWidth停在旧值、没有可滚范围（role版同款问题）
            _loc4_.validateNow(); //
            if(_loc3_ != null) //
            { //
               _loc3_.validateNow(); // 只验证视口不够：Scroller要自己重算才会刷新滚动条显隐
            } //
         } //
      } //

      private function ensureVisible(param1:int) : void // 切换帧时把对应帧滚入可见区域
      { //
         if(param1 < 0) //
         { //
            return; //
         } //
         var _loc2_:Scroller = this._frameScroller; //
         if(_loc2_ == null || _loc2_.viewport == null) //
         { //
            return; //
         } //
         var _loc3_:Number = _loc2_.viewport.width; //
         if(isNaN(_loc3_) || _loc3_ <= 0) //
         { //
            return; //
         } //
         var _loc4_:Number = param1 * 8; // 帧在内容中的左边界（帧宽 8）
         var _loc5_:Number = _loc4_ + 8; //
         var _loc6_:Number = _loc2_.viewport.horizontalScrollPosition; //
         if(_loc4_ < _loc6_) //
         { //
            _loc2_.viewport.horizontalScrollPosition = _loc4_; //
         } //
         else if(_loc5_ > _loc6_ + _loc3_) //
         { //
            _loc2_.viewport.horizontalScrollPosition = _loc5_ - _loc3_; //
         } //
      } //

      private function onFrameScrollerResize(param1:Event) : void // 滚动区尺寸变化：重算帧区宽高与滚动条
      { //
         this.updateFrameWidth(this._frames.length); //
      } //

      private function _TimeLine_BorderContainer1_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array2_c);
         _loc1_.setStyle("backgroundColor",4144716);
         _loc1_.setStyle("backgroundAlpha",0.5);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array2_c() : Array
      {
         return [this._TimeLine_UIComponent1_i()];
      }
      
      private function _TimeLine_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.addEventListener("mouseDown",this.__frameDarw_mouseDown);
         _loc1_.id = "frameDarw";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.frameDarw = _loc1_;
         BindingManager.executeBindings(this,"frameDarw",this.frameDarw);
         return _loc1_;
      }
      
      public function __frameDarw_mouseDown(param1:MouseEvent) : void
      {
         this.onDown(param1);
      }
      
      public function ___TimeLine_Group1_initialize(param1:FlexEvent) : void
      {
         this.onInit(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get frameDarw() : UIComponent
      {
         return this._544640655frameDarw;
      }
      
      public function set frameDarw(param1:UIComponent) : void
      {
         var _loc2_:Object = this._544640655frameDarw;
         if(_loc2_ !== param1)
         {
            this._544640655frameDarw = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"frameDarw",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get onSelect() : Function
      {
         return this._1492388795onSelect;
      }
      
      public function set onSelect(param1:Function) : void
      {
         var _loc2_:Object = this._1492388795onSelect;
         if(_loc2_ !== param1)
         {
            this._1492388795onSelect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"onSelect",_loc2_,param1));
            }
         }
      }

      public function clearXml() : void //
      { //
         while(this._frames.length > 0) //
         { //
            var f:TextSpriteFrame = this._frames.pop(); //
            if(f.parent) //
            { //
               f.parent.removeChild(f); //
            } //
         } //
         this.currentFrame = null; //
      } //

      public function get frameCount() : int //
      { //
         return this._frames.length; //
      } //

      public function selectByName(param1:String) : int // 按精灵表格子名找帧，找到返回下标，找不到返回 -1
      { //
         if(param1 == null) return -1; //
         for(var i:int = 0; i < this._frames.length; i++) //
         { //
            if(this._frames[i].data.@name == param1) //
            { //
               this.frame = i; // setter 内含越界保护
               return i; //
            } //
         } //
         return -1; //
      } //

   }
}

