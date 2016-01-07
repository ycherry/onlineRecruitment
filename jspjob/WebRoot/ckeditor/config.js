/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.width = 700;
	config.height = 850;
	 config.font_names='宋体/宋体;黑体/黑体;仿宋/仿宋_GB2312;楷体/楷体_GB2312;隶书/隶书;幼圆/幼圆;微软雅黑/微软雅黑;'+ config.font_names;
	    config.defaultLanguage = 'zh-cn';
	    //默认的字体名 plugins/font/plugin.js
	    config.font_defaultLabel = '宋体';
	    
	config.filebrowserUploadUrl="actions/ckeditorUpload";
	var pathName = window.document.location.pathname;
	
    //获取带"/"的项目名，如：/uimcardprj
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    config.filebrowserImageUploadUrl = projectName+'/uploadImg.action'; //固定路径
	
};
