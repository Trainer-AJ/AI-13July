1. Retrieve grounding data based on the initial user-entered prompt.
2. Augment {to increase the amount, value, size, etc. of something} the prompt with grounding data.
3. Use a language model to generate a grounded response.

![](https://docs.aws.amazon.com/images/sagemaker/latest/dg/images/jumpstart/jumpstart-fm-rag.jpg)

### Use External data source 
- TO answer based on given data not existing data
1. Upload files and ask AI to answer based on that
2. Use embedding models : converts data into numerical representations and stores it in a **vector database**. This process creates a knowledge library that the generative AI models can understand.

### Pull relevant record
The relevancy was calculated and established using mathematical vector calculations and representations.

### Pair semantic search with RAG:

- 🔍 **Conventional RAG search** (keyword-based) struggles with complex, knowledge-heavy tasks.
- ⚙️ **Manual setup required**: Developers must handle embeddings, chunking, and data prep.
- 🤖 **Semantic search simplifies**: Automatically prepares the knowledge base—no manual effort needed.
- 📚 **Smarter results**: Generates semantically relevant passages and token words.
- 🎯 **Higher quality payloads**: Orders results by relevance to improve RAG performance.
