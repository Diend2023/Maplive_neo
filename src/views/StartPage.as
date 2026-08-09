package views
{
   import events.OpenEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import mx.binding.BindingManager;
   import mx.collections.ArrayCollection;
   import mx.controls.Alert;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal; //
   import mx.events.PropertyChangeEvent;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.VGroup;
   
   public class StartPage extends RefObserve
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      private var _3322014list:List;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function StartPage()
      {
         super();
         mx_internal::_document = this;
         this.width = 400;
         this.height = 300;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._StartPage_Array1_c);
         this.addEventListener("addedToStage",this.___StartPage_RefObserve1_addedToStage);
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
      
      protected function onInit(param1:Event) : void
      {
         var event:Event = param1;
         callLater(function():void
         {
            var _loc1_:Array = App.history;
            list.dataProvider = new ArrayCollection(_loc1_);
         });
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         var _loc2_:File = new File(this.list.selectedItem);
         if(_loc2_.exists)
         {
            this.dispatchEvent(new OpenEvent(OpenEvent.OPEN,_loc2_,null));
         }
         else
         {
            Alert.show("该路径无效，或者不存在","打开失败");
         }
      }
      
      private function _StartPage_Array1_c() : Array
      {
         return [this._StartPage_VGroup1_c()];
      }
      
      private function _StartPage_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.top = 5;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.bottom = 5;
         _loc1_.mxmlContent = [this._StartPage_Label1_c(),this._StartPage_List1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _StartPage_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "历史工程：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _StartPage_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.doubleClickEnabled = true;
         _loc1_.setStyle("contentBackgroundColor",7171193);
         _loc1_.setStyle("color",16777215);
         _loc1_.addEventListener("doubleClick",this.__list_doubleClick);
         _loc1_.id = "list";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.list = _loc1_;
         BindingManager.executeBindings(this,"list",this.list);
         return _loc1_;
      }
      
      public function __list_doubleClick(param1:MouseEvent) : void
      {
         this.onClick(param1);
      }
      
      public function ___StartPage_RefObserve1_addedToStage(param1:Event) : void
      {
         this.onInit(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get list() : List
      {
         return this._3322014list;
      }
      
      public function set list(param1:List) : void
      {
         var _loc2_:Object = this._3322014list;
         if(_loc2_ !== param1)
         {
            this._3322014list = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"list",_loc2_,param1));
            }
         }
      }
   }
}

