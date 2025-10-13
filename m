Return-Path: <linux-leds+bounces-5767-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACB0BD5843
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 19:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7DC0D4E1727
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 17:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F4A30595D;
	Mon, 13 Oct 2025 17:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vm+OdI0O"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3232EA729
	for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 17:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760376964; cv=none; b=YDNnyqIYTp3v41ZDCVUfuxREy7CcRWTlPUZ57boYng4F/h1q2mxuRMLxeEutJi5mmuLsp9zaNcxyAnllOu/WG4hhlcF/ckQPAepZ7d8fSiFZgTs9q4TviFA/QEPpoWqq/REr6ZP5ekZFH9gifAaxz4iwt+Rs6AghL9LE3FQUzuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760376964; c=relaxed/simple;
	bh=vGLsoOK0P6diATKf+pAvRXu++XmUkvxZt/aFULFDuZw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Hz4Yj03rCx70NyAfYUhpCaHY6uBEOaJR2fxsM2JDidEvKppqpYsyt8rj23Wlyir8gXKP5Ykn6d8azJQdNXRHkHzWWneq5MpEaiRWwPW3tOP0s/RNP3FtgNJ2jGziNcxXWRHwxd32c2rHes8RobHbhrNNJ35JRliUbj5Xj6eWVXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vm+OdI0O; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-782bfd0a977so3814629b3a.3
        for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 10:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760376962; x=1760981762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G4QFWdHKHTnFU+rEHq1C51fLR8IiJ3bf0ABGeNJDUlc=;
        b=Vm+OdI0Ojnwriq7a9iKN4RGGCFsrFRa6SFwQzP4Ni9hKYdtOrdsvM9+oDQmT5KxGpY
         Us5p8J+BWfEiFNPHmwP1xojP125NhqEWmR3EUAPBPctmAi3ZuFd8iWbgL35P9enqonVq
         9jrEqlE+T0O8IrYLoqXR673IIoHjlkdWhMAZM6QR8mx8x8Z+xNeV/DAPdxPxTJ9Nkpmt
         WtgjtDRqBaWF2MRlLQI18vLIC5yIr44iSM9oqGK7H/ER8wqP22sVsnw9oxyDmURmcIu3
         JMxRtCC+XRQMCT7cncT4XV3WSJIlUea3sOMrPy4hRDU4FLFGjQeqNYxf2eCMrHEyNY0u
         GI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760376962; x=1760981762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4QFWdHKHTnFU+rEHq1C51fLR8IiJ3bf0ABGeNJDUlc=;
        b=dR06F1qv/+WHDa3KJKS/JC3AeG2apOCfNHkIICvcwPBNQJXygbJVJifnyE1O98DhbK
         nTJplFCV7Ek3A5VNm1rFFDfgPFJQP7OH0O4ByKlIDL4Bh92ypqczCoTV9GWqtiw1B/5e
         z+nWJob/SO74KlWNPl/afk1W2+6SH0RnlDw26raEObe/8iZdUS/4pXlUsZWrvjpkht4b
         dOtJTXYmjlqKwJ85Q0QCehtmfJrKvLbrgovTnZOV89FgN/s7WNOYRJlr321I3O6d5A2V
         AzmaXQ8qXVytySjU2gmY/GsNgrleLSGO4hyiu8D7zWIzRnEKvlgBSNSvicj37Lrqv4Ph
         3+tA==
X-Forwarded-Encrypted: i=1; AJvYcCW+mPDVf26ODwr3zzHo5gl4cwNezIF/Yp0pl0QClMXnEuLhUQSvgMYruk9nPJL0PuODc7KqJI5dBg4k@vger.kernel.org
X-Gm-Message-State: AOJu0YwlMuRCg+MZp4fQg02s+tKRIjSq6Oawp8cEeuOUn6jbQGC4XEQw
	lsEOQy0X/CgAD5PmsanT+0VYa73NJp5HOzErWyEYHCHac2NsTSH/Fj1O
X-Gm-Gg: ASbGncv4EgQpEh0MZ39Q3BGS9eG/4t5VsT9bgg7kLUVobS9XR0ncb2bOSGC/BH231aJ
	yKBk9NSkjvqQxgCd/03FKh8CDIJ9XtsVP4JhDEwyydSZt76wpgKvvJ69W32711v/lcR4GPctmpL
	IA6QqmUlKX95UyHSr64mPeYY66lL98SV4AmWmF/Qm3bzV7glj03UxRBOD1+uNzuNtc5qfJa+mhR
	3Uw+f9c4qgq9isbL/gHn88eVel/LhQJ/7DIXjZCaqI97clFENpiLYWx9QfFTMDzxU3z4Fd3wqS8
	v9VJP6wH6JbNRAQal6lzcT++LEm8ZVclXGUvYKfznsDbTBFd/evfc8Y2viZHVNSYgEplxiM2j5+
	Xw2AbOn8TpBxkZzedX/M5CZmTVmQDs+F6ofpM8WNu8127FYMfbwGg
X-Google-Smtp-Source: AGHT+IEAIw/36vkJM/mQO5Iq/Y6COxiOYo5Py9lE8ISg7NUXOpBiJoFEAm9NFEYdd5Xpth4c7zEDfA==
X-Received: by 2002:a05:6a00:1883:b0:77f:4a83:8f9 with SMTP id d2e1a72fcca58-793859f34c4mr26412272b3a.2.1760376961509;
        Mon, 13 Oct 2025 10:36:01 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.118.149.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060754sm12424546b3a.13.2025.10.13.10.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 10:36:00 -0700 (PDT)
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
Subject: [PATCH v16 0/3] leds: add new LED driver for TI LP5812
Date: Tue, 14 Oct 2025 00:35:48 +0700
Message-Id: <20251013173551.108205-1-trannamatk@gmail.com>
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

 .../devicetree/bindings/leds/ti,lp5812.yaml   | 249 ++++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-lp5812.rst            |  50 ++
 MAINTAINERS                                   |  11 +
 drivers/leds/rgb/Kconfig                      |  13 +
 drivers/leds/rgb/Makefile                     |   1 +
 drivers/leds/rgb/leds-lp5812.c                | 726 ++++++++++++++++++
 drivers/leds/rgb/leds-lp5812.h                | 197 +++++
 8 files changed, 1248 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 create mode 100644 Documentation/leds/leds-lp5812.rst
 create mode 100644 drivers/leds/rgb/leds-lp5812.c
 create mode 100644 drivers/leds/rgb/leds-lp5812.h


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.25.1


