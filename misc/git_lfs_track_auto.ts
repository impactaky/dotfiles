import $ from "https://deno.land/x/dax_extras/mod.ts";
 
// git lfs track more 1MB files
await $`find . -size +1M -not -path "./.git/*"`.forEach(async (file) => {
  const filter = (await $`git check-attr filter ${file}`.text()).match(/filter: (.*)/);
  if (filter && filter[1] === "lfs") return;
  await $`git lfs track ${file}`;
});