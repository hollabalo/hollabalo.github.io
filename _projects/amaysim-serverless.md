---
layout: project
title: Serverless Platform — Amaysim
description: Four years of serverless-first development at an Australian MVNO — Lambda functions in Node.js, Stripe subscriptions, a React dashboard, and a CI/CD migration I'm still proud of.
featured: false
company: Amaysim Philippines / NCSI Philippines
year: 2019
---

## Overview

Four years of serverless-first backend development at Amaysim Philippines, a virtual mobile network operator (MVNO). Heavy use of AWS Lambda, Node.js, and event-driven patterns.

## Projects

**Card Payment via Phone**
Serverless microservice for agent-assisted IVR payment collection. Implemented CVV masking and SecureCo payment gateway integration to meet PCI requirements for phone-based card transactions.

**Stripe Subscriptions**
Webhook handler service for mobile and energy subscription lifecycle events. Structured Stripe product catalog, handled subscription state changes, and published events to AWS Kinesis for downstream processing.

**User Dashboard**
Full-stack: React frontend + Node.js serverless backend. Customer-facing account dashboard showing linked mobile and energy subscriptions with real-time account status.

**CI/CD Migration (SnapCI → GoCD)**
Led migration from SnapCI to GoCD using the 3 Musketeers pattern (Docker + Make + Compose) for consistent Lambda deployments across environments.

**Broadband Provisioning**
Serverless APIs integrating with Australia's NBN (National Broadband Network) for automated service activation on new subscriber signups.

## Tech

`AWS Lambda` `API Gateway` `DynamoDB` `Aurora PostgreSQL` `S3` `SQS` `SNS` `Kinesis` `Node.js` `React` `Serverless Framework` `Docker` `GoCD`
