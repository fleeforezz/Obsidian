# DevOps Telemetry
## 🔧 Tools You Should Know

### **1. Monitoring & Telemetry Tools**

- [**Prometheus**](Monitoring/Prometheus): Metrics collection and querying.
    
- **Grafana**: Visualizing Prometheus metrics, setting up dashboards.
    
- **Datadog / New Relic / AppDynamics**: Commercial APM tools.
    
- **ELK Stack (Elasticsearch, Logstash, Kibana)**: Common for log management.
    
- **OpenTelemetry**: Open standard for collecting traces, logs, and metrics.
    

> 💡 _Understand how data is collected (agent, SDK), processed, and visualized._

---

### **2. DevOps & Cloud Basics**

- **CI/CD pipelines**: GitHub Actions, GitLab CI/CD, Jenkins.
    
- **Docker**: Basic Dockerfile, container lifecycle, networking.
    
- **Kubernetes**: Pods, Services, Deployments (high-level overview).
    
- **AWS / Azure / GCP** basics: EC2, CloudWatch, S3, IAM, etc.
    

---

### **3. Observability Concepts**

- **3 Pillars of Observability**: Logs, Metrics, Traces.
    
- **SLIs / SLOs / SLAs**: Definitions and examples.
    
- **Instrumentation**: Manual vs. auto-instrumentation of code.
    
- **Alerting**: Threshold-based vs. anomaly detection.
    

---

### **4. Scripting & Querying**

- **Bash scripting**: File manipulation, basic loops.
    
- **SQL basics**: Useful for querying monitoring databases.
    
- **PromQL** (if Prometheus is in use): How to write queries.
    

---

### **5. Git & Version Control**

- Cloning, branching, commits, pull requests, merge conflicts.
    

---

## 📚 Soft Knowledge Areas

- **What is DevOps?**: Culture, collaboration, automation, feedback loops.
    
- **Agile/Scrum**: Basic understanding of sprint cycles and standups.
    
- **Telemetry in SDLC**: Why observability matters, how it affects MTTR (Mean Time to Recovery).
    

---

## 🎯 How to Prepare Practically

### Hands-On (if time allows):

- Set up a **Prometheus + Grafana** stack locally or via Docker.
    
- Practice reading **JSON logs**, try creating **dashboards**.
    
- Try **OpenTelemetry Collector** locally to understand its pipeline.
    

### Conceptual:

- Review **Prometheus architecture**, metrics format.
    
- Understand **how to trace a user request** across microservices.
    
- Know **how alerts are triggered and escalated**.
    

---

## 🧠 Sample Questions They Might Ask

- What’s the difference between monitoring and observability?
    
- How would you collect telemetry data from a Python/Node app?
    
- Can you describe a time you debugged an issue using logs or metrics?
    
- What are key metrics you'd monitor for a web application?
    
- How does OpenTelemetry work in distributed systems?

[[Prometheus]]