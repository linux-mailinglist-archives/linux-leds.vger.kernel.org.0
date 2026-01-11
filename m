Return-Path: <linux-leds+bounces-6615-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 922F6D0F023
	for <lists+linux-leds@lfdr.de>; Sun, 11 Jan 2026 14:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC35F3006597
	for <lists+linux-leds@lfdr.de>; Sun, 11 Jan 2026 13:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B0B33F364;
	Sun, 11 Jan 2026 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsGPOTwt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988C633CEA1
	for <linux-leds@vger.kernel.org>; Sun, 11 Jan 2026 13:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768139771; cv=none; b=jHyyxnvcuTLSP/y6wtd0CRMP40PrMKAq9w5eERyUUhpqm/sudJFA+5jNEHL9XJTAYZeq9Mw64V6RPB3IxPuMcvk/B86Cel+FqJDm0SDJYKB24nVyd08Y2/GPlDqBqIfBtwGv4fWh5ZCojYY0UUdh73VrhzTTvUaSEiyMc4/WJsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768139771; c=relaxed/simple;
	bh=fQGHg/GaALo4L7NakZAnZQKi+khkZF+lQSdpTOINtvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HYIUfbX7tDl1WVkX6pXOUfs6Pbhud07bJS/AMJorEIQCKhXAzUTnQBq96go4DRN17mXr0UV1TpWBdUb1dXB4I5cwww0a/gAwr6cYrqomjelYFjZblfJVzMoxb//pbglGfybSWCq5StdPITSkR0nb05Q9+cguI3ZtunM0lERap7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsGPOTwt; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-b553412a19bso2601201a12.1
        for <linux-leds@vger.kernel.org>; Sun, 11 Jan 2026 05:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768139769; x=1768744569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOv6EGsZbFYXRB0m9rGx8n7JodIqftlLa5WhfqqaVtc=;
        b=VsGPOTwtF8qPGY+3/aWuhFOS6jXIrBPAM1OZzC0N/WGBLYbk0WZEX6puXzDpZ+2o33
         2VlFRnHBEk9v80pefFk1wNCPOFXc00Z0pgeUrkLnDlwVPi555H6rq+F+6ZIItqN3r1Zq
         GmWqVBd8U1kxXAfntEb7nWBD19CET1BHnK+y3klMapj4wRPt8H7xey58CdI56FfXu3n+
         K8ysfV5YVsn9g2PTSQlPY9oYa3ToJAgLSz9e7u/L0VRbExWyUnM+ifiGh+eoZyN578tz
         c1bXCNztALTi1sKcG2VO/abJPQm0M+rkW6mpEaiRhicnuSLpm47zJvyOKY7Tn9Y3ajk5
         HE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768139769; x=1768744569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fOv6EGsZbFYXRB0m9rGx8n7JodIqftlLa5WhfqqaVtc=;
        b=ppy9amu7PZGoa1EExQdY/5NrWTHIFlmJBKgkByPWsKbBYq1KE8BEPSs0FsMOa6L0gK
         tWm6Rc6jPvV2Gcn8uhKAkQzqwtch2OXPNag4UdWMz3Y8WtM5TUZEbVMuD8idPDKlnEDC
         8ERgLMGr0Wisgghu472z5fuF73P8rNGU9Svs3VyZz2ND8b77rA8+sjbR8QkNEW8Hc6Tt
         RLL8JQLxnYHKGONXrpMzw8y7xOwhbwXS64crALJJslLph75N0trU9h5tzv7ucnlRcFSv
         2l+tgBzgwI0urGv++AzFRWVgGYTGPhDZL0Yzt7blo5b7WCbP053Ffdx1Muuyjbv9p0y6
         8yIA==
X-Forwarded-Encrypted: i=1; AJvYcCWDhcz12ppSZTSv1KYsV5JIz6GkfjNkJoA3A4JV3dUoHziqhl/ZFb178DqCrEiH5cUmt3Aj+ne2u+xd@vger.kernel.org
X-Gm-Message-State: AOJu0YwHK8cgkvP379qgLGxppVmPcm+BfbsILEftAUij+0TF5OXPH2gF
	St5Yhxoy4FxBVyQeYnHeJBaOXBfYeAzq5eQstzP6C93Lw88flkXkaGND
X-Gm-Gg: AY/fxX70y1lHWGfXcoslJOXHXj9mUFg/A3QgeE6sMyfSsinDAZlVywlyKFm+3hbLUgX
	5iNRZw8sg98FjsGI5OwdzbbsT1q8hsvQG1WVmKXUnQoYXcQh1seenH9kfmPx5frMmnb1GREicwA
	jEtpXHfzpPSwIt2igFGJmi6OgnYCiYgecppS2UdDDivgO5NCi/oEMwnTSIqinzulK/xPahQJI/j
	HDTWdqHUtnAwqyq9I03BXZqEwv1MP/AE74S7bv3zXKxPhSE4BqLWdcqXRZgcts3UOxousOPstgi
	jVQif0HQ9Hsc/dF1sxPA0/zyNLSSAsV4SXDEOZy9SyOrijGXsVkKaj3zUSPtRD06yAoSZzr1IoU
	BLjkCk52APlikpQ25f5pIPNG96ymSDoyvCfkKlTURh9r5jagbTIaoQsgNZhTg4AZITnuqHc6vBH
	p8ExdcT63dCyK4hHgiV6PAt2S4HQhxif9h0B0=
X-Google-Smtp-Source: AGHT+IEB1YKs1sBri/CwpT883LDcNuDwf7Q1SbSRf2vdPYouCmwfR4cxzcsipVBYtOx/jDlkTLMMPw==
X-Received: by 2002:a17:90b:1b03:b0:343:e461:9022 with SMTP id 98e67ed59e1d1-34f68ca444bmr15338692a91.24.1768139768855;
        Sun, 11 Jan 2026 05:56:08 -0800 (PST)
Received: from localhost.localdomain ([113.164.155.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b88d984sm5742345a91.3.2026.01.11.05.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 05:56:08 -0800 (PST)
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
Subject: [PATCH v21 3/3] docs: leds: Document TI LP5812 LED driver
Date: Sun, 11 Jan 2026 20:55:19 +0700
Message-Id: <20260111135519.28112-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260111135519.28112-1-trannamatk@gmail.com>
References: <20260111135519.28112-1-trannamatk@gmail.com>
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
index 65fca8dc34fb..584cf63aaacb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25936,6 +25936,7 @@ M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/rgb/Kconfig
 F:	drivers/leds/rgb/Makefile
 F:	drivers/leds/rgb/leds-lp5812.c
-- 
2.25.1


