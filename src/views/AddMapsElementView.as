package views
{
   import events.OpenEvent;
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
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.BorderContainer;
   import spark.components.Button;
   import spark.components.DropDownList;
   import spark.components.Image;
   import spark.components.Label;
   import spark.components.Panel;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import utils.FileUtils;
   
   public class AddMapsElementView extends Panel
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _3092207drop:DropDownList;
      
      private var _100313435image:Image;
      
      private var _1541688547refParent:Object;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function AddMapsElementView()
      {
         super();
         mx_internal::_document = this;
         this.width = 400;
         this.height = 300;
         this.title = "添加元素";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._AddMapsElementView_Array1_c);
         this._AddMapsElementView_Object1_i();
         this.addEventListener("initialize",this.___AddMapsElementView_Panel1_initialize);
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
         this.drop.dataProvider = FileUtils.getArrayCollectionConfig(App.projectFile.resolvePath("scenery"));
      }
      
      private function onImageChange() : void
      {
         this.image.source = (this.drop.selectedItem.file as File).url;
      }
      
      public function onAddNpc() : void
      {
         if(!this.drop.selectedItem)
         {
            Alert.show("请选择指定地图资源");
            return;
         }
         if(this.refParent)
         {
            (this.refParent as ScenarioSpritePool).onAddMapSprite(new OpenEvent(OpenEvent.ADD_MAP_SPRITE,this.drop.selectedItem.file as File));
         }
         PopUpManager.removePopUp(this);
      }
      
      private function _AddMapsElementView_Object1_i() : Object
      {
         var _loc1_:Object = {};
         this.refParent = _loc1_;
         BindingManager.executeBindings(this,"refParent",this.refParent);
         return _loc1_;
      }
      
      private function _AddMapsElementView_Array1_c() : Array
      {
         return [this._AddMapsElementView_BorderContainer1_c(),this._AddMapsElementView_VGroup1_c(),this._AddMapsElementView_Button1_c(),this._AddMapsElementView_Button2_c()];
      }
      
      private function _AddMapsElementView_BorderContainer1_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.left = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.width = 200;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._AddMapsElementView_Array2_c);
         _loc1_.setStyle("backgroundAlpha",0.5);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddMapsElementView_Array2_c() : Array
      {
         return [this._AddMapsElementView_Image1_i()];
      }
      
      private function _AddMapsElementView_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "image";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.image = _loc1_;
         BindingManager.executeBindings(this,"image",this.image);
         return _loc1_;
      }
      
      private function _AddMapsElementView_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 216;
         _loc1_.right = 7;
         _loc1_.top = 7;
         _loc1_.mxmlContent = [this._AddMapsElementView_Label1_c(),this._AddMapsElementView_DropDownList1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddMapsElementView_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.y = 8;
         _loc1_.text = "地图资源选择：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddMapsElementView_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.labelField = "name";
         _loc1_.prompt = "请选择";
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.setStyle("focusColor",11711154);
         _loc1_.setStyle("rollOverColor",12237498);
         _loc1_.setStyle("selectionColor",9210772);
         _loc1_.addEventListener("change",this.__drop_change);
         _loc1_.id = "drop";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.drop = _loc1_;
         BindingManager.executeBindings(this,"drop",this.drop);
         return _loc1_;
      }
      
      public function __drop_change(param1:IndexChangeEvent) : void
      {
         this.onImageChange();
      }
      
      private function _AddMapsElementView_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 310;
         _loc1_.y = 236;
         _loc1_.label = "添加";
         _loc1_.addEventListener("click",this.___AddMapsElementView_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AddMapsElementView_Button1_click(param1:MouseEvent) : void
      {
         this.onAddNpc();
      }
      
      private function _AddMapsElementView_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 223;
         _loc1_.y = 236;
         _loc1_.label = "取消";
         _loc1_.addEventListener("click",this.___AddMapsElementView_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AddMapsElementView_Button2_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
      }
      
      public function ___AddMapsElementView_Panel1_initialize(param1:FlexEvent) : void
      {
         this.onInit();
      }
      
      [Bindable(event="propertyChange")]
      public function get drop() : DropDownList
      {
         return this._3092207drop;
      }
      
      public function set drop(param1:DropDownList) : void
      {
         var _loc2_:Object = this._3092207drop;
         if(_loc2_ !== param1)
         {
            this._3092207drop = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"drop",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get image() : Image
      {
         return this._100313435image;
      }
      
      public function set image(param1:Image) : void
      {
         var _loc2_:Object = this._100313435image;
         if(_loc2_ !== param1)
         {
            this._100313435image = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"image",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get refParent() : Object
      {
         return this._1541688547refParent;
      }
      
      public function set refParent(param1:Object) : void
      {
         var _loc2_:Object = this._1541688547refParent;
         if(_loc2_ !== param1)
         {
            this._1541688547refParent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"refParent",_loc2_,param1));
            }
         }
      }
   }
}

