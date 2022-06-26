// priority: 0

console.info('HexMC Patches Applied')

onEvent('item.registry', event => {
	// Register new items here
	// event.create('example_item').displayName('Example Item')
})

onEvent('block.registry', event => {
	// Register new blocks here
	// event.create('example_block').material('wood').hardness(1.0).displayName('Example Block')
})

onEvent('rei.hide.items', event => {
	event.hide(global["REMOVED"])
})