docker build -t vmaldosan/multi-client:latest -t vmaldosan/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t vmaldosan/multi-server:latest -t vmaldosan/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t vmaldosan/multi-worker:latest -t vmaldosan/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push vmaldosan/multi-client:latest
docker push vmaldosan/multi-server:latest
docker push vmaldosan/multi-worker:latest

docker push vmaldosan/multi-client:$GIT_SHA
docker push vmaldosan/multi-server:$GIT_SHA
docker push vmaldosan/multi-worker:$GIT_SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=vmaldosan/multi-client:$GIT_SHA
kubectl set image deployments/server-deployment server=vmaldosan/multi-server:$GIT_SHA
kubectl set image deployments/worker-deployment worker=vmaldosan/multi-worker:$GIT_SHA
