// priority: 0

console.info('Patches applied')

onEvent('jei.hide.items', event => {
	event.hide(global["REMOVED"]);
})