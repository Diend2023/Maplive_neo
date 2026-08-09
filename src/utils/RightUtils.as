package utils
{
   import events.RightClickEvent;
   import flash.display.NativeMenu;
   import flash.display.NativeMenuItem;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.Dictionary;
   
   public class RightUtils
   {
      
      private static var _keyDict:Dictionary = new Dictionary();
      
      public function RightUtils()
      {
         super();
      }
      
      public static function init() : void
      {
         addMenu("npcKey",["动作","移至","删除"]);
         addMenu("event",["动作","删除"]);
         addMenu("sceneryKey",["移至","删除"]);
         addMenu("poltTree",["复制","粘贴","删除"]);
         addMenu("porjectRef",["新建地图","新增战斗人物","导入特效","测试","刷新","导入动态资源","导入地图贴图","导入音频","设置为启动地图","删除"]);
         addMenu("effect",["编辑碰撞块","删除"]);
         addMenu("frame",["删除帧","清除元素","清除停顿","清除音效","清除碰撞","清除位移","删除所有帧"]);
         addMenu("pointSprite",["删除节点"]);
         addMenu("mapSprite",["新建节点"]);
      }
      
      public static function onRightClick(param1:Sprite, param2:String) : void
      {
         var display:Sprite = param1;
         var keyName:String = param2;
         display.contextMenu = (_keyDict[keyName] as NativeMenu).clone();
         display.contextMenu.addEventListener(Event.SELECT,function(param1:Event):void
         {
            display.dispatchEvent(new RightClickEvent(RightClickEvent.CLICK,(param1.target as NativeMenuItem).label));
         });
      }
      
      public static function addMenu(param1:String, param2:Array) : void
      {
         var _loc4_:Object = null;
         var _loc3_:NativeMenu = new NativeMenu();
         for(_loc4_ in param2)
         {
            _loc3_.addItem(new NativeMenuItem(param2[_loc4_]));
         }
         _keyDict[param1] = _loc3_;
      }
   }
}

