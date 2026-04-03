---
layout: post
title: Spending Limits Breakdown
description: BSP says show consolidated spending across linked accounts. I designed a parent-child profile architecture that fetches all 5 accounts in a single query, with async cache updates on every transaction.
featured: false
company: Globe Fintech Innovations (GCash)
year: 2024
---

## Overview

BSP regulatory compliance project requiring GCash to display consolidated spending breakdowns across linked accounts — a user may hold up to 5 accounts under one identity.

## Architecture

- **Parent-child profile model:** 1 parent profile ID maps to multiple account IDs, enabling single-query multi-account retrieval instead of N separate calls
- **Caching strategy:** Pre-aggregated spending data with cache invalidation on transaction events for real-time accuracy
- **Asynchronous refund processing:** Refunds update the spending aggregate asynchronously to maintain responsiveness

## Key Contributions

- Designed the data model enabling single-query aggregation across 5 accounts
- Balanced real-time accuracy against read performance using intelligent cache invalidation
- Produced full technical artifact set: sequence diagrams, data flow diagrams, DB schema, pseudocode

## Tech

`Java` `Spring Boot` `Alibaba Cloud ECS` `RESTful APIs` `gRPC` `Distributed Caching`
