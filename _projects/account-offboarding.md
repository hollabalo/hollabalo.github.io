---
layout: project
title: Account Management Offboarding
description: How do you process 30 million accounts without breaking production? Kafka for real-time KYC events, Kubernetes CronJobs for the monthly batch run, and a lot of careful design.
featured: true
company: Major Fintech Platform
year: 2024
---

## Overview

Architected an event-driven offboarding system for BSP regulatory compliance that processes 30 million user accounts — charging monthly maintenance fees to unverified accounts.

## Architecture

Designed a hybrid architecture combining two processing modes:

- **Real-time:** Kafka event streaming for KYC status monitoring — account state changes trigger immediate offboarding events
- **Batch:** Kubernetes CronJobs for monthly fee collection runs across the full account population

## Key Contributions

- Designed logical/physical/data flow/sequence diagrams, network diagrams, database schemas, pseudocode, and performance testing specs
- Collaborated with 3 backend engineers through detailed ticket specifications and acceptance criteria
- Balanced throughput requirements with BSP compliance deadlines and zero-disruption constraints

## Tech

`Java` `Spring Boot` `Apache Kafka` `Kubernetes` `AWS RDS` `Event-Driven Architecture`
