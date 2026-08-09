package skins
{
   import button.ButtonBarBase;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal; //
   import mx.events.PropertyChangeEvent;
   
   public class TabBarSkinInnerClass0 extends ButtonBarBase
   {

      use namespace mx_internal; //
      
      private var _88844982outerDocument:TabBarSkin;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function TabBarSkinInnerClass0()
      {
         super();
         mx_internal::_document = this;
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
      
      [Bindable(event="propertyChange")]
      public function get outerDocument() : TabBarSkin
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:TabBarSkin) : void
      {
         var _loc2_:Object = this._88844982outerDocument;
         if(_loc2_ !== param1)
         {
            this._88844982outerDocument = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outerDocument",_loc2_,param1));
            }
         }
      }
   }
}

