Return-Path: <linux-leds+bounces-4412-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1717DA7CB83
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 20:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F8BE3B9A9F
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 18:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317F51B423E;
	Sat,  5 Apr 2025 18:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVuhd8Lb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED971A9B32;
	Sat,  5 Apr 2025 18:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743878022; cv=none; b=IkOGAtry/NvMfRZiSBT1nVhEslC1WjRgTD9N/93YwWCxEvHSo4fA3LRhQt366e89pkuSwq/yCK/GdoBQ5IiI/gc4iZgFnPHbwgvZQhpJihUMY+LHG/xBU4T3l8niIGkeN4aiflFmPFoX3LtTTT1ojg+ES2BgV+z7a15Rw2FWKZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743878022; c=relaxed/simple;
	bh=HNxJ0Cv2pl85469M6+jBdl0vD2X9O9gPGskO1OzD1i4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MCx5KIcIKyzA0ftCf3W3SLWuZesY5aaiBNhK1JQPxuU6MfVTKKnyc5IhAlZjlPt9ij95YtHNU+7JNKhyq+Cznvq+jcuBq+N9/CTeSTjCQSPVAKCKHWHrlT/Lru72GIJJ85wrzILhTGYCrhgk3F32vv+tLnEVtNryHGN41rwRrys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVuhd8Lb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-227d6b530d8so26533055ad.3;
        Sat, 05 Apr 2025 11:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743878020; x=1744482820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SH6SMkO+euYeoJUl6gj9M6gvgEdCkJt0KXlSFpTE6PI=;
        b=LVuhd8LbXT47Br9PQhTV/33gbNZq3zTsPYie13RkC1OjA0WJEGRwaemtJGT/xJ6AEU
         hQVXmDD13z55ZYSMK3tz4LH/NS4w41pjVNczY07rbhBKI5Ml3I7DnXm3KO23bm6OSnuh
         wZE5ITkUNVSYo/lHejHVk0QRAV8aLJ7qsmuyxjPQ5EuF+ZzluWJ8A2cxGpWpAhulO/f7
         3WFEYflPxkJKOGtbVB0IZMhVmXj00Lidr79LE5x7xSFJ1Z94ynGfiAuABr0o0spS612w
         BqHeQMVdh47NqC5JDJFAOP3L/r5XIo0mduXAHmQiJrrUSfXW8rmoT593LlMwIuAdgRqt
         KYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743878020; x=1744482820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SH6SMkO+euYeoJUl6gj9M6gvgEdCkJt0KXlSFpTE6PI=;
        b=ON8dfXnNWdaNc6XMm3uZdWWk4j8dfn/etE9Z+IL03QUeExNsEaZ7yLTMcx5hRjsI6c
         0Kj6NfFBO8wewfP1EX8/ACMYtxJ2DOogkGY4k070uxZwg6aqvNBHu7Vm0cK4ObrCNh8r
         Bk00tQJvrByWdXBSzW5xawTJUVF0JPgpAEzLtDf058JkypkyMGcOTohzvqaS4YIG2nUV
         EyIndyJDPuhj0w9ONavllpAIi1rZiuQbeS4Pnh8ruhgK3Epg5fJOWCw1+osSQYFr+EeY
         LSl/VX3Jwn01uKL4IMQYCuijrfomqVxQzH5XYJql60lD4iDM/FFAbKy09XWKB9LeHq+Q
         7qRg==
X-Forwarded-Encrypted: i=1; AJvYcCVVa2gY0lCLVI79M8943r1g4A0v6ZE2UE6Zea1/wYXC3KI7CjmX92oyqr2ZT24B2sl5ijOyzGaT5qqw82I=@vger.kernel.org, AJvYcCXvt9tEEJ2w1ABV3k+nXu5rn0e/ztI+yPYknFD23S1lrLijX3L4xNWCn384FNym1vA8UpnSFuRU/SAy1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc3rrfIiiqiRtliTQq9klI/LiTT8iLMyxa/3MyQXOohN4Ezfl/
	KINC1onwpkplpDDb1Wjn0OBE0Pbd258V1/ghNx2EYvukkwVn4oar
X-Gm-Gg: ASbGnctG85BlulhkT80ILT+9SbcguSq4kEYI2rdD0JVC4xmU8UyrwmuIp8xhIATDc6u
	K2lQOMbO7GaHldxll+4C15zWLtm6tg4eCdCP3oVW14mlmulEJuVSv1rN1INojLhc0LDrhbKQV1V
	p9+8dFbTfz5adNRGU55nt+vkCy+snU8cF52HO+LcF7IAcohgGfR6/a4vhWcaOo7dKPJxW93D8PX
	CXN52UBQlUMOWoTZf7VEjgQLwTFelCUDLKkit6f0w9D9r9mSodAGopR2jSWUSrD7maPI82Aug8q
	dyzu4Nz0xvw7PGtyE/rpAiHwOni0AKhtu9mFzMoak1QgcitwXOKDdDJy
X-Google-Smtp-Source: AGHT+IGWJzG4aP0QVYFdfGQ/br14PgaaudI8eRnjG0QcCQjn+R0l14rC+azp4d673FAOsdBt/9TsRQ==
X-Received: by 2002:a17:902:7408:b0:224:1c41:a4c0 with SMTP id d9443c01a7336-22a8a04a7c4mr81266805ad.9.1743878019699;
        Sat, 05 Apr 2025 11:33:39 -0700 (PDT)
Received: from localhost.localdomain ([123.17.0.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e61dsm52980965ad.190.2025.04.05.11.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 11:33:39 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v4 4/5] docs: leds: Document TI LP5812 LED driver
Date: Sun,  6 Apr 2025 01:32:45 +0700
Message-Id: <20250405183246.198568-5-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250405183246.198568-1-trannamatk@gmail.com>
References: <20250405183246.198568-1-trannamatk@gmail.com>
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
index 000000000000..dcdf67ef6d74
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
+  - device_reset: Reset the device (WO)
+  - fault_clear: Clear any device faults (WO)
+  - tsd_config_status: Read thermal shutdown config status (RO)
+
+Each LED channel is exposed as:
+  /sys/bus/i2c/devices/<i2c-dev-addr>/led_<id>/
+
+Each LED exposes the following attributes:
+  - enable: Enable or disable the LED (RW)
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
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/enable
+    echo manual > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/mode
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/manual_dc
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/manual_pwm
+
+To control led_A0 in autonomous mode::
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/lp5812_chip_setup/device_enable
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/enable
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
index 903070e18d05..2bc897eb5600 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23537,6 +23537,7 @@ L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/Kconfig
 F:	drivers/leds/Makefile
 F:	drivers/leds/leds-lp5812.c
-- 
2.25.1


