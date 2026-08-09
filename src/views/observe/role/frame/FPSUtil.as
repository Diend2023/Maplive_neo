package views.observe.role.frame
{
   import flash.utils.getTimer;
   
   public class FPSUtil
   {
      
      private var _fps:int;
      
      private var _fpsTime:Number;
      
      private var _currentTime:Number;
      
      private var _lastFrameTimestamp:Number;
      
      private var _pause:Boolean = false;
      
      public function FPSUtil(param1:int)
      {
         super();
         this.fps = param1;
      }
      
      public function get fps() : int
      {
         return this._fps;
      }
      
      public function set fps(param1:int) : void
      {
         this._fps = param1;
         this._fpsTime = 1000 / this._fps * 0.001;
         this._currentTime = 0;
         this._lastFrameTimestamp = getTimer() / 1000;
      }
      
      public function get currentTimeScale() : Number
      {
         return this._currentTime / this._fpsTime;
      }
      
      public function update() : Boolean
      {
         if(this._pause)
         {
            return false;
         }
         var _loc1_:Number = getTimer() / 1000;
         var _loc2_:Number = _loc1_ - this._lastFrameTimestamp;
         this._lastFrameTimestamp = _loc1_;
         this._currentTime += _loc2_;
         if(this._currentTime >= this._fpsTime)
         {
            this._currentTime -= this._fpsTime;
            if(this._currentTime > this._fpsTime)
            {
               this._currentTime = 0;
            }
            return true;
         }
         return false;
      }
      
      public function pause() : void
      {
         this._pause = true;
      }
      
      public function resume() : void
      {
         this._pause = false;
      }
   }
}

