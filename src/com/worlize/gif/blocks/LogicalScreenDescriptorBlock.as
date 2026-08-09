package com.worlize.gif.blocks
{
   import com.worlize.gif.errors.OutOfDataError;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   
   public class LogicalScreenDescriptorBlock implements IGIFBlockCodec
   {
      
      public var width:uint = 0;
      
      public var height:uint = 0;
      
      public var hasgct:Boolean = false;
      
      public var gctColorResolution:uint = 0;
      
      public var gctSorted:Boolean = false;
      
      public var gctNumColors:uint = 0;
      
      public var backgroundColorIndex:uint = 0;
      
      public var pixelAspect:uint = 0;
      
      private var _packed:uint;
      
      public function LogicalScreenDescriptorBlock()
      {
         super();
      }
      
      public function decode(param1:IDataInput) : void
      {
         if(param1.bytesAvailable < 7)
         {
            throw new OutOfDataError("Out of data while reading logical screen descriptor.");
         }
         this.width = param1.readUnsignedShort();
         this.height = param1.readUnsignedShort();
         this.packed = param1.readUnsignedByte();
         this.backgroundColorIndex = param1.readUnsignedByte();
         this.pixelAspect = param1.readUnsignedByte();
      }
      
      public function encode(param1:ByteArray = null) : ByteArray
      {
         if(param1 === null)
         {
            param1 = new ByteArray();
            param1.endian = Endian.LITTLE_ENDIAN;
         }
         param1.writeShort(this.width);
         param1.writeShort(this.height);
         param1.writeByte(this.packed);
         param1.writeByte(this.backgroundColorIndex);
         param1.writeByte(this.pixelAspect);
         return param1;
      }
      
      public function set packed(param1:uint) : void
      {
         this.hasgct = (param1 & 0x80) !== 0;
         this.gctColorResolution = (param1 & 0x70) >> 4;
         this.gctSorted = (param1 & 8) !== 0;
         this.gctNumColors = 2 << (param1 & 7);
      }
      
      public function get packed() : uint
      {
         var _loc1_:uint = 0;
         if(this.hasgct)
         {
            _loc1_ |= 128;
         }
         _loc1_ |= (this.gctColorResolution & 7) << 4;
         if(this.gctSorted)
         {
            _loc1_ |= 8;
         }
         switch(this.gctNumColors)
         {
            case 2:
               _loc1_ |= 0;
               break;
            case 4:
               _loc1_ |= 1;
               break;
            case 8:
               _loc1_ |= 2;
               break;
            case 16:
               _loc1_ |= 3;
               break;
            case 32:
               _loc1_ |= 4;
               break;
            case 64:
               _loc1_ |= 5;
               break;
            case 128:
               _loc1_ |= 6;
               break;
            case 256:
               _loc1_ |= 7;
               break;
            default:
               throw new Error("Invalid global color table size: " + this.gctNumColors);
         }
         return _loc1_;
      }
      
      public function dispose() : void
      {
      }
   }
}

