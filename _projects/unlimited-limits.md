---
layout: project
title: Unlimited Limits Bug Mitigation
description: A 2019 migration silently left 15 million accounts without spending limits. I designed the batch remediation system to fix them — zero downtime, off-peak Kubernetes jobs, cache invalidation included.
featured: true
company: Globe Fintech Innovations (GCash)
year: 2024
---

## Overview

A 2019 data migration left 15 million GCash accounts with missing spending limits records — silently allowing unlimited transactions against BSP regulations. This project designed the remediation system.

## Architecture

- **Multi-threaded batch processor** with cache invalidation strategy for zero-disruption database patching
- **Concurrent Kubernetes processing:** 3 pods + 3 cron jobs running off-peak within strict time windows to avoid production impact
- Cache invalidation designed to prevent stale limit data from being served during the patching window

## Key Contributions

- Architected the end-to-end remediation approach with no service downtime
- Designed execution schedule to work within BSP-mandated time windows
- Coordinated with infrastructure team for Kubernetes pod scaling and monitoring

## Tech

`Java` `Spring Boot` `Kubernetes CronJobs` `Multi-threading` `Distributed Caching` `AWS` `Alibaba Cloud`
