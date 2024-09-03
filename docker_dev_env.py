import subprocess

def docker_pull_and_run():
    image_name = "ercardona/my-dev-environment:latest"
    
    print("Pulling Docker image...")
    subprocess.run(["docker", "pull", image_name], check=True)
    
    print("Running Docker container...")
    subprocess.run(["docker", "run", "-it", image_name, "/bin/bash"], check=True)

if __name__ == "__main__":
    docker_pull_and_run()
