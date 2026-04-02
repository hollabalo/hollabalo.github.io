---
visible: true
company: Globe Fintech Innovations (GCash)
duration: August 2024 - Present
position: Solutions Architect, Manager
tech: [Java, Spring Boot, Apache Kafka, Kubernetes, AWS RDS, Alibaba Cloud, gRPC, Distributed Caching]
---
**Account Management Offboarding (BSP Regulatory Compliance)**
- Architected event-driven offboarding system processing 30 million accounts for BSP compliance, with Kafka event streaming for real-time KYC monitoring + Kubernetes CronJobs for monthly fee collection
- Created comprehensive technical artifacts: logical/physical/data flow/sequence diagrams, network diagrams, database schemas, pseudocode, performance testing specs

**Spending Limits Breakdown (BSP Regulatory Compliance)**
- Architected real-time aggregation system for users with up to 5 linked accounts; designed parent-child profile architecture (1 parent profile ID → multiple account IDs) enabling single-query multi-account retrieval
- Implemented caching strategy and asynchronous refund processing for real-time spending adjustments

**Unlimited Limits Bug Mitigation (15M Accounts Remediation)**
- Architected automated remediation fixing 15M accounts with missing spending limits records from 2019 data migration
- Designed multi-threaded batch processor with cache invalidation; implemented concurrent Kubernetes processing (3 pods + 3 cron jobs) for off-peak execution within strict time windows

**ZOLOZ Migration & Offer Takeover**
- Architected gradual migration strategy with traffic splitting for zero-downtime transition from on-premise to cloud-based ZOLOZ
- Designed end-to-end automated data pipeline and voucher seeding system processing 1 million eligible users monthly
