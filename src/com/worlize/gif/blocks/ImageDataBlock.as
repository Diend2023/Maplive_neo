package com.worlize.gif.blocks
{
   import com.worlize.gif.errors.FileTypeError;
   import com.worlize.gif.errors.OutOfDataError;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   
   public class ImageDataBlock implements IGIFBlockCodec
   {
      
      public var bytes:ByteArray;
      
      public var lzwMinCodeSize:uint;
      
      public function ImageDataBlock()
      {
         super();
      }
      
      public function decode(param1:IDataInput) : void
      {
         var stream:IDataInput = param1;
         if(stream.bytesAvailable < 1)
         {
            throw new OutOfDataError("Out of data while reading image data block LZW minimum code size.");
         }
         this.lzwMinCodeSize = stream.readUnsignedByte();
         if(this.lzwMinCodeSize < 2 || this.lzwMinCodeSize > 8)
         {
            throw new FileTypeError("Invalid GIF Data: LZW minimum code size is out of bounds.");
         }
         try
         {
            this.bytes = DataBlock.decodeDataBlocks(stream);
         }
         catch(e:OutOfDataError)
         {
            throw new OutOfDataError("Out of data while reading image data.");
         }
      }
      
      public function encode(param1:ByteArray = null) : ByteArray
      {
         if(param1 === null)
         {
            param1 = new ByteArray();
            param1.endian = Endian.LITTLE_ENDIAN;
         }
         param1.writeByte(this.lzwMinCodeSize);
         param1.writeBytes(DataBlock.encodeDataBlocks(this.bytes));
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

