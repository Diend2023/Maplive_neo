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
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.BorderContainer;
   import spark.components.Button;
   import spark.components.DropDownList;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.Panel;
   import spark.components.TextArea;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import utils.XMLUtils;
   import views.attribute.item.XmlAttributeItem;
   
   use namespace mx_internal;
   
   public class ActionView extends Panel implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _1851679201actionName:TextInput;
      
      private var _553754159attrList:List;
      
      private var _3169cd:TextInput;
      
      private var _106079key:TextInput;
      
      private var _108417msg:TextArea;
      
      private var _1946434271otherAttr:BorderContainer;
      
      private var _1992149259skilltype:DropDownList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var callFunc:Function;
      
      public var editxml:XML;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ActionView()
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
         bindings = this._ActionView_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_ActionViewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ActionView[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 224;
         this.height = 300;
         this.title = "添加动作";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._ActionView_Array1_c);
         this.addEventListener("initialize",this.___ActionView_Panel1_initialize);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ActionView._watcherSetupUtil = param1;
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
      
      protected function onEnter(param1:MouseEvent) : void
      {
         if(!this.editxml && Boolean(this.callFunc))
         {
            this.callFunc(this);
         }
         else
         {
            if(this.editxml)
            {
               this.editxml.@name = this.actionName.text;
               this.editxml.@cd = this.cd.text;
               this.editxml.@key = this.key.text;
               this.editxml.@type = this.skilltype.selectedItem.type;
               this.editxml.@other = JSON.stringify(this.attrArray);
               this.editxml.@msg = this.msg.text;
            }
            PopUpManager.removePopUp(this);
         }
      }
      
      public function get attrArray() : Array
      {
         var _loc1_:Array = null;
         var _loc2_:Object = null;
         var _loc3_:XML = null;
         if(this.attrList.dataProvider)
         {
            _loc1_ = [];
            for(_loc2_ in (this.attrList.dataProvider as ArrayCollection).source)
            {
               _loc3_ = (this.attrList.dataProvider as ArrayCollection).source[_loc2_];
               _loc1_.push({
                  "id":String(_loc3_.@id),
                  "value":String(_loc3_.@value)
               });
            }
            return _loc1_;
         }
         return null;
      }
      
      protected function onInit(param1:FlexEvent) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         this.otherAttr.visible = false;
         var _loc2_:ArrayCollection = null;
         if(App.config)
         {
            _loc2_ = XMLUtils.getArrayDataFormXml(App.config,"action");
            this.otherAttr.visible = _loc2_ != null;
         }
         if(this.editxml)
         {
            this.actionName.text = this.editxml.@name;
            this.cd.text = this.editxml.@cd;
            this.key.text = this.editxml.@key;
            this.msg.text = this.editxml.@msg;
            switch(String(this.editxml.@type))
            {
               case "air":
                  this.skilltype.selectedIndex = 1;
                  break;
               case "land":
                  this.skilltype.selectedIndex = 0;
                  break;
               case "all":
                  this.skilltype.selectedIndex = 2;
                  break;
               case "injured":
                  this.skilltype.selectedIndex = 3;
                  break;
               default:
                  this.skilltype.selectedIndex = 0;
            }
            if(this.editxml.@other != undefined && Boolean(_loc2_))
            {
               _loc3_ = JSON.parse(this.editxml.@other) as Array;
               for(_loc4_ in _loc3_)
               {
                  _loc2_.source[_loc4_].@value = _loc3_[_loc4_].value;
               }
            }
         }
         this.attrList.dataProvider = _loc2_;
      }
      
      private function _ActionView_Array1_c() : Array
      {
         return [this._ActionView_VGroup1_c(),this._ActionView_Button1_c(),this._ActionView_Button2_c(),this._ActionView_BorderContainer1_i()];
      }
      
      private function _ActionView_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.top = 10;
         _loc1_.horizontalAlign = "right";
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._ActionView_HGroup1_c(),this._ActionView_HGroup2_c(),this._ActionView_HGroup3_c(),this._ActionView_HGroup4_c(),this._ActionView_HGroup5_c()];
         _loc1_.setStyle("color",0);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ActionView_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "right";
         _loc1_.mxmlContent = [this._ActionView_Label1_c(),this._ActionView_TextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ActionView_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "动作名字";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ActionView_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.id = "actionName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.actionName = _loc1_;
         BindingManager.executeBindings(this,"actionName",this.actionName);
         return _loc1_;
      }
      
      private function _ActionView_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "right";
         _loc1_.mxmlContent = [this._ActionView_Label2_c(),this._ActionView_TextInput2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ActionView_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "CD时间";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ActionView_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.id = "cd";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cd = _loc1_;
         BindingManager.executeBindings(this,"cd",this.cd);
         return _loc1_;
      }
      
      private function _ActionView_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "right";
         _loc1_.mxmlContent = [this._ActionView_Label3_c(),this._ActionView_TextInput3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ActionView_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "键控映射";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ActionView_TextInput3_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.id = "key";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.key = _loc1_;
         BindingManager.executeBindings(this,"key",this.key);
         return _loc1_;
      }
      
      private function _ActionView_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "right";
         _loc1_.mxmlContent = [this._ActionView_Label4_c(),this._ActionView_DropDownList1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ActionView_Label4_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "技能类型";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ActionView_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.labelField = "name";
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.id = "skilltype";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.skilltype = _loc1_;
         BindingManager.executeBindings(this,"skilltype",this.skilltype);
         return _loc1_;
      }
      
      private function _ActionView_HGroup5_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "right";
         _loc1_.mxmlContent = [this._ActionView_Label5_c(),this._ActionView_TextArea1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ActionView_Label5_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "描述";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ActionView_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.x = 90;
         _loc1_.width = 128;
         _loc1_.height = 100;
         _loc1_.id = "msg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.msg = _loc1_;
         BindingManager.executeBindings(this,"msg",this.msg);
         return _loc1_;
      }
      
      private function _ActionView_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 122;
         _loc1_.y = 232;
         _loc1_.label = "确定";
         _loc1_.addEventListener("click",this.___ActionView_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___ActionView_Button1_click(param1:MouseEvent) : void
      {
         this.onEnter(param1);
      }
      
      private function _ActionView_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 33;
         _loc1_.y = 232;
         _loc1_.label = "取消";
         _loc1_.addEventListener("click",this.___ActionView_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___ActionView_Button2_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
      }
      
      private function _ActionView_BorderContainer1_i() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.x = 230;
         _loc1_.y = 10;
         _loc1_.width = 200;
         _loc1_.height = 240;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._ActionView_Array8_c);
         _loc1_.setStyle("backgroundColor",5921126);
         _loc1_.id = "otherAttr";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.otherAttr = _loc1_;
         BindingManager.executeBindings(this,"otherAttr",this.otherAttr);
         return _loc1_;
      }
      
      private function _ActionView_Array8_c() : Array
      {
         return [this._ActionView_List1_i()];
      }
      
      private function _ActionView_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.itemRenderer = this._ActionView_ClassFactory1_c();
         _loc1_.percentHeight = 100;
         _loc1_.id = "attrList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.attrList = _loc1_;
         BindingManager.executeBindings(this,"attrList",this.attrList);
         return _loc1_;
      }
      
      private function _ActionView_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = XmlAttributeItem;
         return _loc1_;
      }
      
      public function ___ActionView_Panel1_initialize(param1:FlexEvent) : void
      {
         this.onInit(param1);
      }
      
      private function _ActionView_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():IList
         {
            return new ArrayCollection([{
               "name":"地面技能",
               "type":"land"
            },{
               "name":"空中技能",
               "type":"air"
            },{
               "name":"全能技能",
               "type":"all"
            },{
               "name":"受伤释放",
               "type":"injured"
            }]);
         },null,"skilltype.dataProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get actionName() : TextInput
      {
         return this._1851679201actionName;
      }
      
      public function set actionName(param1:TextInput) : void
      {
         var _loc2_:Object = this._1851679201actionName;
         if(_loc2_ !== param1)
         {
            this._1851679201actionName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actionName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get attrList() : List
      {
         return this._553754159attrList;
      }
      
      public function set attrList(param1:List) : void
      {
         var _loc2_:Object = this._553754159attrList;
         if(_loc2_ !== param1)
         {
            this._553754159attrList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"attrList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cd() : TextInput
      {
         return this._3169cd;
      }
      
      public function set cd(param1:TextInput) : void
      {
         var _loc2_:Object = this._3169cd;
         if(_loc2_ !== param1)
         {
            this._3169cd = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cd",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get key() : TextInput
      {
         return this._106079key;
      }
      
      public function set key(param1:TextInput) : void
      {
         var _loc2_:Object = this._106079key;
         if(_loc2_ !== param1)
         {
            this._106079key = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"key",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get msg() : TextArea
      {
         return this._108417msg;
      }
      
      public function set msg(param1:TextArea) : void
      {
         var _loc2_:Object = this._108417msg;
         if(_loc2_ !== param1)
         {
            this._108417msg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"msg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get otherAttr() : BorderContainer
      {
         return this._1946434271otherAttr;
      }
      
      public function set otherAttr(param1:BorderContainer) : void
      {
         var _loc2_:Object = this._1946434271otherAttr;
         if(_loc2_ !== param1)
         {
            this._1946434271otherAttr = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"otherAttr",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get skilltype() : DropDownList
      {
         return this._1992149259skilltype;
      }
      
      public function set skilltype(param1:DropDownList) : void
      {
         var _loc2_:Object = this._1992149259skilltype;
         if(_loc2_ !== param1)
         {
            this._1992149259skilltype = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skilltype",_loc2_,param1));
            }
         }
      }
   }
}

