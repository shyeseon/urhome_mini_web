function joinFormCheckData() {
	event.preventDefault();

	// 각 입력 양식의 데이터 검사
	var totalResult = true;

	totalResult &= isRightID();
	totalResult &= isRightPassword();
	totalResult &= isRightPasswordCheck();
	totalResult &= isRightName();
	totalResult &= isRightNormalPhone();
	totalResult &= isRightCellPhone();
	totalResult &= isRightEmail();
	totalResult &= isRightAddress();
	totalResult &= checkAgree();

	if (totalResult) {
		var elForm = $("#joinForm");

		//수동으로 action을 수행
		elForm[0].submit();
	}

}

function isRightID() {
	var result = true;

	//ID 검사	
	var mid = $("#mid");
	var midValue = mid.val();

	var midPattern = /^(?=.*\d)(?=.*[A-Za-z]).{6,20}$/;
	var midResult = midPattern.test(midValue);
	var midSpan = $("#midSpan");

	if (!midResult) {
		mid.addClass("border-danger");
		midSpan.addClass("text-danger");
		result = false;
	} else {
		mid.removeClass("border-danger");
		midSpan.removeClass("text-danger");
	}
	
	return result;
}

function isRightPassword() {
	var result = true;

	//password 검사
	var mpassword = $("#mpassword");
	var mpasswordValue = mpassword.val();
	var mpasswordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,15}$/;
	var mpasswordResult = mpasswordPattern.test(mpasswordValue);
	var mpasswordSpan = $("#mpasswordSpan");

	if (!mpasswordResult) {
		mpassword.addClass("border-danger");
		mpasswordSpan.addClass("text-danger");
		result = false;
	} else {
		mpassword.removeClass("border-danger");
		mpasswordSpan.removeClass("text-danger");
	}

	return result;
}

function isRightPasswordCheck(){
	var result = true;
	
	//passwordCheck 검사
	var mpassword = $("#mpassword");
	var mpasswordValue = mpassword.val();
	var mpasswordCheck = $("#mpasswordCheck");
	var mpasswordCheckValue = mpasswordCheck.val();
	var mpasswordCheckSpan = $("#mpasswordCheckSpan");

	if (mpasswordCheckValue !== mpasswordValue || mpasswordValue === "") {
		mpasswordCheckSpan.html("비밀번호가 맞지 않습니다.");
		mpasswordCheck.addClass("border-danger");
		mpasswordCheckSpan.addClass("text-danger");
		result = false;
	} else {
		mpasswordCheckSpan.html("&nbsp;");
		mpasswordCheck.removeClass("border-danger");
		mpasswordCheckSpan.removeClass("text-danger");
	}
	return result;
}

function isRightName() {
	var result = true;

	//한국이름 검사 
	var name = $("#mname");
	var nameValue = name.val();
	var namePattern = /^[가-힣]{2,4}$/;
	var nameResult = namePattern.test(nameValue);
	var nameSpan = $("#nameSpan");

	if (!nameResult) {
		nameSpan.html("잘못된 형식의 이름입니다.");
		name.addClass("border-danger");
		nameSpan.addClass("text-danger");
		result = false;
	} else {
		nameSpan.html("&nbsp;");
		name.removeClass("border-danger");
		nameSpan.removeClass("text-danger");
	}

	return result;
}

function isRightNormalPhone() {
	var result = true;

	//phone 검사 
	var normalPhone1 = $("#mtel1");
	var normalPhone2 = $("#mtel2");
	var normalPhone3 = $("#mtel3");
	var normalPhoneValue = normalPhone1.val() + "-" + normalPhone2.val() + "-" + normalPhone3.val();
	var normalPhonePattern = /^(02|031)-\d{3}-\d{4}$/;
	var normalPhoneResult = normalPhonePattern.test(normalPhoneValue);
	var normalPhoneSpan = $("#mtelSpan");
	
	if(normalPhone2.val() === "" && normalPhone3.val() === ""){
		normalPhoneSpan.html("&nbsp;");
		normalPhone2.removeClass("border-danger");
		normalPhone3.removeClass("border-danger");
		normalPhoneSpan.removeClass("text-danger");
		return true;
	}

	if (!normalPhoneResult) {
		normalPhoneSpan.html("일반전화번호가 정확한지 확인해 주세요.");
		normalPhone2.addClass("border-danger");
		normalPhone3.addClass("border-danger");
		normalPhoneSpan.addClass("text-danger");
		result = false;
	} else {
		normalPhoneSpan.html("&nbsp;");
		normalPhone2.removeClass("border-danger");
		normalPhone3.removeClass("border-danger");
		normalPhoneSpan.removeClass("text-danger");
	}
	return result;
}

function isRightCellPhone() {
	var result = true;

	//phone 검사 
	var cellPhone1 = $("#mphone1");
	var cellPhone2 = $("#mphone2");
	var cellPhone3 = $("#mphone3");
	var cellPhoneValue = cellPhone1.val() + "-" + cellPhone2.val() + "-" + cellPhone3.val();
	var cellPhonePattern = /^(010|011)-\d{3,4}-\d{4}$/;
	var cellPhoneResult = cellPhonePattern.test(cellPhoneValue);
	var cellPhoneSpan = $("#mphoneSpan");

	if (!cellPhoneResult) {
		cellPhoneSpan.html("휴대전화번호가 정확한지 확인해 주세요.");
		cellPhone2.addClass("border-danger");
		cellPhone3.addClass("border-danger");
		cellPhoneSpan.addClass("text-danger");
		result = false;
	} else {
		cellPhoneSpan.html("&nbsp;");
		cellPhone2.removeClass("border-danger");
		cellPhone3.removeClass("border-danger");
		cellPhoneSpan.removeClass("text-danger");
	}
	return result;
}

function isRightEmail() {
	var result = true;

	//email 검사
	var email = $("#memail");
	var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	var emailResult = emailPattern.test(email.val());
	var emailSpan = $("#memailSpan");

	if (!emailResult) {
		emailSpan.html("잘못된 이메일입니다.");
		email.addClass("border-danger");
		emailSpan.addClass("text-danger");
		result = false;
	} else {
		emailSpan.html("&nbsp;");
		email.removeClass("border-danger");
		emailSpan.removeClass("text-danger");
	}
	return result;
}

function isRightAddress() {
	var result = true;

	//email 검사
	var mzip = $("#mzip");
	var maddress = $("#maddress")
	var mdetailAddress = $("#mdetailAddress");
	var addressSpan = $("#addressSpan");

	if (mzip.val().length <= 0 || mdetailAddress.val().length <= 0) {
		result = false;
		addressSpan.html("주소를 전부 입력해주세요");
		mzip.addClass("border-danger");
		maddress.addClass("border-danger");
		mdetailAddress.addClass("border-danger");
		addressSpan.addClass("text-danger");
	} else {
		addressSpan.html("&nbsp;");
		mzip.removeClass("border-danger");
		maddress.removeClass("border-danger");
		mdetailAddress.removeClass("border-danger");
		addressSpan.removeClass("text-danger");
	}
	return result;
}

function checkAgree() {
	var checkResult = true;
	var checkboxes = $("input[name=agree]");
	var checkSpan = $("#checkSpan");
	
	for(let index = 0; index < checkboxes.length - 1 ; index++){
			checkResult &= checkboxes.eq(index).is(":checked");
	}
	
	if (!checkResult) {
		checkSpan.html("약관에 동의해주세요.");
		checkSpan.addClass("text-danger");
	} else {
		checkSpan.html("&nbsp;");
		checkSpan.removeClass("text-danger");
	}
	
	return checkResult;
}

function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
//                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
//                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('mzip').value = data.zonecode;
            document.getElementById("maddress").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("mdetailAddress").focus();
        }
    }).open();

}


$(function() {
		var agreeAll = $("#agreeAll");
		var checkboxes = $("#agree1, #agree2, #agree3");
		
		agreeAll.on("click", function(){
			if($("#agreeAll").is(":checked")){
				checkboxes.prop("checked", true);
			}else{
				checkboxes.prop("checked", false);
			}
		});
		
		checkboxes.on("click", function(){
			var checked = true;
			checked &= $("input[name=agree1]:checked").length;
			checked &= $("input[name=agree2]:checked").length;
			checked &= $("input[name=agree3]:checked").length;
			
			if(checked){
				agreeAll.prop("checked", true);
			}else{
				agreeAll.prop("checked", false);
			}
			
		});
	}
);