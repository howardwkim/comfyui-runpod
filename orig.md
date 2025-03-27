
## Installation

Download or git clone this repository inside `ComfyUI/custom_nodes/` directory or use the Manager. IPAdapter always requires the latest version of ComfyUI. If something doesn't work be sure to upgrade. Beware that the automatic update of the manager sometimes doesn't work and you may need to upgrade manually.

There's now a *Unified Model Loader*, for it to work you need to name the files exactly as described below. The legacy loaders work with any file name but you have to select them manually. The models can be placed into sub-directories.

Remember you can also use any custom location setting an `ipadapter` entry in the `extra_model_paths.yaml` file.

- `/ComfyUI/models/clip_vision`
    - [CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors](https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors), download and rename
    - [CLIP-ViT-bigG-14-laion2B-39B-b160k.safetensors](https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/image_encoder/model.safetensors), download and rename
    - [clip-vit-large-patch14-336.bin](https://huggingface.co/Kwai-Kolors/Kolors-IP-Adapter-Plus/resolve/main/image_encoder/pytorch_model.bin), download and rename only for Kolors models
- `/ComfyUI/models/ipadapter`, create it if not present
    - [ip-adapter_sd15.safetensors](https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15.safetensors), Basic model, average strength
    - [ip-adapter_sd15_light_v11.bin](https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_light_v11.bin), Light impact model
    - [ip-adapter-plus_sd15.safetensors](https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus_sd15.safetensors), Plus model, very strong
    - [ip-adapter-plus-face_sd15.safetensors](https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus-face_sd15.safetensors), Face model, portraits
    - [ip-adapter-full-face_sd15.safetensors](https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-full-face_sd15.safetensors), Stronger face model, not necessarily better
    - [ip-adapter_sd15_vit-G.safetensors](https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_vit-G.safetensors), Base model, **requires bigG clip vision encoder**
    - [ip-adapter_sdxl_vit-h.safetensors](https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl_vit-h.safetensors), SDXL model
    - [ip-adapter-plus_sdxl_vit-h.safetensors](https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors), SDXL plus model
    - [ip-adapter-plus-face_sdxl_vit-h.safetensors](https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus-face_sdxl_vit-h.safetensors), SDXL face model
    - [ip-adapter_sdxl.safetensors](https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl.safetensors), vit-G SDXL model, **requires bigG clip vision encoder**




For the Unified Loader to work the files need to be named exactly as shown in the list below.

- `/ComfyUI/models/ipadapter`
    - [ip-adapter-faceid_sd15.bin](https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sd15.bin), base FaceID model
    - [ip-adapter-faceid-plusv2_sd15.bin](https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15.bin), FaceID plus v2
    - [ip-adapter-faceid-portrait-v11_sd15.bin](https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait-v11_sd15.bin), text prompt style transfer for portraits
    - [ip-adapter-faceid_sdxl.bin](https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sdxl.bin), SDXL base FaceID
    - [ip-adapter-faceid-plusv2_sdxl.bin](https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl.bin), SDXL plus v2
    - [ip-adapter-faceid-portrait_sdxl.bin](https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sdxl.bin), SDXL text prompt style transfer
    - [ip-adapter-faceid-portrait_sdxl_unnorm.bin](https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sdxl_unnorm.bin), very strong style transfer SDXL only
Most FaceID models require a LoRA. If you use the `IPAdapter Unified Loader FaceID` it will be loaded automatically if you follow the naming convention. Otherwise you have to load them manually, be careful each FaceID model has to be paired with its own specific LoRA.

- `/ComfyUI/models/loras`
    - [ip-adapter-faceid_sd15_lora.safetensors](https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sd15_lora.safetensors)
    - [ip-adapter-faceid-plusv2_sd15_lora.safetensors](https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15_lora.safetensors)
    - [ip-adapter-faceid_sdxl_lora.safetensors](https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sdxl_lora.safetensors), SDXL FaceID LoRA
    - [ip-adapter-faceid-plusv2_sdxl_lora.safetensors](https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl_lora.safetensors), SDXL plus v2 LoRA
