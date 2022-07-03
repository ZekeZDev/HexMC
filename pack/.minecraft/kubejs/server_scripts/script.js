// priority: 0

settings.logAddedRecipes = true
settings.logRemovedRecipes = true
settings.logSkippedRecipes = false
settings.logErroringRecipes = true

console.info('HexMC Patches Reloaded')

global["REMOVED"] = [
	"illagerexp:imbuing_table",
	"things:arm_extender"
]

onEvent('recipes', event => {
	// remove recipes
	event.remove({output: global["REMOVED"]})
})