# AI-13July

**multi-modal, meaning they can process images, audio, and other data types alongside text. Models like GPT-4o and Phi3-vision are capable of analyzing and generating both text and images**

[LLM architecture](https://github.blog/ai-and-ml/llms/the-architecture-of-todays-llm-applications/)

> The Github for AI & ML - Hugging Face
> YOu can create your profile and share your models,
> Inference API: Run models in the cloud (no GPU needed)
> Hugging Face Spaces: Host and demo ML apps using Gradio or Streamlit
Example: Build a chatbot or image classifier in minutes and share it with a link.

- [Hugging Face](https://huggingface.co/) is a platform and toolset that makes it easy to use, share, and deploy modern machine learning models — especially transformers — for tasks like NLP, vision, and audio.

| Capability                           | GitHub | Hugging Face                                |
| ------------------------------------ | ------ | ------------------------------------------- |
| **Model Hosting**                    | ❌      | ✅                                           |
| **One-line Model Download**          | ❌      | ✅ (`transformers`)                          |
| **Dataset Library**                  | ❌      | ✅                                           |
| **Inference API** (no deploy needed) | ❌      | ✅                                           |
| **Live ML demos (Spaces)**           | ❌      | ✅                                           |
| **Pretrained Model Search**          | ❌      | ✅ (like a model marketplace)                |
| **Auto integration with ML tools**   | ❌      | ✅ (`transformers`, `datasets`, `diffusers`) |

## AI models
1. Multi Modles - GPT-4o and Phi3-vision
2. generating images -  DALL·E 3 and Stability AI
3. embedding models like Ada and Cohere. Embeddings models convert text into numerical representations and are used to improve search relevance by understanding semantic meaning. These models are often implemented in Retrieval Augmented Generation (RAG) scenarios to enhance recommendation engines by linking similar content.

## How to Pick AI Model 
[MS Learn](https://learn.microsoft.com/en-us/training/modules/explore-models-azure-ai-studio/2-select-model?ns-enrollment-type=learningpath&ns-enrollment-id=learn.wwl.create-custom-copilots-ai-studio)

## Prompt Engineering - [ms learn](https://learn.microsoft.com/en-us/training/modules/explore-models-azure-ai-studio/4-improve-model)
**Good Question => give response**

system prompt. The system prompt sets the model's behavior and allows you to guide the model without exposing the end user to the instructions. The best results are often achieved through the assignment of an explicit system prompt and guidance (or templates) that help users submit prompts that reflect the patterns described here.

- fine tuning by provifing sample questions and responses
![](https://learn.microsoft.com/en-us/training/wwl-data-ai/explore-models-azure-ai-studio/media/model-optimization.png)

