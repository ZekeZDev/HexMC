// priority: 0

settings.logAddedRecipes = true;
settings.logRemovedRecipes = true;
settings.logSkippedRecipes = false;
settings.logErroringRecipes = true;

console.info("HexMC Custom Patches Reloaded");

// Starting items
onEvent("player.logged_in", (event) => {
  // Check if player doesn't have items yet.
  if (!event.player.stages.has("starting_items")) {
    event.player.stages.add("starting_items");
    // Given Items
    event.player.give(
      Item.of(
        "patchouli:guide_book",
        '{"patchouli:book": "patchouli:hexmc_handbook"}'
      )
    );
  }
});

onEvent("recipes", (event) => {
  event.shapeless(Item.of('patchouli:guide_book', '{"patchouli:book": "patchouli:hexmc_handbook"}'), ['minecraft:book', '#minecraft:logs'])
  event.shapeless("kubejs:roly_poly", [
    "minecraft:sugar",
    "minecraft:lapis_lazuli",
    "botania:mana_diamond",
    "illagerexp:primal_essence",
  ]);
  event.shapeless("kubejs:roly_poly", ["kubejs:hyper_roly_poly"]);
  event.shaped("kubejs:hyper_roly_poly", ["SSS", "SRS", "SSS"], {
    S: "minecraft:sugar",
    R: "kubejs:roly_poly",
  });
});
