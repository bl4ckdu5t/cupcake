/*
 Init jQuery plugins from here
*/
$(document).ready(function(){
  $('#colorpicker1, #colorpicker2, #colorpicker3').ColorPicker({
		onSubmit: function(hsb, hex, rgb, el) {
			$(el).val(hex);
			$(el).ColorPickerHide();
		},
		onBeforeShow: function () {
			$(this).ColorPickerSetColor(this.value);
		}
	})
	.on('keyup', function(){
		$(this).ColorPickerSetColor(this.value);
	});
});