window.addEventListener("load", function() {
	var btnSend = document.querySelector("#btn-send");
	var container2a = document.querySelector("#container-2a");
	
	
	
	function printFish(userName, msg) {
		var template = document.querySelector("#fish-template");
		var clone = document.importNode(template.content, true);
		var fishBox = clone.querySelector("#container-2a");
		fishBox.innerText = fish;

		fishBox.appendChild(clone);

	}
	
	
	btnSend.onclick = function(event) {
		var msg = inputBox.value;
		var data = {type:"chat", 
			uid : uid,
			msg : msg
		};
		data = JSON.stringify(data);
		wsocket.send(data);

		var msg = inputBox.value;


		inputBox.value = "";

	};
});