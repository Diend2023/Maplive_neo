package views.attribute
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
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.BorderContainer;
   import spark.components.DropDownList;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.Scroller;
   import spark.components.TextInput;
   import spark.events.IndexChangeEvent;
   import spark.events.TextOperationEvent;
   import spark.layouts.VerticalLayout;
   import tmx.MapEidtLayer;
   import tmx.MapSprite;
   import tmx.MapSpriteMode;
   
   use namespace mx_internal;
   
   public class MapAttribute extends RefAttribute implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      private var _3023540bian:TextInput;
      
      private var _3083582dipi:TextInput;
      
      private var _827090681drawMode:DropDownList;
      
      private var _676524035typeMode:DropDownList;
      
      private var _113017053wenli:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var display:MapSprite;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function MapAttribute()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._MapAttribute_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_attribute_MapAttributeWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return MapAttribute[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.height = 300;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._MapAttribute_Array1_c);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         MapAttribute._watcherSetupUtil = param1;
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
      
      public function setMapSprite(param1:MapSprite) : void
      {
         var mapSprite:MapSprite = param1;
         callLater(function():void
         {
            display = mapSprite;
            var _loc1_:String = display.data.properties.get("draw_mode");
            if(_loc1_ == "auto" || !_loc1_)
            {
               drawMode.selectedIndex = 0;
            }
            else
            {
               drawMode.selectedIndex = 1;
            }
            switch(display.mode)
            {
               case MapSpriteMode.NOT_PENETRATE:
                  typeMode.selectedIndex = 0;
                  break;
               case MapSpriteMode.NOT_VISIBLE_STES:
                  typeMode.selectedIndex = 2;
                  break;
               case MapSpriteMode.VISIBLE_STES:
                  typeMode.selectedIndex = 1;
                  break;
               case MapSpriteMode.DYNAMIC_VISIBLE:
                  typeMode.selectedIndex = 3;
            }
            var _loc2_:MapEidtLayer = display.parent as MapEidtLayer;
            dipi.text = _loc2_.layer.properties.get("dipi");
            bian.text = _loc2_.layer.properties.get("bian");
            wenli.text = _loc2_.layer.properties.get("wenli");
         });
      }
      
      protected function onChange(param1:IndexChangeEvent) : void
      {
         this.display.data.properties.set("draw_mode",this.drawMode.selectedItem);
         this.display.mode = this.typeMode.selectedItem.data;
         this.dispatchEvent(new OpenEvent(OpenEvent.CHANGE,null));
      }
      
      protected function onTextChange(param1:TextOperationEvent) : void
      {
         var _loc2_:MapEidtLayer = this.display.parent as MapEidtLayer;
         _loc2_.layer.properties.set("bian",this.bian.text);
         _loc2_.layer.properties.set("wenli",this.wenli.text);
         _loc2_.layer.properties.set("dipi",this.dipi.text);
         this.dispatchEvent(new OpenEvent(OpenEvent.CHANGE,null));
      }
      
      private function _MapAttribute_Array1_c() : Array
      {
         return [this._MapAttribute_BorderContainer1_c()];
      }
      
      private function _MapAttribute_BorderContainer1_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._MapAttribute_Array2_c);
         _loc1_.setStyle("backgroundAlpha",0.5);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapAttribute_Array2_c() : Array
      {
         return [this._MapAttribute_Scroller1_c()];
      }
      
      private function _MapAttribute_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._MapAttribute_Group1_c();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapAttribute_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._MapAttribute_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapAttribute_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.layout = this._MapAttribute_VerticalLayout1_c();
         _loc1_.mxmlContent = [this._MapAttribute_HGroup1_c(),this._MapAttribute_HGroup2_c(),this._MapAttribute_HGroup3_c(),this._MapAttribute_HGroup4_c(),this._MapAttribute_HGroup5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapAttribute_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.horizontalAlign = "right";
         _loc1_.verticalAlign = "top";
         return _loc1_;
      }
      
      private function _MapAttribute_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._MapAttribute_Label1_c(),this._MapAttribute_DropDownList1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapAttribute_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "绘制模式：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapAttribute_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.addEventListener("change",this.__drawMode_change);
         _loc1_.id = "drawMode";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.drawMode = _loc1_;
         BindingManager.executeBindings(this,"drawMode",this.drawMode);
         return _loc1_;
      }
      
      public function __drawMode_change(param1:IndexChangeEvent) : void
      {
         this.onChange(param1);
      }
      
      private function _MapAttribute_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._MapAttribute_Label2_c(),this._MapAttribute_DropDownList2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapAttribute_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "地块类型：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapAttribute_DropDownList2_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.labelField = "name";
         _loc1_.addEventListener("change",this.__typeMode_change);
         _loc1_.id = "typeMode";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.typeMode = _loc1_;
         BindingManager.executeBindings(this,"typeMode",this.typeMode);
         return _loc1_;
      }
      
      public function __typeMode_change(param1:IndexChangeEvent) : void
      {
         this.onChange(param1);
      }
      
      private function _MapAttribute_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._MapAttribute_Label3_c(),this._MapAttribute_TextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapAttribute_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "地皮：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapAttribute_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.text = "dipi.png";
         _loc1_.addEventListener("change",this.__dipi_change);
         _loc1_.id = "dipi";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dipi = _loc1_;
         BindingManager.executeBindings(this,"dipi",this.dipi);
         return _loc1_;
      }
      
      public function __dipi_change(param1:TextOperationEvent) : void
      {
         this.onTextChange(param1);
      }
      
      private function _MapAttribute_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._MapAttribute_Label4_c(),this._MapAttribute_TextInput2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapAttribute_Label4_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "拼接：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapAttribute_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.text = "bian.png";
         _loc1_.addEventListener("change",this.__bian_change);
         _loc1_.id = "bian";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bian = _loc1_;
         BindingManager.executeBindings(this,"bian",this.bian);
         return _loc1_;
      }
      
      public function __bian_change(param1:TextOperationEvent) : void
      {
         this.onTextChange(param1);
      }
      
      private function _MapAttribute_HGroup5_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._MapAttribute_Label5_c(),this._MapAttribute_TextInput3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapAttribute_Label5_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "纹理：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapAttribute_TextInput3_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.text = "wenli.png";
         _loc1_.addEventListener("change",this.__wenli_change);
         _loc1_.id = "wenli";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.wenli = _loc1_;
         BindingManager.executeBindings(this,"wenli",this.wenli);
         return _loc1_;
      }
      
      public function __wenli_change(param1:TextOperationEvent) : void
      {
         this.onTextChange(param1);
      }
      
      private function _MapAttribute_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():IList
         {
            return new ArrayCollection(["auto","none"]);
         },null,"drawMode.dataProvider");
         result[1] = new Binding(this,function():IList
         {
            return new ArrayCollection([{
               "data":MapSpriteMode.NOT_PENETRATE,
               "name":"实体"
            },{
               "data":MapSpriteMode.VISIBLE_STES,
               "name":"台阶"
            },{
               "data":MapSpriteMode.NOT_VISIBLE_STES,
               "name":"不可见台阶"
            },{
               "data":MapSpriteMode.DYNAMIC_VISIBLE,
               "name":"动态隐藏墙壁"
            },{
               "data":MapSpriteMode.NOT_HIT,
               "name":"装饰"
            },{
               "data":MapSpriteMode.NOT_VISIBLE_NOT_PENETRATE,
               "name":"不可见实体"
            }]);
         },null,"typeMode.dataProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get bian() : TextInput
      {
         return this._3023540bian;
      }
      
      public function set bian(param1:TextInput) : void
      {
         var _loc2_:Object = this._3023540bian;
         if(_loc2_ !== param1)
         {
            this._3023540bian = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bian",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dipi() : TextInput
      {
         return this._3083582dipi;
      }
      
      public function set dipi(param1:TextInput) : void
      {
         var _loc2_:Object = this._3083582dipi;
         if(_loc2_ !== param1)
         {
            this._3083582dipi = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dipi",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get drawMode() : DropDownList
      {
         return this._827090681drawMode;
      }
      
      public function set drawMode(param1:DropDownList) : void
      {
         var _loc2_:Object = this._827090681drawMode;
         if(_loc2_ !== param1)
         {
            this._827090681drawMode = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"drawMode",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get typeMode() : DropDownList
      {
         return this._676524035typeMode;
      }
      
      public function set typeMode(param1:DropDownList) : void
      {
         var _loc2_:Object = this._676524035typeMode;
         if(_loc2_ !== param1)
         {
            this._676524035typeMode = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"typeMode",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get wenli() : TextInput
      {
         return this._113017053wenli;
      }
      
      public function set wenli(param1:TextInput) : void
      {
         var _loc2_:Object = this._113017053wenli;
         if(_loc2_ !== param1)
         {
            this._113017053wenli = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wenli",_loc2_,param1));
            }
         }
      }
   }
}

