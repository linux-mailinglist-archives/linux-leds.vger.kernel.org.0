Return-Path: <linux-leds+bounces-4774-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FCFAD410B
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 19:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D323189866A
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 17:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9509B24468D;
	Tue, 10 Jun 2025 17:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHAioZlJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C8E21019C;
	Tue, 10 Jun 2025 17:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749577411; cv=none; b=g69oE/9EN4/S46OxPNoJzZHBt/MNlsbbgG2lS4julQNtuyG3hDzAGjZXUIrQuNCA4Cx0RuCeph/3a4/rCeOZP/3abN3qzQII/AZxqu+PxU8/X5QCzI+epryUb+fEBo62VBQVYkHQf9otW1v0oXgTOmg6jrHWa9IVHrO+OB+D2sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749577411; c=relaxed/simple;
	bh=c5ruOmRMSA4MrtdljcdxTfshX30/2hgrToE3LK6is04=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=DNmxYA4viKyZ1G+C4uIyDignJSs5nXxWQi4lln+wbWZq8PGITnrgjdZNWZOIhj+hY9LZcIN1BOMklghHdtBMRJxCct2JRj5QIE+e+ScumgaznZrSKKGwB2Llcc0Xq9EiwrHx4oaxKyescirKrD1lqMlPy6V2HJtj5zwEnXbI0jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHAioZlJ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so83473a91.0;
        Tue, 10 Jun 2025 10:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749577409; x=1750182209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IToNvwe59mraE+d1bXdC19V0St+m5Lm8BJo/R/7MkmY=;
        b=VHAioZlJe9fnOl0LR0JMfiiC32qMcDMC5+B9SRvrC3S4rW0EFY88fyP2YtLL6p5Q9i
         XpJA6Dz5+sGpMB8tA1O+CkR2LCExq1HJzfJNAbeHQXlZsv93e8YQjX1iP8xK+eyze1BW
         d1zf74tOElm8ohAUXlBAR6imfN6JfsqnQ/WCkLCqTy1euCm4MmyiHkttjr4XcdVtybec
         0tRGZJ9YvFrQBmZfvd9YIqOwRFOZIeM/Fw57E6whyilPcEZ0SdbBi3YMYX258SKjMh+1
         3DNN/EACfO6w+xz3KUVRp1ry8LrxEYQy+uLg8iZyIkCHAwxmzbAFVklt/iazHoHvXswH
         yWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749577409; x=1750182209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IToNvwe59mraE+d1bXdC19V0St+m5Lm8BJo/R/7MkmY=;
        b=F3KR2wCtsIayzt1L1CRy59qwbyrQfRxsol4KYMrcY4n+wUh3XasZDKQuzXlF/adNTY
         ko76bkVPHSWhc8XSW/jfWkknQOUS+tI0LGGAzAqLcUfjBvJ9kfgktoLWKQ1w/EqA8qUg
         qQkWORePWyEEBzeVeMAGxMLBMcQQP1h5cSrn64G+qMddf+E0fR6ZgUDZpXtKOMKajls+
         ieFUfS1M2A0I7QY8kUhCmyJeQw6E1lgfuFezmUW5QtAQgqXyD4fmAQWLeZbvkmsF9EHC
         RbZcFnYseQmFILt+BVe8ZXr6EwL2EAFUodskghe6/cYwLEwfBSsnLnXueWVxSxetqm4v
         jT6g==
X-Forwarded-Encrypted: i=1; AJvYcCULxylSWVCPw32+AaXC/aiA+9Ke1vI8qm7vT6X9PKYAVm7kVULdbHj8C3FfEjCBqa0wzCVZKDRs5fSA@vger.kernel.org, AJvYcCUQIonWsdhgD32sN+wtM9U/xsERp6kRSK2WCd68lXaxBQJSqAtYy03uoxklfwOnHxL6ic3dvirbTgjQXk6s@vger.kernel.org, AJvYcCUen6Hd9mEy/bzKTGXK8Pww5U28j7nw1gh/NjfKpXit2XBjXECdl36yL/R3doePefRt3/RGG5d7HgFM@vger.kernel.org, AJvYcCXatxXiwZX0vrF9GjvyHQcdykzzMGtpyWfkyaZGF33/hHPhcw041lyv+1HQ1BPKVKJPjK/vVxLWU4O04A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjZqG2CxWblAWpQU6MLrKBdMhGuqyhJQuiHRJUdNzb0SPeZeLp
	PSwVAYU6hKjBiibrJBzz89a6wKfLjqgdfKmbTzuyAlBgbeiyTYC9qRZEvCKOow==
X-Gm-Gg: ASbGncvJU1wP092gCBjMEE4oOBLnzAuiPYJ3EEWyU+xDJy68n/B4qifFG9R7X4EjkSU
	03xM3BqfT2YTeNfhuiG0f3Ig9gISRMLuVVGKJTZnylOOQxu8WcpyEUsCjlq+Kvi0i/U6AjFjNM+
	lh5kwJkAQId/HynqvZDB5/q++5ePyV0sX5ihcYY/gFYdXHve4x3H/+XPZw7OXOowy7OABjyW55D
	NqfBVl7HlhoecJlQdywQFyyNRKVwrsEYadoBA23DDS1vJD0vlc7FR2uWemh14bWYLRck8N8VwIs
	wdrtXS1iSqJbOESWbcRn6PWXj9KE2MtrmoAIYMErXpsKWvvVftF0F8Ob0VKXO2ckstWqxyEi
X-Google-Smtp-Source: AGHT+IHCQ/s3PZMtUHf6l1NsQrkq7qT/lplwvers3sTczAiKEfMEFba28BOY326bowDBL+VPLEV17A==
X-Received: by 2002:a17:90b:4c4a:b0:313:17d0:b066 with SMTP id 98e67ed59e1d1-313af886227mr317256a91.7.1749577408987;
        Tue, 10 Jun 2025 10:43:28 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.113.163.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b044d91sm7470668a91.2.2025.06.10.10.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:43:28 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v9 0/4] leds: add new LED driver for TI LP5812
Date: Wed, 11 Jun 2025 00:43:14 +0700
Message-Id: <20250610174319.183375-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series adds support for the TI/National Semiconductor LP5812
4x3 matrix RGB LED driver. The driver supports features such as autonomous
animation and time-cross-multiplexing (TCM) for dynamic LED effects.

Following feedback from both the LED and auxdisplay subsystem maintainers,
the driver has been moved back to the LED subsystem, under drivers/leds/rgb/.
This version integrates with the existing multicolor LED APIs, avoiding custom
sysfs where standard LED interfaces are sufficient.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
Changes in v9:
- Move driver back to drivers/leds/rgb/
- Integrate with LED multicolor framework
- Refactor and simplify custom sysfs handling
- Extend Device Tree binding to support multi-led@ nodes using leds-class-multicolor.yaml
- Update documentation to reflect the updated sysfs
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
 .../devicetree/bindings/leds/ti,lp5812.yaml   |  264 +++
 Documentation/leds/index.rst                  |    1 +
 Documentation/leds/leds-lp5812.rst            |   84 +
 MAINTAINERS                                   |   13 +
 drivers/leds/rgb/Kconfig                      |   13 +
 drivers/leds/rgb/Makefile                     |    1 +
 drivers/leds/rgb/leds-lp5812.c                | 1946 +++++++++++++++++
 drivers/leds/rgb/leds-lp5812.h                |  228 ++
 10 files changed, 2710 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-lp5812
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 create mode 100644 Documentation/leds/leds-lp5812.rst
 create mode 100644 drivers/leds/rgb/leds-lp5812.c
 create mode 100644 drivers/leds/rgb/leds-lp5812.h


base-commit: f09079bd04a924c72d555cd97942d5f8d7eca98c
-- 
2.25.1


