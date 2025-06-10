Return-Path: <linux-leds+bounces-4779-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F76AD411E
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 19:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33C5B179D40
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 17:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06385248166;
	Tue, 10 Jun 2025 17:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3E5HwDS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7762475E8;
	Tue, 10 Jun 2025 17:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749577438; cv=none; b=VtXnXFCV0vzK8pFP1bib8z02qRbwrfzsw/nOBtwEMo2cwLkn3EI0VYsl5WOgjJSlolUVwh79yxOE3MuB2U+/l/y0VYJe6CyWwkmq2PHpdN4pFXbIPRPQNLCSlJlvNgwg9O+Eq23KR+VViJy1WCfClPi+smYwI2UNK+IF5xhXO3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749577438; c=relaxed/simple;
	bh=56Sl/nGt3m5t3J5G+VzsIzv0+c8kzRwGZwhJI4NYYaI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o9kjXli7aJKNkLTE9y//ppgouFuJsBh4Lz8shyqLZls/690eG8z9RpDyjWoblR2g8PpDKyiyhDJqbTHoEqSyxKfsFeoQlpuMKnDdvKyBeR539AYbZ7I5JDdRh0cWZTYZGZmSwavt2M4z1jZXDEABeWRQtCTRGLY3Y+s8ZKEhAxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3E5HwDS; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-31329098ae8so86985a91.1;
        Tue, 10 Jun 2025 10:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749577436; x=1750182236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4V9Yp9AA3hWAb7aqFhJTn2UKytTjSMNN61SVrfVNk7w=;
        b=V3E5HwDSoei/Sw5iOLprowOgcxEWpdqSKP1AAb9p+iafclXtwMRgvriYcysEgA4Aeh
         M4081L3lansoVmw86wfcdLPlM64NBNeNfiJqOxVgoLBRZMu14pL2y7+zeo4+/KTMK0Uq
         9oLZQbYnSBqV16BatXWMHopRAi/WH9XvXB+8MF62Jj4mBROzYDOI8JHBR5FYluNuQlC6
         rLgaeHhxwcc5LVvbCMQ06PwL+6CBh1ClA++ZszrjeTraAJ/9dxOIW2QVBBvLBIirLmiS
         rRjVR20liIAnKWyd122SQ8RVu7ngM6HMfS7sAulz0f6ullX2yn2ZnvT13WvuLZy8L9qp
         6GFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749577436; x=1750182236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4V9Yp9AA3hWAb7aqFhJTn2UKytTjSMNN61SVrfVNk7w=;
        b=NVHYAdxQmX9LoKv6mp/59H20oB24dC1kgJ8BRRntKrfyQJDjmVlD9WJb5s4E7uBy14
         SYrVNlF5IA1doZ7Zhwm+LqFXU7BJOVEe17NIfHDThjEqkfmII7s0xQCwHQ1p/brFJcEA
         sHL6d7tAlP7EiTLrgVKDyT1EuDHHznieZMmQjIDnGb1Bxj66UsFA1kX9Dmu7f1HiOoAo
         rW2XZQgEYvNZ+Xc7gHsAE3kfSpD4sYd5GkBjhe6wC0z2Y3Dh/adGEW1gPXJexnh8FIjg
         Jtobbo1Uk0DgkNhXTR0oT5GZkInCZ4hvhO9NAAsPwXzb+/gt4ulPVNi10NHgJ9vcHo/g
         KSrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMr2HZmrsGf/f+3oY/nxqDMl4S87eADVpRSEXILu4S7JeeK+RdEG94pfuBl/OcjQcZIzfareUcvoYSNTsA@vger.kernel.org, AJvYcCW/LyYNPAOuOuaa4wMquT9Uh83h753F9hd4scbr7PWEpXdlzPTREIovV3ckzUK72hQZimETxWmDKGrw@vger.kernel.org, AJvYcCWOQVgmuFm0g0+upPRFuqopU5x9TgrjfmcKVYtRim1Mo95ku5zRipt/Iqn740ufOTc9KzVmkgQ6iXO/@vger.kernel.org, AJvYcCXwpmdj4SXH3fqsOnab4XqTFxOg4X3Q0ZV5TcpSbx3m71OM2FWwyUBPcfchW4fJLdCNqMErm4vF98CpeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0zstt/dbxEEOiG4BnS9rrhsjD6hDI5NKhteGAYJGLnOeXVkcP
	oAIYVI+TSyz5wha8BP0H+vwy/SAEIHZtCbi6hMmrwrqqYb2F+JxlCkIlQAoYrQ==
X-Gm-Gg: ASbGncumcSj8VF5enPBzQjviotuYVoEQP/m5vgzolrOg4cc5UTqdQFmXN+mLyadtOLr
	qKL4l2PX6eQ2vKf/ECE3qvS98JLU0544snZCRJoUjbW82a1FCVxSYKXeqIenMQ0jhIpnEbqW4kx
	qjS6Bv7lZ2qKRdcaP9I8XXRBH0kj7MQ5Qv9OMb7415OJ9/lFoL7+EQARZQz90GXpukQA3RyF6Rv
	+wd6CWf4Q1n2SbpsnYtOCRynEeNrbBH4OVS3rgNEky3sAVeeiBHa+RQlEMmZ41z+EjReBYOGpni
	iAYq2C849KT+BVTMtBQmQhnYz3ldfjjx4TJMgxIjPdpPf0HuTB4yJ9hYhGTpuTu3MP9ay3G5
X-Google-Smtp-Source: AGHT+IGnhIx3wPSm3gM+n4hWUZHOp8VWMgSLatoAUd/lZ05ntFy6r1bsdA5zscuxD1Sx29XFbwe5LA==
X-Received: by 2002:a17:90b:4c4a:b0:312:e751:8213 with SMTP id 98e67ed59e1d1-313af961b14mr354280a91.13.1749577436437;
        Tue, 10 Jun 2025 10:43:56 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.113.163.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b044d91sm7470668a91.2.2025.06.10.10.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:43:55 -0700 (PDT)
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
Subject: [PATCH v9 4/4] docs: leds: Document TI LP5812 LED driver
Date: Wed, 11 Jun 2025 00:43:19 +0700
Message-Id: <20250610174319.183375-6-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250610174319.183375-1-trannamatk@gmail.com>
References: <20250610174319.183375-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver provides sysfs interfaces to control and configure the
LP5812 device and its LED channels.

The documetation describes the chip's capabilities, sysfs interface,
and usage examples.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 Documentation/leds/index.rst       |  1 +
 Documentation/leds/leds-lp5812.rst | 84 ++++++++++++++++++++++++++++++
 MAINTAINERS                        |  1 +
 3 files changed, 86 insertions(+)
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
index 000000000000..4538cfdf415d
--- /dev/null
+++ b/Documentation/leds/leds-lp5812.rst
@@ -0,0 +1,84 @@
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
+autonomous animation control. It provides features such as:
+
+- PWM dimming and DC current control
+- Slope time configuration
+- Autonomous Engine Unit (AEU) for LED animation playback
+- Flexible scan and drive mode configuration
+
+This driver provides sysfs interfaces to control and configure the LP5812
+device and its LED channels.
+
+Sysfs Interface
+===============
+
+LP5812 device exposes a chip-level sysfs group:
+  /sys/bus/i2c/devices/<i2c-dev-addr>/lp5812_chip_setup/
+
+The following attributes are available at chip level:
+  - dev_config: Configure drive mode and scan order (RW)
+  - device_command: Issue device-wide commands (WO)
+  - sw_reset: Reset the hardware (WO)
+  - fault_clear: Clear any device faults (WO)
+  - tsd_config_status: Read thermal shutdown config status (RO)
+
+Each LED channel is exposed as:
+  /sys/class/leds/led_<id>/
+
+Each LED exposes the following attributes:
+  - activate: Activate or deactivate the LED (WO)
+  - mode: manual or autonomous mode (WO)
+  - led_current: DC current value (0–255) (WO)
+  - max_current: maximum DC current bit setting (RO)
+  - pwm_dimming_scale: linear or exponential (WO)
+  - pwm_phase_align: PWM alignment mode (WO)
+  - auto_time_pause_at_start: config start pause time (WO)
+  - auto_time_pause_at_stop: config stop pause time (WO)
+  - auto_playback_eau_number: Activate AEU number (WO)
+  - auto_playback_time: Animation pattern playback times (WO)
+  - aeu_playback_time: playback times for the specific AEU (WO)
+  - aeu_pwm_<pwm_id>: PWM duty cycle setting for the specific AEU (WO)
+  - aeu_slop_time_<st_id>: slop time setting for the specific AEU (WO)
+  - lod_lsd: lod and lsd fault detected status (RO)
+
+Example Usage
+=============
+
+To control led_A in manual mode::
+    echo 1 1 1 > /sys/class/leds/LED_A/activate
+    echo manual manual manual > /sys/class/leds/LED_A/mode
+    echo 100 100 100 > /sys/class/leds/LED_A/led_current
+    echo 50 50 50 > /sys/class/leds/LED_A/multi-intensity
+
+To control led_A in autonomous mode::
+    echo 1 1 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A/activate
+    echo autonomous autonomous autonomous > /sys/class/leds/LED_A/mode
+    echo linear exponential linear > /sys/class/leds/led_<id>/pwm_dimming_scale
+    echo forward forward backward > /sys/class/leds/led_<id>/pwm_phase_align
+    echo 0 0 0 > /sys/class/leds/led_A/auto_playback_eau_number # only use AEU1
+    echo 10 10 10 > /sys/class/leds/led_A/auto_time_pause_at_start
+    echo 10 10 10 > /sys/class/leds/led_A/auto_time_pause_at_stop
+    echo 15 15 15 > /sys/class/leds/led_A/auto_playback_time
+    echo aeu1:100 100 100 > /sys/class/leds/led_A/aeu_pwm1
+    echo aeu1:100 100 100 > /sys/class/leds/led_A/aeu_pwm2
+    echo aeu1:100 100 100 > /sys/class/leds/led_A/aeu_pwm3
+    echo aeu1:100 100 100 > /sys/class/leds/led_A/aeu_pwm4
+    echo aeu1:100 100 100 > /sys/class/leds/led_A/aeu_pwm5
+    echo aeu1:5 5 5 > /sys/class/leds/led_A/aeu_slop_time_t1
+    echo aeu1:5 5 5 > /sys/class/leds/led_A/aeu_slop_time_t2
+    echo aeu1:5 5 5 > /sys/class/leds/led_A/aeu_slop_time_t3
+    echo aeu1:5 5 5 > /sys/class/leds/led_A/aeu_slop_time_t4
+    echo aeu1:1 1 1 > /sys/class/leds/led_A/aeu_playback_time
+    echo start > /sys/bus/i2c/drivers/lp5812/xxxx/lp5812_chip_setup/device_command
diff --git a/MAINTAINERS b/MAINTAINERS
index cdba86f1768b..4fefc7fb7a9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24568,6 +24568,7 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 F:	Documentation/ABI/testing/sysfs-class-led-lp5812
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/rgb/Kconfig
 F:	drivers/leds/rgb/Makefile
 F:	drivers/leds/rgb/leds-lp5812.c
-- 
2.25.1


