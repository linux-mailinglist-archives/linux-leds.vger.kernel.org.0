Return-Path: <linux-leds+bounces-5147-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE21B1352E
	for <lists+linux-leds@lfdr.de>; Mon, 28 Jul 2025 08:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F41316F8A6
	for <lists+linux-leds@lfdr.de>; Mon, 28 Jul 2025 06:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB672222CC;
	Mon, 28 Jul 2025 06:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mh2uaANc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FCF26AF3;
	Mon, 28 Jul 2025 06:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753685927; cv=none; b=A3V75lMZ0bft3I0OQkDpZhs5wlQGYnou7TjeE5slBXUJHdtgYs1Q1MFKMkCxTg0KbiCKB96hqGBfuNBsckf+NkSfXBGr75w9/alLqADzj6XXKq7l+YWZ238BTGELcR1f1e1+0cQSmyS9WoUFlcBQkp/73FqVldbrtjS01G5dxyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753685927; c=relaxed/simple;
	bh=4S2t+qE/5uPuO5jpqSVMCJS2M7xGHBGq71JIsDLV/m8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NVOnwhwBWKsX7s0Ta266UG018UJmns1ejQhgcEgkwWtMSsBgWdAq/jePUoSI672PCi+iJPFYWYj3PL6CMgMDTV6abRy3+/JfUcc5AX2KkA4/hxszSOEJpZQAP8n5YtU/+QIlzS9cCUauySVmYyEWv1GDg//o3w9xxRCew0h9KKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mh2uaANc; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so5086921a12.0;
        Sun, 27 Jul 2025 23:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753685925; x=1754290725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N5cFTI0lWvo1waLhWHtuy0Wvvax1ffCK1XjtpE5A23Y=;
        b=mh2uaANc8YsBsZQ5nI6sjLjYddMh2iMjQXSsyh8MQXfxB/cKqNQII+Kmp/btR3lc6D
         EtBjDTSvowNSfO7dlI1gW1XYhLesni06meSMUU5TUiP8y14WERsiksrnB079h+YLPE72
         ZGl79vS1bE+eRWPdaFT7qRPXkF3zeVSMAO8jKSX3NCylYFZlOZC61QrtIOrIAjUDt4/v
         ncvZX/5ejpBhch/WThN6pj/PjeNkLeg7Qu9//w12gcUmLecjqvg+CsWd724uETwktxYU
         17FK/qaMz9whdDkjlYbHxRWHXSTMDRWEdUI3U4kr6O3I0RV5Kv0QAXSKBn9N/XFZml9Q
         dFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753685925; x=1754290725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5cFTI0lWvo1waLhWHtuy0Wvvax1ffCK1XjtpE5A23Y=;
        b=Gv6XkFxwnR9k2PrUzlgwN6O+PxseJsB21Rvq6PvpuQG/urIsIlrjP1EULTtj3Tjbyg
         9ycnDQ5kdru8xxs3lF7SvWvNtVfBxsmNaMyzXO+CZMDRwXYUMXLASMkzWaLI1XrvZabH
         bYvWfdCXFlEHyAuouFXk6uvgPP+GQiWNqXbkALHQ/E3M9LNzu7aqBl8D7ztbKf1CLVUt
         JSgBCyC3OqHkoNoyeeuLM6sJgaXG0JRQU1xrypVWto4281qig9mxGt6guo+iOubFC4eu
         GJz8VgfWeGTX5fz8Jw+6n9IFE6OS5Hbru+4SeLOM4ndBAx4XIZ3zIrpD+lkJK+rOXhxO
         JD0g==
X-Forwarded-Encrypted: i=1; AJvYcCUp+6p2HIHCLGU7tflFF84XRyRF3AxKuUPfe8Vh8VUa20G8RAFKtT8gh/ZCm+NCKm6i9WiliMzotaO/@vger.kernel.org, AJvYcCVb5g6m2cbl6bx3cRH8lEzgYQKpQQAw2LDef/4CkWKW6+40dBYSz/Pn3xqrUtq5/mG1aQrfj4koeSPV7w==@vger.kernel.org, AJvYcCWCXCZZd960CYOulE9ZOX8Q5Q/hpWRb1pF06axzm6APBCV6J76bBQyKoxhBQLAgllGpvJYzJFHfeOzjsSAd@vger.kernel.org, AJvYcCXBhzRlvvUxeeoMMCooMReHa61RZcGXFgluQ9coBYc82PFlwXW93GLfSQiW5uhEP31DHUSKCrHCQ6iY@vger.kernel.org
X-Gm-Message-State: AOJu0YzsBi8j6f7j2742s9J7rgMKr6bI5v4C1RIG2wdLq+bZfisJTaw6
	FORLeQ8vyyQWVev6dmeGAMgM78YMe+26m0lSpLYMBGhS/XXwBWJTlmZscsKe8Q==
X-Gm-Gg: ASbGnctHWYlEG4mP57jljTQGnYrEUfpp7+yDb5aQUaspdMb0a2qvgUUdjC33uw4LJYj
	zMpILCL7ZWaEHnzA+d4K+Y7SMZQNUGwgd06Ko+w+lfrV5stUy/5hglDNrQi00a6v0QVJk9GqvmB
	8znQmTB6Oa6XIVu0hDGq6xozocrtMuDZfR9tImIPbz+K8ElZ/ikU03WRscuL1/rk787YK+lOWKa
	0wHzVdUbWpkjSmR2gQXMHB2HjxpPpaDMSRNbBE35el6tUchkWi6VZVmP6L/FOLV0B7DDi9J/4Z8
	xNwGs7y+LPHU383g55ptLotBmvLIIPkI7AHBJKC2zkI/P6d8xJKc5YRPkNXFDdNV6u2671YwHbX
	W5xYH1s2d9SvoRRjx1qMJthuyymWq+E2SYPgVaQ==
X-Google-Smtp-Source: AGHT+IHgfOPWQBuZl5oOkQDaDWLh6wqR5YW4Al2wbx1wv9gBtekJsIggGTh7yezzG7sQujt7lN8pEg==
X-Received: by 2002:a17:90b:5623:b0:31a:9004:899d with SMTP id 98e67ed59e1d1-31e779fe9b7mr18874964a91.18.1753685925265;
        Sun, 27 Jul 2025 23:58:45 -0700 (PDT)
Received: from localhost.localdomain ([171.254.200.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31eff8b20d7sm1050375a91.38.2025.07.27.23.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:58:44 -0700 (PDT)
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
Subject: [PATCH v12 0/4] leds: add new LED driver for TI LP5812
Date: Mon, 28 Jul 2025 13:58:10 +0700
Message-Id: <20250728065814.120769-1-trannamatk@gmail.com>
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


base-commit: f09079bd04a924c72d555cd97942d5f8d7eca98c
-- 
2.25.1


