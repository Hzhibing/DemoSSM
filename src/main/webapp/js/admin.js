$(function(){
	//在前台页面中所有无序列表展开完毕后触发的事件，前提在前台把所有的无序列表设置自定义class为collapse_UL
	$('.collapse_UL').on('shown.bs.collapse', function () {
		var point = $(this).prev();//获取当前点击的无序列表的上一个兄弟节点，也就是a元素（本节点为触发事件的无序列表）
		var brpoint = point.children();//获取子节点
		brpoint.removeClass('icon-iconfontadd');
		brpoint.addClass('icon-jianhao');
		
	});
	$('.collapse_UL').on('hidden.bs.collapse', function () {
		var point = $(this).prev();
		var brpoint = point.children();
		brpoint.removeClass('icon-jianhao');
		brpoint.addClass('icon-iconfontadd');
	})
	$(".collapse_UL > li > a").click(function(el){
		el.preventDefault();//禁用掉a标签原本的效果
		var $this = $(this);//获取当前点击的对象		
		$(".collapse_UL > li > a").removeClass("navactive");//先去掉所有无序列表里面的a标签的自定义样式
		$this.addClass("navactive");//给点击a标签添加自定义样式
		$("#iframe_content").attr('src',$this.data("iframesrc"));//点击超链接切换相应的页面
		var text1 = $this.text();
		var text2 = $this.parent().parent().prev().text();
		$("#path_nav > ol > li:last-child").html(text1);
		$("#path_nav > ol > li:last-child").prev().html(text2);
	});
})