package views
{
   import flash.utils.setTimeout;
   import mx.controls.Label;
   import spark.components.Group;
   
   public class TipsMessage extends Group
   {
      
      private var _msg:String;
      
      public function TipsMessage(param1:String)
      {
         super();
         this._msg = param1;
      }
      
      override public function initialize() : void
      {
         var text:Label;
         var remove:TipsMessage = null;
         super.initialize();
         this.width = 200;
         this.height = 32;
         this.width = stage.nativeWindow.width;
         this.height = 100;
         text = new Label();
         this.addElement(text);
         text.text = this._msg;
         text.width = 200;
         text.height = 32;
         text.right = 5;
         text.top = 5;
         text.setStyle("color",16776960);
         remove = this;
         setTimeout(function():void
         {
            parent.removeChild(remove);
         },1500);
      }
   }
}

