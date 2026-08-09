package views
{
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal; //
   import mx.events.FlexEvent;
   import spark.components.Panel;
   
   public class AlertRef extends Panel
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var back:Function;
      
      public function AlertRef()
      {
         super();
         mx_internal::_document = this;
         this.width = 400;
         this.height = 300;
         this.addEventListener("initialize",this.___AlertRef_Panel1_initialize);
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
      
      public function onInit() : void
      {
         this.x = this.stage.stageWidth / 2 - this.width / 2;
         this.y = this.stage.stageHeight / 2 - this.height / 2;
      }
      
      public function ___AlertRef_Panel1_initialize(param1:FlexEvent) : void
      {
         this.onInit();
      }
   }
}

