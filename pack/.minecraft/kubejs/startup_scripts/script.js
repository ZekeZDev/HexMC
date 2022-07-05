// priority: 0

console.info("HexMC Patches Applied");

onEvent("item.registry", (event) => {
  // You can specify item type as 2nd argument in create(), some types have different available methods
  event.create("roly_poly").unstackable().tooltip("ITS ROLLIN TIME");
  event
    .create("hyper_roly_poly")
    .unstackable()
    .glow(true)
    .tooltip("SPEEEEEED ROLLIN");
});
