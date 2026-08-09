package com.worlize.gif.blocks
{
   import com.worlize.gif.constants.BlockType;
   import com.worlize.gif.errors.OutOfDataError;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   
   public class ImageDescriptorBlock implements IGIFBlockCodec
   {
      
      public var offsetLeft:uint;
      
      public var offsetTop:uint;
      
      public var width:uint;
      
      public var height:uint;
      
      public var haslct:Boolean;
      
      public var interlaced:Boolean;
      
      public var lctSorted:Boolean;
      
      public var reserved:uint;
      
      public var lctNumColors:uint;
      
      public function ImageDescriptorBlock()
      {
         super();
      }
      
      public function decode(param1:IDataInput) : void
      {
         if(param1.bytesAvailable < 9)
         {
            throw new OutOfDataError("Out of data while reading image descriptor block.");
         }
         this.offsetLeft = param1.readUnsignedShort();
         this.offsetTop = param1.readUnsignedShort();
         this.width = param1.readUnsignedShort();
         this.height = param1.readUnsignedShort();
         this.packed = param1.readUnsignedByte();
      }
      
      public function encode(param1:ByteArray = null) : ByteArray
      {
         if(param1 === null)
         {
            param1 = new ByteArray();
            param1.endian = Endian.LITTLE_ENDIAN;
         }
         param1.writeByte(BlockType.IMAGE_DESCRIPTOR);
         param1.writeShort(this.offsetLeft);
         param1.writeShort(this.offsetTop);
         param1.writeShort(this.width);
         param1.writeShort(this.height);
         param1.writeByte(this.packed);
         return param1;
      }
      
      public function set packed(param1:uint) : void
      {
         this.haslct = Boolean(param1 & 0x80);
         this.interlaced = Boolean(param1 & 0x40);
         this.lctSorted = Boolean(param1 & 0x20);
         this.reserved = (param1 & 0x18) >> 3;
         this.lctNumColors = 2 << (param1 & 7);
      }
      
      public function get packed() : uint
      {
         var _loc1_:uint = 0;
         if(this.haslct)
         {
            _loc1_ |= 128;
         }
         if(this.interlaced)
         {
            _loc1_ |= 64;
         }
         if(this.lctSorted)
         {
            _loc1_ |= 32;
         }
         _loc1_ |= (this.reserved & 3) << 3;
         switch(this.lctNumColors)
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
               throw new Error("Invalid local color table size: " + this.lctNumColors);
         }
         return _loc1_;
      }
      
      public function dispose() : void
      {
      }
   }
}

