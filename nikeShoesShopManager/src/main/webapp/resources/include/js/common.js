//유효성 검사 대상, 메시지 내용
function chkSubmit(v_item, v_name) {
	if (v_item.val().replace(/\s/g, "") == "") {
		alert(v_name + "확인해 주세요.");
		v_item.val("");
		v_item.focus();
		return false;
	} else {
		return true;
	}
}


function chkCategory(v_item, v_name) {
	   if (v_item.val().replace("- 카테고리선택 -", "") == "") {
	      alert(v_name + "확인해 주세요.");
	      v_item.val("- 카테고리선택 -");
	      v_item.focus();
	      return false;
	   } else {
	      return true;
	   }
	}
