package views.observe.role.frame
{
   public class EffectData
   {
      
      public var blow:Boolean = false;
      
      public var color:Array = [];
      
      public var addColor:uint;
      
      public var intensity:Number;
      
      public var srcColor:int = -1;
      
      public var isBreak:Boolean = false;
      
      public var isLaunch:Boolean = false;
      
      public var isLockActionShow:Boolean = false;
      
      public var isLockAction:Boolean = false;
      
      public var isABlow:Boolean = false;
      
      public var wFight:int = 0;
      
      public var mFight:int = 0;
      
      public var name:String = "";
      
      public var findName:String = "";
      
      public var x:int = 0;
      
      public var y:int = 0;
      
      public var scaleX:Number = 1;
      
      public var scaleY:Number = 1;
      
      public var rotation:int = 0;
      
      public var blendMode:String = "screen";
      
      public var gox:int = 0;
      
      public var goy:int = 0;
      
      public var time:int = 0;
      
      public var hitX:int = 0;
      
      public var hitY:int = 0;
      
      public var stiff:int = 30;
      
      public var isFollow:Boolean = false;
      
      public var cardFrame:int = 0;
      
      public var unhit:Boolean = false;
      
      public var atbottom:Boolean = false;
      
      public var fadeIn:Boolean = false;
      
      public var fadeOut:Boolean = false;
      
      public var hitVibrationSize:int = 0;
      
      public var hitEffectName:String = "";
      
      public var overrideClass:String = "";
      
      public var canHit:Boolean = false;
      
      public var hitMap:Boolean = false;
      
      public var through:Boolean = false;
      
      public function EffectData(param1:String)
      {
         super();
         this.name = param1;
      }
      
      public function getMoveX() : int
      {
         return (this.scaleX > 0 ? 1 : -1) * this.gox;
      }
      
      public function getMoveY() : int
      {
         return this.goy;
      }
      
      public function getSaveData() : String
      {
         return JSON.stringify(this);
      }
      
      public function initData(param1:Object) : void
      {
         var i:Object = null;
         var ob:Object = param1;
         for(i in ob)
         {
            try
            {
               this[i] = ob[i];
            }
            catch(e:Error)
            {
            }
         }
      }
   }
}

