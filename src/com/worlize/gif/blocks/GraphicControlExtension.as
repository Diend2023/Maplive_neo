package com.worlize.gif.blocks
{
   import com.worlize.gif.constants.BlockType;
   import com.worlize.gif.errors.FileTypeError;
   import com.worlize.gif.errors.OutOfDataError;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   
   public class GraphicControlExtension implements IGIFBlockCodec
   {
      
      private var reserved:uint = 0;
      
      public var disposalMethod:uint = 2;
      
      public var userInputExpected:Boolean = false;
      
      public var hasTransparency:Boolean = false;
      
      public var delayTime:uint = 0;
      
      public var transparencyIndex:uint = 0;
      
      public function GraphicControlExtension()
      {
         super();
      }
      
      public function decode(param1:IDataInput) : void
      {
         if(param1.bytesAvailable < 6)
         {
            throw new OutOfDataError("Out of data while reading graphic control extension.");
         }
         if(param1.readUnsignedByte() !== 4)
         {
            throw new FileTypeError("Graphic Control Extension has invalid size.");
         }
         this.packed = param1.readUnsignedByte();
         this.delayTime = param1.readUnsignedShort();
         this.transparencyIndex = param1.readUnsignedByte();
         param1.readUnsignedByte();
      }
      
      public function encode(param1:ByteArray = null) : ByteArray
      {
         if(param1 === null)
         {
            param1 = new ByteArray();
            param1.endian = Endian.LITTLE_ENDIAN;
         }
         param1.writeByte(BlockType.EXTENSION);
         param1.writeByte(BlockType.GRAPHIC_CONTROL_EXT);
         param1.writeByte(4);
         param1.writeByte(this.packed);
         param1.writeShort(this.delayTime);
         param1.writeByte(this.transparencyIndex);
         param1.writeByte(0);
         return param1;
      }
      
      protected function set packed(param1:uint) : void
      {
         this.reserved = (param1 & 0xE0) >> 5;
         this.disposalMethod = (param1 & 0x1C) >> 2;
         if(this.disposalMethod > 3)
         {
            throw new FileTypeError("Invalid disposal method: " + this.disposalMethod);
         }
         this.userInputExpected = (param1 & 2) === 2;
         this.hasTransparency = (param1 & 1) === 1;
      }
      
      protected function get packed() : uint
      {
         var _loc1_:uint = 0;
         _loc1_ |= (this.reserved & 3) << 5;
         _loc1_ |= (this.disposalMethod & 3) << 2;
         _loc1_ |= this.userInputExpected ? 2 : 0;
         return uint(_loc1_ | (this.hasTransparency ? 1 : 0));
      }
      
      public function dispose() : void
      {
      }
   }
}

