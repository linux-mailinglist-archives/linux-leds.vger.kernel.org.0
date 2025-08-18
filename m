Return-Path: <linux-leds+bounces-5228-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D33B29620
	for <lists+linux-leds@lfdr.de>; Mon, 18 Aug 2025 03:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 480B91965D51
	for <lists+linux-leds@lfdr.de>; Mon, 18 Aug 2025 01:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EF722ACFA;
	Mon, 18 Aug 2025 01:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVd2Ajz3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC278166F1A;
	Mon, 18 Aug 2025 01:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755480421; cv=none; b=NXnFVRTesTykHChklCg9wcQi3gkLMIhG55/wTMUrjJzkKbiU4cp/IwbowFAh/Y6qndwKQn2hbXCG9Y8xyPAvSqHImDb4LJYEuikdU3/P2vqSr9PdYx/cDv6PD8TIV0YQON8p0VH07UT2g7ZZqudjv1toHj3BA7NYdVOBhkPhDJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755480421; c=relaxed/simple;
	bh=9qUk3+mDwer0WnasTArSqYYb+WkPgC7aJTYE+9lyscA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DrQq4PYFkyC1zFaOfacMKxYb7cLmIRf4Za+gTJu9wQMB3jvxvGAJ2E5OulHBH9hb0P3z36UoqKMIkCr3K7ZUkKOK0bSOGztdmGiXfr4QgjJDKOKwnCSk5OFHWCpE4jZzzcufqicbvdxWoEp63SDhAPVNZt3G5htiU4dm+cIZncM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVd2Ajz3; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e2e60433eso2639964b3a.0;
        Sun, 17 Aug 2025 18:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755480419; x=1756085219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKxOou6OfT05X1KjhISJG7Ro3gR19qUlCl4/z/UhD1Q=;
        b=ZVd2Ajz3aw5q0DO9PNzg/T+YGl5YSMb7bRRoMl2zL2AYpXWO1n5CWsgdOr9+Sea7dr
         XcuEVoJF7EID56474Ydu1uXsUXiqf9zjA6vf2gI2WHceAG6oatpJyNn2MGO03UmTz6qg
         MJK8z1pAQ7HIzCdkg4Ig9R4IMCb+gpMqHm9dzK1qxd4z7Lz5W23eRxNd/Zrw2R3+EKjA
         IZSBc1iA7ak2cvoWOJMrfrhQhIQbfvhgVy7XMIDG2daI8RoRJULD2ui6bo+yWETAYieb
         h06GGKJVpYgHhRNHEc4bLaqBz3ZGB6klw01BYfUQkmhmfQbcH4pC+lXjtnynxtqRqxFe
         vqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755480419; x=1756085219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKxOou6OfT05X1KjhISJG7Ro3gR19qUlCl4/z/UhD1Q=;
        b=tislbs4bS0gbR6K852gq08iSdlmqUm/ydhbAqL6Bosky0NZ9SmRcTotzC8R2IBKBSS
         IfC2aWCgeYHMSzUzZHWB/Dle7EycbZP4DR1vQVAqs24WWWRtyAZqXZV5ElH0BCULAgIO
         KkdndLS63R5MIHsJesZZCFTrqn19ukfVK9nU5JviJK17TVe8mHoPmDfTdWUf3qLdb2at
         1Ulnfqmx3KNiQNPTfaxg8CvgC/Kn25uut3gV2XJ0AF4Wpy2hoA61bfIHtHrL+vNVVqfC
         UKNF93oH/+ryXIiMRIv3AS02oZxuy4AP3QhcWo8d2ITFue+lwGZUTTTzimlF80sO9Nzc
         awJw==
X-Forwarded-Encrypted: i=1; AJvYcCUlkXtwR6BJJtDGv0oRBdt6K7swBvnWTTDNQqDoX7nRYRSDTmZwLWkzVF8nqYlgFSNd9bBMDIRwpVyC@vger.kernel.org, AJvYcCX0KZCs26KZSVRCkHJMMiYMbumpXmdUhVk+uW4FdRbFdd1J2Tv0gI8lzM9OTQ7DP86wuwxJMa6Lp4gxyWQc@vger.kernel.org, AJvYcCXSQt0ZePvMVoHG5lBm9lea10pqWo2nYL2OVliFAy0YQVOX6GCdz6TKIY3DJXpfLUhEudB1uy748HAo@vger.kernel.org, AJvYcCXXERD1iGoanGyjHaY3HEL96Nf26o9hdcEHnVYklGF4mstrCcVPkgpz2krYksxuCIO2Onr5I5XQzMoHfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHvWzN1iyKNEBM/5F+vmlfnOpjR3qX24eZQc3ZZrJK0oxOr/H1
	gSNIstBodf5zxfUiVrzKwnWwdR3zyF6ubbibC1DyntNfjkZOc1ztY0wJ
X-Gm-Gg: ASbGnctJ7D2xLQwlwLbnsb7IgUtStzs5c7nLDArA5kzTIh63OS4BTicfv5wnzaY8cGN
	Qnbn81EhoDBZFvBN5ZvNw+QSqxlsR7f72PuyefDuHGJRrSeyZ9a42R3v5rYWDkx9CmMU1I76FeT
	jUgE36GNEm70sejgnzzPwFyFyjQI86ld5qrrslmyQ/SFNmtCXTbi+S9Q66PrXHvrzIM6jYoZCBU
	jMeLvDkD2zUSBBFaPKV9NalXLwroZV25EYMYVh7BPt8mp4wjH9a0x6+EizURA+4abstE/zXEM+8
	Hm0XcqZWqcou/e68M+uoU9b7KmzXWXzYtuguNJWWxChQH/RWC5KnfJ647FMh4LKycmTMxrKI19e
	mw8R4lWd8J7duxyo9u9PVd3pyIkIujLDZ+eLdEHfPDjW7
X-Google-Smtp-Source: AGHT+IEQDwqa3boJReRF8UpTIj9xpdPqJT2xjELFWp/t4RUcvWoWX4EAcm8EsyVAx6S/rz4dxwjG9Q==
X-Received: by 2002:a05:6a20:7f96:b0:232:36e3:9a4e with SMTP id adf61e73a8af0-240d2f4a5c1mr15378884637.40.1755480419061;
        Sun, 17 Aug 2025 18:26:59 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.205])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d5d7070sm6709620a12.15.2025.08.17.18.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 18:26:58 -0700 (PDT)
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
Subject: [PATCH v13 RESEND 0/4] leds: add new LED driver for TI LP5812
Date: Mon, 18 Aug 2025 08:26:50 +0700
Message-Id: <20250818012654.143058-1-trannamatk@gmail.com>
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


