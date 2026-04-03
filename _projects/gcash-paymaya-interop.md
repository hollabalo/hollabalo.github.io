---
layout: project
title: Wallet Interoperability Platform
description: Built the API bridge between two major digital wallets — and personally caught a live fraud attack in Splunk logs mid-shift. Stopped it, patched it, shipped better rate limiting.
featured: true
company: Digital Payments Company
year: 2016
---

## Overview

End-to-end backend work connecting two of the country's largest digital wallets — and personally responding to a live fraud attack in production.

## Critical Production Incident

Identified a suspicious pattern in Splunk logs: rapid backend API calls executing high-value fraudulent transfers. Coordinated emergency system shutdown, then designed and deployed:

- Rate limiting on the interoperability API
- Enhanced API authentication
- Transaction velocity checks

## Interoperability Platform

- Developed REST API enabling seamless money transfers between the two platforms, processing hundreds of thousands of transactions monthly
- Architected unified balance inquiry microservice consolidating legacy payment systems through intelligent routing — reducing redundant backend calls

## Money-In Platform

- Built multi-channel money-in platform integrating 6+ payment providers: OTC, kiosks, bank transfers, remittance centers
- Developed Spring Batch application for automated daily merchant transaction reports
- Implemented Jenkins CI/CD quality gates across 5 refactored microservices

## Tech

`Java` `Spring Boot` `Spring Batch` `AWS (EC2, RDS, S3)` `Oracle DB` `Jenkins` `Splunk` `New Relic`
