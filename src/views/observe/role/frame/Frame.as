package views.observe.role.frame
{
   import flash.filesystem.File;
   import flash.geom.Point;
   import utils.FileUtils;
   import utils.PointUtils;
   import views.observe.role.EffectStageObject;
   
   public class Frame
   {
      
      public var group:FrameGroup;
      
      private var _effects:Array;
      
      public var nextGox:int = 0;
      
      public var nextGoy:int = 0;
      
      public var at:int = 0;
      
      public var data:XML;
      
      private var _hitPoint:Vector.<Point>;
      
      public var effectObjects:Vector.<EffectStageObject>;
      
      public function Frame(param1:XML)
      {
         super();
         this.effectObjects = new Vector.<EffectStageObject>();
         this.data = param1;
         if(param1.@effects != undefined && param1.@effects != "")
         {
            this._effects = JSON.parse(param1.@effects) as Array;
         }
         else
         {
            this._effects = [];
         }
         this._hitPoint = new Vector.<Point>();
         if(param1.@hitPoint != undefined && param1.@hitPoint != "")
         {
            PointUtils.setSaveData(this._hitPoint,param1.@hitPoint);
         }
         this.createEffect();
      }
      
      public static function parsingEffectSprite(param1:XMLList, param2:String) : void
      {
         var _loc5_:XML = null;
         var _loc6_:Boolean = false;
         var _loc7_:XMLList = null;
         var _loc8_:XML = null;
         var _loc9_:File = null;
         var _loc10_:XML = null;
         var _loc3_:String = "effect/" + param2;
         var _loc4_:File = App.projectFile.resolvePath(_loc3_ + ".xml");
         if(_loc4_.exists)
         {
            _loc5_ = <sprites/>;
            _loc5_.@path = _loc3_;
            _loc6_ = true;
            _loc7_ = param1.children();
            if(!cheakIsNewXml(_loc7_,_loc5_))
            {
               return;
            }
            param1.appendChild(_loc5_);
            _loc8_ = new XML(FileUtils.readString(_loc4_));
            if(_loc8_.@sound != undefined)
            {
               _loc9_ = App.projectFile.resolvePath("sound/" + _loc8_.@sound + ".mp3");
               if(_loc9_.exists)
               {
                  _loc10_ = <file/>;
                  _loc10_.@path = "sound/" + _loc8_.@sound + ".mp3";
                  if(cheakIsNewXml(param1.children(),_loc10_))
                  {
                     param1.appendChild(_loc10_);
                  }
               }
            }
         }
      }
      
      private static function cheakIsNewXml(param1:XMLList, param2:XML) : Boolean
      {
         var _loc3_:Object = null;
         for(_loc3_ in param1)
         {
            if(String(param1[_loc3_].@path) == String(param2.@path))
            {
               return false;
            }
         }
         return true;
      }
      
      public function set hitPoint(param1:Vector.<Point>) : void
      {
         if(!param1)
         {
            this._hitPoint.splice(0,this._hitPoint.length);
         }
         else
         {
            this._hitPoint = param1;
         }
         this.data.@hitPoint = PointUtils.getSaveData(this._hitPoint);
      }
      
      public function get hitPoint() : Vector.<Point>
      {
         return this._hitPoint;
      }
      
      public function get name() : String
      {
         return String(this.data.@name);
      }
      
      public function get soundName() : String
      {
         return String(this.data.@soundName);
      }
      
      public function set soundName(param1:String) : void
      {
         this.data.@soundName = param1;
      }
      
      public function get hitEffect() : int
      {
         return int(this.data.@hitEffect);
      }
      
      public function set hitEffect(param1:int) : void
      {
         this.data.@hitEffect = param1;
      }
      
      public function get hitInterval() : int
      {
         return int(this.data.@hitInterval);
      }
      
      public function set hitInterval(param1:int) : void
      {
         this.data.@hitInterval = param1;
      }
      
      public function get isHitMapGoOn() : Boolean
      {
         return String(this.data.@isHitMapGoOn) == "true";
      }
      
      public function set isHitMapGoOn(param1:Boolean) : void
      {
         this.data.@isHitMapGoOn = param1 ? "true" : "false";
      }
      
      public function get isGoPoint() : Boolean
      {
         return String(this.data.@isApplyGoPoint) == "true";
      }
      
      public function set isGoPoint(param1:Boolean) : void
      {
         this.data.@isApplyGoPoint = param1 ? "true" : "false";
      }
      
      public function get isStop() : Boolean
      {
         return String(this.data.@stop) == "stop";
      }
      
      public function set isStop(param1:Boolean) : void
      {
         this.data.@stop = !param1 ? "unstop" : "stop";
      }
      
      public function get gox() : int
      {
         return int(this.data.@gox);
      }
      
      public function set gox(param1:int) : void
      {
         this.data.@gox = param1;
      }
      
      public function get turn() : int
      {
         return int(this.data.@turn);
      }
      
      public function set turn(param1:int) : void
      {
         this.data.@turn = param1;
      }
      
      public function get hitX() : int
      {
         return int(this.data.@hitX);
      }
      
      public function set hitX(param1:int) : void
      {
         this.data.@hitX = param1;
      }
      
      public function get wEffFight() : int
      {
         var _loc2_:Object = null;
         var _loc3_:EffectStageObject = null;
         var _loc1_:int = 0;
         for(_loc2_ in this.effectObjects)
         {
            _loc3_ = this.effectObjects[_loc2_];
            _loc1_ += _loc3_.wFight;
         }
         return _loc1_;
      }
      
      public function get mEffFight() : int
      {
         var _loc2_:Object = null;
         var _loc3_:EffectStageObject = null;
         var _loc1_:int = 0;
         for(_loc2_ in this.effectObjects)
         {
            _loc3_ = this.effectObjects[_loc2_];
            _loc1_ += _loc3_.mFight;
         }
         return _loc1_;
      }
      
      public function get mFight() : int
      {
         return int(this.data.@mFight);
      }
      
      public function set mFight(param1:int) : void
      {
         this.data.@mFight = param1;
      }
      
      public function get wFight() : int
      {
         return int(this.data.@wFight);
      }
      
      public function set wFight(param1:int) : void
      {
         this.data.@wFight = param1;
      }
      
      public function get hitY() : int
      {
         return int(this.data.@hitY);
      }
      
      public function set hitY(param1:int) : void
      {
         this.data.@hitY = param1;
      }
      
      public function set golden(param1:Number) : void
      {
         this.data.@golden = param1;
      }
      
      public function get golden() : Number
      {
         return Number(this.data.@golden);
      }
      
      public function get straight() : int
      {
         return int(this.data.@straight);
      }
      
      public function set straight(param1:int) : void
      {
         this.data.@straight = param1;
      }
      
      public function set cardFrame(param1:int) : void
      {
         this.data.@cardFrame = param1;
      }
      
      public function get cardFrame() : int
      {
         return int(this.data.@cardFrame);
      }
      
      public function set vibrationSize(param1:int) : void
      {
         this.data.@vibrationSize = param1;
      }
      
      public function get vibrationSize() : int
      {
         return int(this.data.@vibrationSize);
      }
      
      public function set hitEffectName(param1:String) : void
      {
         this.data.@hitEffectName = param1;
      }
      
      public function get hitEffectName() : String
      {
         return String(this.data.@hitEffectName);
      }
      
      public function set mapVibrationSize(param1:int) : void
      {
         this.data.@mapVibrationSize = param1;
      }
      
      public function get mapVibrationSize() : int
      {
         return int(this.data.@mapVibrationSize);
      }
      
      public function set mapVibrationTime(param1:int) : void
      {
         this.data.@mapVibrationTime = param1;
      }
      
      public function get mapVibrationTime() : int
      {
         return int(this.data.@mapVibrationTime);
      }
      
      public function get goy() : int
      {
         return int(this.data.@goy);
      }
      
      public function set goy(param1:int) : void
      {
         this.data.@goy = param1;
      }
      
      public function get effects() : Array
      {
         return this._effects;
      }
      
      public function updateEffectConfig(param1:XMLList) : void
      {
         var _loc3_:Object = null;
         var _loc4_:XML = null;
         var _loc2_:Array = [];
         for(_loc3_ in this.effectObjects)
         {
            parsingEffectSprite(param1,this.effectObjects[_loc3_].data.name);
            parsingEffectSprite(param1,this.effectObjects[_loc3_].data.hitEffectName);
            _loc2_.push(this.effectObjects[_loc3_].data.getSaveData());
         }
         this.data.@effects = JSON.stringify(_loc2_);
         if(this.soundName != "undefined" && this.soundName != "")
         {
            _loc4_ = <file/>;
            _loc4_.@path = "sound/" + this.soundName + ".mp3";
            if(cheakIsNewXml(param1.children(),_loc4_))
            {
               param1.appendChild(_loc4_);
            }
         }
         if(this.hitEffectName != "" && this.hitEffectName != null)
         {
            parsingEffectSprite(param1,this.hitEffectName);
         }
      }
      
      public function createEffect() : void
      {
         var _loc1_:Object = null;
         var _loc2_:EffectStageObject = null;
         if(this._effects.length > 0)
         {
            for(_loc1_ in this._effects)
            {
               _loc2_ = new EffectStageObject(JSON.parse(this._effects[_loc1_]));
               this.addEffect(_loc2_);
            }
         }
      }
      
      public function clearAllEffect() : void
      {
         var _loc1_:int = int(this.effectObjects.length - 1);
         while(_loc1_ >= 0)
         {
            this.removeEffect(this.effectObjects[_loc1_]);
            _loc1_--;
         }
      }
      
      public function drawEffect(param1:Frame, param2:Number) : void
      {
         var _loc3_:Object = null;
         for(_loc3_ in this.effectObjects)
         {
            this.effectObjects[_loc3_].draw(param1,param2);
         }
      }
      
      public function addEffect(param1:EffectStageObject) : void
      {
         param1.frame = this;
         this.effectObjects.push(param1);
      }
      
      public function removeEffect(param1:EffectStageObject) : void
      {
         this.effectObjects.removeAt(this.effectObjects.indexOf(param1));
         if(param1.parent)
         {
            param1.parent.removeChild(param1);
         }
      }
   }
}

