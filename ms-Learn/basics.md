The API indicates how developers can consume predictions for the following modalities [Docs](https://learn.microsoft.com/en-us/rest/api/aifoundry/modelinference/#modalities):

- Get info: Returns the information about the model deployed under the endpoint.
- Text embeddings: Creates an embedding vector representing the input text.
- Chat completions: Creates a model response for the given chat conversation.
- Image embeddings: Creates an embedding vector representing the input text and image.

## Foundry agents
Foundry Agent Service have the following elements:

- Model: A deployed generative AI model that enables the agent to reason and generate natural language responses to prompts. You can use common OpenAI models and a selection of models from the Azure AI Foundry model catalog.
- Knowledge: data sources that enable the agent to ground prompts with contextual data. Potential knowledge sources include Internet search results from Microsoft Bing, an Azure AI Search index, or your own data and documents.
- Tools: Programmatic functions that enable the agent to automate actions. Built-in tools to access knowledge in Azure AI Search and Bing are provided as well as a code interpreter tool that you can use to generate and run Python code. You can also create custom tools using your own code or Azure Functions.
- Actiions : It will use the code interpreter tool as required to perform actions by generating and running its own Python code.

> Conversations between users and agents take place on a thread, which retains a history of the messages exchanged in the conversation as well as any data assets, such as files, that are generated
