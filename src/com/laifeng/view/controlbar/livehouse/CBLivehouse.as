package com.laifeng.view.controlbar.livehouse
{
	import com.laifeng.config.LiveConfig;
	import com.laifeng.config.NoticeKey;
	import com.laifeng.controls.Notification;
	import com.laifeng.event.MEvent;
	import com.laifeng.view.controlbar.base.BaseControlBar;
	
	/**
	 * livehouse controlbar
	 */
	public class CBLivehouse extends BaseControlBar
	{
		public function CBLivehouse()
		{
			super();
			Notification.get.addEventListener(NoticeKey.N_SHOW_BARRAGE_BTN,showBarrageBtnHandler);
		}
		
		
		override protected function layout():void{
			
			super.layout();
			
			_btnEffectStatus.x = LiveConfig.get.defaultWidth - _btnEffectStatus.width - SPACE;
			_btnBarrageStatus.x = _btnEffectStatus.x - _btnBarrageStatus.width - SPACE;
			_btnBarrageOffX = _btnBarrageStatus.visible? _btnBarrageStatus.x - _qualityTitle.width  : _btnEffectStatus.x -  _qualityTitle.width;
			_qualityTitle.x = _btnBarrageOffX-SPACE;
			
		}
		
		
		override public function resize(w:int,h:int):void{
			super.resize(w,h);
			_btnEffectStatus.x = LiveConfig.get.defaultWidth - _btnEffectStatus.width - SPACE;
			_btnBarrageStatus.x = _btnEffectStatus.x - _btnBarrageStatus.width - SPACE;
			_btnBarrageOffX = _btnBarrageStatus.visible? _btnBarrageStatus.x - _qualityTitle.width  : _btnEffectStatus.x -  _qualityTitle.width;
			_qualityTitle.x = _btnBarrageOffX-SPACE;
		}
		
		
		private function showBarrageBtnHandler(event:MEvent):void{
			var isOpen:Boolean = event.data as Boolean;
			if(_btnBarrageStatus.visible != isOpen){
				_btnBarrageStatus.visible = isOpen;
			}
		}
		
		
		
		
		
		private var _btnBarrageOffX:int = 0;
		
		
	}
}