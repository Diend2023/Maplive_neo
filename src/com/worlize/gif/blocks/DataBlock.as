package com.worlize.gif.blocks
{
   import com.worlize.gif.errors.OutOfDataError;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   
   public class DataBlock implements IGIFBlockCodec
   {
      
      public var blockSize:uint;
      
      public var bytes:ByteArray;
      
      public var isTerminator:Boolean = false;
      
      public function DataBlock()
      {
         super();
      }
      
      public static function decodeDataBlocks(param1:IDataInput) : ByteArray
      {
         var _loc3_:uint = 0;
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.endian = Endian.LITTLE_ENDIAN;
         while(param1.bytesAvailable !== 0)
         {
            _loc3_ = uint(param1.readUnsignedByte());
            if(_loc3_ > 0)
            {
               if(param1.bytesAvailable < _loc3_)
               {
                  throw new OutOfDataError("Out of data while reading data block.");
               }
               param1.readBytes(_loc2_,_loc2_.length,_loc3_);
            }
            if(_loc3_ <= 0)
            {
               return _loc2_;
            }
         }
         throw new OutOfDataError("Out of data while reading data block.");
      }
      
      public static function encodeDataBlocks(param1:ByteArray) : ByteArray
      {
         var _loc5_:int = 0;
         param1.position = 0;
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.endian = Endian.LITTLE_ENDIAN;
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = Math.min(_loc4_ - _loc3_,255);
            _loc2_.writeByte(_loc5_);
            _loc2_.writeBytes(param1,_loc3_,_loc5_);
            _loc3_ += _loc5_;
         }
         _loc2_.writeByte(0);
         return _loc2_;
      }
      
      public function decode(param1:IDataInput) : void
      {
         if(param1.bytesAvailable === 0)
         {
            throw new OutOfDataError("Out of data while reading data block.");
         }
         this.blockSize = param1.readUnsignedByte();
         this.bytes = new ByteArray();
         this.bytes.endian = Endian.LITTLE_ENDIAN;
         if(this.blockSize === 0)
         {
            this.isTerminator = true;
            return;
         }
         if(this.blockSize > 0)
         {
            if(param1.bytesAvailable < this.blockSize)
            {
               throw new OutOfDataError("Out of data while reading data block.");
            }
            param1.readBytes(this.bytes,0,this.blockSize);
         }
      }
      
      public function encode(param1:ByteArray = null) : ByteArray
      {
         if(param1 === null)
         {
            param1 = new ByteArray();
            param1.endian = Endian.LITTLE_ENDIAN;
         }
         if(this.isTerminator)
         {
            param1.writeByte(0);
            return param1;
         }
         if(this.bytes.length > 255)
         {
            throw new RangeError("Block size cannot exceed 255");
         }
         param1.writeByte(this.bytes.length);
         param1.writeBytes(this.bytes,0,this.bytes.length);
         return param1;
      }
      
      public function dispose() : void
      {
         if(this.bytes)
         {
            this.bytes.clear();
            this.bytes = null;
         }
      }
   }
}

