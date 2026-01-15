Return-Path: <linux-leds+bounces-6652-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 792ECD25A3F
	for <lists+linux-leds@lfdr.de>; Thu, 15 Jan 2026 17:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2059F30231EE
	for <lists+linux-leds@lfdr.de>; Thu, 15 Jan 2026 16:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5481530CD89;
	Thu, 15 Jan 2026 16:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkhfzMjM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C3C3B961B
	for <linux-leds@vger.kernel.org>; Thu, 15 Jan 2026 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768493440; cv=none; b=OD4qJKr4CgGPr3aXPhNlYbcEZd+bvEgzIiuDDLhBSikz7PP4vkfYWFh3/qMFwzil8l4Yg3a+ZawLhyPSPx4HphnWpuoC9ZybzWPHoiz/NWgApt5nX+zqOP4ZL4r5r0zQ0qLGvOXKWcCly2Hs7lAiExQIu8Rfp/lf2wwH50h5u78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768493440; c=relaxed/simple;
	bh=p32qd1CMtpZrvOqiOyNxVvmMRWtTmW3d9z9hTfsYpGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oE15TdOqHkF8Kz3t6hphXdAbHXkFJ8UXQKIouElJxFEWuM8jZuafQOYAjfoTCl+zHUq3JfPnWoGcC7s2tU+6ZAxs3knWaOFb1WQ2ZS3Y4/9Ux32BBG1/zXfB1BMtopMcpNry5//42G2spWWJGdWCyCZIuyhDrDsn3ni2tvhee90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkhfzMjM; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a0fe77d141so8397195ad.1
        for <linux-leds@vger.kernel.org>; Thu, 15 Jan 2026 08:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768493437; x=1769098237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnP7OKw91qUHBafMZ5I1kAG02nR+3IKvTt8SsYgVCHw=;
        b=CkhfzMjMsWhs3clmN5O8bQkazXIN7Co4BUqv6MqR0ImsS7dq+uLesuzhzU3aKql3wm
         islDtKmjR7epvIZG5+i5148WPdyeqFAX5aJvlUJIhVxRzWM0zcjg6tQLtW39/bZYTiiO
         MnyTAgYu4Auyj9VX/uEb1bvkD8KxdOk/lu6MNyysOgMy94BLRQAAucn4QC1yfomFNww3
         DoTKk8tBgpFeLe+Y4mD5W14coRPCQQQ6FXhcs/0/SdpantSlfV0SsyUM9wRZK/TPik/c
         19M3vIlGHtjnJtDpv3/M3lDS1yIEMGvI8yTMuxORyVNNm/xobMEulryNIufHOnNGr6HB
         SN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768493437; x=1769098237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XnP7OKw91qUHBafMZ5I1kAG02nR+3IKvTt8SsYgVCHw=;
        b=H+mPIYIwa/6v0CS5nbMYIHcRWPGmO85c85wqZEjsMJ/zwRXSoLOyKh/LGoNAO/avGW
         DUcmBMBAdnPDKXjgv4oARDH8qcBx+ndquLHQE6ioqe6Qc00caxXJqRNch0wE+y0SzSOI
         Zm3MAD5WPypzA0yiz2tJvHJ3CVHgeJuKgbyboAcriaiFhZmIy2F1D4MLcEpTP7o4Ndmv
         ICcA1jM/t9lZLwf38C/2VecxvsA0NcggneyMX7myXX5ilHsS4zZ0Uk9ibOZVrpqm5mnE
         vn5460qmU/xyqbRLAwTH3rf9SK6ia+4HqDwWsxCLx/Koq7NHNAeQgH5BE1mFg+fHAbOd
         b/Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVSv+P0x5wRak/zJ9WyE32tYroWqYzJZG6zgMftvEnnfQiRN64TubMVEMdeu4ughnYJ8xaT+JO3BJlI@vger.kernel.org
X-Gm-Message-State: AOJu0YzN6AhTIUq6HTpa5Iq1VVzaVko7gLSXadnLMJ99rbWk5L5pQAvz
	sTspcBEZhLUo/IGBHaE8rvR3z5mk+kx2+Ml14lhbP8rOmyKSX7jo888t
X-Gm-Gg: AY/fxX4N5uRBnjxk264jSwoOVlpsrh1f12Scx2lGHAw3h6Q8FJqT8Q3f9xBEXYhSV+A
	CoeBkY/d8kHzRU/IlNI0hbr4A5wPlsd4gJKZy0+/f340wM+hbfR/ya4xyE3qZz/bt9F9x5XqW47
	x9BE4DaCGPj66b9nJpHle52PWyI8XnMiFernw8s0MOrDOMyb2saqN/AHJhNTnZtvIUKwKCm+9LY
	xrD+C+vN9bQGrY3fRCajVTbwgBT4gXOKnUsClmT0ap6E9xxhenI4G64JMb+0wINngdj9DYvFGfZ
	fC0ptNuv4rjRzFKUeUdFy10Ps2EOHt7HPhSSyGr+LM7qQ7gqaG5JSHb/PjhxT+4rq8BTMkqHTNU
	gCAcV4TTBBxLYhpwjevLPjEfUF0dkOk9PAIUlBEsqeZvtTOoL7EHYWeKEvXC3TuZadmlh64SHtY
	0YbQIkV77+ITvS7GFGvOrZjA==
X-Received: by 2002:a17:902:f544:b0:2a0:ba6d:d0ff with SMTP id d9443c01a7336-2a717533f7fmr380715ad.16.1768493437015;
        Thu, 15 Jan 2026 08:10:37 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([42.114.215.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d88sm258523195ad.52.2026.01.15.08.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 08:10:36 -0800 (PST)
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
Subject: [PATCH v22 2/2] docs: leds: Document TI LP5812 LED driver
Date: Thu, 15 Jan 2026 23:10:13 +0700
Message-Id: <20260115161013.40706-3-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260115161013.40706-1-trannamatk@gmail.com>
References: <20260115161013.40706-1-trannamatk@gmail.com>
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


