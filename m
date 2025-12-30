Return-Path: <linux-leds+bounces-6492-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A40DCE9006
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 09:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 580463011400
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 08:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB031F30BB;
	Tue, 30 Dec 2025 08:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnJnLgB7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9A22FFFA3
	for <linux-leds@vger.kernel.org>; Tue, 30 Dec 2025 08:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083035; cv=none; b=JDig/74O3e6uPrB9b/Ej+vuAGmu0jqI1/nkVlBtLMLJju0oHd92tMTmxRbJX4Cxm9sOpi1rmizWdoiOS1plcSkipVII47ACrYgcX6+S931Fi3bN3ZRTQQ0FaVyPnfGZgrO3FGRGFS8XVLREOROR5RsDqOE+GLqOesjWWd3h8T9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083035; c=relaxed/simple;
	bh=FSU4s2p+E9acSluPQUHPxlvASLI2qpVJaKFbFRN19Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Srz1iGo6P1fF9aUaxJ0CkloQ6YJVAs0BR2tQKIpL5iIfFdvthfw7i3/n/h/66qDyp1tFqNjepyUofxx9BbyyGZsyZVD+bZyPplu7raQ2BZktNgHnj6u6uuYp2cMqXgOBXIMIs05sjUKehE+0tJVa/NeyzkOIBLainrJYpeb0mOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnJnLgB7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a09d981507so72025885ad.1
        for <linux-leds@vger.kernel.org>; Tue, 30 Dec 2025 00:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767083033; x=1767687833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WofBUBbyzrdxS0DCtEQEyAFQaUrBpAVCVPxtgqIfim4=;
        b=bnJnLgB7hMfq5v4J8Tr2Q7d2MWK2+o2bk9+cLTcWwI950UD+3XXfsAcNhzXtqTWTCQ
         sXUjGwObL9txSws3snpuJSKcK6y3yR3lTnZb/aMqTHdL87M8FwJU+HwcXo4hNlij/CDp
         AoqMDc8kKdJ5/VEVhCkGq+W9p/P2xY1MHAPuWVy/L0Sf2JQCEJOrtMFZvmatsxVYmeW2
         YBHoTT8+iRGBOkN1xdcXCtjcYaM8Pwut0I0OwMRYgHQFu9Lm2jwtfrbxS+I0YSbyWeyh
         NSotv+rjU6We+PN66FWmSolOj6Ybv/BZtxO8T4BDFgMtrD9FNd8zo2s5k6k+iisaNqst
         Cfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767083033; x=1767687833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WofBUBbyzrdxS0DCtEQEyAFQaUrBpAVCVPxtgqIfim4=;
        b=VTRWx7JolnciVaBSrfj7ejgrmAx66qkRnjBPADSxMkNy3lj3INz9P4g9UPrd2z3yw4
         y29GhbDEIg52WPxLUcDWhXMxIuD0G5PsuM08uO6IOUu4/YgruMKR0jbB1mkfuV4BfySi
         QNJ8ibzUvrpNWJCjCwzVtDXp8d28OMu6npHtuapP3RbqUCw4EBtovYbQkm8DJ38Cm8Jh
         4HbcFDdmYpbm3IU4zOq6+PKKFPsv20e0PxUEMlNtK51qwzm7GWyHFrqmao/eGO6PUH1Z
         7ByxR5+NwKiQnIHVLllqoZNfUeo2Km5ihWKxGKGs/AUbiUvOlSH/cXbehfO8ydwJMa9a
         m3hg==
X-Forwarded-Encrypted: i=1; AJvYcCUprq2/jyEl3yQ0/FqPytRVLl0/C0QwnRUfpgvFWBE+BuDWrLf2XGA52fYx6aWCgn/7qjAWYmJg3/xG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt8rMhldAuXjfQE31nJibnGdB+8Fean/88XZZImYEF0QzVL47T
	vZ0g2NRxQCNJv5kxbVW6ONkUhOd0L9UJcXfgp05MRexNJi2Id3V7DK9q
X-Gm-Gg: AY/fxX60jupl4zOtmHZWGviK/oj1nXoqktTgses8loWY/E1hGlgyRu/0DAYGjPCbnT2
	KYuACqD9olS8QfuyjJ2V/p6LtVGRj0vPmUjMUAxvv4x6aYqPT7tnnM3kf7oCf6WmYDnW1azSNPH
	HN84Ex4fT4uizN+M3GiDw7XuTx9oYsYU5ClhZgBTWII69HZDQJQXvgqPUPExJXkJNUOv5G44j6d
	xpf1dDVCXPTJfRH2pYzig6Y3YDhV38YNjX6IKWQh3eNK+nOqO8bUpJ4UPxhUjuzlWH+9L5zjYZv
	TzjioxnOxbLhyvXJOXPsDN7e9Y7bUJEcj+UTiqT4Gsw8x/Dg0jO3OYgSjPPBr5ImS2EEAGbpjMS
	A2zDDnhjEqlyo/8Fz7mfqUqFyPH9PLwpP4iHKsbEXaV4NUysBBAM19KA3Uf6fxMm5aquCa9XYxd
	G761EY6srsdxLmAPZiGXqNBs2rSQLZZLos
X-Google-Smtp-Source: AGHT+IE+zFO76dekcR+vPG/TRpO7dSesJFGRMkQGSrbquww8wHKBuINEJzUJYxLpnZou6H2+vqm+/w==
X-Received: by 2002:a17:903:19c8:b0:295:50f5:c0e3 with SMTP id d9443c01a7336-2a2f0d2dbc5mr335250525ad.14.1767083033354;
        Tue, 30 Dec 2025 00:23:53 -0800 (PST)
Received: from MRSPARKLE.localdomain ([150.228.155.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d76ceesm296667165ad.91.2025.12.30.00.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 00:23:53 -0800 (PST)
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
Subject: [PATCH v5 0/7] leds: Add virtual LED group driver with priority arbitration
Date: Tue, 30 Dec 2025 21:23:13 +1300
Message-ID: <20251230082336.3308403-1-professorjonny98@gmail.com>
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

Changes since v3 commit
- convert driver to pure fwnode
- +Multicolor LED ABI compliance - standard multi_intensity/multi_index attributes
- Winner-takes-all arbitration - deterministic control with sequence-based tie-breaking
- Proper LED reference management - fwnode_led_get() + led_put() prevents leaks
- 30% memory reduction - conditional debug compilation
- Global ownership tracking - prevents conflicts between multiple controllers
- Hierarchical locking - documented 3-tier lock order prevents deadlocks
- Lock-free hardware I/O - concurrent vLED updates during physical LED access
- Dual operating modes - multicolor (dynamic) and standard (fixed-color) modes
- Pre-allocated arbitration buffers - zero allocations in hot path
- Comprehensive power management - suspend/resume with runtime PM support

Changes since v4 commit
- fix yaml validation errors after feedback from maintainers from LKML

Additional highlights:
- Update batching for software PWM workloads
- Gamma correction for perceptual brightness
- Rate limiting for runaway updates
- Extensive debugfs telemetry with stress testing
- Deferred probe handling for late-probing LEDs
- Removal race prevention with atomic flags

Future enhancements planned:
- dynamic led creation Chardev Interface like uleds
- ubus/ dbus wrapper for linux and openwrt (out of tree)
- addressable rgb support WS2812B/SK6812
- readonly leds for important kernel/ functions

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

