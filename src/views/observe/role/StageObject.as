package views.observe.role
{
   import flash.display.Sprite;
   
   public class StageObject extends Sprite
   {
      
      protected var _selectSpr:Sprite;
      
      public function StageObject()
      {
         super();
         this._selectSpr = new Sprite();
         this._selectSpr.mouseEnabled = false;
         this.addChild(this._selectSpr);
      }
      
      public function select(param1:Boolean) : void
      {
         this._selectSpr.graphics.clear();
         if(param1)
         {
         }
      }
      
      public function onAttributeGroup() : void
      {
      }
   }
}

