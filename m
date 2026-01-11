Return-Path: <linux-leds+bounces-6612-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F74AD0F00E
	for <lists+linux-leds@lfdr.de>; Sun, 11 Jan 2026 14:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2AB3300ACD5
	for <lists+linux-leds@lfdr.de>; Sun, 11 Jan 2026 13:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90C633B6C6;
	Sun, 11 Jan 2026 13:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdmL6Rc7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD053090C4
	for <linux-leds@vger.kernel.org>; Sun, 11 Jan 2026 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768139751; cv=none; b=OF8BZNNsgHIPEiNzyJmiWvvzREybGvB4BN3zr27qE/AhQkHBCcXRxglEXqpX6L7FiEPGMHd6AXzNzYrTgxyTAVIBgYK6PTrxooXrWAT39pb7REnBV7AYdfWhjQnztuTAeMMxK34/j2Qrx3kzHjSgOsPG2HPoFIXPNUMDmu3av7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768139751; c=relaxed/simple;
	bh=+AKIQEO5dyvqn5KjRP9Jxh30Gb6KBj2JRPEssHMpZoI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UW6Zlg5vyAAL0IMU/75xw/V/YLt3mtrUn1TgzXa4pHpQUnvgebRUiMpgD/+kyBiH+H2h7StD+bOgykVC652zfH/WF/2Q66FrBt2bgc3NoZWjzvt6A6fbp32YXYQ2qjSlvgfqFNFnV5DjkDeeN+mgvTZylj1XmrRx8UM1oiGyRO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdmL6Rc7; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81f47610542so209875b3a.0
        for <linux-leds@vger.kernel.org>; Sun, 11 Jan 2026 05:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768139749; x=1768744549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vP5elSGqt6TeZcpkFEgYpafr6UqzCjp3j6oPYRYzstk=;
        b=JdmL6Rc7IB417V7qExEpEX0dSnjAGdPIEAodUoDs2bRM71V/xLrg43+u5Fx6S7laAw
         QqW/bPKGIOSlf7ab5vZ4PLx2BZ7hi+RUg83vXCyrlerSLdEtWnLZFBO5oPV23fcHqbk6
         4MSN3ElhqYskrgHOT4DqLysvu50pQAHae0+KbrdvD4tcClrSK0VBB6lBKcKS52jvFdfb
         wpPm7fHpoSJBbJMDJdzlI8V3+ce99GpxaVH33Qokm6dAeTttBFm+Uj3pqMbU+m45XUjc
         0zIojXULzOP+5q/y1HnmyM7BNUmMMc6ByifMdW46nIRdUUSqzSeRsQvVDIRoTUW3q5kr
         3GDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768139749; x=1768744549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vP5elSGqt6TeZcpkFEgYpafr6UqzCjp3j6oPYRYzstk=;
        b=ABTvSrgI83ZfuKByrnCljtKFAO01i2+uYjZ7oI/S3Eq8ISU5n10HbsqMq7vpk+SU+2
         vvBEU5EwlB4WDNjG/IEHQgmLJlDfIKcwzrJhjKb7Myp0a0Ryj1kt8ZuOVmkugoX46h49
         JrPDP8E7j4485pXqcknr+Ihpx5b0nRtgXkH3A7X8uZ5IzeXfj84tu4okopBN096R+cx2
         sYN1c0lGNrzSipe8NMt6Ji324ttZjmZqJ9ZPTvGF0nstje+gZEw3mWrJZNBFBOpziX/1
         uEhQoYPnkjExn4s6kbdsT1TYi00tRsjNCEx5nNuWm3w5ijvJ8h67/7YY4zFcI+gexHCy
         BfvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0ibkzJ5xuZNkXaKnhM74VnHSX8RQz0+1HERiCbVNB7enMwoAfD3TUqxQ4R4jiq6ycIJVR9eHbcMta@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2sB9aBVWG5zE5HYLdmqS8SuwTsLHUpvL2Ny2ldxzI6+dnzPGT
	4l8ouj4aiCkmESWED4QYgITix2Q4y6Ku1k2UFb25pny2v01mHrmrKbT+
X-Gm-Gg: AY/fxX7qXPHLRwNKAZH2U9b0VL5eQ3VcVLjAh7EH1ePC475CgvXRLfsmj4FmEylrnx6
	AMtM0D31VH+NweJ0JoriCe2dnqh3uV+Cl2GKu1mpR8+HjwjksVzSR7981xopHwrVH4fZS8NQ6tV
	QQRMILAEr02G0x875xUPJg2/rPiVdqpIQzIuisuG6dggJIFuCeDqu2W5dQavcLh45al+mP1zQ6L
	9l675g3LNQOUIJ94K90vTTeEqwbDkekgYUYO5ylJQa6Ih0hYQULlSw8IqgPqbIE2ouGaFkTie6V
	Y5n3l7bGBsyBiDeTPbzFTZdTlQ/48M+z8y5DM42IvvML9KxgHL3Wgs/WMWAcN9BDhKAWm+1C4Zr
	vbZ6kCqNvZLP0qGqP9kLArWF5qEvLPuxTlhr/wUg7Al+ayeKksfxBzMVIOIf8dprBXrnRdGa8/U
	aXl+4OScmncmkIvc0V6veBqXnt
X-Google-Smtp-Source: AGHT+IG7l1AtroJ4vtHhwuouBkO/kZ7CsAcG4nQomIHeGtpM3HDKv03O8zL3Ot3znp9Xs4XUP6+DyQ==
X-Received: by 2002:a05:6300:218a:b0:37b:992f:8764 with SMTP id adf61e73a8af0-3898f96bfe3mr13543517637.34.1768139749196;
        Sun, 11 Jan 2026 05:55:49 -0800 (PST)
Received: from localhost.localdomain ([113.164.155.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b88d984sm5742345a91.3.2026.01.11.05.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 05:55:48 -0800 (PST)
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
Subject: [PATCH v21 0/3] leds: add new LED driver for TI LP5812
Date: Sun, 11 Jan 2026 20:55:16 +0700
Message-Id: <20260111135519.28112-1-trannamatk@gmail.com>
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
Changes in v21:
- Rebased onto Linux Next. No functional changes.
- Link to v20: https://lore.kernel.org/linux-leds/20251221041950.4631-1-trannamatk@gmail.com/

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


base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
-- 
2.25.1


