var image = {
	count: 0,
	filesList: []
};

function imgFilesSelect(event, type, previewId, width, height, topPx, rightPx, totalCnt) {
	var files = event.target.files;
	var fileInputId = event.target.id;
	var filesArray = Array.prototype.slice.call(files);
	var curFileCnt = filesArray.length;
	var attFileCnt = $(".fileBox").length;
	var remainFileCnt = totalCnt - attFileCnt;

	if (curFileCnt > remainFileCnt) {
		type.filesList = [];
		curFileCnt = 0;
		remainFileCnt=totalCnt;
	}
	$(previewId).empty();
	var file = filesArray[0];
	if (!file.type.match("image.*")) {
		return;
	}

	type.filesList.push(file);

	var reader = new FileReader();
	reader.onload = function(e) {
		var imageContainer = $("<div class=\"fileBox\" style=\"position:relative;\"></div>");
		var imageElement = $("<img class=\"mt-0 me-2\" src=\"" + e.target.result + "\" width=\"" + width + "\" height=\"" + height + "\"/>");
		var deleteButton = $("<button class=\"btn btn-light btn-sm delete\"  data-index=\"" + file.lastModified + "\" onclick=\"deleteSelectFile\" type=\"button\" style=\"position:absolute;top:" + topPx + ";right:" + rightPx + ";\"><i class=\"bi bi-x\"></i></button>");

		imageContainer.append(imageElement);
		imageContainer.append(deleteButton);
		$(previewId).append(imageContainer);

		deleteButton.on("click", function() {
			deleteSelectFile(imageContainer, fileInputId, type);
		});
	}
	reader.readAsDataURL(file);
}

function deleteSelectFile(imageContainer, fileInputId, type) {
	var removeTargetId = imageContainer.find('button').attr('data-index');
	var id = "#" + fileInputId;
	var files = $(id).prop('files');
	var dataTransfer = new DataTransfer();

	Array.from(files).filter(file => file.lastModified != removeTargetId).forEach(file => { dataTransfer.items.add(file); });
	$(id).prop('files', dataTransfer.files);
	imageContainer.remove();
}

$(function(){
	$("#bpattach").on("change", (event) => imgFilesSelect(event, image, 
			"#bpattachPreview", "100px", "100px", "0px", "-5px", 1));
});