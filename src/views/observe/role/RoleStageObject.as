package views.observe.role
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.geom.Point;
   import utils.FileUtils;
   import views.observe.role.frame.Frame;
   
   public class RoleStageObject extends StageObject
   {
      
      public var roleData:RoleData = new RoleData();
      
      public var bitmap:Bitmap = new Bitmap();
      
      public var sprite:Sprite = new Sprite();
      
      protected var _line:Sprite = new Sprite();
      
      protected var _frame:Frame;
      
      protected var _point:Point;
      
      public function RoleStageObject()
      {
         super();
         this.onInit();
         this.addChild(this.sprite);
         this.sprite.mouseEnabled = false;
         this._line = new Sprite();
         this.addChild(this._line);
         this._line.graphics.beginFill(65280);
         this._line.graphics.drawRect(0,0,100,1);
         this._line.graphics.drawRect(0,0,-100,1);
         this._line.graphics.drawRect(0,0,1,100);
         this._line.graphics.drawRect(0,0,1,-100);
         this._line.mouseEnabled = false;
      }
      
      public function onInit() : void
      {
         this.addChild(this.bitmap);
      }
      
      public function draw(param1:Frame, param2:Pool, param3:Number) : void
      {
         if(Boolean(param1) && param1 != this._frame)
         {
            FileUtils.playSound(App.projectFile.resolvePath("sound/" + param1.soundName + ".mp3"));
            this._frame = param1;
            this.bitmap.bitmapData = param2.getBitmapDataFormName(param1.name);
            this._point = param2.getFramePointFormName(param1.name);
         }
         if(this._frame)
         {
            this.bitmap.x = param2.getPx() - this._point.x + this._frame.gox + this._frame.nextGox * param3;
            this.bitmap.y = param2.getPy() - this._point.y + this._frame.goy + this._frame.nextGoy * param3;
         }
      }
      
      public function get frame() : Frame
      {
         return this._frame;
      }
      
      override public function onAttributeGroup() : void
      {
      }
   }
}

