package com.worlize.gif
{
   import com.worlize.gif.blocks.ApplicationExtension;
   import com.worlize.gif.blocks.ColorTableBlock;
   import com.worlize.gif.blocks.CommentExtension;
   import com.worlize.gif.blocks.GraphicControlExtension;
   import com.worlize.gif.blocks.HeaderBlock;
   import com.worlize.gif.blocks.IGIFBlockCodec;
   import com.worlize.gif.blocks.ImageDataBlock;
   import com.worlize.gif.blocks.ImageDescriptorBlock;
   import com.worlize.gif.blocks.LogicalScreenDescriptorBlock;
   import com.worlize.gif.blocks.NetscapeExtension;
   import com.worlize.gif.blocks.PlainTextExtension;
   import com.worlize.gif.blocks.TrailerBlock;
   import com.worlize.gif.constants.BlockType;
   import com.worlize.gif.constants.DefaultPalette;
   import com.worlize.gif.constants.DisposalType;
   import com.worlize.gif.errors.FileTypeError;
   import com.worlize.gif.errors.OutOfDataError;
   import com.worlize.gif.events.AsyncDecodeErrorEvent;
   import com.worlize.gif.events.GIFDecoderEvent;
   import flash.display.BitmapData;
   import flash.events.EventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class GIFDecoder extends EventDispatcher
   {
      
      protected var data:ByteArray;
      
      protected var header:HeaderBlock;
      
      protected var lsd:LogicalScreenDescriptorBlock;
      
      protected var graphicControlExtension:GraphicControlExtension;
      
      protected var globalColorTable:ColorTableBlock;
      
      protected var fallbackColorTable:ColorTableBlock;
      
      protected var activeColorTable:ColorTableBlock;
      
      public var width:uint;
      
      public var height:uint;
      
      public var backgroundColor:uint = 4294967295;
      
      public var loopCount:uint = 1;
      
      public var frameDecodedCount:uint = 0;
      
      public var framesToDecode:uint = 0;
      
      public var frames:Vector.<GIFFrame>;
      
      private var startTime:uint;
      
      public var totalDecodeTime:uint;
      
      public var blockingDecodeTime:uint;
      
      private var _hasError:Boolean = false;
      
      protected var blockSequence:Vector.<IGIFBlockCodec>;
      
      public function GIFDecoder()
      {
         super();
      }
      
      public function get hasError() : Boolean
      {
         return this._hasError;
      }
      
      public function decodeBytes(param1:ByteArray) : void
      {
         var endTime:uint;
         var errorEvent:AsyncDecodeErrorEvent = null;
         var inputData:ByteArray = param1;
         this.startTime = new Date().valueOf();
         this.data = inputData;
         this.data.endian = Endian.LITTLE_ENDIAN;
         this.blockSequence = new Vector.<IGIFBlockCodec>();
         this.frames = new Vector.<GIFFrame>();
         this.framesToDecode = 0;
         try
         {
            this.readMetadata();
            this.readContents();
         }
         catch(e:Error)
         {
            abortDecode();
            _hasError = true;
            errorEvent = new AsyncDecodeErrorEvent(AsyncDecodeErrorEvent.ASYNC_DECODE_ERROR);
            errorEvent.text = e.message;
            dispatchEvent(errorEvent);
            return;
         }
         endTime = uint(new Date().valueOf());
         this.blockingDecodeTime = endTime - this.startTime;
      }
      
      public function cleanup() : void
      {
         this.data.clear();
         this.data = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.blockSequence.length)
         {
            this.blockSequence[_loc1_].dispose();
            _loc1_++;
         }
      }
      
      private function readMetadata() : void
      {
         this.header = new HeaderBlock();
         this.header.decode(this.data);
         this.blockSequence.push(this.header);
         this.lsd = new LogicalScreenDescriptorBlock();
         this.lsd.decode(this.data);
         this.width = this.lsd.width;
         this.height = this.lsd.height;
         this.blockSequence.push(this.lsd);
         if(this.lsd.hasgct)
         {
            this.globalColorTable = new ColorTableBlock();
            this.globalColorTable.numColors = this.lsd.gctNumColors;
            this.globalColorTable.decode(this.data);
            this.blockSequence.push(this.globalColorTable);
            this.backgroundColor = this.globalColorTable.table[this.lsd.backgroundColorIndex];
         }
         else
         {
            this.fallbackColorTable = new ColorTableBlock();
            this.fallbackColorTable.numColors = 256;
            this.fallbackColorTable.table = DefaultPalette.WINDOWS;
         }
      }
      
      private function readContents() : void
      {
         var _loc2_:uint = 0;
         var _loc1_:Boolean = false;
         while(!_loc1_)
         {
            if(this.data.bytesAvailable < 1)
            {
               throw new OutOfDataError("Out of data while looking for next block.");
            }
            _loc2_ = this.data.readUnsignedByte();
            switch(_loc2_)
            {
               case BlockType.EXTENSION:
                  this.decodeExtension();
                  break;
               case BlockType.IMAGE_DESCRIPTOR:
                  this.decodeImage();
                  break;
               case BlockType.TRAILER:
                  this.blockSequence.push(new TrailerBlock());
                  _loc1_ = true;
                  break;
               default:
                  throw new FileTypeError("Invalid data encountered while decoding GIF stream.");
            }
         }
      }
      
      private function decodeExtension() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:CommentExtension = null;
         var _loc3_:PlainTextExtension = null;
         if(this.data.bytesAvailable < 1)
         {
            throw new OutOfDataError("Out of data while trying to read extension");
         }
         _loc1_ = this.data.readUnsignedByte();
         switch(_loc1_)
         {
            case BlockType.APPLICATION_EXT:
               this.decodeAppExtension();
               break;
            case BlockType.GRAPHIC_CONTROL_EXT:
               this.graphicControlExtension = new GraphicControlExtension();
               this.graphicControlExtension.decode(this.data);
               this.blockSequence.push(this.graphicControlExtension);
               break;
            case BlockType.COMMENT_EXT:
               _loc2_ = new CommentExtension();
               _loc2_.decode(this.data);
               this.blockSequence.push(_loc2_);
               break;
            case BlockType.PLAIN_TEXT_EXT:
               _loc3_ = new PlainTextExtension();
               _loc3_.decode(this.data);
               this.blockSequence.push(_loc2_);
               break;
            default:
               throw new FileTypeError("Invalid GIF data - invalid extension type encountered.");
         }
      }
      
      private function decodeAppExtension() : void
      {
         var _loc2_:NetscapeExtension = null;
         var _loc1_:ApplicationExtension = new ApplicationExtension();
         _loc1_.decode(this.data);
         if(_loc1_.appIdentifier === NetscapeExtension.APP_IDENTIFIER && _loc1_.appAuthCode === NetscapeExtension.APP_AUTH_CODE)
         {
            _loc2_ = new NetscapeExtension();
            _loc2_.decodeFromApplicationExtension(_loc1_);
            this.blockSequence.push(_loc2_);
            this.loopCount = _loc2_.loopCount;
         }
         else
         {
            this.blockSequence.push(_loc1_);
         }
      }
      
      private function decodeImage() : void
      {
         var _loc3_:ColorTableBlock = null;
         var _loc1_:ImageDescriptorBlock = new ImageDescriptorBlock();
         _loc1_.decode(this.data);
         this.blockSequence.push(_loc1_);
         if(_loc1_.haslct)
         {
            _loc3_ = new ColorTableBlock();
            _loc3_.numColors = _loc1_.lctNumColors;
            _loc3_.decode(this.data);
            this.blockSequence.push(_loc3_);
            this.activeColorTable = _loc3_;
         }
         else if(this.globalColorTable)
         {
            this.activeColorTable = this.globalColorTable;
         }
         else
         {
            this.activeColorTable = this.fallbackColorTable;
         }
         var _loc2_:ImageDataBlock = new ImageDataBlock();
         _loc2_.decode(this.data);
         this.blockSequence.push(_loc2_);
         this.frames.push(this.buildFrame(_loc1_,_loc2_));
         this.graphicControlExtension = null;
      }
      
      private function buildFrame(param1:ImageDescriptorBlock, param2:ImageDataBlock) : GIFFrame
      {
         var _loc8_:GraphicControlExtension = null;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         this.header.encode(_loc3_);
         var _loc4_:LogicalScreenDescriptorBlock = new LogicalScreenDescriptorBlock();
         _loc4_.pixelAspect = this.lsd.pixelAspect;
         _loc4_.width = param1.width;
         _loc4_.height = param1.height;
         _loc4_.backgroundColorIndex = this.lsd.backgroundColorIndex;
         _loc4_.gctColorResolution = this.lsd.gctColorResolution;
         _loc4_.gctNumColors = this.activeColorTable.numColors;
         _loc4_.hasgct = true;
         _loc4_.gctSorted = false;
         _loc4_.encode(_loc3_);
         this.activeColorTable.encode(_loc3_);
         if(this.graphicControlExtension)
         {
            _loc8_ = new GraphicControlExtension();
            _loc8_.delayTime = 0;
            _loc8_.userInputExpected = false;
            _loc8_.disposalMethod = this.graphicControlExtension.disposalMethod;
            _loc8_.hasTransparency = this.graphicControlExtension.hasTransparency;
            _loc8_.transparencyIndex = this.graphicControlExtension.transparencyIndex;
            _loc8_.encode(_loc3_);
         }
         var _loc5_:ImageDescriptorBlock = new ImageDescriptorBlock();
         _loc5_.haslct = false;
         _loc5_.lctNumColors = 2;
         _loc5_.lctSorted = false;
         _loc5_.width = param1.width;
         _loc5_.height = param1.height;
         _loc5_.offsetLeft = 0;
         _loc5_.offsetTop = 0;
         _loc5_.reserved = 0;
         _loc5_.interlaced = param1.interlaced;
         _loc5_.encode(_loc3_);
         param2.encode(_loc3_);
         var _loc6_:TrailerBlock = new TrailerBlock();
         _loc6_.encode(_loc3_);
         _loc3_.position = 0;
         var _loc7_:GIFFrame = new GIFFrame();
         _loc7_.gifData = _loc3_;
         _loc7_.left = param1.offsetLeft;
         _loc7_.top = param1.offsetTop;
         _loc7_.width = param1.width;
         _loc7_.height = param1.height;
         _loc7_.backgroundColor = this.activeColorTable.table[_loc4_.backgroundColorIndex];
         _loc7_.backgroundColorIndex = _loc4_.backgroundColorIndex;
         if(this.graphicControlExtension)
         {
            _loc7_.delayMs = this.graphicControlExtension.delayTime * 10;
            _loc7_.disposalType = this.graphicControlExtension.disposalMethod;
            _loc7_.hasTransparency = this.graphicControlExtension.hasTransparency;
            _loc7_.transparencyIndex = this.graphicControlExtension.transparencyIndex;
         }
         else
         {
            _loc7_.hasTransparency = false;
            _loc7_.transparencyIndex = 0;
            _loc7_.delayMs = 42;
            _loc7_.disposalType = DisposalType.RESTORE_BACKGROUND_COLOR;
         }
         ++this.framesToDecode;
         _loc7_.addEventListener(GIFDecoderEvent.DECODE_COMPLETE,this.handleFrameDecodeComplete);
         _loc7_.addEventListener(AsyncDecodeErrorEvent.ASYNC_DECODE_ERROR,this.handleFrameAsyncDecodeError);
         _loc7_.decode();
         return _loc7_;
      }
      
      protected function renderCompositedFrames() : void
      {
         var _loc4_:GIFFrame = null;
         var _loc5_:GIFFrame = null;
         var _loc6_:GIFFrame = null;
         var _loc9_:BitmapData = null;
         var _loc10_:BitmapData = null;
         var _loc11_:uint = 0;
         var _loc12_:Rectangle = null;
         var _loc13_:uint = 0;
         var _loc14_:GIFFrame = null;
         var _loc1_:uint = uint(new Date().valueOf());
         var _loc2_:uint = this.width;
         var _loc3_:uint = this.height;
         var _loc7_:uint = 0;
         while(_loc7_ < this.framesToDecode)
         {
            _loc4_ = this.frames[_loc7_];
            _loc9_ = _loc4_.bitmapData;
            _loc10_ = new BitmapData(_loc2_,_loc3_,true,16777215);
            if(_loc5_ !== null)
            {
               _loc10_.copyPixels(_loc5_.bitmapData,new Rectangle(0,0,_loc2_,_loc3_),new Point(0,0));
               _loc13_ = _loc5_.disposalType;
               if(_loc13_ === DisposalType.RESTORE_TO_PREVIOUS && _loc6_ === null || _loc13_ === DisposalType.RESTORE_BACKGROUND_COLOR)
               {
                  _loc11_ = _loc5_.backgroundColor;
                  _loc11_ = uint(_loc11_ & 0xFFFFFF);
                  _loc12_ = new Rectangle(_loc5_.left,_loc5_.top,_loc5_.width,_loc5_.height);
                  _loc10_.fillRect(_loc12_,_loc11_);
               }
               else if(_loc13_ === DisposalType.NO_DISPOSAL || _loc13_ == DisposalType.DO_NOT_DISPOSE)
               {
                  _loc6_ = _loc5_;
               }
               else if(_loc13_ === DisposalType.RESTORE_TO_PREVIOUS && _loc7_ >= 1)
               {
                  _loc14_ = _loc6_;
                  _loc12_ = new Rectangle(_loc5_.left,_loc5_.top,_loc5_.width,_loc5_.height);
                  _loc10_.copyPixels(_loc14_.bitmapData,_loc12_,new Point(_loc5_.left,_loc5_.top));
               }
            }
            _loc12_ = new Rectangle(0,0,_loc4_.width,_loc4_.height);
            _loc10_.copyPixels(_loc4_.bitmapData,_loc12_,new Point(_loc4_.left,_loc4_.top),null,null,true);
            _loc4_.bitmapData.dispose();
            _loc4_.bitmapData = _loc10_;
            _loc5_ = _loc4_;
            _loc7_++;
         }
         var _loc8_:uint = uint(new Date().valueOf());
         this.blockingDecodeTime += _loc8_ - _loc1_;
      }
      
      public function encode() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         var _loc2_:int = 0;
         var _loc3_:int = int(this.blockSequence.length);
         while(_loc2_ < _loc3_)
         {
            this.blockSequence[_loc2_].encode(_loc1_);
            _loc2_++;
         }
         _loc1_.position = 0;
         return _loc1_;
      }
      
      protected function handleFrameDecodeComplete(param1:GIFDecoderEvent) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:GIFDecoderEvent = null;
         ++this.frameDecodedCount;
         if(this.frameDecodedCount === this.framesToDecode && !this._hasError)
         {
            this.renderCompositedFrames();
            _loc2_ = uint(new Date().valueOf());
            this.totalDecodeTime = _loc2_ - this.startTime;
            _loc3_ = new GIFDecoderEvent(GIFDecoderEvent.DECODE_COMPLETE);
            dispatchEvent(_loc3_);
         }
      }
      
      protected function handleFrameAsyncDecodeError(param1:AsyncDecodeErrorEvent) : void
      {
         this.abortDecode();
         var _loc2_:AsyncDecodeErrorEvent = new AsyncDecodeErrorEvent(AsyncDecodeErrorEvent.ASYNC_DECODE_ERROR);
         _loc2_.text = "An error was encountered while Flash was decoding an image frame.";
         dispatchEvent(_loc2_);
      }
      
      protected function abortDecode() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this.frames.length);
         while(_loc1_ < _loc2_)
         {
            this.frames[_loc1_].abortDecode();
            _loc1_++;
         }
         this.cleanup();
      }
   }
}

