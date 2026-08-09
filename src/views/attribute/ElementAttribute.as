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
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.BorderContainer;
   import spark.components.CheckBox;
   import spark.components.DropDownList;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.RadioButton;
   import spark.components.RadioButtonGroup;
   import spark.components.Scroller;
   import spark.components.TextInput;
   import spark.events.IndexChangeEvent;
   import spark.events.TextOperationEvent;
   import spark.layouts.VerticalLayout;
   import tmx.PoltDisplay;
   import tmx.SaveObject;
   import views.attribute.item.AttributeItem;
   
   use namespace mx_internal;
   
   public class ElementAttribute extends RefAttribute implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      private var _209811107blendModeDrop:DropDownList;
      
      private var _10238507classBind:TextInput;
      
      private var _181467345noChange:CheckBox;
      
      private var _2141470988npcName:TextInput;
      
      private var _568147308otherAttribute:List;
      
      private var _988153097pingpu:CheckBox;
      
      private var _958069342rLabel:TextInput;
      
      private var _1174236830radioBtnGroup:RadioButtonGroup;
      
      private var _714313914scaleXLabel:TextInput;
      
      private var _685684763scaleYLabel:TextInput;
      
      private var _894249832targetNameLabel:TextInput;
      
      private var _786294436xLabel:TextInput;
      
      private var _757665285yLabel:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _npc:SaveObject;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ElementAttribute()
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
         bindings = this._ElementAttribute_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_attribute_ElementAttributeWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ElementAttribute[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._ElementAttribute_Array1_c);
         this._ElementAttribute_RadioButtonGroup1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ElementAttribute._watcherSetupUtil = param1;
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
      
      public function setNpc(param1:SaveObject) : void
      {
         var npc:SaveObject = param1;
         this._npc = npc;
         if(!this._npc)
         {
            return;
         }
         callLater(function():void
         {
            if(_npc as PoltDisplay)
            {
               left.selected = (_npc as PoltDisplay).dialogue == "left";
               right.selected = (_npc as PoltDisplay).dialogue == "right";
               left.enabled = right.enabled = true;
            }
            else
            {
               left.enabled = right.enabled = false;
            }
            targetNameLabel.text = _npc.getName();
            classBind.text = _npc.classBind;
            xLabel.text = String(_npc.x);
            yLabel.text = String(_npc.y);
            scaleXLabel.text = String(_npc.scaleX);
            scaleYLabel.text = String(_npc.scaleY);
            rLabel.text = String(_npc.rotation);
            noChange.selected = _npc.noChange;
            pingpu.selected = _npc.pingpu;
            npcName.text = _npc.instanceName;
            blendModeDrop.selectedIndex = 0;
            parsingArrayAttribute();
            var _loc1_:int = 0;
            while(_loc1_ < blends.length)
            {
               if(blends.getItemAt(_loc1_).value == _npc.starlingBlendMode)
               {
                  blendModeDrop.selectedIndex = _loc1_;
                  break;
               }
               _loc1_++;
            }
         });
      }
      
      public function parsingArrayAttribute() : void
      {
         var _loc3_:Object = null;
         var _loc4_:Boolean = false;
         var _loc5_:Object = null;
         var _loc6_:Array = null;
         var _loc1_:Array = this._npc.other.split("\n");
         var _loc2_:Array = this._npc.attribute;
         this.otherAttribute.dataProvider = new ArrayCollection();
         for(_loc3_ in _loc2_)
         {
            _loc4_ = true;
            for(_loc5_ in _loc1_)
            {
               if((_loc1_[_loc5_] as String).indexOf(_loc2_[_loc3_]) == 0)
               {
                  _loc6_ = _loc1_[_loc5_].split("=");
                  this.otherAttribute.dataProvider.addItem({
                     "name":_loc2_[_loc3_],
                     "value":_loc6_[1]
                  });
                  _loc4_ = false;
               }
            }
            if(_loc4_)
            {
               this.otherAttribute.dataProvider.addItem({
                  "name":_loc2_[_loc3_],
                  "value":null
               });
            }
         }
      }
      
      public function getAttributeString() : String
      {
         var _loc3_:Object = null;
         var _loc1_:String = "";
         var _loc2_:Array = (this.otherAttribute.dataProvider as ArrayCollection).source;
         for(_loc3_ in _loc2_)
         {
            _loc1_ += _loc2_[_loc3_].name + "=" + _loc2_[_loc3_].value + "\n";
         }
         return _loc1_;
      }
      
      override public function onChannge() : void
      {
         if(!this._npc)
         {
            return;
         }
         if(this._npc as PoltDisplay)
         {
            (this._npc as PoltDisplay).dialogue = this.radioBtnGroup.selection == left ? "right" : "left";
         }
         this._npc.x = Number(this.xLabel.text);
         this._npc.y = Number(this.yLabel.text);
         this._npc.scaleX = Number(this.scaleXLabel.text);
         this._npc.scaleY = Number(this.scaleYLabel.text);
         this._npc.rotation = Number(this.rLabel.text);
         this._npc.instanceName = this.npcName.text;
         this._npc.starlingBlendMode = this.blendModeDrop.selectedItem.value;
         this._npc.other = this.getAttributeString();
         this._npc.noChange = this.noChange.selected;
         this._npc.pingpu = this.pingpu.selected;
         this.dispatchEvent(new OpenEvent(OpenEvent.CHANGE,null));
      }
      
      private function _ElementAttribute_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"radioBtnGroup");
         this.radioBtnGroup = _loc1_;
         BindingManager.executeBindings(this,"radioBtnGroup",this.radioBtnGroup);
         return _loc1_;
      }
      
      private function _ElementAttribute_Array1_c() : Array
      {
         return [this._ElementAttribute_BorderContainer1_c()];
      }
      
      private function _ElementAttribute_BorderContainer1_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._ElementAttribute_Array2_c);
         _loc1_.setStyle("backgroundAlpha",0.5);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_Array2_c() : Array
      {
         return [this._ElementAttribute_Scroller1_c()];
      }
      
      private function _ElementAttribute_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._ElementAttribute_Group1_c();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ElementAttribute_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.layout = this._ElementAttribute_VerticalLayout1_c();
         _loc1_.mxmlContent = [this._ElementAttribute_HGroup1_c(),this._ElementAttribute_HGroup2_c(),this._ElementAttribute_HGroup3_c(),this._ElementAttribute_HGroup4_c(),this._ElementAttribute_HGroup5_c(),this._ElementAttribute_HGroup6_c(),this._ElementAttribute_HGroup7_c(),this._ElementAttribute_HGroup8_c(),this._ElementAttribute_HGroup9_c(),this._ElementAttribute_HGroup10_c(),this._ElementAttribute_HGroup11_c(),this._ElementAttribute_HGroup12_c(),this._ElementAttribute_HGroup13_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.horizontalAlign = "right";
         _loc1_.verticalAlign = "top";
         return _loc1_;
      }
      
      private function _ElementAttribute_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ElementAttribute_Label1_c(),this._ElementAttribute_TextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "实例名称：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.right = 5;
         _loc1_.addEventListener("change",this.__npcName_change);
         _loc1_.id = "npcName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.npcName = _loc1_;
         BindingManager.executeBindings(this,"npcName",this.npcName);
         return _loc1_;
      }
      
      public function __npcName_change(param1:TextOperationEvent) : void
      {
         this.onChannge();
      }
      
      private function _ElementAttribute_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ElementAttribute_Label2_c(),this._ElementAttribute_TextInput2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "索引名称：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.right = 5;
         _loc1_.editable = false;
         _loc1_.addEventListener("change",this.__targetNameLabel_change);
         _loc1_.id = "targetNameLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.targetNameLabel = _loc1_;
         BindingManager.executeBindings(this,"targetNameLabel",this.targetNameLabel);
         return _loc1_;
      }
      
      public function __targetNameLabel_change(param1:TextOperationEvent) : void
      {
         this.onChannge();
      }
      
      private function _ElementAttribute_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ElementAttribute_Label3_c(),this._ElementAttribute_TextInput3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "绑定类型：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_TextInput3_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.right = 5;
         _loc1_.editable = false;
         _loc1_.addEventListener("change",this.__classBind_change);
         _loc1_.id = "classBind";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.classBind = _loc1_;
         BindingManager.executeBindings(this,"classBind",this.classBind);
         return _loc1_;
      }
      
      public function __classBind_change(param1:TextOperationEvent) : void
      {
         this.onChannge();
      }
      
      private function _ElementAttribute_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ElementAttribute_Label4_c(),this._ElementAttribute_TextInput4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_Label4_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "X轴：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_TextInput4_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.right = 5;
         _loc1_.addEventListener("change",this.__xLabel_change);
         _loc1_.id = "xLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.xLabel = _loc1_;
         BindingManager.executeBindings(this,"xLabel",this.xLabel);
         return _loc1_;
      }
      
      public function __xLabel_change(param1:TextOperationEvent) : void
      {
         this.onChannge();
      }
      
      private function _ElementAttribute_HGroup5_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ElementAttribute_Label5_c(),this._ElementAttribute_TextInput5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_Label5_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "Y轴：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_TextInput5_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.right = 5;
         _loc1_.addEventListener("change",this.__yLabel_change);
         _loc1_.id = "yLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.yLabel = _loc1_;
         BindingManager.executeBindings(this,"yLabel",this.yLabel);
         return _loc1_;
      }
      
      public function __yLabel_change(param1:TextOperationEvent) : void
      {
         this.onChannge();
      }
      
      private function _ElementAttribute_HGroup6_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ElementAttribute_Label6_c(),this._ElementAttribute_TextInput6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_Label6_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "ScaleX：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_TextInput6_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.right = 5;
         _loc1_.addEventListener("change",this.__scaleXLabel_change);
         _loc1_.id = "scaleXLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scaleXLabel = _loc1_;
         BindingManager.executeBindings(this,"scaleXLabel",this.scaleXLabel);
         return _loc1_;
      }
      
      public function __scaleXLabel_change(param1:TextOperationEvent) : void
      {
         this.onChannge();
      }
      
      private function _ElementAttribute_HGroup7_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ElementAttribute_Label7_c(),this._ElementAttribute_TextInput7_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_Label7_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "ScaleY：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_TextInput7_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.right = 5;
         _loc1_.addEventListener("change",this.__scaleYLabel_change);
         _loc1_.id = "scaleYLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scaleYLabel = _loc1_;
         BindingManager.executeBindings(this,"scaleYLabel",this.scaleYLabel);
         return _loc1_;
      }
      
      public function __scaleYLabel_change(param1:TextOperationEvent) : void
      {
         this.onChannge();
      }
      
      private function _ElementAttribute_HGroup8_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ElementAttribute_Label8_c(),this._ElementAttribute_TextInput8_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_Label8_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "角度：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_TextInput8_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.right = 5;
         _loc1_.addEventListener("change",this.__rLabel_change);
         _loc1_.id = "rLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rLabel = _loc1_;
         BindingManager.executeBindings(this,"rLabel",this.rLabel);
         return _loc1_;
      }
      
      public function __rLabel_change(param1:TextOperationEvent) : void
      {
         this.onChannge();
      }
      
      private function _ElementAttribute_HGroup9_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ElementAttribute_Label9_c(),this._ElementAttribute_DropDownList1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_Label9_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "渲染：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.selectedIndex = 0;
         _loc1_.labelField = "name";
         _loc1_.width = 128;
         _loc1_.addEventListener("change",this.__blendModeDrop_change);
         _loc1_.id = "blendModeDrop";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.blendModeDrop = _loc1_;
         BindingManager.executeBindings(this,"blendModeDrop",this.blendModeDrop);
         return _loc1_;
      }
      
      public function __blendModeDrop_change(param1:IndexChangeEvent) : void
      {
         this.onChannge();
      }
      
      private function _ElementAttribute_HGroup10_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.percentWidth = 90;
         _loc1_.horizontalAlign = "left";
         _loc1_.mxmlContent = [this._ElementAttribute_Label10_c(),this._ElementAttribute_CheckBox1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_Label10_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "转换：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_CheckBox1_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "不转换为角色";
         _loc1_.addEventListener("change",this.__noChange_change);
         _loc1_.id = "noChange";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.noChange = _loc1_;
         BindingManager.executeBindings(this,"noChange",this.noChange);
         return _loc1_;
      }
      
      public function __noChange_change(param1:Event) : void
      {
         this.onChannge();
      }
      
      private function _ElementAttribute_HGroup11_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.percentWidth = 90;
         _loc1_.horizontalAlign = "left";
         _loc1_.mxmlContent = [this._ElementAttribute_Label11_c(),this._ElementAttribute_CheckBox2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_Label11_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "拉伸：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_CheckBox2_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "是否平铺";
         _loc1_.addEventListener("change",this.__pingpu_change);
         _loc1_.id = "pingpu";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pingpu = _loc1_;
         BindingManager.executeBindings(this,"pingpu",this.pingpu);
         return _loc1_;
      }
      
      public function __pingpu_change(param1:Event) : void
      {
         this.onChannge();
      }
      
      private function _ElementAttribute_HGroup12_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.percentWidth = 90;
         _loc1_.horizontalAlign = "left";
         _loc1_.mxmlContent = [this._ElementAttribute_Label12_c(),this._ElementAttribute_RadioButton1_i(),this._ElementAttribute_RadioButton2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_Label12_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "对话：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_RadioButton1_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.label = "左";
         _loc1_.selected = true;
         _loc1_.addEventListener("change",this.__left_change);
         _loc1_.id = "left";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         left = _loc1_;
         BindingManager.executeBindings(this,"left",left);
         return _loc1_;
      }
      
      public function __left_change(param1:Event) : void
      {
         this.onChannge();
      }
      
      private function _ElementAttribute_RadioButton2_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.label = "右";
         _loc1_.addEventListener("change",this.__right_change);
         _loc1_.id = "right";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         right = _loc1_;
         BindingManager.executeBindings(this,"right",right);
         return _loc1_;
      }
      
      public function __right_change(param1:Event) : void
      {
         this.onChannge();
      }
      
      private function _ElementAttribute_HGroup13_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ElementAttribute_List1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ElementAttribute_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.width = 200;
         _loc1_.height = 300;
         _loc1_.itemRenderer = this._ElementAttribute_ClassFactory1_c();
         _loc1_.addEventListener("change",this.__otherAttribute_change);
         _loc1_.id = "otherAttribute";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.otherAttribute = _loc1_;
         BindingManager.executeBindings(this,"otherAttribute",this.otherAttribute);
         return _loc1_;
      }
      
      private function _ElementAttribute_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = AttributeItem;
         return _loc1_;
      }
      
      public function __otherAttribute_change(param1:IndexChangeEvent) : void
      {
         this.onChannge();
      }
      
      private function _ElementAttribute_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"blendModeDrop.dataProvider","blends");
         _loc1_[1] = new Binding(this,null,null,"left.group","radioBtnGroup");
         _loc1_[2] = new Binding(this,null,null,"right.group","radioBtnGroup");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get blendModeDrop() : DropDownList
      {
         return this._209811107blendModeDrop;
      }
      
      public function set blendModeDrop(param1:DropDownList) : void
      {
         var _loc2_:Object = this._209811107blendModeDrop;
         if(_loc2_ !== param1)
         {
            this._209811107blendModeDrop = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"blendModeDrop",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get classBind() : TextInput
      {
         return this._10238507classBind;
      }
      
      public function set classBind(param1:TextInput) : void
      {
         var _loc2_:Object = this._10238507classBind;
         if(_loc2_ !== param1)
         {
            this._10238507classBind = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"classBind",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get noChange() : CheckBox
      {
         return this._181467345noChange;
      }
      
      public function set noChange(param1:CheckBox) : void
      {
         var _loc2_:Object = this._181467345noChange;
         if(_loc2_ !== param1)
         {
            this._181467345noChange = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"noChange",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get npcName() : TextInput
      {
         return this._2141470988npcName;
      }
      
      public function set npcName(param1:TextInput) : void
      {
         var _loc2_:Object = this._2141470988npcName;
         if(_loc2_ !== param1)
         {
            this._2141470988npcName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"npcName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get otherAttribute() : List
      {
         return this._568147308otherAttribute;
      }
      
      public function set otherAttribute(param1:List) : void
      {
         var _loc2_:Object = this._568147308otherAttribute;
         if(_loc2_ !== param1)
         {
            this._568147308otherAttribute = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"otherAttribute",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pingpu() : CheckBox
      {
         return this._988153097pingpu;
      }
      
      public function set pingpu(param1:CheckBox) : void
      {
         var _loc2_:Object = this._988153097pingpu;
         if(_loc2_ !== param1)
         {
            this._988153097pingpu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pingpu",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rLabel() : TextInput
      {
         return this._958069342rLabel;
      }
      
      public function set rLabel(param1:TextInput) : void
      {
         var _loc2_:Object = this._958069342rLabel;
         if(_loc2_ !== param1)
         {
            this._958069342rLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get radioBtnGroup() : RadioButtonGroup
      {
         return this._1174236830radioBtnGroup;
      }
      
      public function set radioBtnGroup(param1:RadioButtonGroup) : void
      {
         var _loc2_:Object = this._1174236830radioBtnGroup;
         if(_loc2_ !== param1)
         {
            this._1174236830radioBtnGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"radioBtnGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scaleXLabel() : TextInput
      {
         return this._714313914scaleXLabel;
      }
      
      public function set scaleXLabel(param1:TextInput) : void
      {
         var _loc2_:Object = this._714313914scaleXLabel;
         if(_loc2_ !== param1)
         {
            this._714313914scaleXLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scaleXLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scaleYLabel() : TextInput
      {
         return this._685684763scaleYLabel;
      }
      
      public function set scaleYLabel(param1:TextInput) : void
      {
         var _loc2_:Object = this._685684763scaleYLabel;
         if(_loc2_ !== param1)
         {
            this._685684763scaleYLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scaleYLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get targetNameLabel() : TextInput
      {
         return this._894249832targetNameLabel;
      }
      
      public function set targetNameLabel(param1:TextInput) : void
      {
         var _loc2_:Object = this._894249832targetNameLabel;
         if(_loc2_ !== param1)
         {
            this._894249832targetNameLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"targetNameLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get xLabel() : TextInput
      {
         return this._786294436xLabel;
      }
      
      public function set xLabel(param1:TextInput) : void
      {
         var _loc2_:Object = this._786294436xLabel;
         if(_loc2_ !== param1)
         {
            this._786294436xLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get yLabel() : TextInput
      {
         return this._757665285yLabel;
      }
      
      public function set yLabel(param1:TextInput) : void
      {
         var _loc2_:Object = this._757665285yLabel;
         if(_loc2_ !== param1)
         {
            this._757665285yLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"yLabel",_loc2_,param1));
            }
         }
      }
   }
}

