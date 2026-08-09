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
   import mx.controls.Alert;
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
   import spark.components.HGroup;
   import spark.components.Image;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.Panel;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.events.TextOperationEvent;
   
   use namespace mx_internal;
   
   public class SelectElementView extends Panel implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public static var _findTag:String = "";
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _3092207drop:List;
      
      private var _3143097find:TextInput;
      
      private var _853209068findDir:String;
      
      private var _100313435image:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _sound:Sound;
      
      private var _soundChannel:SoundChannel;
      
      public var callFunc:Function;
      
      private var _array:Array;
      
      private var findList:ArrayCollection;
      
      public var extension:String = "png";
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SelectElementView()
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
         bindings = this._SelectElementView_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_SelectElementViewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SelectElementView[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.height = 300;
         this.title = "添加元素";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._SelectElementView_Array1_c);
         this.addEventListener("initialize",this.___SelectElementView_Panel1_initialize);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SelectElementView._watcherSetupUtil = param1;
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
      
      private function onInit() : void
      {
         this.x = this.stage.stageWidth / 2 - this.width / 2;
         this.y = this.stage.stageHeight / 2 - this.height / 2;
         var _loc1_:File = App.projectFile.resolvePath(this.findDir);
         var _loc2_:ArrayCollection = new ArrayCollection();
         var _loc3_:Array = _loc1_.getDirectoryListing();
         this.findDirs(_loc2_,_loc3_);
         this._array = _loc2_.source;
         this.drop.dataProvider = _loc2_;
         this.onFind(null);
      }
      
      public function findDirs(param1:ArrayCollection, param2:Array) : void
      {
         var _loc4_:Object = null;
         var _loc3_:File = null;
         for(_loc4_ in param2)
         {
            _loc3_ = param2[_loc4_] as File;
            if(!_loc3_.isDirectory && !_loc3_.isHidden && _loc3_.extension == this.extension)
            {
               param1.addItem({
                  "name":_loc3_.name,
                  "file":_loc3_
               });
            }
            else if(_loc3_.isDirectory)
            {
               this.findDirs(param1,_loc3_.getDirectoryListing());
            }
         }
      }
      
      private function onImageChange() : void
      {
         if(this.extension == "png")
         {
            this.image.source = (this.drop.selectedItem.file as File).url;
         }
         else if(this.extension == "mp3")
         {
            if(this._soundChannel)
            {
               this._soundChannel.stop();
               this._soundChannel = null;
            }
            this._sound = new Sound(new URLRequest((this.drop.selectedItem.file as File).url));
            this._soundChannel = this._sound.play();
         }
      }
      
      public function onAddNpc() : void
      {
         if(!this.drop.selectedItem)
         {
            Alert.show("请选择指定元素资源");
            return;
         }
         this.callFunc(this.drop.selectedItem.file as File);
         PopUpManager.removePopUp(this);
      }
      
      protected function onFind(param1:TextOperationEvent) : void
      {
         var _loc2_:Array = this._array.concat();
         var _loc3_:int = int(_loc2_.length - 1);
         while(_loc3_ >= 0)
         {
            if(_loc2_[_loc3_].name.indexOf(this.find.text) == -1)
            {
               _loc2_.splice(_loc3_,1);
            }
            _loc3_--;
         }
         this.findList = new ArrayCollection(_loc2_);
         this.drop.dataProvider = this.findList;
         _findTag = this.find.text;
      }
      
      private function _SelectElementView_Array1_c() : Array
      {
         return [this._SelectElementView_BorderContainer1_c(),this._SelectElementView_VGroup1_c(),this._SelectElementView_Button1_c(),this._SelectElementView_Button2_c()];
      }
      
      private function _SelectElementView_BorderContainer1_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.left = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.width = 200;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SelectElementView_Array2_c);
         _loc1_.setStyle("backgroundAlpha",0.5);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SelectElementView_Array2_c() : Array
      {
         return [this._SelectElementView_Image1_i()];
      }
      
      private function _SelectElementView_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "image";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.image = _loc1_;
         BindingManager.executeBindings(this,"image",this.image);
         return _loc1_;
      }
      
      private function _SelectElementView_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 216;
         _loc1_.right = 7;
         _loc1_.top = 7;
         _loc1_.mxmlContent = [this._SelectElementView_Label1_c(),this._SelectElementView_HGroup1_c(),this._SelectElementView_List1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SelectElementView_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.y = 8;
         _loc1_.text = "元素选择：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SelectElementView_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 90;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SelectElementView_Label2_c(),this._SelectElementView_TextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SelectElementView_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "搜索：";
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SelectElementView_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("contentBackgroundColor",11711154);
         _loc1_.addEventListener("change",this.__find_change);
         _loc1_.id = "find";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.find = _loc1_;
         BindingManager.executeBindings(this,"find",this.find);
         return _loc1_;
      }
      
      public function __find_change(param1:TextOperationEvent) : void
      {
         this.onFind(param1);
      }
      
      private function _SelectElementView_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.height = 180;
         _loc1_.labelField = "name";
         _loc1_.setStyle("contentBackgroundColor",3355443);
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
         this.onImageChange();
      }
      
      private function _SelectElementView_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 310;
         _loc1_.y = 236;
         _loc1_.label = "确定";
         _loc1_.addEventListener("click",this.___SelectElementView_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___SelectElementView_Button1_click(param1:MouseEvent) : void
      {
         this.onAddNpc();
      }
      
      private function _SelectElementView_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 223;
         _loc1_.y = 236;
         _loc1_.label = "取消";
         _loc1_.addEventListener("click",this.___SelectElementView_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___SelectElementView_Button2_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
      }
      
      public function ___SelectElementView_Panel1_initialize(param1:FlexEvent) : void
      {
         this.onInit();
      }
      
      private function _SelectElementView_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = _findTag;
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"find.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get drop() : List
      {
         return this._3092207drop;
      }
      
      public function set drop(param1:List) : void
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
      public function get find() : TextInput
      {
         return this._3143097find;
      }
      
      public function set find(param1:TextInput) : void
      {
         var _loc2_:Object = this._3143097find;
         if(_loc2_ !== param1)
         {
            this._3143097find = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"find",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get findDir() : String
      {
         return this._853209068findDir;
      }
      
      public function set findDir(param1:String) : void
      {
         var _loc2_:Object = this._853209068findDir;
         if(_loc2_ !== param1)
         {
            this._853209068findDir = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"findDir",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get image() : Image
      {
         return this._100313435image;
      }
      
      public function set image(param1:Image) : void
      {
         var _loc2_:Object = this._100313435image;
         if(_loc2_ !== param1)
         {
            this._100313435image = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"image",_loc2_,param1));
            }
         }
      }
   }
}

