#### Transformers - [AWS Explains](https://aws.amazon.com/what-is/transformers-in-artificial-intelligence/)
Transformers are a type of neural network architecture that transforms or changes an input sequence into an output sequence. They do this by learning context and tracking relationships between sequence components. For example, consider this input sequence: "What is the color of the sky?" The transformer model uses an internal mathematical representation that identifies the relevancy and relationship between the words color, sky, and blue. It uses that knowledge to generate the output: "The sky is blue." 
- With transformers, you can use AI for tasks that combine complex data sets. For instance, models like DALL-E show that transformers can generate images from textual descriptions, combining NLP and computer vision capabilities. With transformers, you can create AI applications that integrate different information types and mimic human understanding and creativity more closely.

> AI = lots of simple math (in parallel) → perfect for GPUs - [AWS Docs](https://aws.amazon.com/compare/the-difference-between-gpus-cpus/)

GPUs offer the parallelism, throughput, and efficiency needed to train and run large-scale AI models quickly.

| Feature           | **CPU**                                | **GPU**                                                 |
| ----------------- | -------------------------------------- | ------------------------------------------------------- |
| **Purpose**       | General-purpose tasks (logic, control) | Specialized for parallel computations                   |
| **Cores**         | Few (4–32 powerful cores)              | Thousands (simple, specialized cores)                   |
| **Task Handling** | Good for sequential, complex tasks     | Great for parallel, repetitive tasks                    |
| **Clock Speed**   | Higher per-core speed                  | Lower per-core, but massive parallelism                 |
| **Latency**       | Low latency for single tasks           | High throughput, less ideal for latency-sensitive tasks |
| **AI Use**        | Used more in inference or small models | Critical for training large models                      |

### Neural Network
- Neural networks have been the leading method in various AI tasks such as image recognition and NLP since the early 2000s. They consist of layers of interconnected computing nodes, or neurons, that mimic the human brain and work together to solve complex problems.

### vectors (AI readble characters) 
- You can visualize vectors as a series of coordinates in an n-dimensional space. As a simple example, think of a two-dimensional graph, where x represents the alphanumeric value of the first letter of the word and y represents their categories. The word banana has the value (2,2) because it starts with the letter b and is in the category fruit. The word mango has the value (13,2) because it starts with the letter m and is also in the category fruit. In this way, the vector (x,y) tells the neural network that the words banana and mango are in the same category.

> Computing = Using machines to think, calculate, and solve problems for us.

| Type                                 | Description                                     | Example                                   |
| ------------------------------------ | ----------------------------------------------- | ----------------------------------------- |
| **Personal Computing**               | For everyday use by individuals                 | Laptops, desktops                         |
| **Cloud Computing**                  | Computing over the internet                     | AWS, Google Cloud, Microsoft Azure        |
| **High-Performance Computing (HPC)** | Super powerful systems for massive calculations | Weather modeling, simulations             |
| **Edge Computing**                   | Processing data near where it's collected       | IoT devices, smart cameras                |
| **Quantum Computing**                | Using quantum mechanics to process data         | Still experimental, for specialized tasks |

| Task                       | Description                                        |
| -------------------------- | -------------------------------------------------- |
| **Browsing the web**       | Computer fetches and renders pages (HTML, CSS, JS) |
| **Typing a document**      | Inputs from keyboard are processed and displayed   |
| **Watching a video**       | Decoding video/audio streams in real-time          |
| **Using a calculator app** | Performing basic arithmetic and displaying results |
| **Playing a game**         | Processing graphics, physics, logic, and inputs    |
| **Email or messaging**     | Sending, receiving, and displaying text and media  |

## Terms
- Fine-Tuning
Adjusting a pre-trained model on specific data to specialize it.

- Contextual Data Integration
Incorporating relevant external information to improve responses.

- RAG (Retrieval Augmented Generation)
Technique combining retrieval of external knowledge with generation to produce more accurate and informed outputs.
