package views.observe.map
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
   import mx.controls.HRule;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal; //
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.Panel;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import utils.FileUtils;
   import views.SelectElementView;
   import views.observe.TMXObserve;
   
   public class MapConfigView extends Panel
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _2055638041bgConfig:TextInput;
      
      private var _604865129pheight:TextInput;
      
      private var _975375530pwidth:TextInput;
      
      private var _3592px:TextInput;
      
      private var _3593py:TextInput;
      
      private var _1417816805texture:TextInput;
      
      private var _113318802world:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _xml:XML;
      
      private var _file:File;
      
      private var _root:TMXObserve;
      
      public function MapConfigView()
      {
         super();
         mx_internal::_document = this;
         this.width = 400;
         this.height = 260;
         this.title = "地图属性配置";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._MapConfigView_Array1_c);
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
      
      public function setXmlFile(param1:File, param2:TMXObserve) : void
      {
         this._root = param2;
         this._file = param1;
         this._xml = new XML(FileUtils.readString(param1));
         callLater(this.updateData);
      }
      
      public function updateData() : void
      {
         if(this._xml.@texture != undefined)
         {
            this.texture.text = this._xml.@texture;
         }
         else
         {
            this.texture.text = "<null>";
         }
         if(this._xml.@world != undefined)
         {
            this.world.text = this._xml.@world;
         }
         else
         {
            this.world.text = "<null>";
         }
         if(this._xml.@height != undefined)
         {
            this.pheight.text = this._xml.@height;
         }
         else
         {
            this.pheight.text = "<null>";
         }
         if(this._xml.@width != undefined)
         {
            this.pwidth.text = this._xml.@width;
         }
         else
         {
            this.pwidth.text = "<null>";
         }
         if(this._xml.@bg != undefined)
         {
            this.bgConfig.text = this._xml.@bg;
         }
         else
         {
            this.bgConfig.text = "<null>";
         }
         this.px.text = int(this._xml.@textureOffsetX).toString();
         this.py.text = int(this._xml.@textureOffsetY).toString();
      }
      
      protected function onEnter(param1:MouseEvent) : void
      {
         this._xml.@texture = this.texture.text;
         this._xml.@world = this.world.text;
         this._xml.@width = this.pwidth.text;
         this._xml.@height = this.pheight.text;
         this._xml.@bg = this.bgConfig.text;
         this._xml.@textureOffsetX = this.px.text;
         this._xml.@textureOffsetY = this.py.text;
         FileUtils.writeString(this._file,this._xml.toXMLString());
         this._root.resetMapSize(int(this.pwidth.text) * 32,int(this.pheight.text) * 32);
         this._root.onSave();
         PopUpManager.removePopUp(this);
      }
      
      protected function onChangeTexture(param1:MouseEvent) : void
      {
         var select:SelectElementView = null;
         var event:MouseEvent = param1;
         select = new SelectElementView();
         select.findDir = "texture";
         select.callFunc = function(param1:File):void
         {
            if(param1)
            {
               texture.text = select.findDir + "/" + param1.name.substr(0,param1.name.lastIndexOf("."));
            }
         };
         PopUpManager.addPopUp(select,this,true);
      }
      
      private function _MapConfigView_Array1_c() : Array
      {
         return [this._MapConfigView_VGroup1_c()];
      }
      
      private function _MapConfigView_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 5;
         _loc1_.top = 5;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.bottom = 5;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._MapConfigView_HGroup1_c(),this._MapConfigView_HGroup2_c(),this._MapConfigView_HGroup3_c(),this._MapConfigView_HRule1_c(),this._MapConfigView_HGroup4_c(),this._MapConfigView_HGroup5_c(),this._MapConfigView_HGroup6_c(),this._MapConfigView_HGroup7_c(),this._MapConfigView_HGroup8_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._MapConfigView_Label1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "地皮纹理配置：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._MapConfigView_Label2_c(),this._MapConfigView_TextInput1_i(),this._MapConfigView_Button1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "地图默认纹理：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.enabled = false;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("color",0);
         _loc1_.id = "texture";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.texture = _loc1_;
         BindingManager.executeBindings(this,"texture",this.texture);
         return _loc1_;
      }
      
      private function _MapConfigView_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "更改";
         _loc1_.addEventListener("click",this.___MapConfigView_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___MapConfigView_Button1_click(param1:MouseEvent) : void
      {
         this.onChangeTexture(param1);
      }
      
      private function _MapConfigView_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._MapConfigView_Label3_c(),this._MapConfigView_TextInput2_i(),this._MapConfigView_Label4_c(),this._MapConfigView_TextInput3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "偏移X轴：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.enabled = true;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("color",0);
         _loc1_.id = "px";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.px = _loc1_;
         BindingManager.executeBindings(this,"px",this.px);
         return _loc1_;
      }
      
      private function _MapConfigView_Label4_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 84;
         _loc1_.text = "偏移Y轴：";
         _loc1_.setStyle("textAlign","right");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_TextInput3_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.enabled = true;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("color",0);
         _loc1_.id = "py";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.py = _loc1_;
         BindingManager.executeBindings(this,"py",this.py);
         return _loc1_;
      }
      
      private function _MapConfigView_HRule1_c() : HRule
      {
         var _loc1_:HRule = new HRule();
         _loc1_.percentWidth = 96;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._MapConfigView_Label5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_Label5_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "其他：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_HGroup5_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._MapConfigView_Label6_c(),this._MapConfigView_TextInput4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_Label6_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "地图类型绑定：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_TextInput4_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.enabled = true;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("color",0);
         _loc1_.id = "world";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.world = _loc1_;
         BindingManager.executeBindings(this,"world",this.world);
         return _loc1_;
      }
      
      private function _MapConfigView_HGroup6_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._MapConfigView_Label7_c(),this._MapConfigView_TextInput5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_Label7_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "背景绑定：";
         _loc1_.width = 84;
         _loc1_.setStyle("textAlign","right");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_TextInput5_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.enabled = true;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("color",0);
         _loc1_.id = "bgConfig";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bgConfig = _loc1_;
         BindingManager.executeBindings(this,"bgConfig",this.bgConfig);
         return _loc1_;
      }
      
      private function _MapConfigView_HGroup7_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._MapConfigView_Label8_c(),this._MapConfigView_TextInput6_i(),this._MapConfigView_Label9_c(),this._MapConfigView_TextInput7_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_Label8_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "地图宽度：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_TextInput6_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.enabled = true;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("color",0);
         _loc1_.id = "pwidth";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pwidth = _loc1_;
         BindingManager.executeBindings(this,"pwidth",this.pwidth);
         return _loc1_;
      }
      
      private function _MapConfigView_Label9_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 84;
         _loc1_.text = "地图高度：";
         _loc1_.setStyle("textAlign","right");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_TextInput7_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.enabled = true;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("color",0);
         _loc1_.id = "pheight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pheight = _loc1_;
         BindingManager.executeBindings(this,"pheight",this.pheight);
         return _loc1_;
      }
      
      private function _MapConfigView_HGroup8_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._MapConfigView_Button2_c(),this._MapConfigView_Button3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapConfigView_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "确定";
         _loc1_.addEventListener("click",this.___MapConfigView_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___MapConfigView_Button2_click(param1:MouseEvent) : void
      {
         this.onEnter(param1);
      }
      
      private function _MapConfigView_Button3_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "取消";
         _loc1_.addEventListener("click",this.___MapConfigView_Button3_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___MapConfigView_Button3_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
      }
      
      [Bindable(event="propertyChange")]
      public function get bgConfig() : TextInput
      {
         return this._2055638041bgConfig;
      }
      
      public function set bgConfig(param1:TextInput) : void
      {
         var _loc2_:Object = this._2055638041bgConfig;
         if(_loc2_ !== param1)
         {
            this._2055638041bgConfig = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgConfig",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pheight() : TextInput
      {
         return this._604865129pheight;
      }
      
      public function set pheight(param1:TextInput) : void
      {
         var _loc2_:Object = this._604865129pheight;
         if(_loc2_ !== param1)
         {
            this._604865129pheight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pheight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pwidth() : TextInput
      {
         return this._975375530pwidth;
      }
      
      public function set pwidth(param1:TextInput) : void
      {
         var _loc2_:Object = this._975375530pwidth;
         if(_loc2_ !== param1)
         {
            this._975375530pwidth = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pwidth",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get px() : TextInput
      {
         return this._3592px;
      }
      
      public function set px(param1:TextInput) : void
      {
         var _loc2_:Object = this._3592px;
         if(_loc2_ !== param1)
         {
            this._3592px = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"px",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get py() : TextInput
      {
         return this._3593py;
      }
      
      public function set py(param1:TextInput) : void
      {
         var _loc2_:Object = this._3593py;
         if(_loc2_ !== param1)
         {
            this._3593py = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"py",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get texture() : TextInput
      {
         return this._1417816805texture;
      }
      
      public function set texture(param1:TextInput) : void
      {
         var _loc2_:Object = this._1417816805texture;
         if(_loc2_ !== param1)
         {
            this._1417816805texture = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"texture",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get world() : TextInput
      {
         return this._113318802world;
      }
      
      public function set world(param1:TextInput) : void
      {
         var _loc2_:Object = this._113318802world;
         if(_loc2_ !== param1)
         {
            this._113318802world = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"world",_loc2_,param1));
            }
         }
      }
   }
}

