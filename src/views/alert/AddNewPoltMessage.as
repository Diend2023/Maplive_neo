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
   import spark.components.TextArea;
   import tmx.PoltDisplay;
   import utils.XMLUtils;
   import views.AlertRef;
   
   use namespace mx_internal;
   
   public class AddNewPoltMessage extends AlertRef implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _3002509area:TextArea;
      
      private var _3092207drop:DropDownList;
      
      private var _3282fx:ArrayCollection;
      
      private var _1261832479fxDrop:DropDownList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _poltDisplay:PoltDisplay;
      
      private var _xml:XML;
      
      private var _eidt:XML;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AddNewPoltMessage()
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
         bindings = this._AddNewPoltMessage_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_alert_AddNewPoltMessageWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AddNewPoltMessage[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.height = 300;
         this.title = "添加新的对话内容";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._AddNewPoltMessage_Array2_c);
         this._AddNewPoltMessage_ArrayCollection1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AddNewPoltMessage._watcherSetupUtil = param1;
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
      
      public function setNpcs(param1:PoltDisplay, param2:ArrayCollection) : void
      {
         var target:PoltDisplay = param1;
         var npcs:ArrayCollection = param2;
         this._poltDisplay = target;
         callLater(function():void
         {
            drop.dataProvider = npcs;
            var _loc1_:int = 0;
            while(_loc1_ < npcs.length)
            {
               if(npcs[_loc1_].npc == target)
               {
                  drop.selectedIndex = _loc1_;
                  break;
               }
               _loc1_++;
            }
         });
      }
      
      public function setXml(param1:XML) : void
      {
         this._xml = param1;
      }
      
      public function setEditXml(param1:XML) : void
      {
         var xml:XML = param1;
         this._eidt = xml;
         callLater(function():void
         {
            area.text = xml.@message;
         });
      }
      
      protected function onEnter(param1:MouseEvent) : void
      {
         if(this.area.text.length == 0)
         {
            Alert.show("请填写内容","提示");
            return;
         }
         if(!this.drop.selectedItem)
         {
            this.drop.selectedIndex = 0;
         }
         if(this._eidt)
         {
            this._eidt.@target = this.drop.selectedItem.name;
            this._eidt.@message = this.area.text;
         }
         else
         {
            XMLUtils.createMessage(this._xml,this.drop.selectedItem.npc as PoltDisplay,this.area.text,this.fxDrop.selectedIndex == 0 ? "up" : "down");
         }
         this.back();
         PopUpManager.removePopUp(this);
      }
      
      private function _AddNewPoltMessage_ArrayCollection1_i() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.source = [{"name":"向上"},{"name":"向下"}];
         _loc1_.initialized(this,"fx");
         this.fx = _loc1_;
         BindingManager.executeBindings(this,"fx",this.fx);
         return _loc1_;
      }
      
      private function _AddNewPoltMessage_Array2_c() : Array
      {
         return [this._AddNewPoltMessage_Button1_c(),this._AddNewPoltMessage_Button2_c(),this._AddNewPoltMessage_Label1_c(),this._AddNewPoltMessage_TextArea1_i(),this._AddNewPoltMessage_DropDownList1_i(),this._AddNewPoltMessage_Label2_c(),this._AddNewPoltMessage_DropDownList2_i()];
      }
      
      private function _AddNewPoltMessage_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 116;
         _loc1_.y = 235;
         _loc1_.label = "取消";
         _loc1_.addEventListener("click",this.___AddNewPoltMessage_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AddNewPoltMessage_Button1_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
      }
      
      private function _AddNewPoltMessage_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 215;
         _loc1_.y = 235;
         _loc1_.label = "添加";
         _loc1_.addEventListener("click",this.___AddNewPoltMessage_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AddNewPoltMessage_Button2_click(param1:MouseEvent) : void
      {
         this.onEnter(param1);
      }
      
      private function _AddNewPoltMessage_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 24;
         _loc1_.y = 18;
         _loc1_.text = "发言者：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddNewPoltMessage_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.x = 24;
         _loc1_.y = 44;
         _loc1_.width = 344;
         _loc1_.height = 183;
         _loc1_.setStyle("contentBackgroundAlpha",0.3);
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("chromeColor",16777215);
         _loc1_.id = "area";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.area = _loc1_;
         BindingManager.executeBindings(this,"area",this.area);
         return _loc1_;
      }
      
      private function _AddNewPoltMessage_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.labelField = "name";
         _loc1_.x = 76;
         _loc1_.y = 13;
         _loc1_.width = 110;
         _loc1_.setStyle("chromeColor",4144716);
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.setStyle("selectionColor",9210772);
         _loc1_.setStyle("rollOverColor",12237498);
         _loc1_.setStyle("focusColor",11711154);
         _loc1_.id = "drop";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.drop = _loc1_;
         BindingManager.executeBindings(this,"drop",this.drop);
         return _loc1_;
      }
      
      private function _AddNewPoltMessage_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 197;
         _loc1_.y = 18;
         _loc1_.text = "添加方向：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddNewPoltMessage_DropDownList2_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.x = 265;
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
      
      private function _AddNewPoltMessage_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"fxDrop.dataProvider","fx");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get area() : TextArea
      {
         return this._3002509area;
      }
      
      public function set area(param1:TextArea) : void
      {
         var _loc2_:Object = this._3002509area;
         if(_loc2_ !== param1)
         {
            this._3002509area = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"area",_loc2_,param1));
            }
         }
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
   }
}

