package views.observe.role.frame
{
   import flash.display.NativeMenuItem;
   import flash.display.Sprite;
   import utils.RightUtils;
   
   public class FrameSprite extends Sprite
   {
      
      public var id:int = 0;
      
      public var frame:Frame;
      
      public function FrameSprite()
      {
         super();
         RightUtils.onRightClick(this,"frame");
      }
      
      public function draw() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(16777215,0);
         this.graphics.drawRect(0,0,8,120);
         this.graphics.beginFill(12303291,0.8);
         this.graphics.drawRect(1,1,6,30);
         this.graphics.beginFill(this.isEffect() ? 65535 : 12303291,0.8);
         this.graphics.drawRect(1,33,6,16);
         this.graphics.beginFill(this.isStop() ? 16776960 : 12303291,0.8);
         this.graphics.drawRect(1,51,6,16);
         this.graphics.beginFill(this.isSound() ? 255 : 12303291,0.8);
         this.graphics.drawRect(1,69,6,16);
         this.graphics.beginFill(this.isHit() ? 16711680 : 12303291,0.8);
         this.graphics.drawRect(1,87,6,16);
         this.graphics.beginFill(this.isMove() ? 16711935 : 12303291,0.8);
         this.graphics.drawRect(1,105,6,16);
         this.graphics.endFill();
      }
      
      public function isHit() : Boolean
      {
         return Boolean(this.frame.hitPoint) && this.frame.hitPoint.length > 2;
      }
      
      public function isEffect() : Boolean
      {
         return Boolean(this.frame.effectObjects) && this.frame.effectObjects.length > 0;
      }
      
      public function isStop() : Boolean
      {
         return this.frame.isStop;
      }
      
      public function isSound() : Boolean
      {
         return this.frame.soundName != "";
      }
      
      public function isMove() : Boolean
      {
         return this.frame.isGoPoint;
      }
      
      public function updateMenu() : void
      {
         (this.contextMenu.items[1] as NativeMenuItem).enabled = this.isEffect();
         (this.contextMenu.items[2] as NativeMenuItem).enabled = this.isStop();
         (this.contextMenu.items[3] as NativeMenuItem).enabled = this.isSound();
         (this.contextMenu.items[4] as NativeMenuItem).enabled = this.isHit();
         (this.contextMenu.items[5] as NativeMenuItem).enabled = this.isMove();
      }
      
      public function select(param1:Boolean) : void
      {
         if(param1)
         {
            this.draw();
            this.graphics.beginFill(16777215,0.5);
            this.graphics.drawRect(0,0,8,120);
            this.graphics.endFill();
         }
         else
         {
            this.draw();
         }
      }
   }
}

