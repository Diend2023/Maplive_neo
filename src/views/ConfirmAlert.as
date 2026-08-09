package views
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
   import mx.core.mx_internal; //
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Label;
   import spark.components.Panel;
   
   public class ConfirmAlert extends Panel
   {

      use namespace mx_internal; //
      
      public static const ENTER:String = "c_enter";
      
      public static const CHANNEL:String = "c_channel";
      
      public static const NO:String = "c_no";
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _1367713851cannel:Button;
      
      private var _96667352enter:Button;
      
      private var _3521no:Button;
      
      private var _831827669textDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var onClose:Function = null;
      
      public function ConfirmAlert()
      {
         super();
         mx_internal::_document = this;
         this.width = 400;
         this.height = 112;
         this.title = "提示";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._ConfirmAlert_Array1_c);
         this.addEventListener("initialize",this.___ConfirmAlert_Panel1_initialize);
      }
      
      public static function show(param1:DisplayObject, param2:String, param3:String, param4:String = "确定", param5:String = "不", param6:String = "取消") : ConfirmAlert
      {
         var _loc7_:ConfirmAlert = new ConfirmAlert();
         PopUpManager.addPopUp(_loc7_,param1,true);
         _loc7_.textDisplay.text = param2;
         _loc7_.title = param3;
         _loc7_.enter.label = param4;
         _loc7_.no.label = param5;
         _loc7_.cannel.label = param6;
         return _loc7_;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.backgroundColor = 5921126;
            this.chromeColor = 4144716;
            this.color = 16777215;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function onInit() : void
      {
         this.x = this.stage.stageWidth / 2 - this.width / 2;
         this.y = this.stage.stageHeight / 2 - this.height / 2;
      }
      
      public function onClick(param1:String) : void
      {
         if(this.onClose != null)
         {
            this.onClose(param1);
         }
         PopUpManager.removePopUp(this);
      }
      
      private function _ConfirmAlert_Array1_c() : Array
      {
         return [this._ConfirmAlert_Label1_i(),this._ConfirmAlert_Button1_i(),this._ConfirmAlert_Button2_i(),this._ConfirmAlert_Button3_i()];
      }
      
      private function _ConfirmAlert_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 27;
         _loc1_.y = 16;
         _loc1_.width = 345;
         _loc1_.height = 32;
         _loc1_.text = "标签";
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "textDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textDisplay = _loc1_;
         BindingManager.executeBindings(this,"textDisplay",this.textDisplay);
         return _loc1_;
      }
      
      private function _ConfirmAlert_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.y = 53;
         _loc1_.label = "确定";
         _loc1_.horizontalCenter = -81;
         _loc1_.addEventListener("click",this.__enter_click);
         _loc1_.id = "enter";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.enter = _loc1_;
         BindingManager.executeBindings(this,"enter",this.enter);
         return _loc1_;
      }
      
      public function __enter_click(param1:MouseEvent) : void
      {
         this.onClick(ENTER);
      }
      
      private function _ConfirmAlert_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.y = 53;
         _loc1_.label = "不";
         _loc1_.horizontalCenter = -1;
         _loc1_.addEventListener("click",this.__no_click);
         _loc1_.id = "no";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.no = _loc1_;
         BindingManager.executeBindings(this,"no",this.no);
         return _loc1_;
      }
      
      public function __no_click(param1:MouseEvent) : void
      {
         this.onClick(NO);
      }
      
      private function _ConfirmAlert_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.y = 53;
         _loc1_.label = "取消";
         _loc1_.horizontalCenter = 81;
         _loc1_.addEventListener("click",this.__cannel_click);
         _loc1_.id = "cannel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cannel = _loc1_;
         BindingManager.executeBindings(this,"cannel",this.cannel);
         return _loc1_;
      }
      
      public function __cannel_click(param1:MouseEvent) : void
      {
         this.onClick(CHANNEL);
      }
      
      public function ___ConfirmAlert_Panel1_initialize(param1:FlexEvent) : void
      {
         this.onInit();
      }
      
      [Bindable(event="propertyChange")]
      public function get cannel() : Button
      {
         return this._1367713851cannel;
      }
      
      public function set cannel(param1:Button) : void
      {
         var _loc2_:Object = this._1367713851cannel;
         if(_loc2_ !== param1)
         {
            this._1367713851cannel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cannel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get enter() : Button
      {
         return this._96667352enter;
      }
      
      public function set enter(param1:Button) : void
      {
         var _loc2_:Object = this._96667352enter;
         if(_loc2_ !== param1)
         {
            this._96667352enter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"enter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get no() : Button
      {
         return this._3521no;
      }
      
      public function set no(param1:Button) : void
      {
         var _loc2_:Object = this._3521no;
         if(_loc2_ !== param1)
         {
            this._3521no = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"no",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textDisplay() : Label
      {
         return this._831827669textDisplay;
      }
      
      public function set textDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._831827669textDisplay;
         if(_loc2_ !== param1)
         {
            this._831827669textDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textDisplay",_loc2_,param1));
            }
         }
      }
   }
}

