function deleteSave(){
	if(document.delForm.passwd.value==""){
		  alert("��й�ȣ�� �Է��Ͻʽÿ�.");
		  document.delForm.passwd.focus();
		  return false;
		}
	
}

function writeSave(){
	
	if(!document.writeform.writer.value){
	  alert("�ۼ��ڸ� �Է��Ͻʽÿ�.");
	  document.writeform.writer.focus();
	  return false;
	}
	if(!document.writeform.subject.value){
	  alert("������ �Է��Ͻʽÿ�.");
	  document.writeform.subject.focus();
	  return false;
	}
	
	if(!document.writeform.content.value){
	  alert("������ �Է��Ͻʽÿ�.");
	  document.writeform.content.focus();
	  return false;
	}
        
	if(!document.writeform.passwd.value){
	  alert(" ��й�ȣ�� �Է��Ͻʽÿ�.");
	  document.writeform.passwd.focus();
	  return false;
	}
 }    

//이미지 미리보기 스크립트
$.fn.setPreview = function(opt){
    "use strict"
    var defaultOpt = {
        inputFile: $(this),
        img: null,
        w: 200,
        h: 200
    };
    $.extend(defaultOpt, opt);
 
    var previewImage = function(){
        if (!defaultOpt.inputFile || !defaultOpt.img) return;
 
        var inputFile = defaultOpt.inputFile.get(0);
        var img       = defaultOpt.img.get(0);
 
        // FileReader
        if (window.FileReader) {
            // image 파일만
            if (!inputFile.files[0].type.match(/image\//)) return;
 
            // preview
            try {
                var reader = new FileReader();
                reader.onload = function(e){
                    img.src = e.target.result;
                    img.style.width  = defaultOpt.w+'px';
                    img.style.height = defaultOpt.h+'px';
                    img.style.display = '';
                }
                reader.readAsDataURL(inputFile.files[0]);
            } catch (e) {
                // exception...
            }
        // img.filters (MSIE)
        } else if (img.filters) {
            inputFile.select();
            inputFile.blur();
            var imgSrc = document.selection.createRange().text;
 
            img.style.width  = defaultOpt.w+'px';
            img.style.height = defaultOpt.h+'px';
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";            
            img.style.display = '';
        // no support
        } else {
            // Safari5, ...
        }
    };
 
    // onchange
    $(this).change(function(){
        previewImage();
    });
};
 
 
$(document).ready(function(){
    var opt = {
        img: $('#img_preview'),
        w: 200,
        h: 200
    };
 
    $('#input_file').setPreview(opt);
});
/////////////////////////////////////////////////////////////////////////////////////////