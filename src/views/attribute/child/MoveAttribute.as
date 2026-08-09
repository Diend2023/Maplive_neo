package views.attribute.child
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
   import mx.containers.ViewStack;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.IndexChangedEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.BorderContainer;
   import spark.components.DropDownList;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.NavigatorContent;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.events.TextOperationEvent;
   import views.observe.role.frame.EffectData;
   
   use namespace mx_internal;
   
   public class MoveAttribute extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _3092207drop:DropDownList;
      
      private var _102544gox:TextInput;
      
      private var _102545goy:TextInput;
      
      private var _109757064stack:ViewStack;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var effect:EffectData;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function MoveAttribute()
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
         bindings = this._MoveAttribute_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_attribute_child_MoveAttributeWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return MoveAttribute[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._MoveAttribute_DropDownList1_i(),this._MoveAttribute_BorderContainer1_c()];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         MoveAttribute._watcherSetupUtil = param1;
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
         var data:EffectData = param1;
         this.effect = data;
         this.stack.selectedIndex = 0;
         callLater(function():void
         {
            if(stack.selectedIndex == 0)
            {
               gox.text = data.gox.toString();
               goy.text = data.goy.toString();
            }
         });
      }
      
      protected function onStackChange(param1:IndexChangedEvent) : void
      {
         this.effect.isLockAction = this.stack.selectedIndex == 2;
      }
      
      private function _MoveAttribute_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.selectedIndex = 0;
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.setStyle("contentBackgroundAlpha",1);
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
         this.stack.selectedIndex = this.drop.selectedIndex;
         this.effect.isFollow = this.drop.selectedIndex == 2;
      }
      
      private function _MoveAttribute_BorderContainer1_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.top = 26;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._MoveAttribute_Array2_c);
         _loc1_.setStyle("backgroundColor",16777215);
         _loc1_.setStyle("backgroundAlpha",0.5);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MoveAttribute_Array2_c() : Array
      {
         return [this._MoveAttribute_ViewStack1_i()];
      }
      
      private function _MoveAttribute_ViewStack1_i() : ViewStack
      {
         var temp:ViewStack = new ViewStack();
         temp.top = 5;
         temp.left = 5;
         temp.right = 5;
         temp.addEventListener("change",this.__stack_change);
         temp.id = "stack";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":ViewStack,
            "id":"stack",
            "events":{"change":"__stack_change"},
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "label":"普通位移",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_MoveAttribute_Array3_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "propertiesFactory":function():Object
                  {
                     return {"label":"方法位移"};
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "propertiesFactory":function():Object
                  {
                     return {"label":"跟随角色"};
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this.stack = temp;
         BindingManager.executeBindings(this,"stack",this.stack);
         return temp;
      }
      
      public function __stack_change(param1:IndexChangedEvent) : void
      {
         this.onStackChange(param1);
      }
      
      private function _MoveAttribute_Array3_c() : Array
      {
         return [this._MoveAttribute_VGroup1_c()];
      }
      
      private function _MoveAttribute_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._MoveAttribute_HGroup1_c(),this._MoveAttribute_HGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MoveAttribute_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._MoveAttribute_Label1_c(),this._MoveAttribute_TextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MoveAttribute_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "X递增：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MoveAttribute_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.width = 100;
         _loc1_.addEventListener("change",this.__gox_change);
         _loc1_.id = "gox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.gox = _loc1_;
         BindingManager.executeBindings(this,"gox",this.gox);
         return _loc1_;
      }
      
      public function __gox_change(param1:TextOperationEvent) : void
      {
         this.effect.gox = int(this.gox.text);
      }
      
      private function _MoveAttribute_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._MoveAttribute_Label2_c(),this._MoveAttribute_TextInput2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MoveAttribute_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "Y递增：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MoveAttribute_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.width = 100;
         _loc1_.addEventListener("change",this.__goy_change);
         _loc1_.id = "goy";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.goy = _loc1_;
         BindingManager.executeBindings(this,"goy",this.goy);
         return _loc1_;
      }
      
      public function __goy_change(param1:TextOperationEvent) : void
      {
         this.effect.goy = int(this.goy.text);
      }
      
      private function _MoveAttribute_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"drop.dataProvider","stack");
         return _loc1_;
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
      public function get gox() : TextInput
      {
         return this._102544gox;
      }
      
      public function set gox(param1:TextInput) : void
      {
         var _loc2_:Object = this._102544gox;
         if(_loc2_ !== param1)
         {
            this._102544gox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get goy() : TextInput
      {
         return this._102545goy;
      }
      
      public function set goy(param1:TextInput) : void
      {
         var _loc2_:Object = this._102545goy;
         if(_loc2_ !== param1)
         {
            this._102545goy = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"goy",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get stack() : ViewStack
      {
         return this._109757064stack;
      }
      
      public function set stack(param1:ViewStack) : void
      {
         var _loc2_:Object = this._109757064stack;
         if(_loc2_ !== param1)
         {
            this._109757064stack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stack",_loc2_,param1));
            }
         }
      }
   }
}

