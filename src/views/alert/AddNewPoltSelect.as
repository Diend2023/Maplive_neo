package views.alert
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
   import mx.controls.Alert;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.DropDownList;
   import spark.components.Label;
   import spark.components.TextInput;
   import utils.XMLUtils;
   import views.AlertRef;
   
   use namespace mx_internal;
   
   public class AddNewPoltSelect extends AlertRef implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _65A:TextInput;
      
      private var _66B:TextInput;
      
      private var _67C:TextInput;
      
      private var _68D:TextInput;
      
      private var _3282fx:ArrayCollection;
      
      private var _1261832479fxDrop:DropDownList;
      
      private var _309542241problem:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _xml:XML;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AddNewPoltSelect()
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
         bindings = this._AddNewPoltSelect_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_alert_AddNewPoltSelectWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AddNewPoltSelect[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.height = 266;
         this.title = "添加新的对话内容";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._AddNewPoltSelect_Array2_c);
         this._AddNewPoltSelect_ArrayCollection1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AddNewPoltSelect._watcherSetupUtil = param1;
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
            this.chromeColor = 4144716;
            this.color = 16777215;
            this.backgroundColor = 5921126;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function setXml(param1:XML) : void
      {
         this._xml = param1;
      }
      
      protected function onEnter(param1:MouseEvent) : void
      {
         if(this.problem.text.length == 0 || this.A.text.length == 0 || this.B.text.length == 0)
         {
            Alert.show("请填写内容，问题和A/B为必须填值","提示");
            return;
         }
         XMLUtils.createSelect(this._xml,this.problem.text,[this.A.text,this.B.text,this.C.text,this.D.text],this.fxDrop.selectedIndex == 1 ? "down" : "up");
         this.back();
         PopUpManager.removePopUp(this);
      }
      
      private function _AddNewPoltSelect_ArrayCollection1_i() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.source = [{"name":"向上"},{"name":"向下"}];
         _loc1_.initialized(this,"fx");
         this.fx = _loc1_;
         BindingManager.executeBindings(this,"fx",this.fx);
         return _loc1_;
      }
      
      private function _AddNewPoltSelect_Array2_c() : Array
      {
         return [this._AddNewPoltSelect_Button1_c(),this._AddNewPoltSelect_Button2_c(),this._AddNewPoltSelect_Label1_c(),this._AddNewPoltSelect_DropDownList1_i(),this._AddNewPoltSelect_Label2_c(),this._AddNewPoltSelect_Label3_c(),this._AddNewPoltSelect_Label4_c(),this._AddNewPoltSelect_TextInput1_i(),this._AddNewPoltSelect_Label5_c(),this._AddNewPoltSelect_TextInput2_i(),this._AddNewPoltSelect_Label6_c(),this._AddNewPoltSelect_TextInput3_i(),this._AddNewPoltSelect_TextInput4_i(),this._AddNewPoltSelect_TextInput5_i()];
      }
      
      private function _AddNewPoltSelect_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 116;
         _loc1_.y = 205;
         _loc1_.label = "取消";
         _loc1_.addEventListener("click",this.___AddNewPoltSelect_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AddNewPoltSelect_Button1_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
      }
      
      private function _AddNewPoltSelect_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 215;
         _loc1_.y = 205;
         _loc1_.label = "添加";
         _loc1_.addEventListener("click",this.___AddNewPoltSelect_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AddNewPoltSelect_Button2_click(param1:MouseEvent) : void
      {
         this.onEnter(param1);
      }
      
      private function _AddNewPoltSelect_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 27;
         _loc1_.y = 18;
         _loc1_.text = "添加方向：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddNewPoltSelect_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.x = 95;
         _loc1_.y = 13;
         _loc1_.width = 103;
         _loc1_.selectedIndex = 1;
         _loc1_.labelField = "name";
         _loc1_.setStyle("chromeColor",4144716);
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.setStyle("selectionColor",9210772);
         _loc1_.setStyle("rollOverColor",12237498);
         _loc1_.setStyle("focusColor",11711154);
         _loc1_.id = "fxDrop";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fxDrop = _loc1_;
         BindingManager.executeBindings(this,"fxDrop",this.fxDrop);
         return _loc1_;
      }
      
      private function _AddNewPoltSelect_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 27;
         _loc1_.y = 51;
         _loc1_.text = "问题：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddNewPoltSelect_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 41;
         _loc1_.y = 81;
         _loc1_.text = "A：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddNewPoltSelect_Label4_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 41;
         _loc1_.y = 111;
         _loc1_.text = "B：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddNewPoltSelect_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.x = 70;
         _loc1_.y = 106;
         _loc1_.width = 299;
         _loc1_.setStyle("contentBackgroundAlpha",0.3);
         _loc1_.id = "B";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.B = _loc1_;
         BindingManager.executeBindings(this,"B",this.B);
         return _loc1_;
      }
      
      private function _AddNewPoltSelect_Label5_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 41;
         _loc1_.y = 141;
         _loc1_.text = "C：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddNewPoltSelect_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.x = 70;
         _loc1_.y = 136;
         _loc1_.width = 299;
         _loc1_.setStyle("contentBackgroundAlpha",0.3);
         _loc1_.id = "C";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.C = _loc1_;
         BindingManager.executeBindings(this,"C",this.C);
         return _loc1_;
      }
      
      private function _AddNewPoltSelect_Label6_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 41;
         _loc1_.y = 171;
         _loc1_.text = "D：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddNewPoltSelect_TextInput3_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.x = 70;
         _loc1_.y = 166;
         _loc1_.width = 299;
         _loc1_.setStyle("contentBackgroundAlpha",0.3);
         _loc1_.id = "D";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.D = _loc1_;
         BindingManager.executeBindings(this,"D",this.D);
         return _loc1_;
      }
      
      private function _AddNewPoltSelect_TextInput4_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.x = 70;
         _loc1_.y = 76;
         _loc1_.width = 299;
         _loc1_.setStyle("contentBackgroundAlpha",0.3);
         _loc1_.id = "A";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.A = _loc1_;
         BindingManager.executeBindings(this,"A",this.A);
         return _loc1_;
      }
      
      private function _AddNewPoltSelect_TextInput5_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.x = 70;
         _loc1_.y = 46;
         _loc1_.width = 299;
         _loc1_.setStyle("contentBackgroundAlpha",0.3);
         _loc1_.id = "problem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.problem = _loc1_;
         BindingManager.executeBindings(this,"problem",this.problem);
         return _loc1_;
      }
      
      private function _AddNewPoltSelect_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"fxDrop.dataProvider","fx");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get A() : TextInput
      {
         return this._65A;
      }
      
      public function set A(param1:TextInput) : void
      {
         var _loc2_:Object = this._65A;
         if(_loc2_ !== param1)
         {
            this._65A = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"A",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get B() : TextInput
      {
         return this._66B;
      }
      
      public function set B(param1:TextInput) : void
      {
         var _loc2_:Object = this._66B;
         if(_loc2_ !== param1)
         {
            this._66B = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"B",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get C() : TextInput
      {
         return this._67C;
      }
      
      public function set C(param1:TextInput) : void
      {
         var _loc2_:Object = this._67C;
         if(_loc2_ !== param1)
         {
            this._67C = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"C",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get D() : TextInput
      {
         return this._68D;
      }
      
      public function set D(param1:TextInput) : void
      {
         var _loc2_:Object = this._68D;
         if(_loc2_ !== param1)
         {
            this._68D = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"D",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fx() : ArrayCollection
      {
         return this._3282fx;
      }
      
      public function set fx(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._3282fx;
         if(_loc2_ !== param1)
         {
            this._3282fx = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fx",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fxDrop() : DropDownList
      {
         return this._1261832479fxDrop;
      }
      
      public function set fxDrop(param1:DropDownList) : void
      {
         var _loc2_:Object = this._1261832479fxDrop;
         if(_loc2_ !== param1)
         {
            this._1261832479fxDrop = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fxDrop",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get problem() : TextInput
      {
         return this._309542241problem;
      }
      
      public function set problem(param1:TextInput) : void
      {
         var _loc2_:Object = this._309542241problem;
         if(_loc2_ !== param1)
         {
            this._309542241problem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"problem",_loc2_,param1));
            }
         }
      }
   }
}

