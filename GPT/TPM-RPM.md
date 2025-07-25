In Azure AI Foundry, RPM (Requests Per Minute) and TPM (Tokens Per Minute) are key components of how usage is measured and limited for deployed language models. They are closely related but serve different purposes:


---

🔹 Definitions

Metric	Description

TPM (Tokens Per Minute)	The maximum number of tokens (input + output combined) that your deployment can process per minute.
RPM (Requests Per Minute)	The maximum number of inference requests (e.g., API calls to a deployed model) allowed per minute.



---

🔹 How They Are Related in Azure AI Foundry

When you create a deployment of a model, Azure assigns a specific quota in terms of "capacity units." Each capacity unit maps to a fixed TPM and RPM pair, depending on the model.

You do not control TPM and RPM independently. Instead, you allocate "capacity," and that capacity determines both values together.


---

🔹 Ratio of RPM to TPM

The ratio between RPM and TPM is model-dependent. For example, with older chat models, Azure provides:

1 Capacity Unit = 6 RPM and 1,000 TPM


This implies that each of the 6 requests per minute can use, on average, about ~167 tokens (1,000 ÷ 6) if fully utilized.


---

🔹 Why This Matters

If you send more tokens per request, you will hit your TPM limit first.

If you send many small requests, you may hit your RPM limit before reaching the TPM cap.

Optimization of usage depends on your use case:

Large prompts or outputs → TPM is more critical.

Frequent small interactions → RPM is more critical.




---

🔹 Example:

Let’s say you have deployed an older chat model with 2 units of capacity:

Metric	Value

TPM	2,000 tokens/minute
RPM	12 requests/minute


You can:

Send 12 requests per minute,

Use up to 2,000 tokens per minute total,

On average: 166 tokens per request if you want to maximize both.



---

🔹 Summary

TPM = How much text you can process per minute.

RPM = How many requests you can make per minute.

Capacity units determine both, based on model.

You don’t set RPM and TPM independently — they scale together based on the quota Azure grants for that model.


Would you like a breakdown for a specific model's quota (e.g., GPT-4-turbo) or how to choose the right capacity for your use case?




Great question. Let’s break it down clearly:


---

🧠 Your Scenario

You make one very large API call.

That one call consumes all or most of your Tokens Per Minute (TPM) quota.

But it's only your first call, so you still have Requests Per Minute (RPM) quota left.



---

❓What Happens Now?

Even though you still have unused RPM, you cannot make another API call until the TPM quota resets (typically at the start of the next minute).

Here’s why:

Azure enforces both RPM and TPM independently.

If either the TPM OR RPM quota is exceeded, additional requests will be throttled or rejected (usually with a 429 Too Many Requests error).

Hitting the TPM means you've maxed out your token capacity for that minute, regardless of how many requests you've made.



---

🔁 What to Expect Next

The quota resets every minute.

Once the next minute starts:

Your TPM is replenished.

Your RPM is also reset.

You can then resume making requests—subject to your quota limits.




---

📌 Summary

Quota Hit	What Happens	Can You Make More Calls?

TPM exceeded	Token limit reached	❌ No, until tokens reset
RPM exceeded	Request count limit reached	❌ No, until next minute
Only one hit	Either limit is reached	❌ Still blocked, even if the other is unused



---

✅ How to Avoid This

If you consistently hit TPM before RPM:

Increase capacity (get more TPM & RPM together).

Batch or compress prompts to reduce tokens per request.

Spread requests over time to avoid bursts.


Would you like help estimating the tokens in your requests or optimizing usage?

