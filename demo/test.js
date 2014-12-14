var writer;
var isCharVisible;
var isHintVisible;

function updateCharacter() {
	document.querySelector('#target').innerHTML = '';

	var character = document.querySelector('.js-char').value
	writer = new HanziWriter('target', character, {
		width: 400,
		height: 400
	});
	isCharVisible = true;
	isHintVisible = true;
	window.writer = writer;
}

window.onload = function() {
	updateCharacter();

	document.querySelector('.js-char-form').addEventListener('submit', function(evt) {
		evt.preventDefault();
		updateCharacter();
	});

	document.querySelector('.js-toggle').addEventListener('click', function() {
		isCharVisible ? writer.hideCharacter() : writer.showCharacter();
		isCharVisible = !isCharVisible;
	});
	document.querySelector('.js-toggle-hint').addEventListener('click', function() {
		isHintVisible ? writer.hideHint() : writer.showHint();
		isHintVisible = !isHintVisible;
	});
	document.querySelector('.js-animate').addEventListener('click', function() {
		writer.animateCharacter();
	});
	document.querySelector('.js-quiz').addEventListener('click', function() {
		writer.quiz({
			enforceStrokeOrder: true,
			showHint: true
		});
	});
}