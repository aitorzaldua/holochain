<script>
	export let name;

	export let appWebsocket;
	export let cell_id;

	let postHash;

	$: postHash;

	 appWebsocket.callZome({
		cap: null,
		cell_id: cell_id,
		zome_name: 'zome_01',
		fn_name: 'create_post',
		payload: ('my postalita1','content1'),
		provenance: cell_id[1],
	}).then(hash => postHash = hash);

</script>

<main>
	<h1>Hola {name}!</h1>
	<p>Estoy creando mi primer proyecto con Holochain.</p>

	{#if postHash}
		<span>Se llama a la función create_post del zome zome_01 y devuelve el Post con hash => {postHash}</span>
	{:else}
		<span>Creating...</span>
	{/if}
</main>

<style>
	main {
		text-align: center;
		padding: 1em;
		max-width: 240px;
		margin: 0 auto;
		background-color: aquamarine;
	}
	

	h1 {
		color: black;
		text-transform: uppercase;
		font-size: 4em;
		font-weight: 100;
	}

	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>