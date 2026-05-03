Return-Path: <linux-leds+bounces-7952-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCX7L45792kpiQIAu9opvQ
	(envelope-from <linux-leds+bounces-7952-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 18:45:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 170DC4B688C
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 18:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36E3C3007C83
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2026 16:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9C430FC27;
	Sun,  3 May 2026 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOSh3htg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F8A2FDC3C
	for <linux-leds@vger.kernel.org>; Sun,  3 May 2026 16:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826698; cv=none; b=a+DaF5rYmR02rQ/rSLC/F56ctqxIOiIpHeFMHYr5b1tA4XjLy6y0aap/mBPuZoGlkg5YVOxyOgIqxaWB9U71dMG93L8ut0r/l6W3805lVXuhyswAtyFkJESFlLC9QKStW+SFo3WgfiTvCFQES/kNIPD+wMS2w4wnT4XQjnjfAiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826698; c=relaxed/simple;
	bh=y+9xN+1jfnMVYLvwRJZSv0ezZVwL6LabrDEHqq7wFB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SUYLb9xb/jEyevtHQh4ohM2RzaINSjpvoYVRK3lRhr0tUpjXmtP8l4as/CYYFua8/1WeZxzZ/ICGXVsiP93XltaeXe+4WBuND0O2eFtzsQTn5NR2KCAcUhCjjMXCJicgsNZAiz0IgLXxaUBzNdVpZ8N1XQs74BJoUn2bJMF7sLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOSh3htg; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b93698bb57aso644804866b.0
        for <linux-leds@vger.kernel.org>; Sun, 03 May 2026 09:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777826696; x=1778431496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l+0umxCULiEOpYYoS6pnO55Z9jlD+e8op4Q5ysR57J0=;
        b=nOSh3htgkvFWtAo1UyX+K6p7lw68/sJ5GsEfmX1hG3LVjn0RCus+cl5OAYrH/3qw+r
         veD+WSzp3MXFSrz4/fetBd0Pkqc9G9T2y/sUiYvFnVBvRW693tlwjyzItg426x3mLqYK
         qzgT63kxEK2gL50BFOZ6Yp4xv3p1ih1MGcct/ymTHjH8uDi9DdHx5a9lqFPkLAmSfQXM
         em+CTFzi4owrW1/6Zud8CpWmr9RBLyW5L9hno8vFMtzkRl+I0M7VWJKjk2eRONjMPtS9
         1YLFfEr4T+u7PLDFB8CyZlNbIxOSaRFcuuDAsUG+Vx6eR82VymmtfcQFhCCnByHSNClR
         8WkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826696; x=1778431496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+0umxCULiEOpYYoS6pnO55Z9jlD+e8op4Q5ysR57J0=;
        b=brO/Ynz3sroyWIWLlAdAz7u+HokyJpOxO7F4cmtob6mWjgPAX4RilOKRjfCuVlQhae
         D8ue1pMyASeLTlzPVGKWQV+Fn+PcUOseXElIZD11/y8g+XstLi7LydE69puvB4ccWbgk
         tUY5DfD6rdMfDcz65M13ERxIj4sSYePQR8IVwDvtLXvYxwarpMWH3+KDfGSM05UPlmgg
         CGqmbo1nIYsndTrf/0ox0pf4dqjx96FQ5uYr+i6hbj7cvSCCu6V9sgPq7vUnJLDYx/zj
         JifRufyIiOVzncEweVVKTJKmxHhkvFNA1gC1cZkBAJ7K7KILQQZDLW/EWtva8uOVEzLs
         jNug==
X-Gm-Message-State: AOJu0Yxv1oSdQALsWBmFrKCu3Ppou4ecgd1V1Gw61YMootcQ+34GAuBD
	Iu5VhMwCPXqc3fC25HHayO+nar8ZRmSjnpwyNDbtg9JZIP0vKUjkAvKI/33uAw==
X-Gm-Gg: AeBDiet+SFyYfUEyn5Uyu4RGaKbBDNxoLnrM5bxfaK34IddyxkAu0pJlTrU8uDdS6W/
	LJjodIBjIX2x5Th97E1O5LHqDsSXhXAHV9Qax48UOHWn4PDl1ZqhyYPeLOxUmeppUNHujONj0Z4
	ngtXJruYHVR4ZVw96Hmq7Lg2RgI1N3N1aBTddUr1MusvqQelZnG/SCnAypMm8Muu2S7HgvEjQ1x
	dTSYV9usJ/fh+JjYdHDCCLGVrPTLIh0rdhXNGsgLy+YAI/WqFBSnbqs2pwUoOsy0683KCjx7iI2
	FJCF39ZNneyehJUnGOiu0n5P9WQ6nVHLz447M2/ekuobnmCpSZwRG6KV+acopp6w91CO0qHSpF4
	eM31cjCRUwo6yYazQYP0j+PTBj+bB83rvdNo+jMa3BF/FBJHiqxMq4zKMjsphSovzaOeBpwOI9n
	ilCRl+DxMzZivBY8w4mFfaXE4=
X-Received: by 2002:a17:907:3f1e:b0:ba6:79c0:c743 with SMTP id a640c23a62f3a-bbfe08823famr295010266b.11.1777826695583;
        Sun, 03 May 2026 09:44:55 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc237ef8297sm27430566b.57.2026.05.03.09.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:44:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v5 0/6] media: lm3560: convert to use OF bindings
Date: Sun,  3 May 2026 19:44:39 +0300
Message-ID: <20260503164445.215540-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 170DC4B688C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7952-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
Remove platform data and switch to OF device tree bindings.

---
Changes in v5:
- schema adjusted to take into account lm3559
- device_for_each_child_node > for_each_available_child_of_node
- lm3559 and lm3560 configuration was diverged with data match
- removed redundant header

Changes in v4:
- fixed current being off by 10 in schema
- label property from schema replaced with modern equivalents
- lm3560_init_device moved before subdev registration
- v4l2_device_unregister_subdev > v4l2_async_unregister_subdev
- added subdevice cleanup if second led registration fails
- added check if "reg" property exists for LED nodes
- added missing fwnode_handle_put if device loop fails
- added bitmap to monitor configured LED id
- added pm_ptr() macro for PM operations pointer

Changes in v3:
- added note regarding lm3559 in the schema commit
- lm3560 power on/off functions converted to be part of PM,
  dropped redundant wrappers

Changes in v2:
- vendor properties swapped with generic LED properties
- added mutex lock usage optimization
- power supply and enable gpio commits squashed into PM
  configuration since they are both required in making
  proper on/off sequence.
---

Svyatoslav Ryhel (6):
  dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
  media: i2c: lm3560: Fix v4l2 subdev registration
  media: i2c: lm3560: Optimize mutex lock usage
  media: i2c: lm3560: Convert to use OF bindings
  media: i2c: lm3560: Add support for PM features
  media: i2c: lm3560: Add proper support for LM3559

 .../devicetree/bindings/leds/ti,lm3560.yaml   | 163 ++++++++
 drivers/media/i2c/lm3560.c                    | 385 +++++++++++++++---
 include/media/i2c/lm3560.h                    |  84 ----
 3 files changed, 481 insertions(+), 151 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml
 delete mode 100644 include/media/i2c/lm3560.h

-- 
2.51.0


