
| Aspect        | Generative AI                                      | Agentic AI                                                                 |
|---------------|-----------------------------------------------------|-----------------------------------------------------------------------------|
| Core Purpose  | Create new content (text, images, code, etc.)       | Autonomously reason, plan, and act toward goals without step-by-step


| Type                    | Reactive | Tool Use | Reasoning | Planning | Proactivity |
|-------------------------|----------|----------|-----------|----------|-------------|
| RAG Chatbot             | ✔️       | ❌       | ❌        | ❌       | ❌          |
| Tool-Augmented Chatbot  | ✔️       | ✔️       | ❌        | ❌       | ❌          |
| Agentic AI              | ✔️       | ✔️       | ✔️        | ✔️       | ✔️          |


## Traditional AI
- **Spam Classification**
- **Image Classification**
- **Home Price Prediction**

## Gen AI
- Example prompt: *"write a 4 line poem on my love for samosas"*
- Output:
  - Golden crunch with spicy cheer,  
    Samosa, my love, forever near.  
    With every bite, my heart does sing,


|                    | FNN                                | RNN                         | CNN                                         | Transformer                        |
|--------------------|-------------------------------------|------------------------------|----------------------------------------------|-------------------------------------|
| **Architecture**   | Feed‑forward network                | Network with cycles         | Feed‑forward network with convolutional filters | Self‑attention mechanism           |
| **Best for?**      | Static, structured data             | Text, time‑series data      | Images, video                                | Text, time‑series, Generative AI   |
| **Use Cases**      | Temperature forecast, credit scoring | Language translation, speech to text | Image classification, object detection | Text summarization, Q&A, translation |

| **Feature**              | **Traditional AI**                                                                 | **Generative AI**                                                                                 |
|--------------------------|--------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| **Purpose**              | Analyze, predict, classify, or make decisions                                       | Generate new content: text, images, code, audio, etc.                                             |
| **Examples of Tasks**    | Fraud detection, price prediction, spam filtering                                   | Writing essays, generating images, summarizing text                                               |
| **Type of Output**       | Fixed/structured outputs (yes/no, labels, numbers)                                   | Creative/unstructured outputs (sentences, images, music, etc.)                                    |
| **Model Types**          | Decision trees, linear regression, SVM, rule-based systems                           | Large Language Models (LLMs), GANs, diffusion models                                              |
| **Training**             | Often supervised learning with labeled data                                          | Pretrained on massive datasets, fine-tuned for specific tasks                                     |
| **Human‑Like Capabilities** | Limited (task-specific logic)                                                         | High (can mimic human writing, art, reasoning, conversation)                                      |
| **Tools/Examples**       | XGBoost, Scikit‑Learn models, rule engines                                           | GPT, DALL‑E, Claude, Stable Diffusion, Gemini

Here you go, Ananay — a **clean, structured Markdown conversion** of *all* the content in your images.  
(As requested: **no mention of any blurred face**.)

***

# **How are LLMs Built?**

```markdown
## How are LLMs built?

1. **Data Curation**
2. **Tokenization**
3. **Model Architecture**
4. **Model Training at Scale**
5. **Evaluation**
```

***

# **Classification vs Regression**

```markdown
## Classification
- Email SPAM Classification  
- Fraud Detection  
- Image Classification  

## Regression
- Property price prediction  
- Salary prediction  
- Stock price forecasting  
```

***

# **Goal‑Oriented Planning (Example Workflow) for AI Agents**

```markdown
## Goal-Oriented Planning: Onboard the new intern joining next Monday

1. Schedule welcome meeting  
   - Supported by: LLM + Calendar tools

2. Create intern’s profile in HR Management System  
   - Supported by: LLM + HRMS tools

3. IT Helpdesk setup (Wi-Fi credentials, Email, Slack access)  
   - Supported by: LLM + IT & communication tools

4. Order laptop, ID card  
   - Supported by: LLM + Asset management tools
```

***

# **Deep Learning Definition**

```markdown
## Deep Learning

Deep Learning is a machine learning technique that uses neural networks
to learn from large amounts of data, mimicking the human brain’s ability
to recognize patterns and make decisions.
```

***

# **Neural Network Illustration (Conceptual)**

```markdown
## Neural Network Structure (Conceptual)

- **Input Layer**
- **Hidden Layer 1**
  - Cat’s Ears
  - Cat’s Eyes
  - Cat’s Legs
  - Cat’s Tail
  - Dog’s Ears
  - Dog’s Eyes
  - Dog’s Legs
  - Dog’s Tail

- **Hidden Layer 2**
  - Cat’s Head
  - Cat’s Body
  - Dog’s Head
  - Dog’s Body

- **Output Layer**
```
# ✅ **1. Attention Breakdown Example (Modifiers & Token Weights)**

```markdown
## Attention Breakdown Example

**Sentence:**  
I made a sweet Indian rice dish called ___

### Token Explanations (with attention scores)
- **I** — I am the subject of the sentence (0.7%)
- **made** — I indicate an action or verb (1.1%)
- **a** — I am a determiner (1.4%)
- **sweet** — I am an adjective describing taste (36.3%)
- **Indian** — I am an adjective describing origin (11.0%)
- **rice** — I am a noun indicating the main ingredient (19.3%)
- **dish** — I am the main subject being described (29.2%)
- **called** — (part of next clause)

### Query
- **Query:** “I want to know about my modifiers”
```

***

# ✅ **2. Pretraining Process (LLM Training Overview)**

```markdown
## Pretraining Steps

### Step 1: Download and preprocess the internet
- Collect large-scale text from websites, books, articles, etc.
- Clean and normalize text.

---

### Step 2: Tokenization
- Convert text into sequences of symbols (tokens).
- Vocabulary size examples:
  - 50,000 tokens
  - 100,000+ tokens
- Byte Pair Encoding (BPE) is often used.
- Compresses text into common subword units.

**Example:**
- "I love pizza" → tokens like:  
  - I  
  - lo  
  - ve  
  - piz  
  - za  

---

### Step 3: Neural Network Training
- Input sequence example: `91, 860, 287, 11579`
- Neural network outputs probability distribution for next token:
  - direction → 2%  
  - case → 1%  
  - post → 4%  
- Correct next token: `3952` (example)

---

### Neural Network Internals
- Parameters (weights):  
  - Typically billions of values.
- Neural network learns a function to map input tokens → output probabilities.

---

### Inference (Generation)
- For text generation:
  - Feed tokens one at a time.
  - Sample next token from probability distribution.
  - Append and repeat.

**Example sequence during generation:**
```

input → neural network → probabilities → sample → next token
91 → ... → next token: 860  
91, 860 → ... → next token: 287  
91, 860, 287 → ... → next token: 11579

```
```

***

# ✅ **3. Attention Explanation (Value Scores Per Token)**

```markdown
## Token Meaning & Value Scores

**Sentence:**  
I made a sweet Indian rice dish called ___

### Token Values
- **I** — This is a first-person perspective (0.7%)
- **made** — An action was performed (1.1%)
- **a** — The dish is singular (1.4%)
- **sweet** — The taste is sweet (36.3%)
- **Indian** — The style or origin is Indian (11.0%)
- **rice** — The main ingredient is rice (19.3%)
- **dish** — This is the main noun being described (29.2%)

### Query
- **User query:** “I want to know about my modifiers”
```


