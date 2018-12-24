(function ($) {
    $.fn.labelauty = function (tag, tag2) {
        
        isChecked(tag);
        //单选or多选
        if (tag2 == "rdo") {
            //单选
            $(".rdobox").click(function () {
            	$(this).parent().children("input:radio").attr("checked",false);
                $(this).prev().attr("checked", true);
                isChecked(tag);
                clickCheckbox(tag,tag2);
            });
        } else {
            //多选
            $(".chkbox").click(function () {
                if ($(this).prev().prop("checked") == true) {
					$(this).prev("input:checkbox").attr("checked",false);
                }else {
                    $(this).prev("input:checkbox").attr("checked",true);
                }
                isChecked(tag);
                clickCheckbox(tag,tag2);
            });
        }

        //判断是否选中
        function isChecked(tag) {
            $('.' + tag).each(function (i) {
                var rdobox = $('.' + tag).eq(i).next();
                if ($('.' + tag).eq(i).prop("checked") == false) {
                    rdobox.removeClass("checked");
                    rdobox.addClass("unchecked");
                }else {
                    rdobox.removeClass("unchecked");
                    rdobox.addClass("checked");
                }
            });
        }
    }
}(jQuery));