package views
{
   import flash.events.KeyboardEvent;
   import flash.filesystem.File;
   import mx.managers.PopUpManager;
   import spark.components.NavigatorContent;
   
   public class RefObserve extends NavigatorContent
   {
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      protected var _change:Boolean = false;
      
      public var file:File;
      
      public function RefObserve()
      {
         super();
      }
      
      public function readFile(param1:File) : void
      {
         this.file = param1;
      }
      
      public function onChange() : void
      {
         if(!this._change)
         {
            this._change = true;
            this.label = this.file.name + " *";
         }
      }
      
      public function get isChange() : Boolean
      {
         return this._change;
      }
      
      public function onSave() : void
      {
         if(!this.file)
         {
            return;
         }
         PopUpManager.addPopUp(new TipsMessage("保存成功！"),this);
         this._change = false;
         this.label = this.file.name;
      }
      
      public function onFrame() : void
      {
      }
      
      public function onRefresh() : void
      {
      }
      
      public function getName() : String
      {
         return this.file.name;
      }
      
      public function onKeyDown(param1:KeyboardEvent) : void
      {
      }
      
      public function onKeyUp(param1:KeyboardEvent) : void
      {
      }
      
      public function discarded() : void
      {
      }
   }
}

