Return-Path: <linux-leds+bounces-5062-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1507BB0466B
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 19:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 302AB4A14C0
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 17:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB51266F0D;
	Mon, 14 Jul 2025 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGG2X0+P"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A693266EFB;
	Mon, 14 Jul 2025 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752513873; cv=none; b=SnV6pob/COxULxI3GDglylpbzMqaEJRgJnL/WtZlhSNlAdCjtdI9x3vgsumZPjaMvnuFwGYA7UBh9NLgiEs3N3fQdQ8gQq/lTzYtM/e4pOC/csBGHZjiePZX3mvftZD8VBvfGI8ZF2111vs0QbST/6wtkzKU/ag/VpfFu0uq1n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752513873; c=relaxed/simple;
	bh=Vl2YaMKjly/V1W36xIR4JIP4lS7i+8jGRYUWL/eIeyY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GV1edeF9UP0bgEe7ToI9LcRsWVRzfWS49JaAG6O2PEuFWfv1CFsf8OEC1bTyUw3N6Odd5a4Mw/F6xdI/RGQYcv0ohoSoIIAE4XTOctA2M3WIxYYmOLG53A2iw1ZH/piCZs5PFgl2DplMD6iamhmPMT6b3FHDIVFA8nFYjD/c240=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGG2X0+P; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7426c44e014so4376214b3a.3;
        Mon, 14 Jul 2025 10:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752513871; x=1753118671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBxIn0XqrDJ/+zfvzzgIjEfOUJRZPwb+TvxglfGh4nE=;
        b=EGG2X0+PunjKiFGLIUH5FekguAJg42O/UTRdOxwkzO1VNguAH3Cu2pK3Zp/nPjZGPf
         DKVNoNAy8IqcRmmRQZ9jlRV/LaYs2fF9c4kiH3gkTgLBTRq4edS/oAw4hlqM0XFT3AKh
         /v4f7xlllMyrpDEU6g2Sb6AYQ5lrnIkMuPRCAqRn55/+M8YjHgLCebTNC0Ll4zosdOo9
         V0Z0miPWkSwRg802OGnpwE/ca11C4V2JfHucTaRKdTQAG6BNEckbraJ/IIDXaotSGVwz
         GkMwnvTcHhuoYbGkqDCg+KTesdlk75PLtKhwIezLyWZEHSD0OdVMEecj0V8VH+s+aGpn
         Q2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752513871; x=1753118671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBxIn0XqrDJ/+zfvzzgIjEfOUJRZPwb+TvxglfGh4nE=;
        b=hKDgl6OoYYsNQLRFj6z9/85yONMmJC19c6kuYqN2CI2xHRQIn06MZhJBD26D0aOJpp
         TSlWnh3amQ0dp5tsgysmz+Dv4kmQOgit34E59K3/eVdubKJOMANPv0umn5uWsLHoKnEW
         NFUqIjWFLOXX9LZi9Lo1MWYHNEL4iWVlxGm+FQVhWy7dvBN00eTaMQFO/EMuqKWtFDF5
         zFCeuSqEiGLAwT1YxCQ3b4LyMx8d/p9od9ZnmoUuty8Hey7VTye5/p9zElKYNCry6NfY
         bz/3yJE/irNB0ac2n7vJARbi8JNC/s53ZQbFUgw1c1yHs/kfwSZ/i5S2BseRpdo9u7Bj
         oHQg==
X-Forwarded-Encrypted: i=1; AJvYcCVdvtRLtuoHOPYfOYxkHI4O3kVumkxU9C7ld0Qf5VgN6tw6ZY5RpfZQ46PhnEqOL45WsQudSC5tB58w@vger.kernel.org, AJvYcCVvuOhLP5Ig/E1Mf23Jw+ErplVe8WWbR0XZ99/rbZFgXiOE72SoHkQLKmtsBPQguNT3g4WjkK5IHOxY@vger.kernel.org, AJvYcCWB6PL5zfyjSl7ybhIdRyCFKTlGWtPKaPuVhrjkD/cKV7M4h2xMncDUtZdSgQq8gQxNWcsIWJ7/9Iuc5N77@vger.kernel.org, AJvYcCXbScy9DCfV2CgGEwmxPGCR44bmixOpDkRR5+bl7dvZrhPR2LPsoIvtsAe3t86kdY91x2OHkWFB/IODiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl9UrAjsc+aQCT3dEt8nQyxtwt4iNIKz3wFqjaEeY2N8tbYnGh
	iLAF9dGRvakm0D8hmtJ8OQHlPp6GYxQ7mVCIr38upfkNJLZ4J5ERNKFo
X-Gm-Gg: ASbGncvqAO1g+vnZW4Sjf5B/L0XH0P3PpNPkzHQ8hw0kRYE5ohDXFRseEbpmAHrq70T
	uLekomEDIDhl1rtbd1xoXEazY3fdsFXRxTcHPnQhy6mDa7K5UxnAFNFP3icI7UW/8rQxLprhMmp
	QCE8coHJquzacuHyrgI1D/JvXM/aFP7CurCAALlXO8Fa6s2O7Rx0VkpUtp3GJi0Wblt1UQPVX3P
	tKqwLQBGDxtQjWjlA+S432XLCe3M3dS0Sr73y4WWzYv+s3/Uv4V0qThEvCE6c/YAd9kcZh8FFZa
	awf+F5vuNlFXrfgSZ1mRYsmSONtzCg3Sm//28UNmIlkLnnGDpO8LHd9Qw0khF5yP9XPZFbjjsuR
	wXaWxCPejbR6II+1B37zc7gVzZFWmD04fVA==
X-Google-Smtp-Source: AGHT+IHwmnZXpLqY2IKYZmv+OOwTMUX/Qu8BaMQQjuNTWTEoPhcsSl7dMOIHWf8MnB29GBBo4yhKuQ==
X-Received: by 2002:a05:6a00:2d15:b0:749:112:c172 with SMTP id d2e1a72fcca58-74f1ebccf03mr15370648b3a.16.1752513870516;
        Mon, 14 Jul 2025 10:24:30 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.114.162.205])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06537sm10495468b3a.43.2025.07.14.10.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:24:30 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
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
Subject: [PATCH v11 3/4] docs: ABI: Document LP5812 LED sysfs interfaces
Date: Tue, 15 Jul 2025 00:23:54 +0700
Message-Id: <20250714172355.84609-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250714172355.84609-1-trannamatk@gmail.com>
References: <20250714172355.84609-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LP5812 is a 4x3 matrix RGB LED driver with autonomous animation
engine control.

The driver provides interfaces to configure LED modes manual/autonomous,
set PWM/DC values, and manage autonomous animation engines.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../ABI/testing/sysfs-bus-i2c-devices-lp5812  |  40 ++++++
 .../ABI/testing/sysfs-class-led-lp5812        | 120 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 3 files changed, 162 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-lp5812

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812 b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
new file mode 100644
index 000000000000..a8b1d5c52a82
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
@@ -0,0 +1,40 @@
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/dev_config
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Configures drive mode and scan order. (WO)
+		Some valid values: tcmscan:4:0:1:2:3 (default), tcmscan:3:0:1:2, mixscan:2:2:0:3, mixscan:3:0:1:2:3
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_command
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Issues device-level commands. (WO)
+		Valid values: "update", "start", "stop", "pause", "continue"
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/sw_reset
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Triggers a software reset of the device. (WO)
+		1 - resets device
+		0 - does not reset device
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/fault_clear
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Clears fault status. (WO)
+		1 - clears fault status
+		0 - does not clear fault status
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/tsd_config_status
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Report the current thermal shutdown config status. (RO)
diff --git a/Documentation/ABI/testing/sysfs-class-led-lp5812 b/Documentation/ABI/testing/sysfs-class-led-lp5812
new file mode 100644
index 000000000000..a6cb49fb523f
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-lp5812
@@ -0,0 +1,120 @@
+What:		/sys/class/leds/led_<id>/activate
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Activate or deactivate the specified LED channel. (WO)
+		1 - Activate
+		0 - Deactivate
+
+What:		/sys/class/leds/led_<id>/mode
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Selects LED operation mode. (WO)
+		Valid values: "manual", "autonomous"
+
+What:		/sys/class/leds/led_<id>/led_current
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		DC current level. (WO)
+		Valid values: 0 - 255
+
+What:		/sys/class/leds/led_<id>/max_current
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Shows maximum DC current bit setting. (RO)
+		0 (default) means the LED maximum current is set to 25.5 mA.
+		1 means the LED maximum current is set to 51 mA.
+
+What:		/sys/class/leds/led_<id>/pwm_dimming_scale
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		PWM dimming scale type. (WO)
+		Valid values: "linear", "exponential"
+
+What:		/sys/class/leds/led_<id>/pwm_phase_align
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Configures PWM phase alignment. (WO)
+		Valid values: "forward", "middle", "backward"
+
+What:		/sys/class/leds/led_<id>/auto_time_pause_at_start
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Controls start pause time. (WO)
+		Valid values: 0 - 15
+
+What:		/sys/class/leds/led_<id>/auto_time_pause_at_stop
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Controls stop pause time. (WO)
+		Valid values: 0 - 15
+
+What:		/sys/class/leds/led_<id>/auto_playback_eau_number
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Active AEU number of led_<id> selection. (WO)
+		Valid values: 0 - 3
+		0 - only use AEU1
+		1 - use AEU1 and AEU2
+		2 - use AEU1, AEU2 and AEU3
+		3 - use AEU1, AEU2 and AEU3 (the same as 2)
+
+What:		/sys/class/leds/led_<id>/auto_playback_time
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Animation pattern playback times of led_<id>. (WO)
+		Valid values: 0 - 15
+		0 - 14 means 0 - 14 times, 15 means infinite times
+
+What:		/sys/class/leds/led_<id>/aeu_playback_time
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		AEU pattern playback times of led_<id>. (WO)
+		Format: aeu<x>:<y> where x (1 - 3) indicates the AEU number,
+		y (0 - 3) indicates the number of playback times.
+
+What:		/sys/class/leds/led_<id>/aeu_pwm_<pwm_id>
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		AEU PWM duty cycle setting. (WO)
+		Format: aeu<x>:<y> where x (1 - 3) indicates the AEU number,
+		y (0 - 255) indicates pwm value.
+
+What:		/sys/class/leds/led_<id>/aeu_slop_time_<st_id>
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		AEU slop time setting. (WO)
+		Format: aeu<x>:<y> where x (1 - 3) indicates the AEU number,
+		y (0 - 15) indicates the slop time value.
+
+What:		/sys/class/leds/led_<id>/lod_lsd
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		0 0 mean no lod and lsd fault detected, 1 1 mean lod and lsd fault detected (RO)
diff --git a/MAINTAINERS b/MAINTAINERS
index b4eb3265c800..cdba86f1768b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24565,6 +24565,8 @@ TEXAS INSTRUMENTS' LP5812 RGB LED DRIVER
 M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
+F:	Documentation/ABI/testing/sysfs-class-led-lp5812
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 F:	drivers/leds/rgb/Kconfig
 F:	drivers/leds/rgb/Makefile
-- 
2.25.1


