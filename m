Return-Path: <linux-leds+bounces-6284-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C69FC7E63E
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 20:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 64989346E3C
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 19:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D132E218AA0;
	Sun, 23 Nov 2025 19:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOMdDLE8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310FC23B61E
	for <linux-leds@vger.kernel.org>; Sun, 23 Nov 2025 19:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763925075; cv=none; b=nC303d+6SZMY7TWepwq5l5IAu3O85rwqu9yOg+fYmiNOQI7140nDEhsTvVAe/zaXbiuqovBUFKWCLyGf1TK5KXx13Aktyk/oO9L1WQW5pRT4FCqbBPRUBlsAHg5oiJJoNYX25gzZhrbEPnEFCrz1Q7+rpWuI/KO5vZlrLs1AcTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763925075; c=relaxed/simple;
	bh=LN6U1JVPb9+1eLo7g3FdtdqGnUAJDli/a5RS4lOyf10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kAUf32ldIihuHD+rdPeyH9NUXnQf3uh7pxTUI57biGiVsYgzOT5mG3TG63e35H/0v5WeGzgZ6in90rHlgpsd4WEAM7tbE0KWtGgHsssOH09RyJ6lSEgKFHK+s5+iIl6d1MYjIed1lf4ebQjsB1fe78AWUx41E97jdz+G9UPB3SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOMdDLE8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2981f9ce15cso43219615ad.1
        for <linux-leds@vger.kernel.org>; Sun, 23 Nov 2025 11:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763925072; x=1764529872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmHa/LXJpUTjBGHVWC+hnuQBMTBsWIpO679JoMtrn84=;
        b=iOMdDLE8fAGVk7tfLpvay21h0WC/XTevAG/C4o2Du14TKamob8BiZP1EcortPLiQtE
         pG9d3iOmwS4pGgBzQr1QWkCAZRnT1+0PawgyIg5FA4dxE3FEorqmHk8pkvQnz7wEn8oa
         utSH2Vt2HChPdVu6R9FShXEzmoKNyf9QXoaCGyPmQS3iDKUnBPtjgy+pu9th/rQTnoUb
         scXsBxzTIMaUIRPm3k4stA2T3Loj8c3uZHFUZAyIE61Db8x0ZnZNL/Fmk9prkXcgI15N
         d5Srbt39IUpC/dLEhJlZVNxmjyHMNYgsv2SpJYgczzVqzGbkYzdAwfR5/4svLM5z+46N
         /n6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763925072; x=1764529872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tmHa/LXJpUTjBGHVWC+hnuQBMTBsWIpO679JoMtrn84=;
        b=NxqD3w8dCo9J5ljuEWoAnxCdeuwkB2j3dCFKfrVIqR0NAdaDz7vUg9cMbn2R7gx+rF
         rzFBxmLYYeZ/uA1wiFkAH1WD7WqKKlddXf0aWNcDy6C6rKUzfnCadkHInuLsVoM6wnWN
         /q60/oJWRM40CJPtoowOmqSUnexw7hBMVlQ132HwQz0lcCHgcOUNwfsthV1QC8fNk0mz
         /2wA+N1cGut/7QmTZ89gAagdSrNJW9jjakZ+nzBgHO8o7JPpt2TQVllYZnaBmBbWOc4u
         Gia6hDA5+KeO5U+TE5OA4lr0fbh7T0hXRDM2qt3RNvmusIDga+sU5Lu+Yj09feztUuy0
         I11A==
X-Forwarded-Encrypted: i=1; AJvYcCWK3dGt29PsGkw5uXKEmmm9hu66HM1ecHsWX4H+IYb0rEy5rTuo07F+hreUCrvDxCXad7MpKuRx3T12@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr2RtvHFOwBMof1r9iIc7Sat/f0D1FauxOTlv6Ru8LfraD4aaN
	Y87XwrhZgfItMFttl52PmIRmxPdNtDEh7DwZnoEsQpXnflRlmEb6QpA5
X-Gm-Gg: ASbGncsRsFP2HksGv0p3Zc/nBzTPNih2Vw+J7i2imJDxmxlVrBnwhUi+dlohzKYMtap
	lGX7boCwQX9zkC0UbuiDN+0vbJ6kWulxhdQg/H5H6oBw8+xip9PfStR1Xs0ifc2u4EC0jB3y9pY
	0NtF3/3r1+ltXTVEGi8VuCaZFRaEMaxrNA/Tb5vUlUYmeu5JfS9eKVKsfRY0EMKsRDt/PYUvUrK
	8ZZgIa9vEpbFmIheohwEzkhZtPTMmJkJxMhKBhglkZWl4fx0pxMyc6ecQLGm9UCKlk7QnMG3X+u
	K2rvDy2Va8vFYhujBHxsvDRbtv4hCzdnVew2ylyEcQjTSPaQyuUHRlg25aPbQMRtcHEscgBsNvV
	LPu2PG8LzFmQpvqsD3TFMls97D4TiLQ5g6M4NUoDjYZ7hVMYOPFGE0Ia2Mmn2yzHbg4bIhspSSc
	uXKUPQntGtUmkW3LZBnJDJmw==
X-Google-Smtp-Source: AGHT+IHPFoSxQZoigWdf+doSXm3n1IZ6Vj/SJ4gDleYOYUskKuzp0oVLKr/lcnHOJRJnx6TXf+8YNg==
X-Received: by 2002:a17:903:38c4:b0:297:df17:54cd with SMTP id d9443c01a7336-29b6becd454mr118444255ad.27.1763925072582;
        Sun, 23 Nov 2025 11:11:12 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13e720sm109542655ad.42.2025.11.23.11.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 11:11:12 -0800 (PST)
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
Subject: [PATCH v18 3/3] docs: leds: Document TI LP5812 LED driver
Date: Mon, 24 Nov 2025 02:10:42 +0700
Message-Id: <20251123191042.116917-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251123191042.116917-1-trannamatk@gmail.com>
References: <20251123191042.116917-1-trannamatk@gmail.com>
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
index 000000000000..4c22d9a79d14
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
+in `Documentation/ABI/testing/sysfs-class-led-multicolor`.
+
+Each LP5812 LED output appears under ``/sys/class/leds/`` with its
+assigned label (for example ``LED_A``).
+
+The following attributes are exposed:
+  - multi_intensity: Per-channel RGB intensity control.
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
index 9a7ae1794328..f696e2299a43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25453,6 +25453,7 @@ M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/rgb/Kconfig
 F:	drivers/leds/rgb/Makefile
 F:	drivers/leds/rgb/leds-lp5812.c
-- 
2.25.1


