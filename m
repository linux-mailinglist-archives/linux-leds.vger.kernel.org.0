Return-Path: <linux-leds+bounces-6281-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8272BC7E623
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 20:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E7B63A7CE7
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 19:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F651218AA0;
	Sun, 23 Nov 2025 19:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsJ3wixE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6AE1A0BF1
	for <linux-leds@vger.kernel.org>; Sun, 23 Nov 2025 19:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763925056; cv=none; b=IP3Eg/ivwmtX4fLGoIwXmQIg/EPWXzS2UQWjUuDAHfGElCo1TeNT+vH2DZbx2YTQ03FmQL1KJSZbmppFa4Twp6XxKGUzRc+veK3b7HmKU7RhJclQdg9RrOwtD2TPIa3KcAE6i8CpzGtDh/fECJwM93lsAP281Rgvbx23lE/CstY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763925056; c=relaxed/simple;
	bh=5Dk3WWXMaPnrxQkhzmNwe8zAo+cjrw2rB8aZpBmxU5o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KMR7uDek1RuZQQYcZm7JcjYPf/NRJLYwbBps0jhOLk7g3RIDIlBaeuQQWdzMPkfcFUzt3zDOcRYD5vF247iQOQv4a/WCz7WLUanNf8TkYxY/iuGdiXMGAU+yfQ4vXXYBY3N37HT7PjXZ7vJDhpNsQvsg/eKfFm01cXz3cMXiW5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsJ3wixE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-297dc3e299bso35729805ad.1
        for <linux-leds@vger.kernel.org>; Sun, 23 Nov 2025 11:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763925053; x=1764529853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AIHlhcFDlCZfZMCtwENVXGOj87xc8K+w3IyybVzXSoM=;
        b=XsJ3wixE3nRi9sxoltkEysZkr87M3G29qCdRQCyi5wiEwhqLVd8JhnKY19xnlQV6xN
         1bANAB7YCLNbqBylCjEk8b+DW0/xE8HB+t1xN/sJBRnANc6DWh0KO4QdEhh/U3T+RXPS
         OqN7pZ95Jjz3PjEkDxXet1Z5046yTLUylKPiJLiPFs616Mj7+Mgw604ikOlAWuW7KmP3
         OO0NCaAXHsbNb6goMP3ly7uCZXLc35t3MAMxamYEN7ZTsVLawGxoLfSbqW56azhQy0Zd
         9QH32RRi1ucL6aYEGTYsgjEdbfhkGVpS5DKn14ZEf4ERkjUxY3XVOKxBzDs/CdGCt2Gy
         eFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763925053; x=1764529853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIHlhcFDlCZfZMCtwENVXGOj87xc8K+w3IyybVzXSoM=;
        b=nI2JQeMt4QgDhHH2oaAIRgiJZ4Ohl735EutVt0IDPnGJXG+QJ0nidZO1fKrAGi6CQT
         ELky+Nc40gl7hkDH4kQ+MPi9g9/ZlL4/t2LH9cI63n7yU1s8Kvv6a4twayYwC9OjanRU
         r3TRPXz2d3D0UOMTGyatZ38kWEENPkbZDLZo1/083W7WUIitE3desiTBqYiIodcLHA8H
         kjjQiQKJBIqDfvUPDDTa1q2UEfRkTEY7kLBpkb6OMCzHe2SCp+PDHrqq/uTb9YMeoKXn
         i4dub4cUjL9XjpYVOkzQjWRz8XFD3/KbEqU/QbMc81o9eJoaVsm9wpFsJDRurs9nn2pk
         CX8A==
X-Forwarded-Encrypted: i=1; AJvYcCW9goBWW1cqyGs7TLFELs46rn7i+MoUZGri3XjW63+hBGX4z0YEywXNEVV0mFmDFrlFQEAAh0v6Esnp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdol+7CMtIPiPYxJOKEc9L4N07MHqWSETL3zlTmCVG+VJ+xlIg
	hZrqSfjU9CWf+moVxMFWRAbsjzGBr2euiKCo8AF//GpvXwJuwRESFg3N
X-Gm-Gg: ASbGncuUY9yB2RdOioBav0iDUTlOSOZj4rZtvGKnL/wAzutb9P28exzmCOZuM6WQOFK
	jRN3aRL+yPtA7PxmkQA7BBsBGK+/ArkcL7+OqndPLnGu8z8UtX26K17Q/vuM6zEA0ERQZM9dR9w
	WOyyBhOhnRV8dqdCoIy2MAEIDZVQTSTBTYi2vUzWa/2L46lbpPq7EPY5htmf2swawVpLKRWAtNJ
	rC4gc/XJk0itVVag614H9th5Lr+/S3ybYaTSsjD6CeZAtaJ56n+9FS/bab2UHpKQfwCq8q0wfcG
	hwCB35tNZq3b2W2SN0V8b9hLhUCM55S2sub4JCteHz6JfW3RcfvKVU2uNKy3IbhcaP+1rGsEihf
	tnPvP0JyMJboRKqNygicSAHH+JViXAHLwM2A2Ap4hcTpt1sYs+2vHGyiFaV7u0XSZU2xlJEms3y
	ZJOey+tAYQxFOL8GLyniNY1w==
X-Google-Smtp-Source: AGHT+IFtFyoQBGCeygz7rw/XlQLfuLOGX/8UUzwFQ15n+r3y12JiFXj4EZnV2vMgsg6Ji3ClAYlb0Q==
X-Received: by 2002:a17:903:4b0c:b0:297:f8d9:aad7 with SMTP id d9443c01a7336-29b6bf815fbmr100474125ad.50.1763925053254;
        Sun, 23 Nov 2025 11:10:53 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13e720sm109542655ad.42.2025.11.23.11.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 11:10:52 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	gregkh@linuxfoundation.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v18 0/3] leds: add new LED driver for TI LP5812
Date: Mon, 24 Nov 2025 02:10:39 +0700
Message-Id: <20251123191042.116917-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds initial support for the TI LP5812,
a 4x3 matrix RGB LED driver with autonomous engine control.
This version provides a minimal, clean implementation focused
on core functionality only. The goal is to upstream a solid
foundation, with the expectation that additional features can
be added incrementally in future patches.

The driver integrates with the LED multicolor framework and
supports a set of basic sysfs interfaces for LED control and
chip management.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
Changes in v18:
- Mark `label` as required for all LED nodes for proper sysfs naming, including single-color
  (led@[0-3]) and multi-color parent nodes (multi-led@[4-7]); remove previous Reviewed-by tag.
- Simplified parse_drive_mode() logic: replaced nested if checks with continue to reduce indentation.
- Use leds[i] instead of each in lp5812_register_leds() for clarity.
- Remove wrapper function lp5812_auto_dc()
- Define all magic numbers.
- Handle parsing properties safely and removed unnecessary pre-initialization.
- Rename lp5812_of_populate_pdata() to lp5812_of_probe().
- Save chip in i2c_set_clientdata(), not led; use leds instead of led for the array in lp5812_probe().
- Remove chip register map structure; use register addresses directly.
- Minor formatting, blank line, comment clean-ups, and add email to MODULE_AUTHOR().
- Link to v17: https://lore.kernel.org/linux-leds/20251021155927.140929-1-trannamatk@gmail.com/

Changes in v17:
- Dropped direct_mode from ti,scan-mode property.
- Updated logic so that omitting ti,scan-mode now implies direct-drive mode by default.
- Refactor lp5812_parse_led_channel() to simplify function arguments.
- Mark lp5812_cfg as const since it contains only static configuration data.
- Link to v16: https://lore.kernel.org/linux-leds/20251013173551.108205-1-trannamatk@gmail.com/

Changes in v16:
- Renamed property 'ti,operation-mode' to 'ti,scan-mode'.
- Simplified allowed values using regex pattern instead of long enum list.
- Updated description accordingly and noted 'direct_mode' as default.
- Updated core driver to match the binding change.
- Link to v15: https://lore.kernel.org/linux-leds/20251005153337.94025-1-trannamatk@gmail.com/

Changes in v15:
- Removed all custom sysfs attributes; driver now fully relies on standard LED multicolor class interfaces.
- Added new device tree property `ti,operation-mode` to configure direct, TCM, and mix scan modes.
- Dropped previous Reviewed-by tag from the binding patch due to property addition.
- Removed ABI documentation since no new sysfs entries are created.
- Updated lp5812.rst documentation accordingly.
- Link to v14: https://lore.kernel.org/linux-leds/20250907160944.149104-1-trannamatk@gmail.com/

Changes in v14:
- Replaced inline constants with proper macros for readability and maintainability.
- Refactored lp5812_read() and lp5812_write() to simplify logic and improve clarity.
- Updated lp5812_fault_clear() to use switch() instead of if/else chain.
- Refactored parse_drive_mode() for cleaner logic, removed string parsing of concatenated data.
- Updated activate_store() and led_current_store() to replace strsep()/kstrtoint() parsing with sscanf().
- Removed redundant comments and renamed variables for better clarity.
- Link to v13: https://lore.kernel.org/lkml/20250818012654.143058-1-trannamatk@gmail.com/

Changes in v13:
- Fixes build warnings reported by kernel test robot:
  - Inconsistent indent in lp5812_probe()
  - Uninitialized variable 'ret' in lp5812_multicolor_brightness()
- Drop of_match_ptr() and directly assign of_match_table, as the driver is DT-only.
- Link to v12: https://lore.kernel.org/lkml/20250728065814.120769-1-trannamatk@gmail.com/

Changes in v12:
- Reordered helper functions above lp5812_probe() for better structure.
- Clarified DT-only support by removing fallback paths and i2c_device_id table.
- Directly assign platform_data to the correct pointer instead of relying on
  string comparisons (LP5812_SC_LED, LP5812_MC_LED) and container_of() casting.
  This simplifies the logic and avoids unnecessary type checks.
- Removed redundant messages.
- Update ABI documentation to reflect reduced feature set.
- Link to v11: https://lore.kernel.org/lkml/20250714172355.84609-1-trannamatk@gmail.com/

Changes in v11:
- Drop autonomous animation and other advanced features; reduce driver to core functionality only.
- Simplify LED parsing to use a unified path.
- Clean up and streamline code
  - Use alphabetically ordered includes
  - Remove redundant comments
  - Fix style issues (e.g., comment capitalization, code placement)
- Update ABI documentation to reflect reduced feature set.
- Link to v10: https://lore.kernel.org/lkml/20250618183205.113344-1-trannamatk@gmail.com/

Changes in v10:
- Address feedback on v9 regarding missing Reviewed-by tag
- Added explanation: binding structure changed significantly to integrate
  with the standard leds-class-multicolor.yaml schema and support multi-led@
  nodes with nested led@ subnodes. This change introduced a new patternProperties
  hierarchy and removed the previous flat led@ layout used in the earlier versions.
  So the Reviewed-by tag was dropped out of caution.
- Address binding document feedback
  - Use consistent quotes
  - Replace 'max-cur' with the standard 'led-max-microamp'
  - Remove 'led-cur' property
  - Fix mixed indentation
- Updated core driver to align with the updated binding schema.
- Address core driver feedback
  - Use for_each_available_child_of_node_scoped() to simplify the code
  - Add a return checks for lp5812_write() and lp5812_read()
  - Remove unneeded trailing commas
  - Fix unsafe usage of stack-allocated strings
- Link to v9: https://lore.kernel.org/lkml/20250617154020.7785-1-trannamatk@gmail.com/

Changes in v9:
- Move driver back to drivers/leds/rgb/
- Integrate with LED multicolor framework
- Refactor and simplify custom sysfs handling
- Extend Device Tree binding to support multi-led@ nodes using leds-class-multicolor.yaml
- Update documentation to reflect the updated sysfs.
- Link to v8: https://lore.kernel.org/lkml/20250427082447.138359-1-trannamatk@gmail.com/

Changes in v8:
- Move driver to drivers/auxdisplay/ instead of drivers/leds/.
- Rename files from leds-lp5812.c/.h to lp5812.c/.h.
- Move ti,lp5812.yaml binding to auxdisplay/ directory,
  and update the title and $id to match new path.
- No functional changes to the binding itself (keep Reviewed-by).
- Update commit messages and patch titles to reflect the move.
- Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/

Changes in v7:
- Mark `chip_leds_map` as const.
- Use consistent `ret` initialization.
- Simplify the function `set_mix_sel_led()`.
- Refactor `dev_config_show()` and `led_auto_animation_show()` to avoid temp buffer, malloc/free.
- Simplify the code and ensure consistent use of mutex lock/unlock in show/store functions.
- Remove `total_leds` and `total_aeu`.
- Link to v6: https://lore.kernel.org/linux-leds/20250419184333.56617-1-trannamatk@gmail.com/

Changes in v6:
- Add `vcc-supply` property to describe the LP5812 power supply.
- Remove `chan-name` property and entire LED subnodes, as they are not needed.
- Update LP5812 LED driver node to Raspberry Pi 4 B Device Tree, based on updated binding.
- Link to v5: https://lore.kernel.org/linux-leds/20250414145742.35713-1-trannamatk@gmail.com/

Changes in v5:
- Rebase on v6.15-rc2
- Removed unused functions (lp5812_dump_regs, lp5812_update_bit).
- Address Krzysztof's review comments
- Link to v4: https://lore.kernel.org/linux-leds/20250405183246.198568-1-trannamatk@gmail.com/
---

Nam Tran (3):
  dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
  leds: add basic support for TI/National Semiconductor LP5812 LED
    Driver
  docs: leds: Document TI LP5812 LED driver

 .../devicetree/bindings/leds/ti,lp5812.yaml   | 251 +++++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-lp5812.rst            |  50 ++
 MAINTAINERS                                   |  11 +
 drivers/leds/rgb/Kconfig                      |  13 +
 drivers/leds/rgb/Makefile                     |   1 +
 drivers/leds/rgb/leds-lp5812.c                | 646 ++++++++++++++++++
 drivers/leds/rgb/leds-lp5812.h                | 172 +++++
 8 files changed, 1145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 create mode 100644 Documentation/leds/leds-lp5812.rst
 create mode 100644 drivers/leds/rgb/leds-lp5812.c
 create mode 100644 drivers/leds/rgb/leds-lp5812.h


base-commit: 1af5c1d3a90246a15225fc7de0ed7e5f9b2f3f98
-- 
2.25.1


