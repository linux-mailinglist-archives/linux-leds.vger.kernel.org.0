Return-Path: <linux-leds+bounces-4844-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9017ADF5DE
	for <lists+linux-leds@lfdr.de>; Wed, 18 Jun 2025 20:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59DB27A9135
	for <lists+linux-leds@lfdr.de>; Wed, 18 Jun 2025 18:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE1D2857C4;
	Wed, 18 Jun 2025 18:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGnUPuKu"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A6E3085B5;
	Wed, 18 Jun 2025 18:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750271535; cv=none; b=CUkH8nPtByQnz1QrEp4XVAOplianXB2XgFbyA0VBbFEyK296F6xfm/UkIifHnP9TNThpEbiMB1lGnHtEbaQT/uX2c4C7HO8o03f5MRyQyVaWoKEZesyy7qPYYUn0X6xiRrIwiTVQuZuVhsJdpzJ5SyKH+7H0ALyUowymDfnHG5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750271535; c=relaxed/simple;
	bh=dF+yxwBWxoUsGAKcD6Y8qqYuRnglUnXy+NkWiLYTZww=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fy72LIaKEyNlrZKikv+AW5Qr1rMSt8kFkWuEW8DMVgfq0zObiMtUim6dt3hiP64lR77/wQW5b90kM81BztLilCLemuufwJK8yj3/Sq+RRNzkfXEysYwB6JlvTK6w+urzpqjF1F0I0eB+6YkfCu8gWWr5hjZhziiHYdGTHIInEbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGnUPuKu; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso32563a12.0;
        Wed, 18 Jun 2025 11:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750271533; x=1750876333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L7CRGl3B4BlmEVMZ+EoW9hR2IHDhKsCbZsudVTakK2c=;
        b=aGnUPuKuvIvpJ4lNzuuGcDj7ibdRpO2H3Ebr7++fCM7gB8mkinrskD8s2C48DssiV3
         kO74441NzVLYolIaUdza/w1Z/jJldnkBRR4Qs/Rx4tp5WSXz1x88pMBJBNWwlgwVsduI
         1vwrw0Ht8VvTD76hWPMzhlfBX9b2I3LNj+SkGY4JiregUFBW+hjx/X0BriZdnCaccdgz
         Bd7qt/PpWi4apGhOmF0dugsm5q9yDxC97bd2IqRy1L1R5u5Bth+tyypLE+8Gr5mHM6e6
         zHA+Cd1Tnt8oQlq1eGj80jsqdcZ61Pq42K/+MTo/PskI/Jsz2/ZHQX3DJYi2Q8skudtx
         uVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750271533; x=1750876333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L7CRGl3B4BlmEVMZ+EoW9hR2IHDhKsCbZsudVTakK2c=;
        b=ARkuDI/QgW0EVYwfRQfQP+6dxVfklKo7XeHiUtuqWOThHy2AV+SuQ/zAAAaDd+PgfK
         XMFLcOv1EUEIti3qxe7yBTs36mW+SFR4v3F14294hj108LZZwYsP+AtRsurWVmNaSSfK
         s0J3Y45NwnlX+C5bpiYHAfRvnrjECm6bbv3lPjAdsHUMFYlc6W9oZND/nSrxR3rzTtUI
         yruS+vBBS0VJuY38aafFEvKJ2C0tcjj5AzopaER4Nf1jDHHI9GfshZDr8Gt4W6jTTX+U
         y4fFgfg7MLEB/pyCeelWp1A4miYqwxSI5+RPJbJv1Dqpw2QnzzEhII11hg6GB3rnoucj
         xeIA==
X-Forwarded-Encrypted: i=1; AJvYcCVUaIu1+hvrG6TOHWXnI0TYe0ezAtNJKAbQFkE3d/TsxD4mW6LzP5MbI9GEQLFIgCiegOrnHUdjEOy31iiN@vger.kernel.org, AJvYcCW+UPaaE7wAd92NTB9OmtAx8Mw7larYEEVzJl+BhGYAqN765ZsfxnreSspo+ft+FTMsediwSxxkYmCB@vger.kernel.org, AJvYcCWDviN5XXlxe7DN296BPwLXzJl6Ug01MppgmTzOc4OylDgo1XqYL39ceTGzwENybgU9Rf7o97Zgstg2LA==@vger.kernel.org, AJvYcCWlAwYVX9mvGzQieD1ccJA9EHWxxryHyb5MDSw6/K1E/TAsirNsmyYy1PLnIRk1Opo0ZYn7pB1qRWnx@vger.kernel.org
X-Gm-Message-State: AOJu0YwmmMq1wYSTbmh1vUZECYFWuC/AWdb/pCQ3Dk98ZEoYOlW3MuqU
	AmjAbcbkrIqq4MMVOZqLpUF3Yts9Pl2xA+r/bkULkSqW8G9JZlBknQKs
X-Gm-Gg: ASbGnctmx0FiFykdel9B1SWTjX8VRe8+TndcGA/P2mk6zC6Yz8UnLc9sn4NLeHgjxFF
	AYNqxpeFZRgEglO4Aq6FIDDm4jkQ+tsG1xgtUVEbtc22aURKukyHlKGpau6dyJRU+hBpVKebW86
	Hyx2ZItln8zsAU9oSfNZ4o+Cjpvdb3u/0baA1sJL7qXbfDi9W5RzQb/etpnxJhe+BAFZUgy5ipB
	yRuGcZHdy4WsNL0yWUl1oVSxaiKgZD+7/Eo5de0hlUtF5cwvoqNRr8VhyzEj1txmxAOI1zvkI2o
	bzbYVMm7gvT8L0G5JY0Ir8rfIaxVPPYcN3OIniAoRpPRvmjM7j/TeBBwWPhODqpY3Ec8D4t5
X-Google-Smtp-Source: AGHT+IEqNL1etkom/51dYTDHPvyPVYkcyS4yGbVSZFCBgvVFNVsV1jdPlM06YwkrLtj+IhMhK1SQSA==
X-Received: by 2002:a05:6a21:4612:b0:1ee:e33d:f477 with SMTP id adf61e73a8af0-21fbd4cd6f3mr29144103637.15.1750271533333;
        Wed, 18 Jun 2025 11:32:13 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.113.163.91])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1639f97sm9606454a12.6.2025.06.18.11.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 11:32:12 -0700 (PDT)
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
Subject: [PATCH v10 0/4] leds: add new LED driver for TI LP5812
Date: Thu, 19 Jun 2025 01:32:01 +0700
Message-Id: <20250618183205.113344-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the TI/National Semiconductor LP5812
4x3 matrix RGB LED driver. The driver supports features such as autonomous
animation and time-cross-multiplexing (TCM) for dynamic LED effects.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
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
  leds: add TI/National Semiconductor LP5812 LED Driver
  docs: ABI: Document LP5812 LED sysfs interfaces
  docs: leds: Document TI LP5812 LED driver

 .../ABI/testing/sysfs-bus-i2c-devices-lp5812  |   40 +
 .../ABI/testing/sysfs-class-led-lp5812        |  120 +
 .../devicetree/bindings/leds/ti,lp5812.yaml   |  229 ++
 Documentation/leds/index.rst                  |    1 +
 Documentation/leds/leds-lp5812.rst            |   84 +
 MAINTAINERS                                   |   13 +
 drivers/leds/rgb/Kconfig                      |   13 +
 drivers/leds/rgb/Makefile                     |    1 +
 drivers/leds/rgb/leds-lp5812.c                | 1943 +++++++++++++++++
 drivers/leds/rgb/leds-lp5812.h                |  227 ++
 10 files changed, 2671 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-lp5812
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 create mode 100644 Documentation/leds/leds-lp5812.rst
 create mode 100644 drivers/leds/rgb/leds-lp5812.c
 create mode 100644 drivers/leds/rgb/leds-lp5812.h


base-commit: f09079bd04a924c72d555cd97942d5f8d7eca98c
-- 
2.25.1


