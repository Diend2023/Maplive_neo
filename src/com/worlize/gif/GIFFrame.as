package com.worlize.gif
{
   import com.worlize.gif.events.AsyncDecodeErrorEvent;
   import com.worlize.gif.events.GIFDecoderEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.utils.ByteArray;
   
   public class GIFFrame extends EventDispatcher
   {
      
      public var bitmapData:BitmapData;
      
      public var gifData:ByteArray;
      
      public var top:uint;
      
      public var left:uint;
      
      public var width:uint;
      
      public var height:uint;
      
      public var backgroundColor:uint;
      
      public var backgroundColorIndex:uint;
      
      public var hasTransparency:Boolean;
      
      public var transparencyIndex:uint;
      
      public var delayMs:uint;
      
      public var disposalType:uint;
      
      public var frameNumber:uint;
      
      private var startTime:uint;
      
      private var loader:Loader;
      
      public function GIFFrame(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public function decode() : void
      {
         if(!this.loader)
         {
         }
         this.bitmapData = null;
         this.loader = new Loader();
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.handleLoaderComplete);
         this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.handleLoaderIOError);
         this.startTime = new Date().valueOf();
         this.loader.loadBytes(this.gifData);
      }
      
      public function abortDecode() : void
      {
         this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.handleLoaderComplete);
         this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.handleLoaderIOError);
      }
      
      protected function handleLoaderComplete(param1:Event) : void
      {
         var _loc2_:uint = uint(new Date().valueOf());
         this.gifData.clear();
         this.bitmapData = (this.loader.content as Bitmap).bitmapData;
         dispatchEvent(new GIFDecoderEvent(GIFDecoderEvent.DECODE_COMPLETE));
      }
      
      protected function handleLoaderIOError(param1:IOErrorEvent) : void
      {
         dispatchEvent(new AsyncDecodeErrorEvent(AsyncDecodeErrorEvent.ASYNC_DECODE_ERROR));
      }
   }
}

