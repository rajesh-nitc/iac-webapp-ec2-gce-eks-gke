apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    App: label-nginx
    Test: nodejsservice
spec:
  replicas: 2
  selector:
    matchLabels:
      App: label-nginx
      Test: nodejsservice
  template:
    metadata:
      labels:
        App: label-nginx
        Test: nodejsservice
    spec:
      containers:
        - name: nginx-container
          image: gcr.io/GOOGLE_CLOUD_PROJECT/mynginx:COMMIT_SHA
          imagePullPolicy: Always
          ports:
            - containerPort: 80
          volumeMounts:
           - name: nginx-config-volume
             mountPath: /etc/nginx/conf.d
      volumes:
        - name: nginx-config-volume
          configMap:
            name: nginx-config-map