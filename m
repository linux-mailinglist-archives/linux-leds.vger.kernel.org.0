Return-Path: <linux-leds+bounces-6355-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30284C951E7
	for <lists+linux-leds@lfdr.de>; Sun, 30 Nov 2025 16:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEB313A2867
	for <lists+linux-leds@lfdr.de>; Sun, 30 Nov 2025 15:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2651284662;
	Sun, 30 Nov 2025 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YofwnR2V"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F11427CB02
	for <linux-leds@vger.kernel.org>; Sun, 30 Nov 2025 15:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764517281; cv=none; b=WveKCCoPFAhk9jiZL5z36Jo4vsUIS0D2TXl5YBKgnapmYhxg2WSwiyqxS4APKyKv6Qh7jkhqgwCKeV7RnQGUYCgmTiFU1Lqs74B8GsTMkGN4K9x3++Ou439oqjkxUhJpvDxArOu+CZ1lki/GZcNjkeJO7HrOeaS/vZXM++/+670=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764517281; c=relaxed/simple;
	bh=yknEGxi1uCob8yAl1wrjFKtlOfxHjL4MX5qcBlbJfrU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lB+r2OTs3oFmdVWVpaP2qAfgcvc5QGTethKv6x7BCgv00M2B95eqg8g8ybWpEP6KmX+BE6fqDF2Uo5KsdRrZyUwXzSSMldzb7vEiI2elmY+vK5uBlDExVrGJI7uLwzdT4YlFBsulcT61YupO2KU3ikW/+ZspbSUPCdCAV1Bx8XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YofwnR2V; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso3842426b3a.1
        for <linux-leds@vger.kernel.org>; Sun, 30 Nov 2025 07:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764517279; x=1765122079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jOzKc0BXX1qNRReg7a6AAzT4jmiSQSRqVhsPleD4HE=;
        b=YofwnR2Vu9TonAclhELCRC3jwipwXZbRq40gE0oQtaE6MXLwupvuUXHjS+p80DXVKY
         aHj9xhDpwqZBIRcrefyZP3F2mjM/ig5UCbOTBdd7jfpSqtHZmv2DKwri9EshcD1h1HOY
         0YjGEpTD1IqAn6ZmJJ2u27btSXzFPUxfAH/HJXIBotnCSOQ3y7Sk9MLZIjI7HH9lGgpU
         IJRLZhSI47AAuSxVj8BYqvPEIsTLd1n3xlvcNpts1Pm8Fzof2xnEh4NuCM8fIiGu3A+d
         yEZ3tidnuZICKGEqYO4SozqX9dwpaYchaGWgvEOvWkvvLnLtF/OcJZolfxJDpKvacOn3
         q7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764517279; x=1765122079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/jOzKc0BXX1qNRReg7a6AAzT4jmiSQSRqVhsPleD4HE=;
        b=xJMbwgGSnL1H4PR5LitzGAQWx02p8+eeGUKl5lCkbFzzrOodBhojKM6fIiE4e9Z2FY
         fpF6Tr5VExNGLK6dHsTA50Pb/PTJ6V1fWqSuPWizTs4Q9o2eGLXvik1lSPQTLK5QIoIw
         fOOKo2AX2llteAhir7anE9QGnFdeeRbz7SEbSyHhoH2Xwj/z/IqLsWoCmjqZCOGQVdJc
         82p5C+aaKJQTHBPqAMtofVDL7zkJdTLuiDMt+dFv+WUtrpNDZL3NaEtHOdnHzZaNyJjg
         pKYzcatrjND08qPpquVLlLCiQKx37brvwMy7T2gd50kh14w7jDzaUjUYsxnG+7q5yVbh
         imLA==
X-Forwarded-Encrypted: i=1; AJvYcCWQQFUru+H1EExJ4b2XuVDTEBRBsvHUEuOx+v3TA1xl6GuLz5VfGhET0XVZ8TQSKNQyKyGodzYDKEWl@vger.kernel.org
X-Gm-Message-State: AOJu0YyU9zPi0KBTtkw/37Or0BhYZZxAgRVEZwctCTV9cgl+2MyrFBj6
	vw21uV0X36rfVhXa0B0hJeV25iF0jBlJmDlVMKv39PetAwOOpcGmzOxM
X-Gm-Gg: ASbGncsRWnYDwOrqF3b16Va9zRCx7sQMwfbd0DgRtrzxOpM8+fEXc+zMK1fmnpL5dSW
	lTMostPSkBxxeuThNCzNxO0nUv6yUXeonCOW5VyFI0E43N2esYe792BJzTXuTQkO0vSeFJ5Autn
	Q1tG2W4td6tB3atamiRejghDVJUMI2pYlyCn0dFx7y1Ya2vyt89D/1AMpDsa10do8BO3tyEwFSl
	GjOhusEVuGo7R18kMCukZt46tPcFU/RelA/fh5EADFH29cfETh9dGV9HbIwf8lOXcINzvskifkV
	wpP4daQ9fYyW0PlWibWFluA2FnkhDWsyyzMnxqAPWhJUy/MnrsZBgj1O0USAvoeqy0s7UAWBZV9
	1UWmF4ZBm1ECCPl9WLv2Q1hqhiHqE2f6rRwrhuiXHJ2JrVcvLg6rcpCFFwRRpTjTAXuEv4f7eZ9
	ZISclncMHl4ZCJRYDxM6IrCQ==
X-Google-Smtp-Source: AGHT+IE6IycgglZPBLNtEeo/kPKcOXO5VSy/+npfPp66iSwqU7ysTtvtelkbhYQPNj7tsQg9O5NqAw==
X-Received: by 2002:a05:6a21:9983:b0:35d:d477:a7fa with SMTP id adf61e73a8af0-3614ebbb712mr34574189637.23.1764517279052;
        Sun, 30 Nov 2025 07:41:19 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.188])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be5e7485b1esm8640097a12.20.2025.11.30.07.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 07:41:18 -0800 (PST)
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
Subject: [PATCH v19 3/3] docs: leds: Document TI LP5812 LED driver
Date: Sun, 30 Nov 2025 22:39:56 +0700
Message-Id: <20251130153956.241375-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251130153956.241375-1-trannamatk@gmail.com>
References: <20251130153956.241375-1-trannamatk@gmail.com>
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
index 166fb7e0ca45..530c7a3ff350 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25454,6 +25454,7 @@ M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/rgb/Kconfig
 F:	drivers/leds/rgb/Makefile
 F:	drivers/leds/rgb/leds-lp5812.c
-- 
2.25.1


