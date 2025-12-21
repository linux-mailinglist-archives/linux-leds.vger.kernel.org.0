Return-Path: <linux-leds+bounces-6459-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A09CD3B79
	for <lists+linux-leds@lfdr.de>; Sun, 21 Dec 2025 05:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C987302176C
	for <lists+linux-leds@lfdr.de>; Sun, 21 Dec 2025 04:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2638E2222BF;
	Sun, 21 Dec 2025 04:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQhNzP2h"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B63A1DE8AF
	for <linux-leds@vger.kernel.org>; Sun, 21 Dec 2025 04:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766290846; cv=none; b=hZvd2pKDkZfHhrpS1FKv+uLAU1HEyfKrOdC8mWKIHbjyupiZAEDWakDqbBW0cxUTiQ4wdWo9+xcyDnshn1DAEtrJDcCCoyd+NuBeRL7SnQbNaHRDNPnmlhur7huc7OJQKl61blPcCMLKmnSdflP4ZgxE0xybJ9TIHq8XwYxLyGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766290846; c=relaxed/simple;
	bh=p32qd1CMtpZrvOqiOyNxVvmMRWtTmW3d9z9hTfsYpGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ta6bC/lsA5qfb4G3cx0VmeYCa2qHhI/VbBA1dOV5Uxyi+LuR8sB49zC0FFd0XOO4LUq6CBQUiGv1VZHC/J8fAPLonVM00kqXTenwP24JcGgkfxaJwbD3Fzl1AHyO8x4buJnYD7IL0+R39fb6cscBl3rkYYlf/YWFwjCvCT65mg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQhNzP2h; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a0833b5aeeso40796955ad.1
        for <linux-leds@vger.kernel.org>; Sat, 20 Dec 2025 20:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766290842; x=1766895642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnP7OKw91qUHBafMZ5I1kAG02nR+3IKvTt8SsYgVCHw=;
        b=eQhNzP2hyJPrrXzQHti/TlHxYQ7rh820FC1uSKeiaxBMTqW84YClOkDOgmygSLcyJ4
         SD7T+3YXTNzDJwuQBzzlnYy8OL4jZY2C3Bd6dYXK2n2fz+GlvKzy+3xFnnGZhuthLJ0O
         7mFdd67OeJL9rCg1Ovina79UX447bw20MpLPeOChQ5DktvBIcGRC10lCKOOhLIYZtSPc
         xEo6dyOsKpOR12doH04Z/OIdjjwvfv8glw1cidp4j//+3R1egb/W5ZJR9wENagxRKmf+
         FgMyE/3ErvPTbrLXLncnHzR/cMN+DW6Sp4Hu8CsA+CXpHz2aaDel++dpaRcTT+mbuz5e
         WJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766290842; x=1766895642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XnP7OKw91qUHBafMZ5I1kAG02nR+3IKvTt8SsYgVCHw=;
        b=XHfpM1tntA2hQHkRzYrl48biB2GXwROSLR1lbvFqK4uJpYLA0HUgUv5rJMhXwUhwl3
         iOT8tXWvfwJHaJUaNdBCshsF+e91D/cSYsXQRXO1H/Pd539x96o6QlN8p+qewvgZcHFi
         NBmVDHNn4ktaLR9zRmEVeq+J3R7kKvwzvU7qkb4pD0hB84rYjiFQATFpwvD+kvC6GQki
         ATKnlUn7FHRA+xYFXBXZ8EmClVcf0ZTHBVlVXteFX058QCz4j63rnqzdVfKWqGItwtDT
         CV3jsVGBXHMg0YtJKoJtKMzM3rjHM1LdN6qyje9PcrNnso/pdaUep4EjUVM2Y7bgYv1z
         8v+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUu4JoJVzAQHdcl7TJL4JlVwZjbY6OVqO5Y7saq601mXrWDbkEOC13z/KmJVIW21h6Kn2STiunwi6lG@vger.kernel.org
X-Gm-Message-State: AOJu0YxgmiYaEksSHf5h6O7W3VLVgykBBuPoEAsB1+Y2COrlUOZeJtw8
	0/87vMNbZmxVYeTMQ97p54jSTymFBvI96oav7OuJo6yp1hh63CSDrGeN
X-Gm-Gg: AY/fxX4Nr89rtiziZGrTeluiYKGrwcLHKk/wvRyY92T1kU4m2e/pRY398P9qhSaajHD
	3sQt86a7V/w4rF6nAzhTZoSPZ8HYcaU/Z+pxQk1buTQYKjNGA2ZR+P0Iv8RXDzERS8GK+vjemmv
	FLCyd2BK+D3iPNPGOW/Yg6Z6L88e3FqePiosLx8CWhccOrVt2W1BAQlGkJZQQxLUQoiYGu2Jy1y
	Bi1h8z2eqSRLr0szhXbPuYlsYM+tkoaMsYQfGCy578alhEKEkCujDYFeib1EJgs/btRh6nf0hTk
	A4Kb5x/OrOIVqHzV7WROmgWf11QPmnwZlGWxJg0X9xsRzU1ga5YDxaM54tZd8vsshm4tSc37Kfa
	uQxEcFZQP5oXtS+rrwu/TRfzYcgKppLIaTmbQuGkCY6x51XOz5/oC7LKWq2XDu8ginlfEoWxHuR
	vluh1qcuhzH4JI27UG+hNIIt4=
X-Google-Smtp-Source: AGHT+IGmGZSCNhEhHjUIS60wSnhLvOSqRgduWOyCEsTNRSYTC/0ddkkGHZQMcpHHjFAEheFEk433nw==
X-Received: by 2002:a17:903:2342:b0:2a0:e5cd:80a1 with SMTP id d9443c01a7336-2a2f2a34fa1mr71333975ad.41.1766290842511;
        Sat, 20 Dec 2025 20:20:42 -0800 (PST)
Received: from localhost.localdomain ([14.255.43.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb90sm62319245ad.51.2025.12.20.20.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 20:20:42 -0800 (PST)
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
Subject: [PATCH v20 3/3] docs: leds: Document TI LP5812 LED driver
Date: Sun, 21 Dec 2025 11:19:50 +0700
Message-Id: <20251221041950.4631-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251221041950.4631-1-trannamatk@gmail.com>
References: <20251221041950.4631-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver provides sysfs interfaces to control and configure the
LP5812 device and its LED channels.

The documetation describes the chip's capabilities, sysfs interface,
and usage examples.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 Documentation/leds/index.rst       |  1 +
 Documentation/leds/leds-lp5812.rst | 50 ++++++++++++++++++++++++++++++
 MAINTAINERS                        |  1 +
 3 files changed, 52 insertions(+)
 create mode 100644 Documentation/leds/leds-lp5812.rst

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index 76fae171039c..bebf44004278 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -25,6 +25,7 @@ LEDs
    leds-lp5523
    leds-lp5562
    leds-lp55xx
+   leds-lp5812
    leds-mlxcpld
    leds-mt6370-rgb
    leds-sc27xx
diff --git a/Documentation/leds/leds-lp5812.rst b/Documentation/leds/leds-lp5812.rst
new file mode 100644
index 000000000000..c2a6368d5149
--- /dev/null
+++ b/Documentation/leds/leds-lp5812.rst
@@ -0,0 +1,50 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================
+Kernel driver for lp5812
+========================
+
+* TI/National Semiconductor LP5812 LED Driver
+* Datasheet: https://www.ti.com/product/LP5812#tech-docs
+
+Authors: Jared Zhou <jared-zhou@ti.com>
+
+Description
+===========
+
+The LP5812 is a 4x3 matrix LED driver with support for both manual and
+autonomous animation control. This driver provides sysfs interfaces to
+control and configure the LP5812 device and its LED channels.
+
+Sysfs Interface
+===============
+
+This driver uses the standard multicolor LED class interfaces defined
+in Documentation/ABI/testing/sysfs-class-led-multicolor.rst.
+
+Each LP5812 LED output appears under ``/sys/class/leds/`` with its
+assigned label (for example ``LED_A``).
+
+The following attributes are exposed:
+  - multi_intensity: Per-channel RGB intensity control
+  - brightness: Standard brightness control (0-255)
+
+Autonomous Control Modes
+========================
+
+The driver also supports autonomous control through pattern configuration
+(e.g., direct, tcmscan, or mixscan modes) defined in the device tree.
+When configured, the LP5812 can generate transitions and color effects
+without CPU intervention.
+
+Refer to the device tree binding document for valid mode strings and
+configuration examples.
+
+Example Usage
+=============
+
+To control LED_A::
+    # Set RGB intensity (R=50, G=50, B=50)
+    echo 50 50 50 > /sys/class/leds/LED_A/multi_intensity
+    # Set overall brightness to maximum
+    echo 255 > /sys/class/leds/LED_A/brightness
diff --git a/MAINTAINERS b/MAINTAINERS
index 8d840b34c924..394165660e67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25841,6 +25841,7 @@ M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/rgb/Kconfig
 F:	drivers/leds/rgb/Makefile
 F:	drivers/leds/rgb/leds-lp5812.c
-- 
2.25.1


