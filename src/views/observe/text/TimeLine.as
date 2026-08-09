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
   
   public class TimeLine extends Group
   {

      use namespace mx_internal; //
      
      private var _544640655frameDarw:UIComponent;
      
      private var _1492388795onSelect:Function;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public const timeline:Class = TimeLine_timeline;
      
      private var _xml:XML;
      
      private var _frames:Vector.<TextSpriteFrame>;
      
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
      }
      
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
   }
}

