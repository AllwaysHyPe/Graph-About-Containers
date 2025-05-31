# Run from Script
In this folder is a PowerShell script and a Dockerfile that builds a containerized environment the PowerShell script in. It’s an intentionally simple PowerShell script, just a personal script to echo the mood I'm in, but it's a great way to test argument handling and container behavior.

1. Build the container (make sure you are in this same directory, or otherwise specify the path rather than `.`)

	`docker build -t container-vibes .` (you can replace the `container-vibes` tag with whatever you want)

1. Run the container. The entrypoint is already specified in the container via the `CMD` operator in the dockerfile.

	`docker run container-vibes`
	
	*Output:* ```Running this container with the vibe: tired at 05/31/2025 00:42:00!```
	
1. Now try running the container with an argument. You must respecify the `CMD` part as the first argument when doing this

	`docker run container-vibes "/main.ps1" "productive"`
	
	*Output:* ```Running this container with the vibe: productive at 05/31/2025 00:42:00```