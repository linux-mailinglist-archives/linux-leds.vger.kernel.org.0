Return-Path: <linux-leds+bounces-4847-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 799D1ADF5EE
	for <lists+linux-leds@lfdr.de>; Wed, 18 Jun 2025 20:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AE2817D039
	for <lists+linux-leds@lfdr.de>; Wed, 18 Jun 2025 18:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213272FA64A;
	Wed, 18 Jun 2025 18:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrg5jnSG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501DB2F94BF;
	Wed, 18 Jun 2025 18:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750271555; cv=none; b=mc741WPO3hZG7EulIp7BV131g5Enx2rr69ddSUwKUjUJVXbCQ1nfd3GllkNa3qJwcbFDOovJqcM2lbchNSUVDeo04kmcxgNo0gkO9M7xzW2rwcdAszwfRKYmL6hYGzRTJAu+R0Wr4B1WCWz4MjdlCkGj67R8Szqwem5zaHXcTik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750271555; c=relaxed/simple;
	bh=Vl2YaMKjly/V1W36xIR4JIP4lS7i+8jGRYUWL/eIeyY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eRgRzBQiBlaokgRqRSfJeXnNLu3RygkmCoaNIMX90eA+agCWK7PEJHzkA9SI1WW/G8DNIY98lqMaJKqIpvOMuqDRI4fm9mXfgDtbmoKSSpqn+ecOJTSw0GeBzI1O6uneR+cLLTI+zehOH5OxUGc/XU3mVfoiIZItVBXwGT43+PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrg5jnSG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234f17910d8so46145ad.3;
        Wed, 18 Jun 2025 11:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750271552; x=1750876352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBxIn0XqrDJ/+zfvzzgIjEfOUJRZPwb+TvxglfGh4nE=;
        b=hrg5jnSGhAWN3DYHweTeV/3SzHUwVRC5ebZHytp8AE0vKr6TjmeSsLjt2ZDyzDsNS0
         Khr5qJPbS29ca0XduQXEa2xPT3AuWdlpLEymFC7fnlJSTujFP77wvViPB+Wg7Vm4crdl
         F3PfMCVLBdjmxUBwB11qj6caKljXd8sEjVe6Wxh5wL59+zNK6/CurISjAJNmpoOMYBFB
         xrgjkGTr2KPYD/GT2MXwvba9awmSNzFsuvQT2xgpcIghPVzOLqV65ISs0aPFJnG7eWAC
         ydbEVH2T9Fm24jtt2aibSZCx5OsOCqcC7iqkuBsnE0QIjHFkgcAh8BqpXUNXH6YwSl4w
         O7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750271552; x=1750876352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBxIn0XqrDJ/+zfvzzgIjEfOUJRZPwb+TvxglfGh4nE=;
        b=NPw+fKp3VWEHzsF2lXF8hdf9jCu8Z+p8xvM9g2813PaKSsgAT3OzwgRDvrToQqIa1a
         0ccB4osXp+CseeT+5mpZIWzl7jHKWfe9/jboU6JTtLe9RixCsra2QXkYT/6lcXeOClA5
         YxuqlR6GFKUsZaIKriso819BVhnfHosTQDe62xSh04+STe3gME+x0+esZQ3geVxur0k9
         QNa1DSRSH4nDJpbPrZZNNIcfzyZBc3BpQr71goMBT0pGwHIGaogEwk9tjW21fBy5TdG8
         UwSXP2/Bmmv2NRds2ovpoNZOmr4HYxcyxDbRjGkVLjobcEUCwQtTPe5hHhJCZqcteq9t
         UIdw==
X-Forwarded-Encrypted: i=1; AJvYcCUluNujFARS7WFKD+p/npQPJ7y9DfJIGCngDS/KCubu6yjYGqwHhkW4K96ybWALSBAm5WfLKsnu/jKuqQ==@vger.kernel.org, AJvYcCUremGXUbq+IHYW3WknfKO1BYV4hQxz4mvFEFdZsKkUfWQ2UqzgmebKPqkGYpNHHMv7sAs4QcGZzSal@vger.kernel.org, AJvYcCXCKtz8zugzxNFoi8S347aRI/SMP8/l7bcjYquSBbC2Iero+QjrVOc3i9EIEheGFAcAvtZGbbJccC34@vger.kernel.org, AJvYcCXNUqCl3Q1yTyMx5x+8ruKzbqZVa5JAhejdQN/CLFReLdmkr7iyC0ekgquNcqrcGKrQADcv4fNEddakBNsN@vger.kernel.org
X-Gm-Message-State: AOJu0YyduPOxmQwxguTsqQk8UtTGBqSXbFRLeKuLmB0j5KYpdXG+Itbo
	STp2gR21KWTJQprs0cYoYHeFkG77sps3hYNDTDLvAme8E1Sn3r/k9pHB
X-Gm-Gg: ASbGncuAciNfeKyoqKkR38F/D4c7QJPzRygii2UNpygae9+GzvUszQclRugb29CNlbP
	nCC+oXwuSr6DVth6MQsAbQY1P2ACDlg5NOwZ3UMg/oM25FChBtdINkByqAt18sukKbgguCbWGEb
	0D0nJ20HvsL6pSW0pk6Q5p6gk6tI6YWJRpMjs00Sx936yWNhw6t+FgUDcXSk8RA7vg1XIfaSJmH
	ajwJQgSPYLUdIW6EeKDxczLu+kGvOM8Otm+67640ava5SMs5XDNyc5LALrpzoUK7zDj5kY/S4LO
	YzmLqlFN5mqVOGdqLdnXB8SgI7Cl8yr3/VnGePo5vABPRtowFosgsyLTmZAU8pDTDVhXl33PFQc
	QDu+9zIo=
X-Google-Smtp-Source: AGHT+IGY0bmVW8S9wEQ7CqAOAw/XBjkKnKcbvuDIA1uUYEVeRAn5EwKwHHZoweywRB6ZyrC0oMoEfg==
X-Received: by 2002:a17:903:2347:b0:235:91a:4d with SMTP id d9443c01a7336-2366b0185e5mr250951485ad.23.1750271552362;
        Wed, 18 Jun 2025 11:32:32 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.113.163.91])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1639f97sm9606454a12.6.2025.06.18.11.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 11:32:31 -0700 (PDT)
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
Subject: [PATCH v10 3/4] docs: ABI: Document LP5812 LED sysfs interfaces
Date: Thu, 19 Jun 2025 01:32:04 +0700
Message-Id: <20250618183205.113344-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250618183205.113344-1-trannamatk@gmail.com>
References: <20250618183205.113344-1-trannamatk@gmail.com>
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


