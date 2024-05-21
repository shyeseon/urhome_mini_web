function orderFormCheckData() {
	// 각 입력 양식의 데이터 검사
	var totalResult = true;

	totalResult &= isRightName("oname");
	totalResult &= isRightCellPhone("ophone");
	totalResult &= isRightEmail("oemail");
	totalResult &= isRightName("rname");
	totalResult &= isRightCellPhone("rphone");
	totalResult &= checkAgree();

	return totalResult;
}

function isRightName(nameId) {
	var result = true;
	var name = "#" + nameId;
	var onameSpan = name + "Span";

	//한국이름 검사 
	var name = $(name);
	var nameValue = name.val();
	var namePattern = /^[가-힣]{2,4}$/;
	var nameResult = namePattern.test(nameValue);
	var nameSpan = $(onameSpan);
	
	if(nameValue=="" || nameValue==null){
		nameSpan.html("이름을 입력해주세요.");
		name.addClass("border-danger");
		nameSpan.addClass("text-danger");
		result = false;
	}else if (!nameResult) {
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

function isRightCellPhone(cellPhoneId) {
	var result = true;
	var cellPhone = "#" + cellPhoneId;
	var cellPhoneSpan = cellPhone + "Span";

	//phone 검사 
	var cellPhone1 = $(cellPhone+"1");
	var cellPhone2 = $(cellPhone+"2");
	var cellPhone3 = $(cellPhone+"3");
	var cellPhoneValue = cellPhone1.val() + "-" + cellPhone2.val() + "-" + cellPhone3.val();
	var cellPhonePattern = /^(010|011)-\d{3,4}-\d{4}$/;
	var cellPhoneResult = cellPhonePattern.test(cellPhoneValue);
	var cellPhoneSpan = $(cellPhoneSpan);
	
	if(cellPhoneValue=="" || cellPhoneValue==null){
		nameSpan.html("휴대전화번호를 입력해주세요.");
		name.addClass("border-danger");
		nameSpan.addClass("text-danger");
		result = false;
	}else if (!cellPhoneResult) {
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
	var email = $("#oemail");
	var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	var emailResult = emailPattern.test(email.val());
	var emailSpan = $("#emailSpan");

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

function checkAgree() {
	var checkResult = true;
	var checkboxes = $("input[name=check]");
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

function changeBtn(id){
    var currentBtn = $("#" + id);
    var buttons = $("button[name=paymentBtn]");
    
    buttons.find("img").addClass("grayscale"); // 모든 이미지에 그레이스케일 추가
    
    currentBtn.find("img").removeClass("grayscale"); // 현재 버튼 이미지의 그레이스케일 제거
}

function fillDeliveryInfo() {
    // 주문자 정보 가져오기
    var oname1 = document.getElementById('oname').value;
    var email = document.getElementById('oemail').value;
    var cellPhone1_1 = document.getElementById('ophone1').value;
    var cellPhone1_2 = document.getElementById('ophone2').value;
    var cellPhone1_3 = document.getElementById('ophone3').value;
    var address1_1 = document.getElementById('ozip').value;
    var address1_2 = document.getElementById('oaddress').value;
    var address1_3 = document.getElementById('odetailAddress').value;

    // 배송지 정보 채우기
    document.getElementById('rname').value = oname1;
    document.getElementById('rphone1').value = cellPhone1_1;
    document.getElementById('rphone2').value = cellPhone1_2;
    document.getElementById('rphone3').value = cellPhone1_3;
    document.getElementById('rzip').value = address1_1;
    document.getElementById('raddress').value = address1_2;
    document.getElementById('rdetailAddress').value = address1_3;
}

function clearDeliveryInfo() {
    // 배송지 정보 입력란 비우기
    document.getElementById('rname').value = '';
    document.getElementById('rphone2').value = '';
    document.getElementById('rphone3').value = '';
    document.getElementById('rzip').value = '';
    document.getElementById('raddress').value = '';
    document.getElementById('rdetailAddress').value = '';
}

function daumPostcode(target) {
	var address1 = target + 'address1';
	var address2 = target + 'address2';
	var address3 = target + 'address3';
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
            document.getElementById(address1).value = data.zonecode;
            document.getElementById(address2).value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById(address3).focus();
        }
    }).open();

}

$(function() {
		var checkAll = $("#checkAll");
		var checkboxes = $("input[name=check]");
		
		checkAll.on("click", function(){
			if($("#checkAll").is(":checked")){
				checkboxes.prop("checked", true);
			}else{
				checkboxes.prop("checked", false);
			}
		});
		
		checkboxes.on("click", function(){
			var total = checkboxes.length;
			var checked = $("input[name=check]:checked").length;
			
			if(checked == total){
				checkAll.prop("checked", true);
			}else{
				checkAll.prop("checked", false);
			}
			
		});
		
		$("#pay").on("click", function(){
			var isRightSubmit = orderFormCheckData();
			if(!isRightSubmit){
				return;
			}
			
			var oname =$("#oname").val();
			var oemail = $("#oemail").val();
			var ozip = $("#ozip").val();
			var oaddress = $("#oaddress").val();
			var odetailAddress = $("#odetailAddress").val();
			var ophone1 = $("#ophone1");
			var ophone2 = $("#ophone2");
			var ophone3 = $("#ophone3");
			var ophone = ophone1.val() + "-" + ophone2.val() + "-" + ophone3.val();
			var orderer={
					"oname": oname,
					"oemail": oemail,
					"ophone": ophone,
					"ozip": ozip,
					"oaddress": oaddress,
					"odetailAddress": odetailAddress
			}
			
			var rname =$("#rname").val();
			var rzip = $("#rzip").val();
			var raddress = $("#raddress").val();
			var rdetailAddress = $("#rdetailAddress").val();
			var rphone1 = $("#rphone1");
			var rphone2 = $("#rphone2");
			var rphone3 = $("#rphone3");
			var rphone = rphone1.val() + "-" + rphone2.val() + "-" + rphone3.val();
			var recipient={
					"rname": rname,
					"rphone": rphone,
					"rzip": rzip,
					"raddress": raddress,
					"rdetailAddress": rdetailAddress
			}
			
			var cartList = [];
			
			var pidDiv = $("#products").find("input");
			var pbuyAmounts = $(".pbuyAmount");
			var ptotalPrice = $(".ptotalPrice");
			for(var i=0; i < pidDiv.length; i++){
				var cart = {
					"pid":pidDiv[i].value,
					"pbuyAmount":parseInt(pbuyAmounts[i].innerText),
					"ptotalPrice":parseInt(ptotalPrice[i].innerText)
				}
				cartList.push(cart);
			}
			
			var ototalPrice = parseInt($("#totalPayment").text().slice(0,-1));
			
			var data = {
				"orderer":orderer,
				"recipient":recipient,
				"cartList":cartList,
				"ototalPrice":ototalPrice
			}
			
			$.ajax({
				url : "orderNow",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function(data) {
					location.href="../";
				}
			});
		})
	}
);