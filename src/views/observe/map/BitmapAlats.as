package views.observe.map
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.filesystem.File;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import utils.FileUtils;
   
   public class BitmapAlats
   {
      
      private var _xml:XML;
      
      private var _bitmapData:BitmapData;
      
      private var _dict:Dictionary;
      
      public var back:Function;
      
      public function BitmapAlats(param1:String)
      {
         super();
         this._dict = new Dictionary();
         this._xml = XML(FileUtils.readString(new File(param1)));
         var _loc2_:Loader = new Loader();
         _loc2_.load(new URLRequest(param1.replace(".xml",".png")));
         _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onComplete);
      }
      
      private function onComplete(param1:Event) : void
      {
         var _loc2_:XMLList = null;
         var _loc3_:Object = null;
         var _loc4_:BitmapData = null;
         this._bitmapData = ((param1.target as LoaderInfo).content as Bitmap).bitmapData;
         if(this._xml)
         {
            _loc2_ = this._xml.children();
            for(_loc3_ in _loc2_)
            {
               _loc4_ = new BitmapData(_loc2_[_loc3_].@width,_loc2_[_loc3_].@height,true,0);
               _loc4_.copyPixels(this._bitmapData,new Rectangle(_loc2_[_loc3_].@x,_loc2_[_loc3_].@y,_loc2_[_loc3_].@width,_loc2_[_loc3_].@height),new Point());
               this._dict[String(_loc2_[_loc3_].@name)] = _loc4_;
            }
         }
         if(this.back != null)
         {
            this.back(true);
         }
      }
      
      public function getBitmapData(param1:String) : BitmapData
      {
         var _loc2_:Object = null;
         for(_loc2_ in this._dict)
         {
            if((_loc2_ as String).indexOf(param1) == 0)
            {
               return this._dict[_loc2_];
            }
         }
         return null;
      }
   }
}

