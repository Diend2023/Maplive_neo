package views.alert
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
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Label;
   import spark.components.TextInput;
   import views.AlertRef;
   
   public class AddNewPoltPoint extends AlertRef
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _1058056547textInput:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function AddNewPoltPoint()
      {
         super();
         mx_internal::_document = this;
         this.width = 400;
         this.height = 148;
         this.title = "添加新的节点";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._AddNewPoltPoint_Array1_c);
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
            this.chromeColor = 4144716;
            this.color = 16777215;
            this.backgroundColor = 5921126;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function _AddNewPoltPoint_Array1_c() : Array
      {
         return [this._AddNewPoltPoint_Button1_c(),this._AddNewPoltPoint_Button2_c(),this._AddNewPoltPoint_Label1_c(),this._AddNewPoltPoint_TextInput1_i()];
      }
      
      private function _AddNewPoltPoint_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 116;
         _loc1_.y = 85;
         _loc1_.label = "取消";
         _loc1_.addEventListener("click",this.___AddNewPoltPoint_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AddNewPoltPoint_Button1_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
      }
      
      private function _AddNewPoltPoint_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 215;
         _loc1_.y = 85;
         _loc1_.label = "添加";
         _loc1_.addEventListener("click",this.___AddNewPoltPoint_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AddNewPoltPoint_Button2_click(param1:MouseEvent) : void
      {
         back(this.textInput.text);
         PopUpManager.removePopUp(this);
      }
      
      private function _AddNewPoltPoint_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 24;
         _loc1_.y = 38;
         _loc1_.text = "节点名称：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddNewPoltPoint_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.x = 92;
         _loc1_.y = 33;
         _loc1_.width = 276;
         _loc1_.setStyle("contentBackgroundAlpha",0.25);
         _loc1_.id = "textInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textInput = _loc1_;
         BindingManager.executeBindings(this,"textInput",this.textInput);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get textInput() : TextInput
      {
         return this._1058056547textInput;
      }
      
      public function set textInput(param1:TextInput) : void
      {
         var _loc2_:Object = this._1058056547textInput;
         if(_loc2_ !== param1)
         {
            this._1058056547textInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textInput",_loc2_,param1));
            }
         }
      }
   }
}

