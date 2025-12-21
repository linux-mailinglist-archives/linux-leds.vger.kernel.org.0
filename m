Return-Path: <linux-leds+bounces-6456-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD638CD3B61
	for <lists+linux-leds@lfdr.de>; Sun, 21 Dec 2025 05:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04B333011757
	for <lists+linux-leds@lfdr.de>; Sun, 21 Dec 2025 04:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B416F21E087;
	Sun, 21 Dec 2025 04:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8HnKX0M"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2871428F4
	for <linux-leds@vger.kernel.org>; Sun, 21 Dec 2025 04:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766290823; cv=none; b=B+k2+48IyECnY6X4cu7QTIpT9kKrhbfprG6PUMgEGo/II55mBMlZfyMyvAHrRZYkIkJdXakmq55iF3hcwHFKXi7Z9IzYyGQDRwQalyk0YB51UVzfYLPgnfhR2L7YpGWXjJcIGx2A1sqvRNrTDACQ0ZWnap18oPZfgK1X32t34fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766290823; c=relaxed/simple;
	bh=Xz2orvjMxUjNOH2W84kanSJLhVfgcCrkgfjZNB/glh0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aX/vBjGK0MuC66c1xFnYi5Sz2dp9/bu3hCmaP3KsURaTpqcaXLqCicvxhVOGqli6jXenaaZL2T1uJZB+1MQ0CQj+8a48iAletTMP0ncQEXGv3YVKxRRpX+bv8WQRfHLFHwOEnEKmrJajhrlDMi/Gw8EyxhAWDirQQA9Ndef6irE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8HnKX0M; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0834769f0so28843775ad.2
        for <linux-leds@vger.kernel.org>; Sat, 20 Dec 2025 20:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766290820; x=1766895620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mia4arb217YTBcb9kJZ2HR6SMk0Gx/PAcON52vTXcDY=;
        b=N8HnKX0MzhUVDV+kp1TxHHWlkpfFo2WtbI97G/MES39YenRDY1/TBn333BuB5qHoje
         82NFLnAu6p4wtfM+C4bRIEKm4P72mqXvjtnykjrvNvoyb7Umjel+8ZtfjBAl6VPb4+ec
         CsGQqss9F+8VJK45efBydt826I5gH4gdoBfMP+nW11uy5UmVZIFPX4on5TwXVWiG5L9v
         lGJKKxbuSX9B+jiEiqCXsNe3ADV85CB2sMwr17JxZVgs3V6XdAB/vFki2Ke9M94DDGAD
         UhfgufLbayDEiAVxyYca5iU1wsFIVX7/ddGqnmCkhPNtlDn5Pek1vgBb3L/OX6/KnK0X
         khIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766290820; x=1766895620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mia4arb217YTBcb9kJZ2HR6SMk0Gx/PAcON52vTXcDY=;
        b=sxfOIvZhK/VQOcYSFxfuGY9WF1gJypFti/gWe9nJs0qCM6MUop7CRODN1NWPVrXJHG
         j+56N4dno1Ygv/EMQF6dz1P8FOS1wiDARSyYL/lbRRIfCZiGwQehKnwV22xF6AbZy0fn
         7lVu6S4Vq/To7khn0I7U+lVWVEcGJ7XcNvZ/TJWCm2h91a3bugoNt7DZZXQ08H6ODo2i
         ho3cOdnxv41a/9ksoMCtN+1QVUj1txekEBXigQ+unMXtTTLHtg0C7ij9q1H/qCaYLIUa
         Ut7dIXBeaFQx/gE3d99a8w3Bz8rHw5PTrKFDOOiR5u1Y01ohg+RkPTNHcZyfR+JmWE4v
         h5WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIBbXkMhlAS4khXL7ZfplxDVFykMzNv5+1IqKo6UTMqu+QPHa762N1kcDK5y1uHbvAfOuxvkD3IO0D@vger.kernel.org
X-Gm-Message-State: AOJu0YwM1M2IbN3RWheoU3p33YTSwr3AlDsgx6vqidSfVdeTbM+jh9vc
	gUHFk/Es+sozj1DnPgt3W5+7PS3QaN7y1emfVpfmgBljBj9fQzUepUYH
X-Gm-Gg: AY/fxX7uyGMmRhgDWBA61W/yQjA0D7dSJPILfdu8qGCkAJcbzVAiISTDhCZvbZMCN35
	dTbZRNPoFp5CNwmlHGSrPR5aUYaP/bn3/zV8PSJzYLKJJ2gjzueXu0zE06GoJ/tSxzy8nfS+vC8
	5gESHyuK2UJx/wqqSOOqXeCY3FocbZ+rVR84k/38qpBZ22i8ymj3PgI76qCPuvUhS3qLtTk0+Ce
	RrVqa6hS5Pj4PygoD85aW/h/2wb4eoejM2QWIJ+PsRUzVbdn7zUNg5lG6Un3R7RKo2Xna6jyfJ1
	ivfWmUgYXiEat6YqefunWaRGYQtK69KiiT0LkG1OXP/PTTAaQWskG1JANlugMvJK0i9+57j6pTL
	ON7EYPjrfaTAkeLA+zAlhJkjd+CqgYMac+FKfF6qS2/lUktzgjqo2/gQzIq5uOCbK72U0V5izv1
	TJqptDB29b/KJfPs6S9oD4JXI=
X-Google-Smtp-Source: AGHT+IFV6KIycYa2uc5L7MlqMF3r7j3FI6km/KfEtkOwNMIbl0CMKz144eYEiNlykJxDS5npcgVwsQ==
X-Received: by 2002:a17:903:1c8:b0:2a1:3769:1cf8 with SMTP id d9443c01a7336-2a2f2734d5emr66763305ad.33.1766290819928;
        Sat, 20 Dec 2025 20:20:19 -0800 (PST)
Received: from localhost.localdomain ([14.255.43.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb90sm62319245ad.51.2025.12.20.20.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 20:20:19 -0800 (PST)
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
Subject: [PATCH v20 0/3] leds: add new LED driver for TI LP5812
Date: Sun, 21 Dec 2025 11:19:47 +0700
Message-Id: <20251221041950.4631-1-trannamatk@gmail.com>
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
Changes in v20:
- Rebase on v6.19-rc1
- Link to v19: https://lore.kernel.org/linux-leds/20251130153956.241375-1-trannamatk@gmail.com/

Changes in v19:
- DT bindings: Reverted to v17, as making `label` required in v18 was incorrect.
- Driver: Drop validation code enforcing parsing of the optional `label` property.
- Driver: Renamed unions for clarity: replaced u_scan_order { s_scan_order, scan_order_val} with
  lp5812_scan_order { bits, val }. Applied the same pattern to the drive-mode union.
- Driver: Updated all code to use the new `bits` and `val` fields.
- Documentation: Fix links (remove backticks, add `.rst`) and make attribute formatting consistent.
- Link to v18: https://lore.kernel.org/linux-leds/20251123191042.116917-1-trannamatk@gmail.com/

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

 .../devicetree/bindings/leds/ti,lp5812.yaml   | 246 +++++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-lp5812.rst            |  50 ++
 MAINTAINERS                                   |  11 +
 drivers/leds/rgb/Kconfig                      |  13 +
 drivers/leds/rgb/Makefile                     |   1 +
 drivers/leds/rgb/leds-lp5812.c                | 642 ++++++++++++++++++
 drivers/leds/rgb/leds-lp5812.h                | 172 +++++
 8 files changed, 1136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 create mode 100644 Documentation/leds/leds-lp5812.rst
 create mode 100644 drivers/leds/rgb/leds-lp5812.c
 create mode 100644 drivers/leds/rgb/leds-lp5812.h


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.25.1


