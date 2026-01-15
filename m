Return-Path: <linux-leds+bounces-6650-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D692BD259D9
	for <lists+linux-leds@lfdr.de>; Thu, 15 Jan 2026 17:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA87C30087B8
	for <lists+linux-leds@lfdr.de>; Thu, 15 Jan 2026 16:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CE13AE718;
	Thu, 15 Jan 2026 16:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWwQYfVN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0F11D8E01
	for <linux-leds@vger.kernel.org>; Thu, 15 Jan 2026 16:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768493426; cv=none; b=WLy4BvE65yNG4JIfxpHqGiEb2AQWy+cl1txqeEP7bcKCOXdVVXKuq14BIYS3faIIJfbZ3MNrCFa6JPDCgseXkYKiyoeYvML+4bKQ+GPwf5qoMiE2ZdJ96BBnV+QxtMqVnjr25yaC9Bwm4qBma84f3aHIztAJ+6SSMV/r7D6Hb+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768493426; c=relaxed/simple;
	bh=4ukEu6Htb08KeJpFPdqBiNp0aFZktOCLUSGBYIRzOmw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LGUE+gDbdzBGCUNGzfWXJ4olXganQYOtS9tqvV0qJxnGGaFJ2FP7H8eaW56Oanes47EhWQMadjPxw0fWgeb+T6fLFMhrjzafQ9D2Avm9xA1IJfKCzZRoC3qCPLOSDgV9nvYzSsFnz6Raleg/Hc/auyrQN6uCWAQf/AhTftJyJ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWwQYfVN; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a110548cdeso7827415ad.0
        for <linux-leds@vger.kernel.org>; Thu, 15 Jan 2026 08:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768493421; x=1769098221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zkxDR5udwN4n/Bv1rkRa8kZ2WADSPaLS60MQgSZ2YU0=;
        b=mWwQYfVNO0DSk6+fzD4AhgxQznp/z1Xd6SDJ9wStNseEBuY6nqo861rJHl83dRD/vF
         3q4LWreg4jF59UNtETRTb8tqb9Qg7ddbazpNE25z8rtRI/GIL+wn/f3Q0qAy9vWsOz44
         h6F1GsSZXr5Su80xm/fPaRn28k0sK424izO7y1y2pjjLUz1Y6/8vUVF1dFNICmi1kjJP
         eYKJXKVP3X0XTmMr9Ruum9E3lEoaejv7OGSZDJ3XL1KoBdoEvtGHfx5l8D2AkiYPxe8G
         x8qvdvF2XJrnntudwlmOie+oX57XLv/C9ng3kmHjyzEeA5FrvE8a0+DrhgPfeZ5rSG2s
         5fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768493421; x=1769098221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkxDR5udwN4n/Bv1rkRa8kZ2WADSPaLS60MQgSZ2YU0=;
        b=ruBoPNead1FAlfibjnJFRFumwWAe6+3ymUruv3oLpZBuc7Zh18HTBtbgR1Xv06U9Lq
         1rMMIzv5IDO8wS6RdMFONgdVDEvfW+p/7+WPuOie9fjmG8Ln8r7kSevzxt7YVIO9wuma
         KvthMFrUSJO8cCbAhkDBNfvDU1Q7z325EIIqy2DbQucc0XssjfIvHTjDxhPUz3TC2UuF
         WAhzyVjTjz5kDiDRitF7Rma5MSAf/XcEbIIhv67GmeYnD87zyB7GkFl3ITeB8bsderWd
         qEL7mU04zUHBoSz204NEGV6JqotvMzCiTOcScinslJh6aYrS30jfECIIPqiqsm7Uawp3
         LnEA==
X-Forwarded-Encrypted: i=1; AJvYcCXlf/6lTtQrenWIGR0MLwuTXjFE42TJE+V64MzaWp8MiVYOinryA0ftGEhevqXXhyjCxE6jPHkHoofE@vger.kernel.org
X-Gm-Message-State: AOJu0YwXPBAG2Upv/aAh5UDy8YJ45JQEqp8K/7VScQthx4paVPOAuqOc
	kyG9rYE/eGjEumiPaPdwHATW3f7VhrxVJyY5q80dDh/KEUNOy6S7H6A6
X-Gm-Gg: AY/fxX5iDA1feaApfdXwGwXZZlCXuTTsXH1m5SXgz0iUmjVUn3eu829VWzxdBR48O1o
	3f886eaYnLKkN9P8+Kdw+9BWkvfiSri64g4mPeFDjLodPEYeAo7yT0ttLznsZb0JYJr2mcM2vJt
	S1CFe3agsBn3aPpSMZ4UsO5Zani0p+E3I1Pas+kVLKOJHvocVZ7eJn+VOCKjKe7shiGnRf0AJlA
	hYvZDZ/wH2LqtWRL4HJ0KjEVtIUchItkVzGmfW2Lkrwx+RBKjuOfnRih+g8TEqZmFfYScVmojnV
	MWewDrblzU8jYC6LgTZWfJaGQ00uFgvmPTSomtggKlSHGEwsqO21qDGxwn9mreMBj8/bwUmOHd/
	TCXn4fa6znTVZhxhr9YMA8R7I6FztP0mXMjYK/O7i2XV0PctMNbKvElVY8GH7lAZTXrWwvdjvmx
	nZG5WeoA6SupbC+o0xQCkQCvv4iKsH4A6e
X-Received: by 2002:a17:903:41cd:b0:2a0:ba6d:d101 with SMTP id d9443c01a7336-2a717537551mr346625ad.21.1768493421190;
        Thu, 15 Jan 2026 08:10:21 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([42.114.215.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d88sm258523195ad.52.2026.01.15.08.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 08:10:20 -0800 (PST)
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
Subject: [PATCH v22 0/2] leds: add new LED driver for TI LP5812
Date: Thu, 15 Jan 2026 23:10:11 +0700
Message-Id: <20260115161013.40706-1-trannamatk@gmail.com>
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

This version contains only the remaining driver and documentation
patches. The DT binding patch included in earlier versions has
already been applied to for-leds-next.

The series is rebased onto:
https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git (for-leds-next)

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
Changes in v22:
- Rebased onto for-leds-next. No functional changes.
- Dropped the DT binding patch (already applied)
- Link to v21: https://lore.kernel.org/linux-leds/20260111135519.28112-1-trannamatk@gmail.com/

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

Nam Tran (2):
  leds: add basic support for TI/National Semiconductor LP5812 LED
    Driver
  docs: leds: Document TI LP5812 LED driver

 Documentation/leds/index.rst       |   1 +
 Documentation/leds/leds-lp5812.rst |  50 +++
 MAINTAINERS                        |   5 +
 drivers/leds/rgb/Kconfig           |  13 +
 drivers/leds/rgb/Makefile          |   1 +
 drivers/leds/rgb/leds-lp5812.c     | 642 +++++++++++++++++++++++++++++
 drivers/leds/rgb/leds-lp5812.h     | 172 ++++++++
 7 files changed, 884 insertions(+)
 create mode 100644 Documentation/leds/leds-lp5812.rst
 create mode 100644 drivers/leds/rgb/leds-lp5812.c
 create mode 100644 drivers/leds/rgb/leds-lp5812.h


base-commit: 33e822f6f4eba2cfbd09ffd080af221cf8c542b2
-- 
2.25.1


