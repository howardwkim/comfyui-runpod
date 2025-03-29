curl https://rest.runpod.io/v1/pods \
  --request POST \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer {}' \
  --data '{
  "allowedCudaVersions": [
	"12.4"
  ],
  "cloudType": "SECURE",
  "computeType": "GPU",
  "containerDiskInGb": 20,
  "containerRegistryAuthId": "",
  "countryCodes": [],
  "cpuFlavorIds": [],
  "cpuFlavorPriority": "availability",
  "dataCenterIds": [
    "US-TX-3"
  ],
  "dataCenterPriority": "availability",
  "dockerEntrypoint": [],
  "dockerStartCmd": [],
  "env": {
    "ENV_VAR": "value"
  },
  "gpuCount": 1,
  "gpuTypeIds": [
    "NVIDIA GeForce RTX 4090"
  ],
  "gpuTypePriority": "availability",
  "imageName": "runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04",
  "interruptible": false,
  "locked": false,
  "minDiskBandwidthMBps": 1,
  "minDownloadMbps": 1,
  "minRAMPerGPU": 8,
  "minUploadMbps": 1,
  "minVCPUPerGPU": 2,
  "name": "ls-comfyui",
  "networkVolumeId": "se6dw04nb3",
  "ports": [
    "8888/http",
    "8188/http",
    "22/tcp"
  ],
  "supportPublicIp": true,
  "templateId": "",
  "vcpuCount": 2,
  "volumeInGb": 20,
  "volumeMountPath": "/workspace"
}'



curl https://rest.runpod.io/v1/pods \
  --request POST \
  --header 'Content-Type: application/json' \
  --header 'Authorization: {}' \
  --data '{
  "allowedCudaVersions": [
	"12.4"
  ],
  "cloudType": "SECURE",
  "computeType": "GPU",
  "containerDiskInGb": 20,
  "containerRegistryAuthId": "",
  "countryCodes": [],
  "cpuFlavorIds": [],
  "cpuFlavorPriority": "availability",
  "dataCenterIds": [
    "US-TX-3"
  ],
  "dataCenterPriority": "availability",
  "dockerEntrypoint": [],
  "dockerStartCmd": [],
  "env": {
    "ENV_VAR": "value"
  },
  "gpuCount": 1,
  "gpuTypeIds": [
    "NVIDIA GeForce RTX 4090"
  ],
  "gpuTypePriority": "availability",
  "imageName": "runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04",
  "interruptible": false,
  "locked": false,
  "minDiskBandwidthMBps": 1,
  "minDownloadMbps": 1,
  "minRAMPerGPU": 8,
  "minUploadMbps": 1,
  "minVCPUPerGPU": 2,
  "name": "ls-comfyui",
  "networkVolumeId": {},
  "ports": [
    "8888/http",
    "8188/http",
    "22/tcp"
  ],
  "supportPublicIp": true,
  "templateId": "",
  "vcpuCount": 2,
  "volumeInGb": 20,
  "volumeMountPath": "/workspace"
}'