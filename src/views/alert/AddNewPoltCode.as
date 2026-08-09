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
   import mx.controls.HTML;
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
   import tmx.Npc;
   import tmx.PoltDisplay;
   import utils.XMLUtils;
   import views.AlertRef;
   
   use namespace mx_internal;
   
   public class AddNewPoltCode extends AlertRef implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _3092207drop:DropDownList;
      
      private var _3282fx:ArrayCollection;
      
      private var _1261832479fxDrop:DropDownList;
      
      private var _3213227html:HTML;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _poltDisplay:PoltDisplay;
      
      private var _xml:XML;
      
      private var _as3:String = null;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AddNewPoltCode()
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
         bindings = this._AddNewPoltCode_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_alert_AddNewPoltCodeWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AddNewPoltCode[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 500;
         this.height = 400;
         this.title = "添加AS3Code";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._AddNewPoltCode_Array2_c);
         this._AddNewPoltCode_ArrayCollection1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AddNewPoltCode._watcherSetupUtil = param1;
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
            html.htmlLoader.load(new URLRequest(File.applicationDirectory.resolvePath("jshint/jshint.htm").url));
            html.htmlLoader.addEventListener(Event.HTML_DOM_INITIALIZE,onComplete);
         });
      }
      
      private function onDown(param1:KeyboardEvent) : void
      {
      }
      
      public function onSelectAll(param1:Event) : void
      {
      }
      
      public function setAS3Code(param1:String) : void
      {
         this._as3 = param1;
      }
      
      public function getCodeData() : String
      {
         var _loc1_:String = this.html.htmlLoader.window.getContent();
         var _loc2_:Array = _loc1_.split("\n");
         _loc1_ = "";
         var _loc3_:* = false;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            if(_loc3_)
            {
               _loc1_ += _loc2_[_loc4_] + "\n";
            }
            _loc3_ = !_loc3_;
            _loc4_++;
         }
         return _loc1_;
      }
      
      private function onComplete(param1:Event) : void
      {
         var e:Event = param1;
         this.html.htmlLoader.window.init = function():void
         {
            html.htmlLoader.window.setCode(_as3 ? _as3 : "//by maplive code\n\n");
         };
      }
      
      public function setXml(param1:XML) : void
      {
         this._xml = param1;
      }
      
      protected function onEnter(param1:MouseEvent) : void
      {
         if(this.getCodeData().length == 0)
         {
            Alert.show("请填写内容","提示");
            return;
         }
         if(!this.drop.selectedItem)
         {
            this.drop.selectedIndex = 0;
         }
         if(this._as3)
         {
            XMLUtils.createMessage(this._xml,this.drop.selectedItem.npc as Npc,this.getCodeData(),"update",true);
         }
         else
         {
            XMLUtils.createMessage(this._xml,this.drop.selectedItem.npc as Npc,this.getCodeData(),this.fxDrop.selectedIndex == 0 ? "up" : "down",true);
         }
         this.back();
         PopUpManager.removePopUp(this);
      }
      
      private function _AddNewPoltCode_ArrayCollection1_i() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.source = [{"name":"向上"},{"name":"向下"}];
         _loc1_.initialized(this,"fx");
         this.fx = _loc1_;
         BindingManager.executeBindings(this,"fx",this.fx);
         return _loc1_;
      }
      
      private function _AddNewPoltCode_Array2_c() : Array
      {
         return [this._AddNewPoltCode_Button1_c(),this._AddNewPoltCode_Button2_c(),this._AddNewPoltCode_Label1_c(),this._AddNewPoltCode_DropDownList1_i(),this._AddNewPoltCode_Label2_c(),this._AddNewPoltCode_DropDownList2_i(),this._AddNewPoltCode_HTML1_i()];
      }
      
      private function _AddNewPoltCode_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.y = 335;
         _loc1_.label = "取消";
         _loc1_.horizontalCenter = -45;
         _loc1_.addEventListener("click",this.___AddNewPoltCode_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AddNewPoltCode_Button1_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
      }
      
      private function _AddNewPoltCode_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.y = 335;
         _loc1_.label = "添加";
         _loc1_.horizontalCenter = 54;
         _loc1_.addEventListener("click",this.___AddNewPoltCode_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AddNewPoltCode_Button2_click(param1:MouseEvent) : void
      {
         this.onEnter(param1);
      }
      
      private function _AddNewPoltCode_Label1_c() : Label
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
      
      private function _AddNewPoltCode_DropDownList1_i() : DropDownList
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
      
      private function _AddNewPoltCode_Label2_c() : Label
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
      
      private function _AddNewPoltCode_DropDownList2_i() : DropDownList
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
      
      private function _AddNewPoltCode_HTML1_i() : HTML
      {
         var _loc1_:HTML = new HTML();
         _loc1_.left = 24;
         _loc1_.right = 22;
         _loc1_.top = 42;
         _loc1_.bottom = 40;
         _loc1_.id = "html";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.html = _loc1_;
         BindingManager.executeBindings(this,"html",this.html);
         return _loc1_;
      }
      
      private function _AddNewPoltCode_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"fxDrop.dataProvider","fx");
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
      public function get html() : HTML
      {
         return this._3213227html;
      }
      
      public function set html(param1:HTML) : void
      {
         var _loc2_:Object = this._3213227html;
         if(_loc2_ !== param1)
         {
            this._3213227html = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"html",_loc2_,param1));
            }
         }
      }
   }
}

