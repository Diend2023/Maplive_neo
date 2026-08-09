package views.observe.role.frame
{
   import views.observe.role.EffectStageObject;
   
   public class FrameGroup
   {
      
      public var name:String;
      
      public var frames:Vector.<Frame>;
      
      private var _fps:int = -1;
      
      public var data:XML;
      
      public function FrameGroup(param1:XML, param2:int)
      {
         var _loc4_:Frame = null;
         var _loc5_:Object = null;
         var _loc6_:Frame = null;
         super();
         this.data = param1;
         this.name = param1.@name;
         this.frames = new Vector.<Frame>();
         var _loc3_:XMLList = param1.children();
         if(param1.@fps != undefined)
         {
            this._fps = int(param1.@fps);
         }
         if(this._fps == -1 && param2 > 0)
         {
            this._fps = param2;
         }
         for(_loc5_ in _loc3_)
         {
            _loc6_ = new Frame(_loc3_[_loc5_]);
            _loc6_.group = this;
            this.frames.push(_loc6_);
            _loc6_.at = int(_loc5_);
            if(_loc4_)
            {
               _loc4_.nextGox = _loc6_.gox - _loc4_.gox;
               _loc4_.nextGoy = _loc6_.goy - _loc4_.goy;
            }
            _loc4_ = _loc6_;
         }
      }
      
      public function getRoleScaleX(param1:int) : int
      {
         var _loc2_:* = false;
         var _loc3_:int = param1;
         while(_loc3_ >= 0)
         {
            if(this.frames[_loc3_].turn == 1)
            {
               _loc2_ = !_loc2_;
            }
            _loc3_--;
         }
         return _loc2_ ? -1 : 1;
      }
      
      public function set fps(param1:int) : void
      {
         this._fps = param1;
         this.data.@fps = param1;
      }
      
      public function get fps() : int
      {
         return this._fps;
      }
      
      public function add(param1:Frame, param2:int) : void
      {
         this.frames.splice(param2,0,param1);
         if(this.data.children().length() == 0)
         {
            this.data.appendChild(param1.data);
         }
         else
         {
            this.data.insertChildAfter(this.data.children()[param2 - 1],param1.data);
         }
         this.math();
      }
      
      public function remove(param1:int) : void
      {
         if(this.frames.length > param1)
         {
            this.frames.splice(param1,1);
            delete this.data.children()[param1];
            this.math();
         }
      }
      
      public function updateFrames(param1:XMLList) : void
      {
         var _loc2_:Object = null;
         for(_loc2_ in this.frames)
         {
            this.frames[_loc2_].updateEffectConfig(param1);
         }
      }
      
      public function math() : void
      {
         var _loc5_:Frame = null;
         var _loc7_:Object = null;
         var _loc8_:Frame = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Frame = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Vector.<Frame> = new Vector.<Frame>();
         var _loc6_:int = 0;
         while(_loc6_ < this.frames.length)
         {
            _loc8_ = this.frames[_loc6_];
            _loc8_.at = _loc6_;
            if(_loc8_.isGoPoint)
            {
               _loc9_ = int(_loc4_.length);
               _loc10_ = 0;
               _loc11_ = 0;
               if(_loc5_)
               {
                  _loc10_ = (_loc8_.gox - _loc5_.gox) / (_loc9_ + 1);
                  _loc11_ = (_loc8_.goy - _loc5_.goy) / (_loc9_ + 1);
               }
               else
               {
                  _loc10_ = _loc8_.gox / (_loc9_ + 1);
                  _loc11_ = _loc8_.goy / (_loc9_ + 1);
               }
               _loc12_ = 0;
               while(_loc12_ < _loc9_)
               {
                  _loc13_ = _loc4_[_loc12_];
                  _loc2_ += _loc10_;
                  _loc3_ += _loc11_;
                  _loc13_.gox = _loc2_;
                  _loc13_.goy = _loc3_;
                  _loc12_++;
               }
               _loc2_ = _loc8_.gox;
               _loc3_ = _loc8_.goy;
               _loc4_.splice(0,_loc4_.length);
               _loc5_ = _loc8_;
            }
            else
            {
               _loc4_.push(_loc8_);
            }
            _loc6_++;
         }
         this.mathEnd();
         for(_loc7_ in _loc4_)
         {
            _loc4_[_loc7_].gox = _loc2_;
            _loc4_[_loc7_].goy = _loc3_;
         }
         _loc4_.splice(0,_loc4_.length);
      }
      
      private function mathEnd() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Frame = null;
         var _loc3_:Frame = null;
         for(_loc1_ in this.frames)
         {
            _loc3_ = this.frames[_loc1_];
            if(_loc2_)
            {
               _loc2_.nextGox = _loc3_.gox - _loc2_.gox;
               _loc2_.nextGoy = _loc3_.goy - _loc2_.goy;
            }
            _loc2_ = _loc3_;
         }
      }
      
      public function getGPUMenemy(param1:int = 4) : int
      {
         var _loc5_:Vector.<EffectStageObject> = null;
         var _loc6_:Object = null;
         var _loc2_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < this.frames.length)
         {
            _loc5_ = this.frames[_loc4_].effectObjects;
            for(_loc6_ in _loc5_)
            {
               if(_loc3_.indexOf(_loc5_[_loc6_].data.name) == -1)
               {
                  _loc3_.push(_loc5_[_loc6_].data.name);
                  _loc2_ += mathGPU(_loc5_[_loc6_].bitmapData,param1);
               }
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function removeAction() : void
      {
         var _loc1_:int = int(this.data.childIndex());
         var _loc2_:XMLList = this.data.parent().children();
         delete _loc2_[_loc1_];
      }
   }
}

