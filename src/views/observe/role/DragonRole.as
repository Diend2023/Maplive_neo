package views.observe.role
{
   import dragonBones.flash.FlashArmatureDisplay;
   import views.observe.role.frame.Frame;
   
   public class DragonRole extends RoleStageObject
   {
      
      private var _dragon:FlashArmatureDisplay;
      
      public function DragonRole()
      {
         super();
      }
      
      override public function onInit() : void
      {
      }
      
      override public function draw(param1:Frame, param2:Pool, param3:Number) : void
      {
         if(param1)
         {
            _frame = param1;
            if(this._dragon.animation.lastAnimationName != param1.group.name)
            {
               this._dragon.animation.play(param1.group.name);
            }
            this._dragon.animation.lastAnimationState.currentTime = param1.at / param1.group.frames.length * (param1.group.frames.length / 24);
            this._dragon.armature.advanceTime(0);
         }
         if(_frame)
         {
            this._dragon.x = param2.getPx() + _frame.gox + _frame.nextGox * param3;
            this._dragon.y = param2.getPy() + _frame.goy + _frame.nextGoy * param3;
         }
      }
      
      public function pushDisplay(param1:FlashArmatureDisplay) : void
      {
         if(this._dragon)
         {
            this._dragon.parent.removeChild(this._dragon);
         }
         this._dragon = param1;
         this.addChild(this._dragon);
      }
   }
}

