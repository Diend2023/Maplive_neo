package views.attribute
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
   import mx.controls.ColorPicker;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.ColorPickerEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.CheckBox;
   import spark.components.DropDownList;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.HSlider;
   import spark.components.Label;
   import spark.components.NumericStepper;
   import spark.components.Scroller;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.events.TextOperationEvent;
   import spark.layouts.VerticalLayout;
   import views.SelectElementView;
   import views.attribute.child.MoveAttribute;
   import views.observe.role.frame.EffectData;
   
   use namespace mx_internal;
   
   public class SkillAttribute extends RefAttribute implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      private var _1874202174RLabel:HSlider;
      
      private var _92608403ablow:CheckBox;
      
      private var _36860958atbottom:CheckBox;
      
      private var _209811107blendModeDrop:DropDownList;
      
      private var _1367719485canhit:CheckBox;
      
      private var _623667385canhitmap:CheckBox;
      
      private var _1367707766cantou:CheckBox;
      
      private var _1267104585cardFrameLabel:NumericStepper;
      
      private var _308408228classLabel:TextInput;
      
      private var _628846196colorInt:HSlider;
      
      private var _968161855colorSelect:ColorPicker;
      
      private var _1282133823fadeIn:CheckBox;
      
      private var _1091436750fadeOut:CheckBox;
      
      private var _1640811439hitEffectName:TextInput;
      
      private var _1662652192hitVibrationSize:NumericStepper;
      
      private var _1778540239hitXLabel:NumericStepper;
      
      private var _1807169390hitYLabel:NumericStepper;
      
      private var _99390100iName:TextInput;
      
      private var _435808899isLaunch:CheckBox;
      
      private var _1180327563isLock:CheckBox;
      
      private var _990876008liveLabel:NumericStepper;
      
      private var _1101215097mLabel:NumericStepper;
      
      private var _104973982moveAttr:MoveAttribute;
      
      private var _912680431rigidityLabel:NumericStepper;
      
      private var _714313914scaleXLabel:TextInput;
      
      private var _685684763scaleYLabel:TextInput;
      
      private var _894249832targetNameLabel:TextInput;
      
      private var _111432282unhit:CheckBox;
      
      private var _814923587wLabel:NumericStepper;
      
      private var _786294436xLabel:TextInput;
      
      private var _757665285yLabel:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _effectData:EffectData;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SkillAttribute()
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
         bindings = this._SkillAttribute_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_attribute_SkillAttributeWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SkillAttribute[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.height = 300;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._SkillAttribute_Array1_c);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SkillAttribute._watcherSetupUtil = param1;
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
      
      public function setEffectData(param1:EffectData) : void
      {
         var _loc2_:Object = null;
         this.xLabel.text = param1.x.toString();
         this.yLabel.text = param1.y.toString();
         this.mLabel.value = param1.mFight;
         this.wLabel.value = param1.wFight;
         this.iName.text = param1.findName;
         this.targetNameLabel.text = param1.name;
         this.scaleXLabel.text = String(param1.scaleX);
         this.scaleYLabel.text = String(param1.scaleY);
         this.hitXLabel.value = param1.hitX;
         this.hitYLabel.value = param1.hitY;
         this.rigidityLabel.value = param1.stiff;
         this.liveLabel.value = param1.time;
         this.moveAttr.setEffectData(param1);
         this._effectData = param1;
         this.RLabel.value = param1.rotation;
         this.ablow.selected = param1.isABlow;
         this.isLock.selected = param1.isLockActionShow;
         this.isLaunch.selected = param1.isLaunch;
         this.cardFrameLabel.value = param1.cardFrame;
         this.unhit.selected = param1.unhit;
         this.atbottom.selected = param1.atbottom;
         this.fadeIn.selected = param1.fadeIn;
         this.fadeOut.selected = param1.fadeOut;
         this.colorInt.value = (1 - param1.intensity) * 100;
         this.colorSelect.selectedColor = param1.addColor;
         this.hitVibrationSize.value = param1.hitVibrationSize;
         this.hitEffectName.text = param1.hitEffectName;
         this.classLabel.text = param1.overrideClass;
         this.canhit.selected = param1.canHit;
         this.cantou.selected = param1.through;
         this.canhitmap.selected = param1.hitMap;
         if(param1.isLockAction)
         {
            this.moveAttr.drop.selectedIndex = 2;
            this.moveAttr.stack.selectedIndex = 2;
         }
         for(_loc2_ in blends)
         {
            if(blends[_loc2_].value == param1.blendMode)
            {
               this.blendModeDrop.selectedIndex = int(_loc2_);
               break;
            }
         }
      }
      
      protected function onSelectHitEffect(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         var select:SelectElementView = new SelectElementView();
         select.findDir = "effect";
         PopUpManager.addPopUp(select,this,true);
         select.callFunc = function(param1:File):void
         {
            hitEffectName.text = param1.name.substr(0,param1.name.lastIndexOf("."));
            _effectData.hitEffectName = hitEffectName.text;
            onChannge();
         };
      }
      
      private function _SkillAttribute_Array1_c() : Array
      {
         return [this._SkillAttribute_Scroller1_c()];
      }
      
      private function _SkillAttribute_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._SkillAttribute_Group1_c();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SkillAttribute_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.layout = this._SkillAttribute_VerticalLayout1_c();
         _loc1_.mxmlContent = [this._SkillAttribute_HGroup1_c(),this._SkillAttribute_HGroup2_c(),this._SkillAttribute_HGroup3_c(),this._SkillAttribute_HGroup4_c(),this._SkillAttribute_HGroup5_c(),this._SkillAttribute_HGroup6_c(),this._SkillAttribute_HGroup7_c(),this._SkillAttribute_HGroup8_c(),this._SkillAttribute_HGroup9_c(),this._SkillAttribute_HGroup10_c(),this._SkillAttribute_HGroup11_c(),this._SkillAttribute_HGroup12_c(),this._SkillAttribute_HGroup13_c(),this._SkillAttribute_HGroup14_c(),this._SkillAttribute_HGroup15_c(),this._SkillAttribute_HGroup16_c(),this._SkillAttribute_HGroup17_c(),this._SkillAttribute_HGroup18_c(),this._SkillAttribute_HGroup19_c(),this._SkillAttribute_VGroup1_c(),this._SkillAttribute_HGroup20_c(),this._SkillAttribute_HGroup21_c(),this._SkillAttribute_Label30_c(),this._SkillAttribute_HGroup22_c(),this._SkillAttribute_Label31_c(),this._SkillAttribute_HGroup23_c()];
         _loc1_.setStyle("color",0);
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.setStyle("contentBackgroundAlpha",0.25);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.horizontalAlign = "right";
         _loc1_.verticalAlign = "top";
         return _loc1_;
      }
      
      private function _SkillAttribute_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label1_c(),this._SkillAttribute_TextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "实例名称：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.right = 5;
         _loc1_.addEventListener("change",this.__iName_change);
         _loc1_.id = "iName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.iName = _loc1_;
         BindingManager.executeBindings(this,"iName",this.iName);
         return _loc1_;
      }
      
      public function __iName_change(param1:TextOperationEvent) : void
      {
         this._effectData.findName = this.iName.text;
         onChannge();
      }
      
      private function _SkillAttribute_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label2_c(),this._SkillAttribute_TextInput2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "索引名称：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.right = 5;
         _loc1_.editable = false;
         _loc1_.id = "targetNameLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.targetNameLabel = _loc1_;
         BindingManager.executeBindings(this,"targetNameLabel",this.targetNameLabel);
         return _loc1_;
      }
      
      private function _SkillAttribute_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label3_c(),this._SkillAttribute_TextInput3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "覆盖类型：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_TextInput3_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.right = 5;
         _loc1_.addEventListener("change",this.__classLabel_change);
         _loc1_.id = "classLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.classLabel = _loc1_;
         BindingManager.executeBindings(this,"classLabel",this.classLabel);
         return _loc1_;
      }
      
      public function __classLabel_change(param1:TextOperationEvent) : void
      {
         this._effectData.overrideClass = this.classLabel.text;
         onChannge();
      }
      
      private function _SkillAttribute_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label4_c(),this._SkillAttribute_TextInput4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label4_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "X：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_TextInput4_i() : TextInput
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
         this._effectData.x = int(this.xLabel.text);
         onChannge();
      }
      
      private function _SkillAttribute_HGroup5_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label5_c(),this._SkillAttribute_TextInput5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label5_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "Y：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_TextInput5_i() : TextInput
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
         this._effectData.y = int(this.yLabel.text);
         onChannge();
      }
      
      private function _SkillAttribute_HGroup6_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label6_c(),this._SkillAttribute_TextInput6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label6_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "ScaleX：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_TextInput6_i() : TextInput
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
         this._effectData.scaleX = Number(this.scaleXLabel.text);
         onChannge();
      }
      
      private function _SkillAttribute_HGroup7_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label7_c(),this._SkillAttribute_TextInput7_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label7_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "ScaleY：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_TextInput7_i() : TextInput
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
         this._effectData.scaleY = Number(this.scaleYLabel.text);
         onChannge();
      }
      
      private function _SkillAttribute_HGroup8_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label8_c(),this._SkillAttribute_DropDownList1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label8_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "渲染：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.selectedIndex = 0;
         _loc1_.labelField = "name";
         _loc1_.width = 128;
         _loc1_.prompt = "GameActor";
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.setStyle("contentBackgroundAlpha",1);
         _loc1_.setStyle("focusColor",11711154);
         _loc1_.setStyle("rollOverColor",12237498);
         _loc1_.setStyle("selectionColor",9210772);
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
         this._effectData.blendMode = this.blendModeDrop.selectedItem.value;
         onChannge();
      }
      
      private function _SkillAttribute_HGroup9_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label9_c(),this._SkillAttribute_HSlider1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label9_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "旋转角度：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_HSlider1_i() : HSlider
      {
         var _loc1_:HSlider = new HSlider();
         _loc1_.width = 128;
         _loc1_.right = 5;
         _loc1_.minimum = 0;
         _loc1_.maximum = 360;
         _loc1_.addEventListener("change",this.__RLabel_change);
         _loc1_.id = "RLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.RLabel = _loc1_;
         BindingManager.executeBindings(this,"RLabel",this.RLabel);
         return _loc1_;
      }
      
      public function __RLabel_change(param1:Event) : void
      {
         this._effectData.rotation = int(this.RLabel.value);
         onChannge();
      }
      
      private function _SkillAttribute_HGroup10_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label10_c(),this._SkillAttribute_NumericStepper1_i(),this._SkillAttribute_Label11_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label10_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "物理伤害：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.right = 5;
         _loc1_.width = 112;
         _loc1_.minimum = 0;
         _loc1_.maximum = 9999;
         _loc1_.addEventListener("change",this.__wLabel_change);
         _loc1_.id = "wLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.wLabel = _loc1_;
         BindingManager.executeBindings(this,"wLabel",this.wLabel);
         return _loc1_;
      }
      
      public function __wLabel_change(param1:Event) : void
      {
         this._effectData.wFight = this.wLabel.value;
         onChannge();
      }
      
      private function _SkillAttribute_Label11_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "%";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_HGroup11_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label12_c(),this._SkillAttribute_NumericStepper2_i(),this._SkillAttribute_Label13_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label12_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "魔法伤害：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_NumericStepper2_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.right = 23;
         _loc1_.width = 112;
         _loc1_.minimum = 0;
         _loc1_.maximum = 9999;
         _loc1_.addEventListener("change",this.__mLabel_change);
         _loc1_.id = "mLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mLabel = _loc1_;
         BindingManager.executeBindings(this,"mLabel",this.mLabel);
         return _loc1_;
      }
      
      public function __mLabel_change(param1:Event) : void
      {
         this._effectData.mFight = this.mLabel.value;
         onChannge();
      }
      
      private function _SkillAttribute_Label13_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "%";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_HGroup12_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label14_c(),this._SkillAttribute_NumericStepper3_i(),this._SkillAttribute_Label15_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label14_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "击飞：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_NumericStepper3_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.right = 23;
         _loc1_.width = 112;
         _loc1_.minimum = -50;
         _loc1_.maximum = 50;
         _loc1_.addEventListener("change",this.__hitYLabel_change);
         _loc1_.id = "hitYLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitYLabel = _loc1_;
         BindingManager.executeBindings(this,"hitYLabel",this.hitYLabel);
         return _loc1_;
      }
      
      public function __hitYLabel_change(param1:Event) : void
      {
         this._effectData.hitY = this.hitYLabel.value;
         onChannge();
      }
      
      private function _SkillAttribute_Label15_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "px";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_HGroup13_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label16_c(),this._SkillAttribute_NumericStepper4_i(),this._SkillAttribute_Label17_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label16_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "击退：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_NumericStepper4_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.right = 23;
         _loc1_.width = 112;
         _loc1_.minimum = -50;
         _loc1_.maximum = 50;
         _loc1_.addEventListener("change",this.__hitXLabel_change);
         _loc1_.id = "hitXLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitXLabel = _loc1_;
         BindingManager.executeBindings(this,"hitXLabel",this.hitXLabel);
         return _loc1_;
      }
      
      public function __hitXLabel_change(param1:Event) : void
      {
         this._effectData.hitX = this.hitXLabel.value;
         onChannge();
      }
      
      private function _SkillAttribute_Label17_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "px";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_HGroup14_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label18_c(),this._SkillAttribute_NumericStepper5_i(),this._SkillAttribute_Label19_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label18_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "击中震动：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_NumericStepper5_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.right = 23;
         _loc1_.width = 112;
         _loc1_.minimum = 0;
         _loc1_.maximum = 999;
         _loc1_.addEventListener("change",this.__hitVibrationSize_change);
         _loc1_.id = "hitVibrationSize";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitVibrationSize = _loc1_;
         BindingManager.executeBindings(this,"hitVibrationSize",this.hitVibrationSize);
         return _loc1_;
      }
      
      public function __hitVibrationSize_change(param1:Event) : void
      {
         this._effectData.hitVibrationSize = this.hitVibrationSize.value;
         onChannge();
      }
      
      private function _SkillAttribute_Label19_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "px";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_HGroup15_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label20_c(),this._SkillAttribute_TextInput8_i(),this._SkillAttribute_Button1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label20_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "击中特效：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_TextInput8_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.right = 5;
         _loc1_.width = 100;
         _loc1_.addEventListener("change",this.__hitEffectName_change);
         _loc1_.id = "hitEffectName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitEffectName = _loc1_;
         BindingManager.executeBindings(this,"hitEffectName",this.hitEffectName);
         return _loc1_;
      }
      
      public function __hitEffectName_change(param1:TextOperationEvent) : void
      {
         this._effectData.hitEffectName = this.hitEffectName.text;
         onChannge();
      }
      
      private function _SkillAttribute_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "选择";
         _loc1_.width = 46;
         _loc1_.addEventListener("click",this.___SkillAttribute_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___SkillAttribute_Button1_click(param1:MouseEvent) : void
      {
         this.onSelectHitEffect(param1);
      }
      
      private function _SkillAttribute_HGroup16_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label21_c(),this._SkillAttribute_NumericStepper6_i(),this._SkillAttribute_Label22_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label21_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "卡帧：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_NumericStepper6_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.right = 23;
         _loc1_.width = 112;
         _loc1_.minimum = -50;
         _loc1_.maximum = 50;
         _loc1_.addEventListener("change",this.__cardFrameLabel_change);
         _loc1_.id = "cardFrameLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cardFrameLabel = _loc1_;
         BindingManager.executeBindings(this,"cardFrameLabel",this.cardFrameLabel);
         return _loc1_;
      }
      
      public function __cardFrameLabel_change(param1:Event) : void
      {
         this._effectData.cardFrame = this.cardFrameLabel.value;
         onChannge();
      }
      
      private function _SkillAttribute_Label22_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "fps";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_HGroup17_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label23_c(),this._SkillAttribute_NumericStepper7_i(),this._SkillAttribute_Label24_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label23_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "僵直：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_NumericStepper7_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.right = 23;
         _loc1_.width = 112;
         _loc1_.minimum = 0;
         _loc1_.maximum = 999;
         _loc1_.addEventListener("change",this.__rigidityLabel_change);
         _loc1_.id = "rigidityLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rigidityLabel = _loc1_;
         BindingManager.executeBindings(this,"rigidityLabel",this.rigidityLabel);
         return _loc1_;
      }
      
      public function __rigidityLabel_change(param1:Event) : void
      {
         this._effectData.stiff = this.rigidityLabel.value;
         onChannge();
      }
      
      private function _SkillAttribute_Label24_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "帧";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_HGroup18_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label25_c(),this._SkillAttribute_ColorPicker1_i(),this._SkillAttribute_Label26_c(),this._SkillAttribute_HSlider2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label25_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "颜色：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_ColorPicker1_i() : ColorPicker
      {
         var _loc1_:ColorPicker = new ColorPicker();
         _loc1_.addEventListener("change",this.__colorSelect_change);
         _loc1_.id = "colorSelect";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorSelect = _loc1_;
         BindingManager.executeBindings(this,"colorSelect",this.colorSelect);
         return _loc1_;
      }
      
      public function __colorSelect_change(param1:ColorPickerEvent) : void
      {
         this._effectData.addColor = uint(this.colorSelect.value);
         onChannge();
      }
      
      private function _SkillAttribute_Label26_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "强度：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_HSlider2_i() : HSlider
      {
         var _loc1_:HSlider = new HSlider();
         _loc1_.minimum = 0;
         _loc1_.maximum = 100;
         _loc1_.value = 50;
         _loc1_.addEventListener("change",this.__colorInt_change);
         _loc1_.id = "colorInt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorInt = _loc1_;
         BindingManager.executeBindings(this,"colorInt",this.colorInt);
         return _loc1_;
      }
      
      public function __colorInt_change(param1:Event) : void
      {
         this._effectData.intensity = (100 - this.colorInt.value) / 100;
         onChannge();
      }
      
      private function _SkillAttribute_HGroup19_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_Label27_c(),this._SkillAttribute_NumericStepper8_i(),this._SkillAttribute_Label28_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label27_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "持续时间：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_NumericStepper8_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.right = 23;
         _loc1_.width = 112;
         _loc1_.minimum = 0;
         _loc1_.maximum = 999;
         _loc1_.addEventListener("change",this.__liveLabel_change);
         _loc1_.id = "liveLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.liveLabel = _loc1_;
         BindingManager.executeBindings(this,"liveLabel",this.liveLabel);
         return _loc1_;
      }
      
      public function __liveLabel_change(param1:Event) : void
      {
         this._effectData.time = this.liveLabel.value;
         onChannge();
      }
      
      private function _SkillAttribute_Label28_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "帧";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "left";
         _loc1_.width = 170;
         _loc1_.mxmlContent = [this._SkillAttribute_Label29_c(),this._SkillAttribute_MoveAttribute1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_Label29_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "位移方式：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_MoveAttribute1_i() : MoveAttribute
      {
         var _loc1_:MoveAttribute = new MoveAttribute();
         _loc1_.height = 100;
         _loc1_.id = "moveAttr";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.moveAttr = _loc1_;
         BindingManager.executeBindings(this,"moveAttr",this.moveAttr);
         return _loc1_;
      }
      
      private function _SkillAttribute_HGroup20_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_CheckBox1_i(),this._SkillAttribute_CheckBox2_i(),this._SkillAttribute_CheckBox3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_CheckBox1_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "击中消失";
         _loc1_.addEventListener("change",this.__ablow_change);
         _loc1_.id = "ablow";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ablow = _loc1_;
         BindingManager.executeBindings(this,"ablow",this.ablow);
         return _loc1_;
      }
      
      public function __ablow_change(param1:Event) : void
      {
         this._effectData.isABlow = this.ablow.selected;
         onChannge();
      }
      
      private function _SkillAttribute_CheckBox2_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "锁定动作";
         _loc1_.addEventListener("change",this.__isLock_change);
         _loc1_.id = "isLock";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.isLock = _loc1_;
         BindingManager.executeBindings(this,"isLock",this.isLock);
         return _loc1_;
      }
      
      public function __isLock_change(param1:Event) : void
      {
         this._effectData.isLockActionShow = this.isLock.selected;
         onChannge();
      }
      
      private function _SkillAttribute_CheckBox3_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "射击";
         _loc1_.addEventListener("change",this.__isLaunch_change);
         _loc1_.id = "isLaunch";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.isLaunch = _loc1_;
         BindingManager.executeBindings(this,"isLaunch",this.isLaunch);
         return _loc1_;
      }
      
      public function __isLaunch_change(param1:Event) : void
      {
         this._effectData.isLaunch = this.isLaunch.selected;
         onChannge();
      }
      
      private function _SkillAttribute_HGroup21_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_CheckBox4_i(),this._SkillAttribute_CheckBox5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_CheckBox4_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "无伤害";
         _loc1_.addEventListener("change",this.__unhit_change);
         _loc1_.id = "unhit";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.unhit = _loc1_;
         BindingManager.executeBindings(this,"unhit",this.unhit);
         return _loc1_;
      }
      
      public function __unhit_change(param1:Event) : void
      {
         this._effectData.unhit = this.unhit.selected;
         onChannge();
      }
      
      private function _SkillAttribute_CheckBox5_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "置底部";
         _loc1_.addEventListener("change",this.__atbottom_change);
         _loc1_.id = "atbottom";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.atbottom = _loc1_;
         BindingManager.executeBindings(this,"atbottom",this.atbottom);
         return _loc1_;
      }
      
      public function __atbottom_change(param1:Event) : void
      {
         this._effectData.atbottom = this.atbottom.selected;
         onChannge();
      }
      
      private function _SkillAttribute_Label30_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "- 碰撞设置 -";
         _loc1_.width = 200;
         _loc1_.horizontalCenter = "left";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_HGroup22_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_CheckBox6_i(),this._SkillAttribute_CheckBox7_i(),this._SkillAttribute_CheckBox8_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_CheckBox6_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "允许碰撞";
         _loc1_.addEventListener("change",this.__canhit_change);
         _loc1_.id = "canhit";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.canhit = _loc1_;
         BindingManager.executeBindings(this,"canhit",this.canhit);
         return _loc1_;
      }
      
      public function __canhit_change(param1:Event) : void
      {
         this._effectData.canHit = this.canhit.selected;
         onChannge();
      }
      
      private function _SkillAttribute_CheckBox7_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "允许穿透";
         _loc1_.addEventListener("change",this.__cantou_change);
         _loc1_.id = "cantou";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cantou = _loc1_;
         BindingManager.executeBindings(this,"cantou",this.cantou);
         return _loc1_;
      }
      
      public function __cantou_change(param1:Event) : void
      {
         this._effectData.through = this.cantou.selected;
         onChannge();
      }
      
      private function _SkillAttribute_CheckBox8_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "碰撞地图";
         _loc1_.addEventListener("change",this.__canhitmap_change);
         _loc1_.id = "canhitmap";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.canhitmap = _loc1_;
         BindingManager.executeBindings(this,"canhitmap",this.canhitmap);
         return _loc1_;
      }
      
      public function __canhitmap_change(param1:Event) : void
      {
         this._effectData.hitMap = this.canhitmap.selected;
         onChannge();
      }
      
      private function _SkillAttribute_Label31_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "- 动画过渡 -";
         _loc1_.width = 200;
         _loc1_.horizontalCenter = "left";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_HGroup23_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SkillAttribute_CheckBox9_i(),this._SkillAttribute_CheckBox10_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SkillAttribute_CheckBox9_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "淡入";
         _loc1_.addEventListener("change",this.__fadeIn_change);
         _loc1_.id = "fadeIn";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fadeIn = _loc1_;
         BindingManager.executeBindings(this,"fadeIn",this.fadeIn);
         return _loc1_;
      }
      
      public function __fadeIn_change(param1:Event) : void
      {
         this._effectData.fadeIn = this.fadeIn.selected;
         onChannge();
      }
      
      private function _SkillAttribute_CheckBox10_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "淡出";
         _loc1_.addEventListener("change",this.__fadeOut_change);
         _loc1_.id = "fadeOut";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fadeOut = _loc1_;
         BindingManager.executeBindings(this,"fadeOut",this.fadeOut);
         return _loc1_;
      }
      
      public function __fadeOut_change(param1:Event) : void
      {
         this._effectData.fadeOut = this.fadeOut.selected;
         onChannge();
      }
      
      private function _SkillAttribute_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"blendModeDrop.dataProvider","blends");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get RLabel() : HSlider
      {
         return this._1874202174RLabel;
      }
      
      public function set RLabel(param1:HSlider) : void
      {
         var _loc2_:Object = this._1874202174RLabel;
         if(_loc2_ !== param1)
         {
            this._1874202174RLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"RLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ablow() : CheckBox
      {
         return this._92608403ablow;
      }
      
      public function set ablow(param1:CheckBox) : void
      {
         var _loc2_:Object = this._92608403ablow;
         if(_loc2_ !== param1)
         {
            this._92608403ablow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ablow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get atbottom() : CheckBox
      {
         return this._36860958atbottom;
      }
      
      public function set atbottom(param1:CheckBox) : void
      {
         var _loc2_:Object = this._36860958atbottom;
         if(_loc2_ !== param1)
         {
            this._36860958atbottom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"atbottom",_loc2_,param1));
            }
         }
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
      public function get canhit() : CheckBox
      {
         return this._1367719485canhit;
      }
      
      public function set canhit(param1:CheckBox) : void
      {
         var _loc2_:Object = this._1367719485canhit;
         if(_loc2_ !== param1)
         {
            this._1367719485canhit = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"canhit",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get canhitmap() : CheckBox
      {
         return this._623667385canhitmap;
      }
      
      public function set canhitmap(param1:CheckBox) : void
      {
         var _loc2_:Object = this._623667385canhitmap;
         if(_loc2_ !== param1)
         {
            this._623667385canhitmap = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"canhitmap",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cantou() : CheckBox
      {
         return this._1367707766cantou;
      }
      
      public function set cantou(param1:CheckBox) : void
      {
         var _loc2_:Object = this._1367707766cantou;
         if(_loc2_ !== param1)
         {
            this._1367707766cantou = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cantou",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cardFrameLabel() : NumericStepper
      {
         return this._1267104585cardFrameLabel;
      }
      
      public function set cardFrameLabel(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1267104585cardFrameLabel;
         if(_loc2_ !== param1)
         {
            this._1267104585cardFrameLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cardFrameLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get classLabel() : TextInput
      {
         return this._308408228classLabel;
      }
      
      public function set classLabel(param1:TextInput) : void
      {
         var _loc2_:Object = this._308408228classLabel;
         if(_loc2_ !== param1)
         {
            this._308408228classLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"classLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get colorInt() : HSlider
      {
         return this._628846196colorInt;
      }
      
      public function set colorInt(param1:HSlider) : void
      {
         var _loc2_:Object = this._628846196colorInt;
         if(_loc2_ !== param1)
         {
            this._628846196colorInt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorInt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get colorSelect() : ColorPicker
      {
         return this._968161855colorSelect;
      }
      
      public function set colorSelect(param1:ColorPicker) : void
      {
         var _loc2_:Object = this._968161855colorSelect;
         if(_loc2_ !== param1)
         {
            this._968161855colorSelect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorSelect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fadeIn() : CheckBox
      {
         return this._1282133823fadeIn;
      }
      
      public function set fadeIn(param1:CheckBox) : void
      {
         var _loc2_:Object = this._1282133823fadeIn;
         if(_loc2_ !== param1)
         {
            this._1282133823fadeIn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeIn",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fadeOut() : CheckBox
      {
         return this._1091436750fadeOut;
      }
      
      public function set fadeOut(param1:CheckBox) : void
      {
         var _loc2_:Object = this._1091436750fadeOut;
         if(_loc2_ !== param1)
         {
            this._1091436750fadeOut = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeOut",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hitEffectName() : TextInput
      {
         return this._1640811439hitEffectName;
      }
      
      public function set hitEffectName(param1:TextInput) : void
      {
         var _loc2_:Object = this._1640811439hitEffectName;
         if(_loc2_ !== param1)
         {
            this._1640811439hitEffectName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hitEffectName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hitVibrationSize() : NumericStepper
      {
         return this._1662652192hitVibrationSize;
      }
      
      public function set hitVibrationSize(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1662652192hitVibrationSize;
         if(_loc2_ !== param1)
         {
            this._1662652192hitVibrationSize = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hitVibrationSize",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hitXLabel() : NumericStepper
      {
         return this._1778540239hitXLabel;
      }
      
      public function set hitXLabel(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1778540239hitXLabel;
         if(_loc2_ !== param1)
         {
            this._1778540239hitXLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hitXLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hitYLabel() : NumericStepper
      {
         return this._1807169390hitYLabel;
      }
      
      public function set hitYLabel(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1807169390hitYLabel;
         if(_loc2_ !== param1)
         {
            this._1807169390hitYLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hitYLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iName() : TextInput
      {
         return this._99390100iName;
      }
      
      public function set iName(param1:TextInput) : void
      {
         var _loc2_:Object = this._99390100iName;
         if(_loc2_ !== param1)
         {
            this._99390100iName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isLaunch() : CheckBox
      {
         return this._435808899isLaunch;
      }
      
      public function set isLaunch(param1:CheckBox) : void
      {
         var _loc2_:Object = this._435808899isLaunch;
         if(_loc2_ !== param1)
         {
            this._435808899isLaunch = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isLaunch",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isLock() : CheckBox
      {
         return this._1180327563isLock;
      }
      
      public function set isLock(param1:CheckBox) : void
      {
         var _loc2_:Object = this._1180327563isLock;
         if(_loc2_ !== param1)
         {
            this._1180327563isLock = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isLock",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get liveLabel() : NumericStepper
      {
         return this._990876008liveLabel;
      }
      
      public function set liveLabel(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._990876008liveLabel;
         if(_loc2_ !== param1)
         {
            this._990876008liveLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"liveLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mLabel() : NumericStepper
      {
         return this._1101215097mLabel;
      }
      
      public function set mLabel(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1101215097mLabel;
         if(_loc2_ !== param1)
         {
            this._1101215097mLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get moveAttr() : MoveAttribute
      {
         return this._104973982moveAttr;
      }
      
      public function set moveAttr(param1:MoveAttribute) : void
      {
         var _loc2_:Object = this._104973982moveAttr;
         if(_loc2_ !== param1)
         {
            this._104973982moveAttr = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moveAttr",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rigidityLabel() : NumericStepper
      {
         return this._912680431rigidityLabel;
      }
      
      public function set rigidityLabel(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._912680431rigidityLabel;
         if(_loc2_ !== param1)
         {
            this._912680431rigidityLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rigidityLabel",_loc2_,param1));
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
      public function get unhit() : CheckBox
      {
         return this._111432282unhit;
      }
      
      public function set unhit(param1:CheckBox) : void
      {
         var _loc2_:Object = this._111432282unhit;
         if(_loc2_ !== param1)
         {
            this._111432282unhit = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"unhit",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get wLabel() : NumericStepper
      {
         return this._814923587wLabel;
      }
      
      public function set wLabel(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._814923587wLabel;
         if(_loc2_ !== param1)
         {
            this._814923587wLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wLabel",_loc2_,param1));
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

