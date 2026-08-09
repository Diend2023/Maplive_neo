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
   import mx.controls.Alert;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal; //
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Label;
   import spark.components.NumericStepper;
   import spark.components.TextInput;
   import utils.FileUtils;
   import views.AlertRef;
   
   public class CreateTMX extends AlertRef
   {

      use namespace mx_internal; //
      
      public static const TMXDATA:String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><map version=\"1.0\" orientation=\"orthogonal\" width=\"64\" height=\"40\" tilewidth=\"32\" tileheight=\"32\"><objectgroup name=\"hit_layer\" width=\"64\" height=\"40\"/></map>";
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _1205562871hvalue:NumericStepper;
      
      private var _1215755049nameLabel:TextInput;
      
      private var _776125606wvalue:NumericStepper;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function CreateTMX()
      {
         super();
         mx_internal::_document = this;
         this.width = 356;
         this.height = 156;
         this.title = "创建地图";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._CreateTMX_Array1_c);
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
      
      protected function onCreate(param1:MouseEvent) : void
      {
         if(this.nameLabel.text == "")
         {
            Alert.show("地图名称请填写","提示");
            return;
         }
         var _loc2_:File = App.projectFile.resolvePath("tmx/" + this.nameLabel.text + ".tmx");
         if(_loc2_.exists)
         {
            Alert.show("该地图名已被使用","提示");
            return;
         }
         var _loc3_:XML = new XML(TMXDATA);
         _loc3_.@width = this.wvalue.value.toFixed();
         _loc3_.@height = this.hvalue.value.toFixed();
         _loc3_[0].@width = this.wvalue.value.toFixed();
         _loc3_[0].@height = this.hvalue.value.toFixed();
         FileUtils.writeString(_loc2_,_loc3_.toXMLString());
         System.disposeXML(_loc3_);
         this.back(_loc2_,"地图");
         PopUpManager.removePopUp(this);
      }
      
      private function _CreateTMX_Array1_c() : Array
      {
         return [this._CreateTMX_Label1_c(),this._CreateTMX_Label2_c(),this._CreateTMX_Label3_c(),this._CreateTMX_NumericStepper1_i(),this._CreateTMX_NumericStepper2_i(),this._CreateTMX_TextInput1_i(),this._CreateTMX_Button1_c(),this._CreateTMX_Button2_c()];
      }
      
      private function _CreateTMX_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 47;
         _loc1_.y = 22;
         _loc1_.text = "地图名称：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CreateTMX_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 37;
         _loc1_.y = 60;
         _loc1_.text = "宽（32px）:";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CreateTMX_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 194;
         _loc1_.y = 61;
         _loc1_.text = "高（32px）:";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CreateTMX_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.x = 112;
         _loc1_.y = 55;
         _loc1_.value = 32;
         _loc1_.maximum = 64;
         _loc1_.minimum = 1;
         _loc1_.stepSize = 1;
         _loc1_.setStyle("contentBackgroundAlpha",0.3);
         _loc1_.id = "wvalue";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.wvalue = _loc1_;
         BindingManager.executeBindings(this,"wvalue",this.wvalue);
         return _loc1_;
      }
      
      private function _CreateTMX_NumericStepper2_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.x = 268;
         _loc1_.y = 55;
         _loc1_.value = 32;
         _loc1_.maximum = 64;
         _loc1_.minimum = 1;
         _loc1_.stepSize = 1;
         _loc1_.setStyle("contentBackgroundAlpha",0.3);
         _loc1_.id = "hvalue";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hvalue = _loc1_;
         BindingManager.executeBindings(this,"hvalue",this.hvalue);
         return _loc1_;
      }
      
      private function _CreateTMX_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.x = 113;
         _loc1_.y = 15;
         _loc1_.width = 208;
         _loc1_.setStyle("contentBackgroundAlpha",0.3);
         _loc1_.id = "nameLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nameLabel = _loc1_;
         BindingManager.executeBindings(this,"nameLabel",this.nameLabel);
         return _loc1_;
      }
      
      private function _CreateTMX_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 194;
         _loc1_.y = 92;
         _loc1_.label = "创建";
         _loc1_.addEventListener("click",this.___CreateTMX_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___CreateTMX_Button1_click(param1:MouseEvent) : void
      {
         this.onCreate(param1);
      }
      
      private function _CreateTMX_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 95;
         _loc1_.y = 92;
         _loc1_.label = "取消";
         _loc1_.addEventListener("click",this.___CreateTMX_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___CreateTMX_Button2_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
      }
      
      [Bindable(event="propertyChange")]
      public function get hvalue() : NumericStepper
      {
         return this._1205562871hvalue;
      }
      
      public function set hvalue(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1205562871hvalue;
         if(_loc2_ !== param1)
         {
            this._1205562871hvalue = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hvalue",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get nameLabel() : TextInput
      {
         return this._1215755049nameLabel;
      }
      
      public function set nameLabel(param1:TextInput) : void
      {
         var _loc2_:Object = this._1215755049nameLabel;
         if(_loc2_ !== param1)
         {
            this._1215755049nameLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get wvalue() : NumericStepper
      {
         return this._776125606wvalue;
      }
      
      public function set wvalue(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._776125606wvalue;
         if(_loc2_ !== param1)
         {
            this._776125606wvalue = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wvalue",_loc2_,param1));
            }
         }
      }
   }
}

