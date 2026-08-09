package views
{
   import button.ButtonBarBase;
   import flash.events.Event;
   import mx.controls.Alert;
   import spark.components.TabBar;
   import spark.components.supportClasses.ItemRenderer;
   
   public class TabBar extends spark.components.TabBar
   {
      
      // private static var _skinParts:Object = {"dataGroup":false};
      private var _skinParts:Object = {"dataGroup":false}; //
      
      public function TabBar()
      {
         super();
         this.addEventListener(ButtonBarBase.CLOSE,this.onClose);
      }
      
      override protected function itemSelected(param1:int, param2:Boolean) : void
      {
         super.itemSelected(param1,param2);
         this.addEventListener(Event.ENTER_FRAME,this.onFrame);
      }
      
      public function onFrame(param1:Event) : void
      {
         if(this.selectedIndex == -1)
         {
            return;
         }
         var _loc2_:RefObserve = this.dataProvider.getItemAt(this.selectedIndex) as RefObserve;
         if(_loc2_)
         {
            _loc2_.onFrame();
         }
      }
      
      public function onClose(param1:Event = null) : void
      {
         var delIndex:int = 0;
         var observe:RefObserve = null;
         var item:ItemRenderer = null;
         var e:Event = param1;
         delIndex = this.selectedIndex;
         if(e != null)
         {
            item = e.target as ItemRenderer;
            delIndex = this.dataProvider.getItemIndex(item.data);
         }
         observe = this.dataProvider.getItemAt(delIndex) as RefObserve;
         if(observe is StartPage)
         {
            Alert.show("无法进行关闭","提示");
            return;
         }
         if(Boolean(observe) && observe.isChange)
         {
            ConfirmAlert.show(this,"是否保存" + observe.getName() + "文件？","关闭操作","保存","不","取消").onClose = function(param1:String):void
            {
               switch(param1)
               {
                  case ConfirmAlert.ENTER:
                     observe.onSave();
                     removeIndex(delIndex);
                     break;
                  case ConfirmAlert.NO:
                     removeIndex(delIndex);
               }
            };
            return;
         }
         this.removeIndex(delIndex);
      }
      
      private function removeIndex(param1:int) : void
      {
         var _loc2_:RefObserve = this.dataProvider.getItemAt(param1) as RefObserve;
         _loc2_.discarded();
         this.dataProvider.removeItemAt(param1);
         this.selectedIndex = this.dataProvider.length > param1 ? param1 : param1 - 1;
      }
      
      public function onSave() : void
      {
         var _loc1_:RefObserve = this.dataProvider.getItemAt(this.selectedIndex) as RefObserve;
         if(_loc1_)
         {
            _loc1_.onSave();
         }
      }
   }
}

