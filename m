Return-Path: <linux-leds+bounces-5643-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B4ABB98F9
	for <lists+linux-leds@lfdr.de>; Sun, 05 Oct 2025 17:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21B063B7E42
	for <lists+linux-leds@lfdr.de>; Sun,  5 Oct 2025 15:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9135528A1F3;
	Sun,  5 Oct 2025 15:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QECSqFm1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32CC28D84F
	for <linux-leds@vger.kernel.org>; Sun,  5 Oct 2025 15:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759678486; cv=none; b=Wxo9vBk9YVRKDmoDjkXTVsf7cv7NFXOKV7zeLxnX9wvscNmEW6r94RrRssJhc28uZsIpW/0yBgo5ps3IGfex9UyuEdw14xm2Zben143uorqmDozjv3wbXpFf6BMse1QMGor/mMNFB2lp/oPfrlcl0ioqFc+mfGXGgItdpTYcuhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759678486; c=relaxed/simple;
	bh=98caJkQZ0MiAzC2fQEY27b92eOKFqM0zqIcXCKa8xZs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hRxMD0Kcb1HyRAyY/ufeAhVBO6ozTY3x2NZUn/hbgGKUEBtmiqRFdzUSNFCw1Oq8qxATvhKgN2GGMSPLM/JjEj8ojuqHw46WiWXRC6xh5H4B0lHA6T90IuHxYOCdnmDlnqCvy9z+SIN6OW48o8H9jw+7dMQ/It4kRiTkXm7AyRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QECSqFm1; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2897522a1dfso38382765ad.1
        for <linux-leds@vger.kernel.org>; Sun, 05 Oct 2025 08:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759678483; x=1760283283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2X6o/MRuCTc+0p6F+rhXe+4gejxskim5+wROeJzq1wc=;
        b=QECSqFm1VriYQk9c4gdRFpoXTZrIpcg0XT0Ho+gFVzfeDvVJCdvDP3drUdRBwMQHMX
         C7iZxGnt9UgpNnwbUnjv9IsJwyGo44Y8A0k4zFXSayf582/buLa/9kwCB9I5HPZkzwHH
         Ybr9y2UQ+H2jNf9LNVdbeavqVjrEVJmW3TFe0rWZ+HhwNr8iQLaeWmVfWnUpE0Y0CtN/
         2fbdxiE5awu2BIPYJY3A2UW9RB4MzTmNltt7I+d6NNe1yHYyqIjYFQNfEFlQEAQV3bl1
         hLqZPwjuJc2BJCg40lSMJmVop0dIhlPSvpiEPu6uRpMbisHfMl4HJg7+JvcaDowF5j+F
         KV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759678483; x=1760283283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2X6o/MRuCTc+0p6F+rhXe+4gejxskim5+wROeJzq1wc=;
        b=rszMzzYjtPuReHK+jCvp+fpEmO+w08nBzPgwqtK7SgGzsih83mIPEvlvUgQD16RZ7F
         Q/wcqrpqVsZnpkTvUwwdUanWucAGXtlQYeNUhY1uDoQ/m1Wwzd2BbCRG+bKV+PN/qLZr
         W1tZ+aYA7h2yb9WaDxw9CLr1BvhJT9BwZbcdhLSbZ8WLPCZp23AOAww0IBMSrzNHWxqO
         1vd0i11eeLiFsEEOmiMm3pBL6Kkm+VA4Kdmotpez/C6oU/76X/jCEPGBE/2c4Cl7lEcl
         9bR4Ugtl2RPjBYHMwUxXzXjB5zpx3Qmm7NEv3Ts/Loms21ioOPcoQjanw4CPgqrlLTcZ
         KXtA==
X-Forwarded-Encrypted: i=1; AJvYcCWhR3X77uvN6/GXZvStMJkoF+VG9Gamx6bUycEE+Z6e+XMwsO5KcFFdhQcuxPSRXqwAcLwxjmkhGLnH@vger.kernel.org
X-Gm-Message-State: AOJu0YzE0vrFu5vhzQoJxeQkkMizKioIdTm1PfnpPVTIgV4LVAOPyvmu
	CAVbo3UWwk/aX27tRZURfDbwTdAubGOh9GMgdY1zDJX0qaDiZiKHPyT1
X-Gm-Gg: ASbGncvouHzQku0QkhUcOcvPgmMwfIeT5ZBVvg0h9Z+RkxyRA9x2AtWv/0mpIuHrwjz
	rFdXGWEkX5JMDcI0gAsFSV4EUlwYIgC9j7NwUaYL7Ql/hhlVqkqY7knAKo0BZp3qYoVGzGC2ByZ
	V1fSYlBCaELtRel6xYPPuR/zxSTLogfsFq5YsjBbEStygEUHBR1bqdvdrt9HrUjCWKkiPQuTrGM
	bzbLjjMR3p3bH2aiXJEF8UqvQlu0W3iJ/Gm6/m30Q9QQ5srgwMKNEReZttyrORaJzXtrQtJcSDN
	IPsVpX7c/cRPhasA7e5+rNNl4jPycn1Brav1fIxsKbHyOwgRCoB2uinXdTR9OmEoRJqOVgBOqTX
	ip8I1ppcCanZNdRttD+kgZDvJAWU0WgaxTQ5KJhpwbrcTQiSDfRIs2dn6U7Xe+QLNXA==
X-Google-Smtp-Source: AGHT+IGOOTrBzPFcXT/L1Z9eJjafTeBHYh5acgbfBjUTIl/XV5J6IgoIQc+d+NUDca8jIPHpHj7Nlw==
X-Received: by 2002:a17:902:ce88:b0:28d:18d3:46cb with SMTP id d9443c01a7336-28e9a54660fmr118836165ad.20.1759678483159;
        Sun, 05 Oct 2025 08:34:43 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([58.187.66.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110d9csm105555965ad.2.2025.10.05.08.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 08:34:42 -0700 (PDT)
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
Subject: [PATCH v15 3/3] docs: leds: Document TI LP5812 LED driver
Date: Sun,  5 Oct 2025 22:33:37 +0700
Message-Id: <20251005153337.94025-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251005153337.94025-1-trannamatk@gmail.com>
References: <20251005153337.94025-1-trannamatk@gmail.com>
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
index 7a3808d8d624..4d625dabde72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25388,6 +25388,7 @@ M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/rgb/Kconfig
 F:	drivers/leds/rgb/Makefile
 F:	drivers/leds/rgb/leds-lp5812.c
-- 
2.25.1


