Return-Path: <linux-leds+bounces-5414-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D6CB47C32
	for <lists+linux-leds@lfdr.de>; Sun,  7 Sep 2025 18:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5ACE189B4DF
	for <lists+linux-leds@lfdr.de>; Sun,  7 Sep 2025 16:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0BD28000D;
	Sun,  7 Sep 2025 16:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfeM5xjq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF0518C011;
	Sun,  7 Sep 2025 16:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757261416; cv=none; b=dDMhiVRRWBHksZYF720kbQ+QeI1liotKQIUSATi9436EO6pM2YXxVS3dJw2hweoJ9ub6GkkFWuhaEGFmKGDnSbXifzWenFA2W5FH3YKJiTA0lLMWS85JbZmpv/S+HKJYVeFf9AGTvTRpy8FM3IXLQxUEJYi922Qf1Wh6oyF8w4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757261416; c=relaxed/simple;
	bh=OOwv/y6O9vRVIWRUIIcJNWhWKtZRXXM4Fqx9Nl/bLv8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R1nrbZk7t7lGrwN76vJvvJK6K9Lc/1uib6e8W4mE0ZLsZCF6z5QrYZ/GpGTp0AXj/J7K/VnUZdbajD3TJcAjnvs+NHd6GRMD0YLZfVel8rKqX46nj9HFFE/E0pNGIMj/Ejv2GAnF3uN7RQRo61iA7pMpIdTycdAoM2lfs9tzm8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfeM5xjq; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-77287fb79d3so2910114b3a.1;
        Sun, 07 Sep 2025 09:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757261414; x=1757866214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pC/me/4Fhg20EFM6PKWAmcUfDTOeCcP6PZjRIytI1Mg=;
        b=CfeM5xjqSKuC5+x7Qzol5MtrWCbnMGcLiX7IXOH/EV0iB9rkf67GovIerG2DqvsH3W
         CXTOtZSnvi5NL1U4HvUm1XOjiwmMyJThch0HdLzKJz/Nbl7aIvdbXXgcF/yn3h2DXEy9
         25Ol4ut91/71PRy3+60RyKpQleixTDEQQ6lSEMTWg6K9sGtzsVys+xO1O7NuyZFfc55R
         UixXGWL60W42kYpXjCXpi4dwua57h9njsX6PAFd1EaLB1b91kYUFW8j+LB+DxZCcgZda
         qxiVW8W1FPd3tQVf+TgtF7g9O1FUwEr/I7illVYI8HHXv+sXCrG3B4xilVZOXAb8KTjz
         x69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757261414; x=1757866214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pC/me/4Fhg20EFM6PKWAmcUfDTOeCcP6PZjRIytI1Mg=;
        b=opLs9n9l/8+hyEk6XtaZYftlhhVxqhXiaMS13xmJpXONpZel4aGVFfdn6ybEx5X3Y/
         S83FgCD6zXBHZuLh6B6MOrIVFCh1Fyj/E1HAuY6MdtIx5MKNq+k3IVSXN5s2M6bpEgns
         6G3VrdmaMreujtvDBE2IYe5P/57UiDIjWqtuB6IbwkIvpFu4diMkOzAUpVOa3akRUHyG
         L8kjlhmWJ1QCMTs9TCsxybdrLg+Bb21TTpleJ0WTmQXlX0Z2LptBkxoKKGVfR+vqshpn
         ZPQHM1Tii+wZRr7v4vbkDgz3GlPNWiVjMlxVDnz8/J70HrMJ8t/4yoR/FXMK/HZVjArA
         0Qpw==
X-Forwarded-Encrypted: i=1; AJvYcCVTHx8UvAVuToZb+syCUiKqfQVtmvCE+24ODN/CdCE+E1O1W7C7/jA/dj/v2bU3y0SoDjcDBTKy2VZA@vger.kernel.org, AJvYcCVygcXw3dkmb0rhV/St/DbRuXQCtYcAdm3zX9VB1+tQgEiAmJ367FOmgmkYkk/zHH7swD3Z4zUsotaA3A==@vger.kernel.org, AJvYcCXG8Bt+hzR7YcwOyubbNBJXWbEeVP7Z6aMTKVsPUyr6OQXD0DwT5NVgGM5DeEwJ0ZG7t/nhKFgzxzMcHLvu@vger.kernel.org, AJvYcCXTRiPmIshI1wx6XPZl8NNOjUAXB4hS9m1Kd6dz9yCsAbY9oXmdtDL3s1mEMpvp9n7BCgyun1TmQuJJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzCot8BUquq1naj9BqP1s6JTUdjawcn5ePEH4HeyyvNKEe2706v
	u8wQC/m2OaDeWgw62UF3vS1ttUAq1V1YLdTC3tsW0zk3HcmWNAlPnLGAeZKL/Q==
X-Gm-Gg: ASbGncugRD/ZlI9c/WYmJZyvzMrmLKPHS47sAISkqE0tABRXAuaUjM+9Fm0mhsgzHTP
	kto/x65ZWO53rkoOnf5U1s0J32eq9NYULh9YjxvpSwrfoW3JpZFc1SGqyt8c/q1RNX6YtAsPjGj
	L5JrftGi98zgFZCjlCyK6V12O0QXqF2Hh4WCuQGTCI5pc9zqMGqiMiEimg4BXIOaiQJA21YKafs
	JizUbESD/TjUrFzatfUoJQEX6fmyDC5lpvF5AZ/QqvKU5t9aAupjspFw3cE7tis+mgjLKa/8p/b
	Auzxl+K2umhdCSg4+wb6hqSMiHUbn83ZiNCBFYtVgkZXW9NsribJ/9WU6svM9zZB+kMlYgP3kXD
	ju1scqntju7VHpHC88sx2aiUoGGVNzXwINyvy
X-Google-Smtp-Source: AGHT+IHAdCwDm+daPnMUPptQ5TRCynFMXA5gfYN93zMTy3gUkKpFMAG0IiSkjzf8HXayBkGCZoTArQ==
X-Received: by 2002:a05:6a00:2e16:b0:771:ef95:996a with SMTP id d2e1a72fcca58-7742dc992efmr6761043b3a.1.1757261413856;
        Sun, 07 Sep 2025 09:10:13 -0700 (PDT)
Received: from localhost.localdomain ([113.177.224.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723534c0a8sm25352541b3a.79.2025.09.07.09.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 09:10:13 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
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
Subject: [PATCH v14 0/4] leds: add new LED driver for TI LP5812
Date: Sun,  7 Sep 2025 23:09:40 +0700
Message-Id: <20250907160944.149104-1-trannamatk@gmail.com>
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

Nam Tran (4):
  dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
  leds: add basic support for TI/National Semiconductor LP5812 LED
    Driver
  docs: ABI: Document LP5812 LED sysfs interfaces
  docs: leds: Document TI LP5812 LED driver

 .../ABI/testing/sysfs-bus-i2c-devices-lp5812  |   32 +
 .../ABI/testing/sysfs-class-led-lp5812        |   37 +
 .../devicetree/bindings/leds/ti,lp5812.yaml   |  229 ++++
 Documentation/leds/index.rst                  |    1 +
 Documentation/leds/leds-lp5812.rst            |   46 +
 MAINTAINERS                                   |   13 +
 drivers/leds/rgb/Kconfig                      |   13 +
 drivers/leds/rgb/Makefile                     |    1 +
 drivers/leds/rgb/leds-lp5812.c                | 1089 +++++++++++++++++
 drivers/leds/rgb/leds-lp5812.h                |  206 ++++
 10 files changed, 1667 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-lp5812
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 create mode 100644 Documentation/leds/leds-lp5812.rst
 create mode 100644 drivers/leds/rgb/leds-lp5812.c
 create mode 100644 drivers/leds/rgb/leds-lp5812.h


base-commit: b236920731dd90c3fba8c227aa0c4dee5351a639
-- 
2.25.1


