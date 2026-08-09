package
{
   import flash.display.BitmapData;
   
   public function mathGPU(param1:BitmapData, param2:int = 4) : int
   {
      if(!param1)
      {
         return 0;
      }
      return param1.width * param1.height * param2;
   }
}

