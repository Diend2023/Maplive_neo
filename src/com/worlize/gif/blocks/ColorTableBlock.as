package com.worlize.gif.blocks
{
   import com.worlize.gif.errors.OutOfDataError;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   
   public class ColorTableBlock implements IGIFBlockCodec
   {
      
      public var numColors:uint;
      
      public var table:Vector.<uint>;
      
      protected var cachedEncodedBytes:ByteArray;
      
      public function ColorTableBlock()
      {
         super();
      }
      
      public function decode(param1:IDataInput) : void
      {
         var _loc2_:int = 3 * this.numColors;
         if(param1.bytesAvailable < _loc2_)
         {
            throw new OutOfDataError("Out of data while decoding color table");
         }
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeByte(0);
         param1.readBytes(_loc3_,1,_loc2_);
         this.table = new Vector.<uint>(256);
         _loc3_.endian = Endian.BIG_ENDIAN;
         var _loc4_:uint = 0;
         while(_loc4_ < this.numColors)
         {
            --_loc3_.position;
            this.table[_loc4_] = _loc3_.readUnsignedInt() | 0xFF000000;
            _loc4_++;
         }
      }
      
      public function encode(param1:ByteArray = null) : ByteArray
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         if(!this.cachedEncodedBytes)
         {
            this.cachedEncodedBytes = new ByteArray();
            this.cachedEncodedBytes.endian = Endian.LITTLE_ENDIAN;
            _loc2_ = 0;
            while(_loc2_ < this.numColors)
            {
               _loc3_ = this.table[_loc2_];
               this.cachedEncodedBytes.writeByte((_loc3_ & 0xFF0000) >> 16);
               this.cachedEncodedBytes.writeByte((_loc3_ & 0xFF00) >> 8);
               this.cachedEncodedBytes.writeByte(_loc3_ & 0xFF);
               _loc2_++;
            }
         }
         if(param1 === null)
         {
            param1 = new ByteArray();
            param1.endian = Endian.LITTLE_ENDIAN;
         }
         param1.writeBytes(this.cachedEncodedBytes);
         return param1;
      }
      
      public function dispose() : void
      {
         if(this.cachedEncodedBytes)
         {
            this.cachedEncodedBytes.clear();
            this.cachedEncodedBytes = null;
         }
      }
   }
}

