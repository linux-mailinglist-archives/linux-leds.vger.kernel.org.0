Return-Path: <linux-leds+bounces-4848-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE10EADF5F4
	for <lists+linux-leds@lfdr.de>; Wed, 18 Jun 2025 20:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A7CB4046E3
	for <lists+linux-leds@lfdr.de>; Wed, 18 Jun 2025 18:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325382FBFF6;
	Wed, 18 Jun 2025 18:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKTxxZ3I"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795D92FBFE9;
	Wed, 18 Jun 2025 18:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750271560; cv=none; b=RNJVQesMZkJt1mqv/T/1mbc9VlH/kBgHE071aA6V20Dnu9UlA1kurgrmq42NT7dfNcDCOwBrCGD/xZTcFiJey1ivauBVHBdvZNcut/7YFAZWzARqep7l054UgsDOmWqqrio59Jp5QLOb1c51XMu9Rrl+BWjWTPR3/Zd1iRJYoNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750271560; c=relaxed/simple;
	bh=56Sl/nGt3m5t3J5G+VzsIzv0+c8kzRwGZwhJI4NYYaI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jsjyfm9dLrY15Bq8yqBa/NVTKlfW0hKJmq8eWvLz+7R9U7AtUe3ynzweXRcba6DbnEe0odA89JPYPTX7eM+8y+DRtqiMwCTycbejes/UMLzyWUpscnhSaq6HAii9HOtkKlmXUw7ZZVe7LSbgIabtaPK9YiLIttp+Pq+JtJKcbcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKTxxZ3I; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-748e81d37a7so747379b3a.1;
        Wed, 18 Jun 2025 11:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750271558; x=1750876358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4V9Yp9AA3hWAb7aqFhJTn2UKytTjSMNN61SVrfVNk7w=;
        b=OKTxxZ3IydbBvJX/2jgRuEZAXPYyx4z3R4NgD8mc+VKQc7pQdG2aon6cGDdZZ732rH
         nagfNVSmqoZCOj/Mb9bEl0bF1qmhy7MvnFowem10cQiiJwjRyQPaD1WvS9Et3PmG/KwJ
         BRr56p7E5nw84abAPp1MxVHyghn4/heYYch3SG3alwpoC5tfSMjL4f+I0fAX+4rF+ciV
         OtQC5Qa15bjJyiTzknzykR7IMHU50t/W5oPHg5sKpHj4t2leWNYe3W/DLw3qi90qyOvu
         AN0Lbhp8p6WP372LvUs0TOl9owHCLewX4dpU0ba8s2ix/c2ZO/gezZLwk2ia276PbuqG
         PNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750271558; x=1750876358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4V9Yp9AA3hWAb7aqFhJTn2UKytTjSMNN61SVrfVNk7w=;
        b=Rt2eItVlUcWTdRhyCnItAeP0JmRGtmLAkiaoSOGsiu+GmUApbDEV3x/SdXpEJipPHN
         6h6AvpzakGCW3GMIsgdB7dTlbR9qkCp+z6tu+nhsyGSifJhrClvjhYYJhT+JS6zd/zWA
         2eRvO0Yp4J13uDjCKQaaN+USDauyorPdYwYV9gK/z2SbTmQo2cnVwb0jbeYRAxvpokKO
         owe67tXx3J7vRb4MqosRy9vabQqBDyM0s2gGzhHROs18K860FjEUeMx88aQ5L4mEfeLb
         bsMYA8Me13SJRIoCWJk7lxu/4sI8+QS0rGf6R43FMZMsPzpvrDSN6cbwsI47bRxoa+bU
         05Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVwtTIR/ffZdDaFyJ70kPAYHU4XWjKu9Ph98o76eGJ2cscV9yed6cnsivsxAKky3Z7hZKkLoYqFs3uTBLXt@vger.kernel.org, AJvYcCWPJLgBhUFYtt33C6yCEp+H1lZRdeTVUlKhMzXVChvEi/qRuAwsF9/fZE4WiqDvHzaRMDOTz9QDENit@vger.kernel.org, AJvYcCWeCgH24jjbT11t7uZFeR0n3O8daYqjMPKDouDhp4QgqzlcA+mcJDGHQhczZCP6wIWUb8HsUDUG3sow@vger.kernel.org, AJvYcCXowv50OTZkxuB+d8UAGWjRS0MJnEnD/hDfPZmgB65fN0Bx8WEFtmqT9I/wFZZFZCSiNty5rOApbNz7NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/MLYjd31UvJuFDUDgYPmcIWzO++p6r0CLXpP8CwWgoa9EgMN5
	m1BHvwUVQ1VGoNrH42VHuTHzUA6sfb1QpfrblzPcUccnzdgDAMwiKBxU
X-Gm-Gg: ASbGncvFF2JrceHmh85qFp++qm6qJQ+ZB4hPM1e63VDp69TmK0LveBlqq18Nctuc80y
	jTcwGVnJNozpdQiCcyLYLv3/+rQtKAPOv958KIUiJA1F625oSOQHl0H+jLvGAOB07smifiXXNnF
	IOT6Qle05xhWvjhNaS3JCJatGr1GVkJpx1k1Zyq8odn1t8X1Q8FNVXMvRGNWqVl9I7uzINBKz6d
	q+m4Oj+A6Rs3N35Oq0YtwvbJya9gFwmL00WHuQllRobm++l++kDi6F4dLCnIgNejvYe6zC3i8M5
	FxmIgsR+/FPJcOV0T9PC9EOVUCq8r6ETbU+FrsV346K9ZmUDbPTQLuI0+0o0448ffF6uSrB0
X-Google-Smtp-Source: AGHT+IHxG9XbUgbsz3AXCKtUbw40NVDtwgtcYywPrcmxo7eCIXNYVplLkQY/by6iIoiecAYOBHQWHg==
X-Received: by 2002:a05:6a21:329e:b0:1f5:97c3:41b9 with SMTP id adf61e73a8af0-21fbd505d57mr25020541637.5.1750271557612;
        Wed, 18 Jun 2025 11:32:37 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.113.163.91])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1639f97sm9606454a12.6.2025.06.18.11.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 11:32:37 -0700 (PDT)
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
Subject: [PATCH v10 4/4] docs: leds: Document TI LP5812 LED driver
Date: Thu, 19 Jun 2025 01:32:05 +0700
Message-Id: <20250618183205.113344-5-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250618183205.113344-1-trannamatk@gmail.com>
References: <20250618183205.113344-1-trannamatk@gmail.com>
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


