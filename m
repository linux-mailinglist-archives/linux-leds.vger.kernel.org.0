Return-Path: <linux-leds+bounces-5059-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D68DFB04660
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 19:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06BD61890D57
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 17:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9502652B6;
	Mon, 14 Jul 2025 17:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsQu2Bqy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD4F258CEC;
	Mon, 14 Jul 2025 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752513855; cv=none; b=bM8HtDaH3F10u004jSYs3tareepmlRA/pKOcBvaAsDY8FG/1Cp6pEgU8xw1KYeDTkM7axB4Fn+oVh06T2J/xp2+FrfM/v/0MYU++ZOpQkC4lEFn7CfWBDronq02ey0vIyJKzdRRphQjGlR7YcXOFwQyobejm8lgvuRSJJyRCOv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752513855; c=relaxed/simple;
	bh=ivMptVJPBmGjWbt4HyCBkC3tTi1+splFFjDba4/JNF4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dpHJueXI0E0oZ3BsJ++LqMGE3exzm8eV6vaL2X8k3CCPSuoFeeeQiqZ/+icHknDpT+otFbBMWes7E45yF5bBXj3rR+4TtWa4MzjNL3GyntXmxUImQPKTZMXkIbtlA3RPQHfS8cvrTKcKNAw89CNK1acBfb6eUQBOdVbtJTxLsCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsQu2Bqy; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748e378ba4fso5364924b3a.1;
        Mon, 14 Jul 2025 10:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752513853; x=1753118653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3bNfx4hEwfmcyoQMDWcdh1F4yZRkkE/6FRX59g8xmTQ=;
        b=HsQu2BqyA6xIf8fU7TxFmi5UXbLP7O0P0aFPuXNlOktG7pPR8UNnJWvC50/UnlhK3T
         4nC8yPKKjifDozxcRx7UpXIxv0BAbhSTcMb3i0qDb+sgESITb+/E3yGxU9PF5ChgWt5B
         P8J/bk8HqlzZc4vXifhm2nQkwM6Cf1TOMIUGRoVKVgFnnKj8DiaJALCvD0xMWgEzLjM9
         Pwcknf54SXRMK+BHEB1Hes/oLcZYTgJpCfXevQAVJVZGcHRll65dLpYqORgpBSWsVO8U
         JyDtv1AfCHcMosGozZ3zKooZi0Sqp+nT9XHrhmdcIfvdKIvwRA6gfOluKfqFrBgOQAOn
         xOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752513853; x=1753118653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3bNfx4hEwfmcyoQMDWcdh1F4yZRkkE/6FRX59g8xmTQ=;
        b=wC0usznk+zDJLgUAZP9Z1hgrwnUk9iBuB5oMxG0j9HIjVWpMWmtwNSse9NSSRfE5XX
         NB58zjrzjRpoyTcgGoKz5LpVBdNZOZofocKeozZQys/FrPLpmG+jeYLgDuoMDHzkJ4Kh
         WKr3WCNv2FkHNblLgBFo5dFOe0cHXvktIXq5GxuaJgncsMQF2TOxEfK8NYZSb83N6WHm
         mX9kIHihnHK/8JFbkJnCRw2J7kcOajG99dYP/ZAQw5ruFoQ3DXXbCu7jIiLFf9dhzN5z
         EK+IjvFGdOk7uQgjfwSYLyziXwxsjrPK1JziA2Ve24ltCGScuqw6+U0qCOzXAdeLmSwV
         zlSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNxCgHpx0wp2X9RoEtGuOveXHww1W5dmo6WfwEwzGSD7sqjwadjHSk3wHrOxza6em63RsnJfE1NAbV@vger.kernel.org, AJvYcCWgqocuBcmbjXRWGP5vxIlY6p41EELoPpFSibuD0NjBe4bxXyVvsYzL5poG7CP2S4qWZpPQ+3UG6JWu2A==@vger.kernel.org, AJvYcCXV6o8Flk2cCecGBLpGlV/moBhIFzzNpO5AVwwudsWbsbmv+MsYqrsZf5AP9sEVbgX5pRVVTCmzd1jStJ0h@vger.kernel.org, AJvYcCXwuOP9kZUbsFhUJFFOMfm8bX4M04kHpM/uo6MzvKtF7Y5cAoI5X4LY3x3DwDH/c20RzRcrrha6RcU1@vger.kernel.org
X-Gm-Message-State: AOJu0YwWN6P/EXAyjRjyI8SjgaJG1wRuSxkuqR1Cq/JvuVIu28umpVmh
	6+O3jP/sKm76h6RHgJ1q6q2/AXKunkEQK1jjxlZtTmN4kYIT7lMjwJgE
X-Gm-Gg: ASbGncvs1qy8NPHRgMkt0c8L9S0zAzDk1+7oqKgIpFoOl416morzLVzp2GmGBdTmbKv
	d52F1bVps4+Tnkx/oeV7zueCAkMfqqmM/KxAoXCGKrPYeNGRN9yVKtmLTFPpRv320ppjuuzI43/
	RRUzNWH06HfxWyFM9g4ivVGryBEmVFz9LPAhdrwvv9qf4uV0RQy7NYSgLPmfvK+L/jTGQjTX7cb
	5w2DFB/fh+OFHvIhEuX7yot/B5JxqsLGB+ehd1ubY+BcNEM7IRw5h4eVzUEMwCmEFjzoDtbHllw
	ON9u0J4jEI8F8ht6zY5ou+a8PHVWJDiwNWS07tPrgyB306haa690nhKKUnjAmhhcfTa5IJCIYSk
	b5O9lvxsBUvLFLANAavEnKaWX6QR0I6SvtQ==
X-Google-Smtp-Source: AGHT+IECFvznfs7tBOSlhQ9vgkT7vcYrWHE1LgfLJoEE/TrW8B09kb+zHMan5vHOXPzu6cIW2bOAbw==
X-Received: by 2002:a05:6a21:999d:b0:1f5:80a3:b008 with SMTP id adf61e73a8af0-231202f247emr24340540637.32.1752513852564;
        Mon, 14 Jul 2025 10:24:12 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.114.162.205])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06537sm10495468b3a.43.2025.07.14.10.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:24:12 -0700 (PDT)
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
Subject: [PATCH v11 0/4] leds: add new LED driver for TI LP5812
Date: Tue, 15 Jul 2025 00:23:51 +0700
Message-Id: <20250714172355.84609-1-trannamatk@gmail.com>
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

 .../ABI/testing/sysfs-bus-i2c-devices-lp5812  |   40 +
 .../ABI/testing/sysfs-class-led-lp5812        |  120 ++
 .../devicetree/bindings/leds/ti,lp5812.yaml   |  229 ++++
 Documentation/leds/index.rst                  |    1 +
 Documentation/leds/leds-lp5812.rst            |   84 ++
 MAINTAINERS                                   |   13 +
 drivers/leds/rgb/Kconfig                      |   13 +
 drivers/leds/rgb/Makefile                     |    1 +
 drivers/leds/rgb/leds-lp5812.c                | 1147 +++++++++++++++++
 drivers/leds/rgb/leds-lp5812.h                |  164 +++
 10 files changed, 1812 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-lp5812
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 create mode 100644 Documentation/leds/leds-lp5812.rst
 create mode 100644 drivers/leds/rgb/leds-lp5812.c
 create mode 100644 drivers/leds/rgb/leds-lp5812.h


base-commit: f09079bd04a924c72d555cd97942d5f8d7eca98c
-- 
2.25.1

