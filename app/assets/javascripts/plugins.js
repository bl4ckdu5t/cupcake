/*
 Init jQuery plugins from here
*/
$(document).ready(function(){
  $('#colorpicker1, #colorpicker2, #colorpicker3').ColorPicker({
		onSubmit: function(hsb, hex, rgb, el) {
			$(el).val(hex);
			$(el).ColorPickerHide();
			$('#'+$(el).prop('id')).siblings('.color-box__preview').css('background', '#'+hex);
		},
		onBeforeShow: function () {
			$(this).ColorPickerSetColor(this.value);
		}
	})
	.on('keyup', function(){
		$(this).ColorPickerSetColor(this.value);
	});
});