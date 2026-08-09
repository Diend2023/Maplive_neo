package skins
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal; //
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.LinearGradientStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.BorderContainer;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   public class IconButtonBarButtonSkin extends SparkButtonSkin implements IStateClient2
   {

      use namespace mx_internal; //
      
      private static const exclusions:Array = ["labelDisplay"];
      
      public var _IconButtonBarButtonSkin_BorderContainer1:BorderContainer;
      
      private var _1709204214_IconButtonBarButtonSkin_GradientEntry1:GradientEntry;
      
      private var _1445723130_IconButtonBarButtonSkin_GradientEntry10:GradientEntry;
      
      private var _1445723131_IconButtonBarButtonSkin_GradientEntry11:GradientEntry;
      
      private var _1709204215_IconButtonBarButtonSkin_GradientEntry2:GradientEntry;
      
      private var _1383304148border:Rect;
      
      private var _1472494227hldownstroke1:Rect;
      
      private var _1472494228hldownstroke2:Rect;
      
      private var _903579360shadow:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var cornerRadius:Number = 2;
      
      public function IconButtonBarButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._IconButtonBarButtonSkin_Rect1_i(),this._IconButtonBarButtonSkin_Rect4_i()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._IconButtonBarButtonSkin_BitmapImage1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._IconButtonBarButtonSkin_BitmapImage2_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._IconButtonBarButtonSkin_BorderContainer1_i);
         var _loc4_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._IconButtonBarButtonSkin_Rect2_i);
         var _loc5_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._IconButtonBarButtonSkin_Rect3_i);
         states = [new State({
            "name":"up",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["border"]
            })]
         }),new State({
            "name":"over",
            "stateGroups":["overStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["border"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["border"]
            })]
         }),new State({
            "name":"down",
            "stateGroups":["downStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["border"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc5_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["shadow"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["shadow"]
            }),new SetProperty().initializeFromObject({
               "target":"_IconButtonBarButtonSkin_GradientEntry1",
               "name":"color",
               "value":16777215
            }),new SetProperty().initializeFromObject({
               "target":"_IconButtonBarButtonSkin_GradientEntry1",
               "name":"alpha",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"_IconButtonBarButtonSkin_GradientEntry2",
               "name":"color",
               "value":16777215
            }),new SetProperty().initializeFromObject({
               "target":"_IconButtonBarButtonSkin_GradientEntry2",
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"_IconButtonBarButtonSkin_GradientEntry10",
               "name":"alpha",
               "value":0.6375
            }),new SetProperty().initializeFromObject({
               "target":"_IconButtonBarButtonSkin_GradientEntry11",
               "name":"alpha",
               "value":0.85
            })]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates","selectedUpStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["border"]
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["border"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["border"]
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["border"]
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","selectedUpStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         })];
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
      
      override public function get colorizeExclusions() : Array
      {
         return exclusions;
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
      }
      
      private function _IconButtonBarButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = -1;
         _loc1_.right = -1;
         _loc1_.top = -1;
         _loc1_.bottom = -1;
         _loc1_.radiusX = 2;
         _loc1_.fill = this._IconButtonBarButtonSkin_LinearGradient1_c();
         _loc1_.initialized(this,"shadow");
         this.shadow = _loc1_;
         BindingManager.executeBindings(this,"shadow",this.shadow);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._IconButtonBarButtonSkin_GradientEntry1_i(),this._IconButtonBarButtonSkin_GradientEntry2_i()];
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_GradientEntry1_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.01;
         this._IconButtonBarButtonSkin_GradientEntry1 = _loc1_;
         BindingManager.executeBindings(this,"_IconButtonBarButtonSkin_GradientEntry1",this._IconButtonBarButtonSkin_GradientEntry1);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_GradientEntry2_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.07;
         this._IconButtonBarButtonSkin_GradientEntry2 = _loc1_;
         BindingManager.executeBindings(this,"_IconButtonBarButtonSkin_GradientEntry2",this._IconButtonBarButtonSkin_GradientEntry2);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.radiusX = 2;
         _loc1_.stroke = this._IconButtonBarButtonSkin_LinearGradientStroke1_c();
         _loc1_.initialized(this,"hldownstroke1");
         this.hldownstroke1 = _loc1_;
         BindingManager.executeBindings(this,"hldownstroke1",this.hldownstroke1);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.weight = 1;
         _loc1_.entries = [this._IconButtonBarButtonSkin_GradientEntry3_c(),this._IconButtonBarButtonSkin_GradientEntry4_c(),this._IconButtonBarButtonSkin_GradientEntry5_c(),this._IconButtonBarButtonSkin_GradientEntry6_c(),this._IconButtonBarButtonSkin_GradientEntry7_c()];
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_GradientEntry3_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.25;
         _loc1_.ratio = 0;
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_GradientEntry4_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.25;
         _loc1_.ratio = 0.001;
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_GradientEntry5_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.07;
         _loc1_.ratio = 0.0011;
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_GradientEntry6_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.07;
         _loc1_.ratio = 0.965;
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_GradientEntry7_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0;
         _loc1_.ratio = 0.9651;
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 2;
         _loc1_.right = 2;
         _loc1_.top = 2;
         _loc1_.bottom = 2;
         _loc1_.radiusX = 2;
         _loc1_.stroke = this._IconButtonBarButtonSkin_LinearGradientStroke2_c();
         _loc1_.initialized(this,"hldownstroke2");
         this.hldownstroke2 = _loc1_;
         BindingManager.executeBindings(this,"hldownstroke2",this.hldownstroke2);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_LinearGradientStroke2_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.weight = 1;
         _loc1_.entries = [this._IconButtonBarButtonSkin_GradientEntry8_c(),this._IconButtonBarButtonSkin_GradientEntry9_c()];
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_GradientEntry8_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.09;
         _loc1_.ratio = 0;
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_GradientEntry9_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0;
         _loc1_.ratio = 0.0001;
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Rect4_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 69;
         _loc1_.height = 20;
         _loc1_.radiusX = 2;
         _loc1_.stroke = this._IconButtonBarButtonSkin_LinearGradientStroke3_c();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_LinearGradientStroke3_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.weight = 1;
         _loc1_.entries = [this._IconButtonBarButtonSkin_GradientEntry10_i(),this._IconButtonBarButtonSkin_GradientEntry11_i()];
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_GradientEntry10_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.5625;
         this._IconButtonBarButtonSkin_GradientEntry10 = _loc1_;
         BindingManager.executeBindings(this,"_IconButtonBarButtonSkin_GradientEntry10",this._IconButtonBarButtonSkin_GradientEntry10);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_GradientEntry11_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.75;
         this._IconButtonBarButtonSkin_GradientEntry11 = _loc1_;
         BindingManager.executeBindings(this,"_IconButtonBarButtonSkin_GradientEntry11",this._IconButtonBarButtonSkin_GradientEntry11);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.alpha = 0.5;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 1;
         _loc1_.initialized(this,"iconDisplay");
         iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",iconDisplay);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.alpha = 1;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 1;
         _loc1_.initialized(this,"iconDisplay");
         iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",iconDisplay);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_BorderContainer1_i() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.left = 5;
         _loc1_.top = 32;
         _loc1_.height = 26;
         _loc1_.minWidth = 10;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._IconButtonBarButtonSkin_Array14_c);
         _loc1_.setStyle("backgroundColor",3355443);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.id = "_IconButtonBarButtonSkin_BorderContainer1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._IconButtonBarButtonSkin_BorderContainer1 = _loc1_;
         BindingManager.executeBindings(this,"_IconButtonBarButtonSkin_BorderContainer1",this._IconButtonBarButtonSkin_BorderContainer1);
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Array14_c() : Array
      {
         return [this._IconButtonBarButtonSkin_HGroup1_c()];
      }
      
      private function _IconButtonBarButtonSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.mxmlContent = [this._IconButtonBarButtonSkin_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _IconButtonBarButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _IconButtonBarButtonSkin_GradientEntry1() : GradientEntry
      {
         return this._1709204214_IconButtonBarButtonSkin_GradientEntry1;
      }
      
      public function set _IconButtonBarButtonSkin_GradientEntry1(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1709204214_IconButtonBarButtonSkin_GradientEntry1;
         if(_loc2_ !== param1)
         {
            this._1709204214_IconButtonBarButtonSkin_GradientEntry1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_IconButtonBarButtonSkin_GradientEntry1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _IconButtonBarButtonSkin_GradientEntry10() : GradientEntry
      {
         return this._1445723130_IconButtonBarButtonSkin_GradientEntry10;
      }
      
      public function set _IconButtonBarButtonSkin_GradientEntry10(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1445723130_IconButtonBarButtonSkin_GradientEntry10;
         if(_loc2_ !== param1)
         {
            this._1445723130_IconButtonBarButtonSkin_GradientEntry10 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_IconButtonBarButtonSkin_GradientEntry10",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _IconButtonBarButtonSkin_GradientEntry11() : GradientEntry
      {
         return this._1445723131_IconButtonBarButtonSkin_GradientEntry11;
      }
      
      public function set _IconButtonBarButtonSkin_GradientEntry11(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1445723131_IconButtonBarButtonSkin_GradientEntry11;
         if(_loc2_ !== param1)
         {
            this._1445723131_IconButtonBarButtonSkin_GradientEntry11 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_IconButtonBarButtonSkin_GradientEntry11",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _IconButtonBarButtonSkin_GradientEntry2() : GradientEntry
      {
         return this._1709204215_IconButtonBarButtonSkin_GradientEntry2;
      }
      
      public function set _IconButtonBarButtonSkin_GradientEntry2(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1709204215_IconButtonBarButtonSkin_GradientEntry2;
         if(_loc2_ !== param1)
         {
            this._1709204215_IconButtonBarButtonSkin_GradientEntry2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_IconButtonBarButtonSkin_GradientEntry2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get border() : Rect
      {
         return this._1383304148border;
      }
      
      public function set border(param1:Rect) : void
      {
         var _loc2_:Object = this._1383304148border;
         if(_loc2_ !== param1)
         {
            this._1383304148border = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hldownstroke1() : Rect
      {
         return this._1472494227hldownstroke1;
      }
      
      public function set hldownstroke1(param1:Rect) : void
      {
         var _loc2_:Object = this._1472494227hldownstroke1;
         if(_loc2_ !== param1)
         {
            this._1472494227hldownstroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hldownstroke1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hldownstroke2() : Rect
      {
         return this._1472494228hldownstroke2;
      }
      
      public function set hldownstroke2(param1:Rect) : void
      {
         var _loc2_:Object = this._1472494228hldownstroke2;
         if(_loc2_ !== param1)
         {
            this._1472494228hldownstroke2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hldownstroke2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get shadow() : Rect
      {
         return this._903579360shadow;
      }
      
      public function set shadow(param1:Rect) : void
      {
         var _loc2_:Object = this._903579360shadow;
         if(_loc2_ !== param1)
         {
            this._903579360shadow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shadow",_loc2_,param1));
            }
         }
      }
   }
}

