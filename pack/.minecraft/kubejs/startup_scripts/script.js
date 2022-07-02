// priority: 0

console.info('HexMC Patches Applied')

onEvent('rei.hide.items', event => {
	event.hide(global["REMOVED"])
})