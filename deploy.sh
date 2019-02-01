docker build -t federicoviscomineterea/multi-client:latest -t federicoviscomineterea/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t federicoviscomineterea/multi-server:latest -t federicoviscomineterea/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t federicoviscomineterea/multi-worker:latest -t federicoviscomineterea/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push federicoviscomineterea/multi-client:latest
docker push federicoviscomineterea/multi-server:latest
docker push federicoviscomineterea/multi-worker:latest
docker push federicoviscomineterea/multi-client:$SHA
docker push federicoviscomineterea/multi-server:$SHA
docker push federicoviscomineterea/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=federicoviscomineterea/multi-client:$SHA
kubectl set image deployments/server-deployment server=federicoviscomineterea/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=federicoviscomineterea/multi-worker:$SHA
