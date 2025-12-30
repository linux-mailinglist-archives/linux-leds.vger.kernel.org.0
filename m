Return-Path: <linux-leds+bounces-6483-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3583CE867D
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 01:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CB2E300983C
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 00:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E552D97AA;
	Tue, 30 Dec 2025 00:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4WZJ9QW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC9D1519B4
	for <linux-leds@vger.kernel.org>; Tue, 30 Dec 2025 00:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767054791; cv=none; b=KMSUN+L4pxpgDRzZssMAvrmSnGNeHxwHX/VBHIKM8n1/iEgd8sZIi4OTLbWpinWX01oOePYGENGxt9+QEP9BnH9+7opZ6clTvGBT94lQghi5LlX7kuOS40bJ/GC9jHv0cy4SCzEHF44J6t3qB6O4fN1iZHQ5p3h/pC6uoXPwtoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767054791; c=relaxed/simple;
	bh=3y1NVc5vWTSx3MmvStySWn0mxLBSepomzp/r9o4iIeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eIRhi53tUKNu76DBgG9agujv6U/ajoVSTw0G06XwudS+dC6hexjAn1/iLP8ePf88hroej6+k7HmWNGjB127jkjqZ4s+k/6Fjy050BDdhTxrt1YBBvZfErJL9K9FSCnsQi4eU+Z053Cz0SRiToNHGmJBxKouUnyDGehNqh3a15zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4WZJ9QW; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso9686943b3a.3
        for <linux-leds@vger.kernel.org>; Mon, 29 Dec 2025 16:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767054789; x=1767659589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYf7zCvIjBULgzq6jQ3x0ChfTPBHY+SYJeU7DZ2l1d0=;
        b=U4WZJ9QW0Kws4f/Y2fiVgd3cRZEsFpDZr8G0CTYuO/yfVIotZ2k6XKppYTMUOGkbO9
         IowtPI9GrpQh+mz7jhkId7wanzl6pbv62cwDK+BENKNFAYKr70dwcb8X7IwxVDpc+ddg
         afxQied18lJTWMS7ECHGzMeKkA0qN0Ewo+szJkNAfE/tYYpI6+vZn6kQFh8M3nd2baNq
         AsQjnBI9hKXjrgzofeqZTw17xJ+PXZDVE6nJUdWlpUL8D+YBHL+TSparUnn3YtNMNVEC
         X5x5yJGJ78grEv8pIK/yMxi4AbXYqNlkLhXnZo5KMIubCwdJQZY1bor9BtiDoz5m4jJe
         5h8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767054789; x=1767659589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYf7zCvIjBULgzq6jQ3x0ChfTPBHY+SYJeU7DZ2l1d0=;
        b=AhaHU/pPUfvZApSomxVRh1+MyX8w2ohMr7F5Y6cIfHx4GqEcA8Yb1bA80jJvbnBlkv
         JisTRiVwaYLXqBsUfeLsD6jPUbLjt2L5W/isH7zpduTq5T/Ozx3Gk2jQxSmdFoWeG9nC
         8WQBsLduan6NAkkEzK84fa7MXQTOJab5757SESvduqhZveUR5xcBQW/aPkgtTkrEXdu0
         2uQDLe681V2P2epFosQUM44DJFA0KEgdhn4fumKJhORftXcvIHsz2Q47xxXdlqchfOy7
         s0FhZEo3q48rQkDNzGKasgQGWo4f4lwXtoghHvxvb5B/uml7lbNAHwaR/WI11GviWB7R
         q3Fg==
X-Forwarded-Encrypted: i=1; AJvYcCW0EMtClw+rdT4+PYr8nx69g5SelK91ReL0n4oJCQ3aKQvaB8XyuGk63Db549Bu/1pMemTwSkhY+/Ul@vger.kernel.org
X-Gm-Message-State: AOJu0YwkMmwQj682/7Y6f1z71iMOnIN4R++pPJVSYkRwbKSrLCgEpt6R
	JHerx+oeX7TMwYFgCNTbGHEgMe9acemUHDygHnTpUPN1wcaVcb4NKar8
X-Gm-Gg: AY/fxX7xSJPObhUWEDUxYddBIAX74LNwbF7ahq03BuRcX9YiUpRJlAjULKrirPPdTx0
	wuOuU369F8wTrbV+zywjwjiQEP3rTlopemjCa2lG8B0fT3UQHCiJyi+itl+ya2HlnpRA8OlMZET
	gnsNmmPyNU8jUtQIObPAABvrAuDDbMAYFgslbQ/r2kt89i0wFLvrZU8WBw4lymDARTYsJYr0D7n
	Cckfm9W1Qa3YSG1spbafb67rd0SOkgQoeqsH9c+0V3aLnkdgvG3oxeMBveJsivzRrNhzdxpCe45
	xjVJWHYxUsLqptFUoaTcA6LgES482lzD/xUwpcH3jqSwlptQiCakSJYoINjtn7L0XoWetRhQXtX
	d2WkJzEu/qqBpeHUrE2EqtZ5B2Q1K0siVv3c/Nfa2ZfqaRmx9nHvAUL7hqUOFL6HrrgSfbxX58U
	9gmv1N9eZRLV6kOFjZ0kTpQwrdWhzOb5Zm
X-Google-Smtp-Source: AGHT+IFWBwGON5rFBSn5eTP82qw9eZo63G+2uS0ADX0k9HKBZ1vIa62hb0xOdbLqWkBnpUg0QtrRfw==
X-Received: by 2002:a05:6a00:44c4:b0:7fe:788e:4ef6 with SMTP id d2e1a72fcca58-7ff66d5fc38mr29639210b3a.62.1767054788992;
        Mon, 29 Dec 2025 16:33:08 -0800 (PST)
Received: from MRSPARKLE.localdomain ([150.228.155.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e8947a1sm30241562b3a.67.2025.12.29.16.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 16:33:08 -0800 (PST)
From: Jonathan Brophy <professorjonny98@gmail.com>
To: lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andriy Shevencho <andriy.shevchenko@linux.intel.com>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 0/7] leds: Add virtual LED group driver with priority arbitration
Date: Tue, 30 Dec 2025 13:32:37 +1300
Message-ID: <20251230003250.1197744-1-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

This patch series introduces a new LED driver that implements virtual LED
groups with priority-based arbitration for shared physical LEDs. The driver
provides a multicolor LED interface while solving the problem of multiple
subsystems needing to control the same physical LEDs.

Key features:
- Winner-takes-all priority-based arbitration
- Full multicolor LED ABI compliance
- Two operating modes (multicolor and standard/fixed-color)
- Deterministic channel ordering by LED_COLOR_ID
- Comprehensive debugfs telemetry (when CONFIG_DEBUG_FS enabled)
- Optimized memory footprint (~200 bytes per LED in production builds)

Use cases:
- System status indicators with boot/error/update priority levels
- RGB lighting with coordinated control
- Multi-element LED arrays unified into single logical controls

The series includes:
1. New LED function identifier for virtual LEDs
2. Device tree bindings for virtual LED class
3. Device tree bindings for virtual LED group controller
4. ABI documentation for sysfs interface
5. Comprehensive driver documentation
6. fwnode_led_get() helper for firmware-agnostic LED resolution
7. Complete driver implementation

Changes since last v3 commit
- convert driver to pure fwnode
- Multicolor LED ABI compliance - standard multi_intensity/multi_index attributes
- Winner-takes-all arbitration - deterministic control with sequence-based tie-breaking
- Proper LED reference management - fwnode_led_get() + led_put() prevents leaks
- 30% memory reduction - conditional debug compilation
- Global ownership tracking - prevents conflicts between multiple controllers
- Hierarchical locking - documented 3-tier lock order prevents deadlocks
- Lock-free hardware I/O - concurrent vLED updates during physical LED access
- Dual operating modes - multicolor (dynamic) and standard (fixed-color) modes
- Pre-allocated arbitration buffers - zero allocations in hot path
- Comprehensive power management - suspend/resume with runtime PM support

Additional highlights:

Update batching for software PWM workloads
Gamma correction for perceptual brightness
Rate limiting for runaway updates
Extensive debugfs telemetry with stress testing
Deferred probe handling for late-probing LEDs
Removal race prevention with atomic flags

Testing:
- Tested on ARM64 platform with GPIO and PWM LEDs
- Stress tested with 10,000 iterations
- Validated suspend/resume cycles
- Memory leak detection passes

Jonathan Brophy (7):
  dt-bindings: leds: Add LED_FUNCTION_VIRTUAL_STATUS identifier
  dt-bindings: leds: Add virtual LED class bindings
  dt-bindings: leds: Add virtual LED group controller bindings
  ABI: Add sysfs documentation for leds-group-virtualcolor
  leds: Add driver documentation for leds-group-virtualcolor
  leds: Add fwnode_led_get() for firmware-agnostic LED resolution
  leds: Add virtual LED group driver with priority arbitration

 .../sysfs-class-led-driver-virtualcolor       |  168 +
 .../leds/leds-class-virtualcolor.yaml         |  197 +
 .../leds/leds-group-virtualcolor.yaml         |  170 +
 .../leds/leds-group-virtualcolor.rst          |  641 ++++
 drivers/leds/led-class.c                      |  136 +-
 drivers/leds/leds.h                           |  758 +++-
 drivers/leds/rgb/Kconfig                      |   17 +
 drivers/leds/rgb/Makefile                     |    1 +
 drivers/leds/rgb/leds-group-virtualcolor.c    | 3360 +++++++++++++++++
 include/dt-bindings/leds/common.h             |    3 +
 10 files changed, 5399 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-virtualcolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-virtualcolor.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
 create mode 100644 Documentation/leds/leds-group-virtualcolor.rst
 create mode 100644 drivers/leds/rgb/leds-group-virtualcolor.c

--
2.43.0

