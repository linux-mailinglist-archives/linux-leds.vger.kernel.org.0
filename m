Return-Path: <linux-leds+bounces-5184-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1BCB17AED
	for <lists+linux-leds@lfdr.de>; Fri,  1 Aug 2025 03:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 540EC165D87
	for <lists+linux-leds@lfdr.de>; Fri,  1 Aug 2025 01:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E7A7262A;
	Fri,  1 Aug 2025 01:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPXz21jb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A325134CB;
	Fri,  1 Aug 2025 01:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754012744; cv=none; b=LyYW8B2BfG3ofyM8hbCQqEAACZ/HvRqrgFtRS460o+w5WnrUHwSWgKp1Cwg97pTBJVzA7jy2FjlUPtOHqJBVoaLmx0n8mfFGhRU45Pwz83p7aoku7Ff2nGi6dYrrNcWDP8BPb0in0yiF68+Bl7n05+81NRJ+vWODIhM8BgzzFOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754012744; c=relaxed/simple;
	bh=9qUk3+mDwer0WnasTArSqYYb+WkPgC7aJTYE+9lyscA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q508OnJnTQqMcUY2Axiomm7jKR9Z/0GqijmeQvpHXiyiKC/i9YWIYSCzJAXWLh39XqwsV49er3Z/7I6JewpaAuUMdJaqCpfxWtQc26Ja2hs2a+0TMRHZTpHVBdu7s6ncha1g9fsUihB1TpgvDEvhtiDO2affz0GfLb7HxZiTo2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPXz21jb; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76bde220e20so102166b3a.0;
        Thu, 31 Jul 2025 18:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754012742; x=1754617542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKxOou6OfT05X1KjhISJG7Ro3gR19qUlCl4/z/UhD1Q=;
        b=GPXz21jbEra5KFEMCOmPypr/gZAWzHQ7If4ldUpXHQu9cupBq+Vzzbw4K7oy6KM9nt
         sY2CCXpz4BN0591/hRitpqfFmIt12mUfWVvDFkuN9SOtkf8dN66eSoi0eNjylEL0TZQH
         U3Qc7lVG0qaAR/7HryjKkhpLdIQnONkW5UTUgPRlGbki50UD2eSdndcNgZpRVBtqCDnJ
         e5c1tjHBL7mKqZXNMDF4MJqh6gwdFyc+KYzwO869Gi/9zJoJFtV5izu6Z6KgASErNlKS
         2ILl6Q/I3rgmR9G2fW/rpEyR+yCZ0UFEi+/t8Haq/ksyTlsR5hiajjd/bT2BNqFxWlej
         xvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754012742; x=1754617542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKxOou6OfT05X1KjhISJG7Ro3gR19qUlCl4/z/UhD1Q=;
        b=ME6ufn4xFIvSVY9PI2bTe+xzLvNuNQKUgB2ayCD6i/Lc5whtBMDXUhli7KCbzbq21S
         NynATMFxfAQCCUe2LEwUm4J4s0IqobGElFZsnOHTSTov096deaFi3HlRF/SUs3uI3LX+
         zWZC+7C9uKGorrhD9BZCR2y+sxGlwqABqzi18yD0N3S13Ecd/5jN/f5s6QZb5fOuoJkW
         UxwIbNuLJpNowZPbsQh5dQmZKUAGe3Uoqu8C1cR+aGwvxbcESsXzJXKktmggki/EGWFG
         wyk/AcXJUbXdiJFkMnv0+Tzx+czYpkYyCF9//XrzYP5/u8o6EOzD9qTP4QkDjaKQOXD3
         Tvfg==
X-Forwarded-Encrypted: i=1; AJvYcCUPUtNmVOkNnMb2fgxKzptIQGZ68OhxurgulYP/p7YJWmhzGGOcdKggf9ZrZOyh/DDA1koDQGn98G/m3X12@vger.kernel.org, AJvYcCUlQIS+SfzDr01Xt2teCF/w+xMmhxZvnUa0W7Y7isW9N+9tP63r9AZp1CkdKCxRvK3iu5OpjvZdYYBlVA==@vger.kernel.org, AJvYcCWMhCyn+oxYzRpGA+xTAjFl39/5MGdM1r23X5FnTDNJL7zO+Z3hrmMis9Dbr3+KcjKwx/XKXgr4Ubsz@vger.kernel.org, AJvYcCWUbzcmiFT2Tk8QjUlhs3tIwwdXp1y8BMXoi3NoBwlUb5eIHPOe45OeGRZErelyJp0WdG/Hq1CdhXI2@vger.kernel.org
X-Gm-Message-State: AOJu0YwEIfxRdo+Vv6vZgeS2K7NorNA4qOBrBY7mlLNaa5fdg56SZXAr
	fmGQZrTRGTcqjmJXbKri+2601qPs4YI3ZWteT3rGOVFSjK60xZey3WO9
X-Gm-Gg: ASbGncsccIjHCBcQ+BpDd3PUfQ1/qYj0qzlFcE/KMGzPqx2pDx9JVjVuBKhHe2+d5GW
	WI3ALwbYyzv1eCAhPGr6V6JGE53vdm26Rh0XKf+HUg0cslnMTZNg/CXA+Rz6RabW5ntdLYgYApn
	/JPoE0GeD7fcLU/2ZF7xC5fma3ryy4/TdrVh91fKs++7Q4WsijRrGJA93OCJK/OzY1LJf2DpH+9
	imbEmpMElXrPupbyFLgKh6LlkCSDWMy1834X53bwFXpEfCmzpdO4QgSz1nysxw3/ywSXd0avEvw
	quGIyXNYTxeWYii6yvhtXbjTEpDO3RCBcelzOn7unxJ4p2SAzfuzMUSmiEx6ZLksicY/4FqflAl
	Vtp6K24h/lfpAAdC9q7SgOoLoBfOFf5FoGCOI
X-Google-Smtp-Source: AGHT+IHITgVP+ROsJ9UfWqTAoVQQbDUrLPXc7vX90ZJ8dtpDiUgMMEPzEy3yK26knUlfL0otTk2POQ==
X-Received: by 2002:a05:6a20:94ca:b0:232:22a4:bd50 with SMTP id adf61e73a8af0-23dd7af497amr7972352637.9.1754012742405;
        Thu, 31 Jul 2025 18:45:42 -0700 (PDT)
Received: from localhost.localdomain ([171.254.200.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7b9377sm2514011a12.16.2025.07.31.18.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 18:45:41 -0700 (PDT)
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
Subject: [PATCH v13 0/4] leds: add new LED driver for TI LP5812
Date: Fri,  1 Aug 2025 08:45:07 +0700
Message-Id: <20250801014511.139862-1-trannamatk@gmail.com>
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
 .../ABI/testing/sysfs-class-led-lp5812        |   32 +
 .../devicetree/bindings/leds/ti,lp5812.yaml   |  229 ++++
 Documentation/leds/index.rst                  |    1 +
 Documentation/leds/leds-lp5812.rst            |   46 +
 MAINTAINERS                                   |   13 +
 drivers/leds/rgb/Kconfig                      |   13 +
 drivers/leds/rgb/Makefile                     |    1 +
 drivers/leds/rgb/leds-lp5812.c                | 1086 +++++++++++++++++
 drivers/leds/rgb/leds-lp5812.h                |  164 +++
 10 files changed, 1617 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-lp5812
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 create mode 100644 Documentation/leds/leds-lp5812.rst
 create mode 100644 drivers/leds/rgb/leds-lp5812.c
 create mode 100644 drivers/leds/rgb/leds-lp5812.h


base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
-- 
2.25.1


