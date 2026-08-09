package views.attribute
{
   import events.OpenEvent;
   import flash.events.Event;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal; //
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.RadioButton;
   import spark.components.Scroller;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.events.TextOperationEvent;
   import spark.layouts.VerticalLayout;
   import tmx.EventSprite;
   
   public class EventAttribute extends RefAttribute
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      private var _445506051allSelect:RadioButton;
      
      private var _1050436083heightLabel:TextInput;
      
      private var _99390100iName:TextInput;
      
      private var _923962893mapTarget:TextInput;
      
      private var _1587997442oneSelect:RadioButton;
      
      private var _779249193timeSelect:RadioButton;
      
      private var _3641992warp:RadioButton;
      
      private var _1208686023warpTarget:TextInput;
      
      private var _1605235506widthLabel:TextInput;
      
      private var _786294436xLabel:TextInput;
      
      private var _757665285yLabel:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _eventSprite:EventSprite;
      
      public function EventAttribute()
      {
         super();
         mx_internal::_document = this;
         this.width = 400;
         this.height = 300;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._EventAttribute_Array1_c);
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
      
      public function setEventSprite(param1:EventSprite) : void
      {
         var eventSpr:EventSprite = param1;
         this._eventSprite = eventSpr;
         callLater(function():void
         {
            iName.text = _eventSprite.instanceName;
            xLabel.text = _eventSprite.x.toString();
            yLabel.text = _eventSprite.y.toString();
            widthLabel.text = _eventSprite.width.toString();
            heightLabel.text = _eventSprite.height.toString();
            mapTarget.text = _eventSprite.go;
            warpTarget.text = _eventSprite.to;
            switch(_eventSprite.type)
            {
               case EventSprite.ONEC_EVENT:
                  oneSelect.selected = true;
                  break;
               case EventSprite.REPEAT_EVENT:
                  allSelect.selected = true;
                  break;
               case EventSprite.TIME_EVENT:
                  timeSelect.selected = true;
                  break;
               case EventSprite.WARP_EVENT:
                  warp.selected = true;
            }
         });
      }
      
      private function onChange() : void
      {
         this.dispatchEvent(new OpenEvent(OpenEvent.CHANGE,null));
         if(this.oneSelect.selected)
         {
            this._eventSprite.type = EventSprite.ONEC_EVENT;
         }
         else if(this.allSelect.selected)
         {
            this._eventSprite.type = EventSprite.REPEAT_EVENT;
         }
         else if(this.warp.selected)
         {
            this._eventSprite.type = EventSprite.WARP_EVENT;
         }
         else if(this.timeSelect.selected)
         {
            this._eventSprite.type = EventSprite.TIME_EVENT;
         }
         this._eventSprite.go = this.mapTarget.text;
         this._eventSprite.to = this.warpTarget.text;
      }
      
      private function _EventAttribute_Array1_c() : Array
      {
         return [this._EventAttribute_Scroller1_c()];
      }
      
      private function _EventAttribute_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._EventAttribute_Group1_c();
         _loc1_.setStyle("color",0);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._EventAttribute_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.layout = this._EventAttribute_VerticalLayout1_c();
         _loc1_.mxmlContent = [this._EventAttribute_HGroup1_c(),this._EventAttribute_HGroup2_c(),this._EventAttribute_HGroup3_c(),this._EventAttribute_HGroup4_c(),this._EventAttribute_HGroup5_c(),this._EventAttribute_VGroup1_c(),this._EventAttribute_VGroup2_c()];
         _loc1_.setStyle("color",0);
         _loc1_.setStyle("contentBackgroundColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.horizontalAlign = "right";
         _loc1_.verticalAlign = "top";
         return _loc1_;
      }
      
      private function _EventAttribute_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._EventAttribute_Label1_c(),this._EventAttribute_TextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "实例名称：";
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_TextInput1_i() : TextInput
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
         this._eventSprite.instanceName = this.iName.text;
         this.onChange();
      }
      
      private function _EventAttribute_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._EventAttribute_Label2_c(),this._EventAttribute_TextInput2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "X：";
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_TextInput2_i() : TextInput
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
         this._eventSprite.x = int(this.xLabel.text);
         this.onChange();
      }
      
      private function _EventAttribute_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._EventAttribute_Label3_c(),this._EventAttribute_TextInput3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "Y：";
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_TextInput3_i() : TextInput
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
         this._eventSprite.y = int(this.yLabel.text);
         this.onChange();
      }
      
      private function _EventAttribute_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._EventAttribute_Label4_c(),this._EventAttribute_TextInput4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_Label4_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "宽度：";
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_TextInput4_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.right = 5;
         _loc1_.addEventListener("change",this.__widthLabel_change);
         _loc1_.id = "widthLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.widthLabel = _loc1_;
         BindingManager.executeBindings(this,"widthLabel",this.widthLabel);
         return _loc1_;
      }
      
      public function __widthLabel_change(param1:TextOperationEvent) : void
      {
         this._eventSprite.width = Number(this.widthLabel.text);
         this.onChange();
      }
      
      private function _EventAttribute_HGroup5_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._EventAttribute_Label5_c(),this._EventAttribute_TextInput5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_Label5_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "高度：";
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_TextInput5_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.right = 5;
         _loc1_.addEventListener("change",this.__heightLabel_change);
         _loc1_.id = "heightLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.heightLabel = _loc1_;
         BindingManager.executeBindings(this,"heightLabel",this.heightLabel);
         return _loc1_;
      }
      
      public function __heightLabel_change(param1:TextOperationEvent) : void
      {
         this._eventSprite.height = Number(this.heightLabel.text);
         this.onChange();
      }
      
      private function _EventAttribute_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._EventAttribute_RadioButton1_i(),this._EventAttribute_RadioButton2_i(),this._EventAttribute_RadioButton3_i(),this._EventAttribute_RadioButton4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_RadioButton1_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.label = "单次事件";
         _loc1_.selected = true;
         _loc1_.setStyle("color",16777215);
         _loc1_.addEventListener("change",this.__oneSelect_change);
         _loc1_.id = "oneSelect";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.oneSelect = _loc1_;
         BindingManager.executeBindings(this,"oneSelect",this.oneSelect);
         return _loc1_;
      }
      
      public function __oneSelect_change(param1:Event) : void
      {
         callLater(this.onChange);
      }
      
      private function _EventAttribute_RadioButton2_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.label = "重复事件";
         _loc1_.selected = true;
         _loc1_.setStyle("color",16777215);
         _loc1_.addEventListener("change",this.__allSelect_change);
         _loc1_.id = "allSelect";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.allSelect = _loc1_;
         BindingManager.executeBindings(this,"allSelect",this.allSelect);
         return _loc1_;
      }
      
      public function __allSelect_change(param1:Event) : void
      {
         callLater(this.onChange);
      }
      
      private function _EventAttribute_RadioButton3_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.label = "计时事件";
         _loc1_.selected = true;
         _loc1_.setStyle("color",16777215);
         _loc1_.addEventListener("change",this.__timeSelect_change);
         _loc1_.id = "timeSelect";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timeSelect = _loc1_;
         BindingManager.executeBindings(this,"timeSelect",this.timeSelect);
         return _loc1_;
      }
      
      public function __timeSelect_change(param1:Event) : void
      {
         callLater(this.onChange);
      }
      
      private function _EventAttribute_RadioButton4_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.label = "传送事件";
         _loc1_.selected = true;
         _loc1_.setStyle("color",16777215);
         _loc1_.addEventListener("change",this.__warp_change);
         _loc1_.id = "warp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.warp = _loc1_;
         BindingManager.executeBindings(this,"warp",this.warp);
         return _loc1_;
      }
      
      public function __warp_change(param1:Event) : void
      {
         callLater(this.onChange);
      }
      
      private function _EventAttribute_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._EventAttribute_HGroup6_c(),this._EventAttribute_HGroup7_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_HGroup6_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._EventAttribute_Label6_c(),this._EventAttribute_TextInput6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_Label6_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "地图目标：";
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_TextInput6_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.addEventListener("change",this.__mapTarget_change);
         _loc1_.id = "mapTarget";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mapTarget = _loc1_;
         BindingManager.executeBindings(this,"mapTarget",this.mapTarget);
         return _loc1_;
      }
      
      public function __mapTarget_change(param1:TextOperationEvent) : void
      {
         this.onChange();
      }
      
      private function _EventAttribute_HGroup7_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._EventAttribute_Label7_c(),this._EventAttribute_TextInput7_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_Label7_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "传送目标：";
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EventAttribute_TextInput7_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.addEventListener("change",this.__warpTarget_change);
         _loc1_.id = "warpTarget";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.warpTarget = _loc1_;
         BindingManager.executeBindings(this,"warpTarget",this.warpTarget);
         return _loc1_;
      }
      
      public function __warpTarget_change(param1:TextOperationEvent) : void
      {
         this.onChange();
      }
      
      [Bindable(event="propertyChange")]
      public function get allSelect() : RadioButton
      {
         return this._445506051allSelect;
      }
      
      public function set allSelect(param1:RadioButton) : void
      {
         var _loc2_:Object = this._445506051allSelect;
         if(_loc2_ !== param1)
         {
            this._445506051allSelect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allSelect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get heightLabel() : TextInput
      {
         return this._1050436083heightLabel;
      }
      
      public function set heightLabel(param1:TextInput) : void
      {
         var _loc2_:Object = this._1050436083heightLabel;
         if(_loc2_ !== param1)
         {
            this._1050436083heightLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"heightLabel",_loc2_,param1));
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
      public function get mapTarget() : TextInput
      {
         return this._923962893mapTarget;
      }
      
      public function set mapTarget(param1:TextInput) : void
      {
         var _loc2_:Object = this._923962893mapTarget;
         if(_loc2_ !== param1)
         {
            this._923962893mapTarget = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mapTarget",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get oneSelect() : RadioButton
      {
         return this._1587997442oneSelect;
      }
      
      public function set oneSelect(param1:RadioButton) : void
      {
         var _loc2_:Object = this._1587997442oneSelect;
         if(_loc2_ !== param1)
         {
            this._1587997442oneSelect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"oneSelect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timeSelect() : RadioButton
      {
         return this._779249193timeSelect;
      }
      
      public function set timeSelect(param1:RadioButton) : void
      {
         var _loc2_:Object = this._779249193timeSelect;
         if(_loc2_ !== param1)
         {
            this._779249193timeSelect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timeSelect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get warp() : RadioButton
      {
         return this._3641992warp;
      }
      
      public function set warp(param1:RadioButton) : void
      {
         var _loc2_:Object = this._3641992warp;
         if(_loc2_ !== param1)
         {
            this._3641992warp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get warpTarget() : TextInput
      {
         return this._1208686023warpTarget;
      }
      
      public function set warpTarget(param1:TextInput) : void
      {
         var _loc2_:Object = this._1208686023warpTarget;
         if(_loc2_ !== param1)
         {
            this._1208686023warpTarget = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warpTarget",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get widthLabel() : TextInput
      {
         return this._1605235506widthLabel;
      }
      
      public function set widthLabel(param1:TextInput) : void
      {
         var _loc2_:Object = this._1605235506widthLabel;
         if(_loc2_ !== param1)
         {
            this._1605235506widthLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"widthLabel",_loc2_,param1));
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

