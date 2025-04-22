Return-Path: <linux-leds+bounces-4520-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D37DA97519
	for <lists+linux-leds@lfdr.de>; Tue, 22 Apr 2025 21:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA14A1B61708
	for <lists+linux-leds@lfdr.de>; Tue, 22 Apr 2025 19:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DEF2989B9;
	Tue, 22 Apr 2025 19:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjR1pod3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC38B2989A5;
	Tue, 22 Apr 2025 19:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745348566; cv=none; b=gJaX+I8KrsNJwwwQIVFU3YhEKAL9mEZ9V3nldljVsFT7vIaLUaQBNQySsdXwC7+0//WY3C2zIQKv7uSjuD2/6GATZQx3qRWuJIUPO4bvecvX7/k90fb2gyy2lr14Vm9tR5UEE3oBZVLl0OH5s54jPNZPC53yxvHTbrRZpl7vTuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745348566; c=relaxed/simple;
	bh=wmJMX/WB/WiQ6SviBGsVJTgRYrva/S08QhPLen62sx4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4LYJRoL31gCg3wPbUurMUTDvldwiSt2JW6KdphX4D2gj2oUWFgPVv32DT4Awo/TaBc2Q/2KHrBT1WKAY+FB1fUp2iG81UIEq3rQ2XtOCVV3uJJvrvLSqkN6UaQTcSIEoxOP4O4uS6s0U0qn2YdAtBJaaZEH4VpwltLjxP3t7Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjR1pod3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224171d6826so79155895ad.3;
        Tue, 22 Apr 2025 12:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745348564; x=1745953364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Zf88gnfHaJ5KBrOG+9x764xT9ApCB8IHa+yRzxrGYM=;
        b=LjR1pod3xeECZfnStGOUt+erGVYF08GHAZ2CuMLmsOuPi9nCjQtd2fxRtlqqLyIppw
         twO5WcPPR5+OD0/0VpnnM2aljURNM/4y3CWRbLj8a7qnzOBVEFAtCwabmX2Zc6ahzUKb
         LHAf+DE59aDxyItklKfE8grGFWt87IT3oZ0RzJavYnV3iou7snCjJJApgJMUPdVdRjXz
         kslccUg7BZi0FpcAzr63kEVMCBp7DI7SrYc1v3KfhrW/F8vznaLKh4e72jK5mVinR2Bf
         17/8e/gN7or76rRHcqsveLPH4vbuBC12V2UUm/GqGQYg4/QnY/gzplJyhIzw9svrw4Oi
         WA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745348564; x=1745953364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Zf88gnfHaJ5KBrOG+9x764xT9ApCB8IHa+yRzxrGYM=;
        b=BMcTAmHKwsAeKLFHXwO4+hA5JhDILw5JiEBS1wK6WzqO7MYQyRt8+yIH7pztFik7eN
         JVpftZ6xKeNGjvZyjI/vurQgmCtp+BOK9czjLx0BJDMY+FBh3KfweT2oDphndo6wmHfc
         NAyoc0xivM7KQTEBAPzu54e+woAPzk3uFtGv4oGnhyHOp/PsTYssSd2QsTdaSc/jCwc5
         TljLBc6kaP3s65pPOZAUcNR5TNyPyGKbIShmj8CXZgVtmnG3q6TRKDELrBdRozBJyVhm
         OEZVZKzqcc34TvIv/Efr4GIs6nTt16j6AJJNrQgIHFIsm7y61EOBP4QW+buI75JRmuIv
         JmNA==
X-Forwarded-Encrypted: i=1; AJvYcCVkMtxCbkiUy0l7Aau8KebwHPu9Yg7vQ555DCvEB9F4dxAqQBbAsbtVK6zRxq+vlvF9XxrnVIZpalHc0Dg=@vger.kernel.org, AJvYcCWtakwqNMmKqbEtiv0X2ZXiXPVPH5L4SWheydjnK/j0EMqFO/MKSeKdnpN63Ab3l1AD46bROP2Lhtv7Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaaMUfVRuRYPz7+2hAE8m57uJ24NdqlGAl/dkHtiawzsTpu56h
	mpoAv85zTY1Y/SKL9+110mfUud2vPPzDgN9RZz3dO/Mee+nPQPox
X-Gm-Gg: ASbGncsbdSuiICwDLU0SdAOPFGI2lCACAjztcNmzequj/eXnrRnjpL+VKJITH0Yj6uy
	ao2YSUNogAYljz7kb4Cfd0Np68EhcCRGTv9AcliPZ8WtNdwGOhn1waji9Af6Yw907wjeRxqLimw
	OESN4P4TAQL3z8F+T6RtyCzabJZkDIAgUtfpHye21MXgDjamkAZYwob6mKErKSt2a7RjeGvpyKC
	4fY15SVwgF80QjMijTJs5+pTVqWEPl4jflsSHU3hd/aZNl1UMVb84GnUFxfFv/cEBukQWBDw0f+
	B2RpuXHxFmHjuMrBX2HVXSPm50fmZP5Mf9HwZPk95uuRQ2a8jADFNA==
X-Google-Smtp-Source: AGHT+IH4+pKgCjERVBqqbOZ5j4zIJdPMsIcWiaNd/ULfVjMVtFvYPoCeNTEMTbPz3eaEHhWbOYYGmQ==
X-Received: by 2002:a17:902:ce11:b0:223:f639:69df with SMTP id d9443c01a7336-22c53605f6amr285853595ad.41.1745348563893;
        Tue, 22 Apr 2025 12:02:43 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa574fasm9287684b3a.99.2025.04.22.12.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:02:43 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v7 4/5] docs: leds: Document TI LP5812 LED driver
Date: Wed, 23 Apr 2025 02:01:20 +0700
Message-Id: <20250422190121.46839-5-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422190121.46839-1-trannamatk@gmail.com>
References: <20250422190121.46839-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver provides sysfs interfaces to control
and configure the LP5812 device and its LED channels.

The documetation describes the chip's capabilities,
sysfs interface, and usage examples.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 Documentation/leds/leds-lp5812.rst | 79 ++++++++++++++++++++++++++++++
 MAINTAINERS                        |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/leds/leds-lp5812.rst

diff --git a/Documentation/leds/leds-lp5812.rst b/Documentation/leds/leds-lp5812.rst
new file mode 100644
index 000000000000..ef182f859f86
--- /dev/null
+++ b/Documentation/leds/leds-lp5812.rst
@@ -0,0 +1,79 @@
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
+The LP5812 is a 4x3 maxtrix LED driver with support for both manual and
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
+  - device_enable: Enable/disable the device (RW)
+  - dev_config: Configure drive mode and scan order (RW)
+  - device_command: Issue device-wide commands (WO)
+  - sw_reset: Reset the hardware (WO)
+  - fault_clear: Clear any device faults (WO)
+  - tsd_config_status: Read thermal shutdown config status (RO)
+
+Each LED channel is exposed as:
+  /sys/bus/i2c/devices/<i2c-dev-addr>/led_<id>/
+
+Each LED exposes the following attributes:
+  - activate: Activate or deactivate the LED (RW)
+  - mode: manual or autonomous mode (RW)
+  - manual_dc: DC current value (0–255) (RW)
+  - manual_pwm: PWM duty cycle (0–255) (RW)
+  - autonomous_dc: DC current in autonomous mode (RW)
+  - pwm_dimming_scale: linear or exponential (RW)
+  - pwm_phase_align: PWM alignment mode (RW)
+  - autonomous_animation: Config autonomous animation mode with aeu number, start pause time, stop pause time, playback time (RW)
+  - aep_status: autonomous engine pattern status (RO)
+  - auto_pwm_val: pwm value in autonomous mode when pause the animation (RO)
+  - lod_lsd: lod and lsd fault detected status (RO)
+
+Example Usage
+=============
+
+To control led_A0 in manual mode::
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/lp5812_chip_setup/device_enable
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/activate
+    echo manual > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/mode
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/manual_dc
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/manual_pwm
+
+To control led_A0 in autonomous mode::
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/lp5812_chip_setup/device_enable
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/activate
+    echo autonomous > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/mode
+    echo 1:10:10:15 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/autonomous_animation
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm1
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm2
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm3
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm4
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm5
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t1
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t2
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t3
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t4
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/playback_time
+    echo start > /sys/bus/i2c/drivers/lp5812/xxxx/lp5812_chip_setup/device_command
diff --git a/MAINTAINERS b/MAINTAINERS
index aadd5dd76de4..b94067aca123 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23996,6 +23996,7 @@ L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/Kconfig
 F:	drivers/leds/Makefile
 F:	drivers/leds/leds-lp5812.c
-- 
2.25.1


