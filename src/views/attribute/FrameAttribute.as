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
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal; //
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.BorderContainer;
   import spark.components.Button;
   import spark.components.CheckBox;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.NumericStepper;
   import spark.components.RadioButtonGroup;
   import spark.components.Scroller;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.events.TextOperationEvent;
   import spark.layouts.VerticalLayout;
   import views.SelectElementView;
   import views.observe.role.frame.Frame;
   
   public class FrameAttribute extends RefAttribute
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      private var _1267104585cardFrameLabel:NumericStepper;
      
      private var _1040372209effLabel:NumericStepper;
      
      private var _1240337143golden:TextInput;
      
      private var _926343204hitAttr:Scroller;
      
      private var _1640811439hitEffectName:TextInput;
      
      private var _65313144hitInterval:NumericStepper;
      
      private var _926716198hitNext:CheckBox;
      
      private var _1778540239hitXLabel:NumericStepper;
      
      private var _1807169390hitYLabel:NumericStepper;
      
      private var _1106512989mFight:NumericStepper;
      
      private var _1368601161mapVibrationSize:NumericStepper;
      
      private var _1368571773mapVibrationTime:NumericStepper;
      
      private var _1174236830radioBtnGroup:RadioButtonGroup;
      
      private var _912680431rigidityLabel:NumericStepper;
      
      private var _1812686790soundName:TextInput;
      
      private var _1714632213stopNext:CheckBox;
      
      private var _3571837turn:CheckBox;
      
      private var _1769558605vibrationSize:NumericStepper;
      
      private var _820221479wFight:NumericStepper;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _frame:Frame;
      
      public function FrameAttribute()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._FrameAttribute_Array1_c);
         this._FrameAttribute_RadioButtonGroup1_i();
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
            this.color = 0;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function setFrame(param1:Frame) : void
      {
         var frame:Frame = param1;
         this._frame = frame;
         callLater(function():void
         {
            soundName.text = _frame.soundName;
            hitNext.selected = _frame.isHitMapGoOn;
            stopNext.selected = _frame.isStop;
            golden.text = String(_frame.golden);
            hitYLabel.value = _frame.hitY;
            hitXLabel.value = _frame.hitX;
            rigidityLabel.value = _frame.straight;
            effLabel.value = _frame.hitEffect;
            hitInterval.value = _frame.hitInterval;
            mFight.value = _frame.mFight;
            wFight.value = _frame.wFight;
            cardFrameLabel.value = _frame.cardFrame;
            mapVibrationSize.value = _frame.mapVibrationSize;
            mapVibrationTime.value = _frame.mapVibrationTime;
            vibrationSize.value = _frame.vibrationSize;
            turn.selected = _frame.turn == 1 ? Boolean(1) : Boolean(0);
            hitEffectName.text = _frame.hitEffectName;
         });
      }
      
      override public function onChannge() : void
      {
         if(!this._frame)
         {
            return;
         }
         super.onChannge();
         this._frame.isHitMapGoOn = this.hitNext.selected;
         this._frame.soundName = this.soundName.text;
         this._frame.isStop = this.stopNext.selected;
         this._frame.golden = Number(this.golden.text);
         this._frame.turn = this.turn.selected ? 1 : 0;
         this._frame.hitEffectName = this.hitEffectName.text;
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
            onChannge();
         };
      }
      
      protected function onSoundSelect(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         var select:SelectElementView = new SelectElementView();
         select.findDir = "sound";
         select.extension = "mp3";
         select.title = "添加音效";
         select.callFunc = function(param1:File):void
         {
            var _loc2_:String = param1.nativePath.substr(param1.nativePath.lastIndexOf("sound") + 6);
            if(_loc2_.indexOf("\\") != -1)
            {
               _loc2_ = _loc2_.split("\\").join("/");
            }
            soundName.text = _loc2_.substr(0,_loc2_.lastIndexOf("."));
            onChannge();
         };
         PopUpManager.addPopUp(select,this,true);
      }
      
      private function _FrameAttribute_RadioButtonGroup1_i() : RadioButtonGroup
      {
         var _loc1_:RadioButtonGroup = new RadioButtonGroup();
         _loc1_.initialized(this,"radioBtnGroup");
         this.radioBtnGroup = _loc1_;
         BindingManager.executeBindings(this,"radioBtnGroup",this.radioBtnGroup);
         return _loc1_;
      }
      
      private function _FrameAttribute_Array1_c() : Array
      {
         return [this._FrameAttribute_BorderContainer1_c()];
      }
      
      private function _FrameAttribute_BorderContainer1_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._FrameAttribute_Array2_c);
         _loc1_.setStyle("backgroundAlpha",0.5);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Array2_c() : Array
      {
         return [this._FrameAttribute_VGroup1_c()];
      }
      
      private function _FrameAttribute_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._FrameAttribute_Scroller1_c(),this._FrameAttribute_Scroller2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.height = 120;
         _loc1_.viewport = this._FrameAttribute_Group1_c();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._FrameAttribute_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.layout = this._FrameAttribute_VerticalLayout1_c();
         _loc1_.mxmlContent = [this._FrameAttribute_HGroup1_c(),this._FrameAttribute_HGroup2_c(),this._FrameAttribute_HGroup3_c(),this._FrameAttribute_HGroup4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.horizontalAlign = "right";
         _loc1_.verticalAlign = "top";
         return _loc1_;
      }
      
      private function _FrameAttribute_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_Label1_c(),this._FrameAttribute_TextInput1_i(),this._FrameAttribute_Button1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "音效：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.width = 100;
         _loc1_.addEventListener("change",this.__soundName_change);
         _loc1_.id = "soundName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundName = _loc1_;
         BindingManager.executeBindings(this,"soundName",this.soundName);
         return _loc1_;
      }
      
      public function __soundName_change(param1:TextOperationEvent) : void
      {
         this.onChannge();
      }
      
      private function _FrameAttribute_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "选择";
         _loc1_.addEventListener("click",this.___FrameAttribute_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___FrameAttribute_Button1_click(param1:MouseEvent) : void
      {
         this.onSoundSelect(param1);
      }
      
      private function _FrameAttribute_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_Label2_c(),this._FrameAttribute_TextInput2_i(),this._FrameAttribute_Label3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "霸体生效";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.width = 100;
         _loc1_.addEventListener("change",this.__golden_change);
         _loc1_.id = "golden";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.golden = _loc1_;
         BindingManager.executeBindings(this,"golden",this.golden);
         return _loc1_;
      }
      
      public function __golden_change(param1:TextOperationEvent) : void
      {
         this.onChannge();
      }
      
      private function _FrameAttribute_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "秒";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_CheckBox1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_CheckBox1_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "碰到地面继续下一帧";
         _loc1_.addEventListener("change",this.__hitNext_change);
         _loc1_.id = "hitNext";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitNext = _loc1_;
         BindingManager.executeBindings(this,"hitNext",this.hitNext);
         return _loc1_;
      }
      
      public function __hitNext_change(param1:Event) : void
      {
         this.onChannge();
      }
      
      private function _FrameAttribute_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_CheckBox2_i(),this._FrameAttribute_CheckBox3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_CheckBox2_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "转向";
         _loc1_.addEventListener("change",this.__turn_change);
         _loc1_.id = "turn";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.turn = _loc1_;
         BindingManager.executeBindings(this,"turn",this.turn);
         return _loc1_;
      }
      
      public function __turn_change(param1:Event) : void
      {
         this.onChannge();
      }
      
      private function _FrameAttribute_CheckBox3_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "停顿";
         _loc1_.addEventListener("change",this.__stopNext_change);
         _loc1_.id = "stopNext";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.stopNext = _loc1_;
         BindingManager.executeBindings(this,"stopNext",this.stopNext);
         return _loc1_;
      }
      
      public function __stopNext_change(param1:Event) : void
      {
         this.onChannge();
      }
      
      private function _FrameAttribute_Scroller2_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._FrameAttribute_Group3_c();
         _loc1_.id = "hitAttr";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitAttr = _loc1_;
         BindingManager.executeBindings(this,"hitAttr",this.hitAttr);
         return _loc1_;
      }
      
      private function _FrameAttribute_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._FrameAttribute_Group4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.layout = this._FrameAttribute_VerticalLayout2_c();
         _loc1_.mxmlContent = [this._FrameAttribute_HGroup5_c(),this._FrameAttribute_HGroup6_c(),this._FrameAttribute_HGroup7_c(),this._FrameAttribute_HGroup8_c(),this._FrameAttribute_HGroup9_c(),this._FrameAttribute_HGroup10_c(),this._FrameAttribute_HGroup11_c(),this._FrameAttribute_HGroup12_c(),this._FrameAttribute_HGroup13_c(),this._FrameAttribute_HGroup14_c(),this._FrameAttribute_HGroup15_c(),this._FrameAttribute_HGroup16_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_VerticalLayout2_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.horizontalAlign = "right";
         _loc1_.verticalAlign = "top";
         return _loc1_;
      }
      
      private function _FrameAttribute_HGroup5_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_Label4_c(),this._FrameAttribute_NumericStepper1_i(),this._FrameAttribute_Label5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Label4_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "攻击间隔：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.width = 100;
         _loc1_.addEventListener("change",this.__hitInterval_change);
         _loc1_.id = "hitInterval";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitInterval = _loc1_;
         BindingManager.executeBindings(this,"hitInterval",this.hitInterval);
         return _loc1_;
      }
      
      public function __hitInterval_change(param1:Event) : void
      {
         this._frame.hitInterval = this.hitInterval.value;
         this.onChannge();
      }
      
      private function _FrameAttribute_Label5_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "帧";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_HGroup6_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_Label6_c(),this._FrameAttribute_NumericStepper2_i(),this._FrameAttribute_Label7_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Label6_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "有效帧长：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_NumericStepper2_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.width = 100;
         _loc1_.maximum = 100;
         _loc1_.addEventListener("change",this.__effLabel_change);
         _loc1_.id = "effLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.effLabel = _loc1_;
         BindingManager.executeBindings(this,"effLabel",this.effLabel);
         return _loc1_;
      }
      
      public function __effLabel_change(param1:Event) : void
      {
         this._frame.hitEffect = this.effLabel.value;
         this.onChannge();
      }
      
      private function _FrameAttribute_Label7_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "帧";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_HGroup7_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_Label8_c(),this._FrameAttribute_NumericStepper3_i(),this._FrameAttribute_Label9_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Label8_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "物理伤害：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_NumericStepper3_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.width = 100;
         _loc1_.maximum = 9999;
         _loc1_.addEventListener("change",this.__wFight_change);
         _loc1_.id = "wFight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.wFight = _loc1_;
         BindingManager.executeBindings(this,"wFight",this.wFight);
         return _loc1_;
      }
      
      public function __wFight_change(param1:Event) : void
      {
         this._frame.wFight = this.wFight.value;
         this.onChannge();
      }
      
      private function _FrameAttribute_Label9_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "%";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_HGroup8_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_Label10_c(),this._FrameAttribute_NumericStepper4_i(),this._FrameAttribute_Label11_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Label10_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "魔法伤害：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_NumericStepper4_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.width = 100;
         _loc1_.maximum = 9999;
         _loc1_.addEventListener("change",this.__mFight_change);
         _loc1_.id = "mFight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mFight = _loc1_;
         BindingManager.executeBindings(this,"mFight",this.mFight);
         return _loc1_;
      }
      
      public function __mFight_change(param1:Event) : void
      {
         this._frame.mFight = this.mFight.value;
         this.onChannge();
      }
      
      private function _FrameAttribute_Label11_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "%";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_HGroup9_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_Label12_c(),this._FrameAttribute_NumericStepper5_i(),this._FrameAttribute_Label13_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Label12_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "击飞：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_NumericStepper5_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.right = 23;
         _loc1_.width = 100;
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
         this._frame.hitY = this.hitYLabel.value;
         this.onChannge();
      }
      
      private function _FrameAttribute_Label13_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "px";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_HGroup10_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_Label14_c(),this._FrameAttribute_NumericStepper6_i(),this._FrameAttribute_Label15_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Label14_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "击退：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_NumericStepper6_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.right = 23;
         _loc1_.width = 100;
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
         this._frame.hitX = this.hitXLabel.value;
         this.onChannge();
      }
      
      private function _FrameAttribute_Label15_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "px";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_HGroup11_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_Label16_c(),this._FrameAttribute_NumericStepper7_i(),this._FrameAttribute_Label17_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Label16_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "僵直：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_NumericStepper7_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.right = 23;
         _loc1_.width = 100;
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
         this._frame.straight = this.rigidityLabel.value;
         this.onChannge();
      }
      
      private function _FrameAttribute_Label17_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "帧";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_HGroup12_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_Label18_c(),this._FrameAttribute_NumericStepper8_i(),this._FrameAttribute_Label19_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Label18_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "卡帧：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_NumericStepper8_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.right = 23;
         _loc1_.width = 100;
         _loc1_.minimum = 0;
         _loc1_.maximum = 999;
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
         this._frame.cardFrame = this.cardFrameLabel.value;
         this.onChannge();
      }
      
      private function _FrameAttribute_Label19_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "帧";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_HGroup13_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_Label20_c(),this._FrameAttribute_TextInput3_i(),this._FrameAttribute_Button2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Label20_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "击中特效：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_TextInput3_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.right = 23;
         _loc1_.width = 90;
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
         this._frame.hitEffectName = this.hitEffectName.text;
         this.onChannge();
      }
      
      private function _FrameAttribute_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "选择";
         _loc1_.width = 46;
         _loc1_.addEventListener("click",this.___FrameAttribute_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___FrameAttribute_Button2_click(param1:MouseEvent) : void
      {
         this.onSelectHitEffect(param1);
      }
      
      private function _FrameAttribute_HGroup14_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_Label21_c(),this._FrameAttribute_NumericStepper9_i(),this._FrameAttribute_Label22_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Label21_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "击中震动幅度：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_NumericStepper9_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.right = 23;
         _loc1_.width = 100;
         _loc1_.minimum = 0;
         _loc1_.maximum = 999;
         _loc1_.addEventListener("change",this.__vibrationSize_change);
         _loc1_.id = "vibrationSize";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.vibrationSize = _loc1_;
         BindingManager.executeBindings(this,"vibrationSize",this.vibrationSize);
         return _loc1_;
      }
      
      public function __vibrationSize_change(param1:Event) : void
      {
         this._frame.vibrationSize = this.vibrationSize.value;
         this.onChannge();
      }
      
      private function _FrameAttribute_Label22_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "帧";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_HGroup15_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_Label23_c(),this._FrameAttribute_NumericStepper10_i(),this._FrameAttribute_Label24_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Label23_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "环境震动时长：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_NumericStepper10_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.right = 23;
         _loc1_.width = 100;
         _loc1_.minimum = 0;
         _loc1_.maximum = 999;
         _loc1_.addEventListener("change",this.__mapVibrationTime_change);
         _loc1_.id = "mapVibrationTime";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mapVibrationTime = _loc1_;
         BindingManager.executeBindings(this,"mapVibrationTime",this.mapVibrationTime);
         return _loc1_;
      }
      
      public function __mapVibrationTime_change(param1:Event) : void
      {
         this._frame.mapVibrationTime = this.mapVibrationTime.value;
         this.onChannge();
      }
      
      private function _FrameAttribute_Label24_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "帧";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_HGroup16_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._FrameAttribute_Label25_c(),this._FrameAttribute_NumericStepper11_i(),this._FrameAttribute_Label26_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_Label25_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "环境震动幅度：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FrameAttribute_NumericStepper11_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.right = 23;
         _loc1_.width = 100;
         _loc1_.minimum = 0;
         _loc1_.maximum = 999;
         _loc1_.addEventListener("change",this.__mapVibrationSize_change);
         _loc1_.id = "mapVibrationSize";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mapVibrationSize = _loc1_;
         BindingManager.executeBindings(this,"mapVibrationSize",this.mapVibrationSize);
         return _loc1_;
      }
      
      public function __mapVibrationSize_change(param1:Event) : void
      {
         this._frame.mapVibrationSize = this.mapVibrationSize.value;
         this.onChannge();
      }
      
      private function _FrameAttribute_Label26_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "帧";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
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
      public function get effLabel() : NumericStepper
      {
         return this._1040372209effLabel;
      }
      
      public function set effLabel(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1040372209effLabel;
         if(_loc2_ !== param1)
         {
            this._1040372209effLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get golden() : TextInput
      {
         return this._1240337143golden;
      }
      
      public function set golden(param1:TextInput) : void
      {
         var _loc2_:Object = this._1240337143golden;
         if(_loc2_ !== param1)
         {
            this._1240337143golden = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"golden",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hitAttr() : Scroller
      {
         return this._926343204hitAttr;
      }
      
      public function set hitAttr(param1:Scroller) : void
      {
         var _loc2_:Object = this._926343204hitAttr;
         if(_loc2_ !== param1)
         {
            this._926343204hitAttr = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hitAttr",_loc2_,param1));
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
      public function get hitInterval() : NumericStepper
      {
         return this._65313144hitInterval;
      }
      
      public function set hitInterval(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._65313144hitInterval;
         if(_loc2_ !== param1)
         {
            this._65313144hitInterval = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hitInterval",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hitNext() : CheckBox
      {
         return this._926716198hitNext;
      }
      
      public function set hitNext(param1:CheckBox) : void
      {
         var _loc2_:Object = this._926716198hitNext;
         if(_loc2_ !== param1)
         {
            this._926716198hitNext = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hitNext",_loc2_,param1));
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
      public function get mFight() : NumericStepper
      {
         return this._1106512989mFight;
      }
      
      public function set mFight(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1106512989mFight;
         if(_loc2_ !== param1)
         {
            this._1106512989mFight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mFight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mapVibrationSize() : NumericStepper
      {
         return this._1368601161mapVibrationSize;
      }
      
      public function set mapVibrationSize(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1368601161mapVibrationSize;
         if(_loc2_ !== param1)
         {
            this._1368601161mapVibrationSize = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mapVibrationSize",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mapVibrationTime() : NumericStepper
      {
         return this._1368571773mapVibrationTime;
      }
      
      public function set mapVibrationTime(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1368571773mapVibrationTime;
         if(_loc2_ !== param1)
         {
            this._1368571773mapVibrationTime = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mapVibrationTime",_loc2_,param1));
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
      public function get soundName() : TextInput
      {
         return this._1812686790soundName;
      }
      
      public function set soundName(param1:TextInput) : void
      {
         var _loc2_:Object = this._1812686790soundName;
         if(_loc2_ !== param1)
         {
            this._1812686790soundName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get stopNext() : CheckBox
      {
         return this._1714632213stopNext;
      }
      
      public function set stopNext(param1:CheckBox) : void
      {
         var _loc2_:Object = this._1714632213stopNext;
         if(_loc2_ !== param1)
         {
            this._1714632213stopNext = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stopNext",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get turn() : CheckBox
      {
         return this._3571837turn;
      }
      
      public function set turn(param1:CheckBox) : void
      {
         var _loc2_:Object = this._3571837turn;
         if(_loc2_ !== param1)
         {
            this._3571837turn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"turn",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get vibrationSize() : NumericStepper
      {
         return this._1769558605vibrationSize;
      }
      
      public function set vibrationSize(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1769558605vibrationSize;
         if(_loc2_ !== param1)
         {
            this._1769558605vibrationSize = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"vibrationSize",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get wFight() : NumericStepper
      {
         return this._820221479wFight;
      }
      
      public function set wFight(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._820221479wFight;
         if(_loc2_ !== param1)
         {
            this._820221479wFight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wFight",_loc2_,param1));
            }
         }
      }
   }
}

