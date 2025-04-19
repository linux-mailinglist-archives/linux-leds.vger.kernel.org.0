Return-Path: <linux-leds+bounces-4510-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F2A94523
	for <lists+linux-leds@lfdr.de>; Sat, 19 Apr 2025 20:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15BDA17A838
	for <lists+linux-leds@lfdr.de>; Sat, 19 Apr 2025 18:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACBE1E1E06;
	Sat, 19 Apr 2025 18:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8NSZNxU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02A71E231E;
	Sat, 19 Apr 2025 18:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745088306; cv=none; b=EWV8gixIcotIo6WY5JEYLbR3/ZTWEwOT+ZPU1Ptd7Q6R5ryE9yJqQ5WetjUBj0B/0M8PrGY7y3CwXGzXYJDRqLX0ugGTEVBuHlH9x/cFZ8vWOR3rOQHyicLE8wO/uSbdlX1G6ZuHwkSo7VezC9hp2PrI/OjxtNFofWMXPpeR8gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745088306; c=relaxed/simple;
	bh=uNzEBYYeWZ0JrshHd/fFWSH5sM4ByHVeqJ2yWPX78kc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IJNLvzr/+Ls9coMUT1qkpxCoFp+MVDCdde2xL+LfL5ZAVtNYCEcD0j8pYu0oHGh6rvyKRX4yyK3ryu2GKfkbXm/ULD8g3SSbovXlCZhjNUlXNCQ/pXaqKunr8aTaYoA0K3fXCvI2yACEm0g3Faz6Np7Cs/3goPH6M0knvwT/cuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8NSZNxU; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af9a6b3da82so1815218a12.0;
        Sat, 19 Apr 2025 11:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745088304; x=1745693104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFHc0+rdKUSUe10/QTRrHY5vFMfBpRXmipu0sviFp+M=;
        b=Y8NSZNxURRXXLajFU/wYzYoCB+RcQNc/3IsrFUCABgL4vT6VhsSQepFgFtluWZL5rI
         Cgq5+tmWOG1sYz9yX3FjsGj2em9Q02EhMU8k6JHMEVmbnuBYEft343Xs7RQd67OrIJsE
         8myC1QYkfd3l7GF+gMM6lUV3j2R3xIFX5QqjRqnrGGiIW3P11bb75gVNmnc4HP9EFdjW
         +5L5I2DLJq9MTTN9/r1SHpWXP/A8cA/XA7YxguLs9xmdBte8SgYT34CDrsxw5g1TgDQR
         wLbNnyXzpUi/hPfPeDjhGZsF1nndz36GlmW5IYfDVcQFWVf0M645bCVSCd4yOXzVOdrM
         894A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745088304; x=1745693104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFHc0+rdKUSUe10/QTRrHY5vFMfBpRXmipu0sviFp+M=;
        b=ftU6Bi/whKTn9i1VaJPvhTdtocdY0BvTq63paXiSswm1W+UtPlhecxUGAn/fm1RQqo
         32eaMY53oBKGPlw/XNL0MHloFBOotY/WgL4bJSAldx+vcvuq61Z6mpOmYPi5vnTVCQJt
         TQVEiKOz/cZPryZGxngDr2sqlSS3l9BwzeSPK3tXpiTBJU4+Pu4jSANcayLRLF1BtrM6
         VKE2jwQ8r2gSZRRDrLWsoiHG9eLFDEUUSsPEKfmEGBzjuZ0AN0fQfH8Vu9kzvGI2UFrJ
         n0iXypqTqOPy82E+4Sftp96no06KwfnGLs53i6MWwUPHqgLy2Xlf43kyf/PdHDGaH7dp
         LBOg==
X-Forwarded-Encrypted: i=1; AJvYcCUDIwy2VK8FPzgPZDLCB4hXAc4avzFI/wYVKYJicxamq0gbZpr9Y7XlvpzKcjSI5n1Hyr3eSANMsR3b1w==@vger.kernel.org, AJvYcCVYGwa4mwZzv/EujHkeTdhts36bhwMwKhZJyJ8IeOq1CbSy8QC+q2RjSZ8w0558/UzQSkr5+8iaSaavaps=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoEZXi0sEnDn9cnYFLVQhkV7srxJJHv8Azn7Nu4SLXA+TtLPd2
	voSlhy2pbiNQ6GOOc9N6h7Cr+qV+/QVPdMYq/wRk8VSAxoVZ3F0V
X-Gm-Gg: ASbGncvstoWaJ8Y7CyoJlFDxtC2Nt9KL/IOIpFgrQwxykucEFxiqeB9z0a1pstVLpCC
	OGY8loT1O7InCzNaKeVTCCFIg7MeVYa6ek9bX7/4eBnZHQm82FOVytoCq+NsGbmuO8pKgSi+RgN
	BK2Qfbn0Ut2sPb7cHAHcyPMZ+kegFNl4jgt888kQj4coHFAuO5ti0ZslhW/HCmNGhNk8J7be3N4
	xyelsN+I0S2i9T/r0k3QO0LGx/0ifpeyWnvxIQEUufRH47eh9ZqcAA0JV5lPoKF7drhlrtwBfKA
	EC6WTlH5tPCxdYYYeuGYChwgwFaxCP1CPbIp5SzaEustEQb0JjTX
X-Google-Smtp-Source: AGHT+IGtodxY+N3x1kwopnnQy1qeDsftgIrSAF7H6ze89e/MVXrKZtdxzZxcTs2zIuZTKB7KTOJo1w==
X-Received: by 2002:a17:90b:17c5:b0:2ff:5a9d:937f with SMTP id 98e67ed59e1d1-3087bbb1dbbmr10060284a91.24.1745088304198;
        Sat, 19 Apr 2025 11:45:04 -0700 (PDT)
Received: from localhost.localdomain ([123.17.0.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e1149b1sm3383052a91.40.2025.04.19.11.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 11:45:03 -0700 (PDT)
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
Subject: [PATCH v6 4/5] docs: leds: Document TI LP5812 LED driver
Date: Sun, 20 Apr 2025 01:43:32 +0700
Message-Id: <20250419184333.56617-5-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250419184333.56617-1-trannamatk@gmail.com>
References: <20250419184333.56617-1-trannamatk@gmail.com>
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
index 63ecb019e3bc..4433cfe7491c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23940,6 +23940,7 @@ L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/Kconfig
 F:	drivers/leds/Makefile
 F:	drivers/leds/leds-lp5812.c
-- 
2.25.1


