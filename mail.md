Here is a draft you can send to the Salesforce Technical Team. I have structured it to be clear, professional, and technically specific so they understand the architectural challenges immediately.
I have also added a "Pre-Send Notes" section at the bottom to give you context on why I phrased certain questions the way I did, particularly regarding the .zip and .xlsx limitations.
Subject: Technical Inquiry: Agentforce & Document AI Feasibility (Zip/Multi-format Support)
Hi [Name of Account Executive or Solution Engineer],
We are currently scoping a specific use case for Agentforce and Document AI, and we would like your technical team’s input regarding feasibility and architectural best practices.
The Use Case:
We aim to automate data extraction from attachments on a custom "Application" object. The workflow is as follows:
 * Trigger: An Application record is created with a .zip file attachment.
 * Processing: The system accesses the .zip file, which contains 1–2 specific files (formats vary: .pdf, .txt, .docx, .csv, or .xlsx).
 * Analysis: The AI analyzes these specific files to extract key data points.
 * Human-in-the-Loop: An Agentforce Agent presents a summary of the extracted data and a proposal of records to be created.
 * Execution: Upon user confirmation, the Agent creates the necessary records in Salesforce.
Technical Questions:
We have identified several potential constraints and would appreciate clarity on the following:
1. Document AI & File Format Support:
We understand Document AI natively supports PDF, PNG, and JPEG.
 * Zip Files: Since our input is a .zip archive, what is the recommended approach to "unzip" and extract the files for the Agent to process? Does Agentforce have a native action for this, or does this require an Apex/Flow pre-processing step?
 * Non-OCR Formats: How should we handle .docx, .txt, .csv, and .xlsx files? Since Document AI is typically OCR-focused, should we be using a standard LLM prompt within the Agent for these text-based formats instead of the Document AI parser?
2. Data Cloud Ingestion & Filtering:
 * Salesforce Files -> Data Cloud: What is the correct architecture to retrieve files attached to Salesforce records (ContentDocument) and ingest them into Data Cloud for Document AI processing?
 * Filtering: Is there a configuration within the Data Cloud ingestion flow (or Document AI) to filter files based on the Parent Record’s Object or RecordType? We strictly want to avoid ingesting all Salesforce attachments into Data Cloud for cost and governance reasons.
3. Limitations & Consumption:
 * Volume: What are the current file size and file count limitations per transaction?
 * Credits: How is credit consumption calculated in this flow? specifically, if we have to unzip a file and process multiple documents inside, is that treated as a single request or multiple?
Next Steps:
Could we schedule a brief call to discuss the architecture for this? We want to ensure we are selecting the right tool (Document AI vs. standard LLM context) for the varied file types.
Best regards,
[Your Name]
[Your Title]
Pre-Send Notes for You (Context)
I grouped your questions to make them easier for the engineer to answer. Here is why I phrased them that way:
 * The ZIP Issue: Document AI generally cannot "look inside" a zip file. It expects a raw PDF or Image. The solution will likely require a Flow or Apex Class to unzip the file first. I asked about "native actions" to see if Agentforce has a new feature for this, but likely you will need a developer to write a small utility to unzip the files.
 * The Excel/Word Issue: Document AI is designed for unstructured images (like a scanned invoice). It is usually overkill (and sometimes incompatible) with .csv or .xlsx files because those are already structured data. The solution for Excel/CSV is usually just feeding the text directly to the LLM, not using Document AI.
 * The "Files" Connection: Salesforce "Files" (Attachments) do not automatically exist in Data Cloud. You usually have to set up a specific Data Stream or use an S3 bucket as a middleman. I emphasized the "Filtering" question because turning on a Data Stream for "ContentDocument" without filters will suck every file in your org into Data Cloud, which gets expensive very fast.
Would you like me to create a diagram of how the "Unzip via Apex" flow might look to prepare for their answer?
