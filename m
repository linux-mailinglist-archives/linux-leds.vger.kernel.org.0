Return-Path: <linux-leds+bounces-4411-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E6BA7CB7C
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 20:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C64A47A693F
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 18:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F691A840D;
	Sat,  5 Apr 2025 18:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkA9K6yY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517021A83E6;
	Sat,  5 Apr 2025 18:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743878015; cv=none; b=V2SI6tTuDDkonOxgq49zCRh+sKpuH3g500wju0eNyQu0h1vuP7HLW/9343iCdQhp930I7A1j4Zx9SygswxcGpA1TbLYZvUZNnTRAveUgZ9cf7S9duoPpSy3TSr75DQx+a+FTnFo5Z6HihHt6hyzTScF6y40OudinFq+iNL0FGIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743878015; c=relaxed/simple;
	bh=i0GjCpjV6OAaeN1mNxVFs22poZOf4jcYRiuKtbbk9ys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MBzninFA9a7mXrSwxF0+megQsFxKk3nn3qXayqJt6shW0wegPwSy6UAm6rnhpQD3a9fpvh66TTbaQIerlKGMi7KBeDnqgCgaBzFO4yzvD4mqPTIaI8AgE783zOWKK4PXyRWamQRhz4wDeNTUnCmHUC9mA1YX0oiPOKedi3Ccq7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkA9K6yY; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2254e0b4b79so37678785ad.2;
        Sat, 05 Apr 2025 11:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743878013; x=1744482813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snlX1McCli16iM2RGtD1yvfIPaEuaS5GubilZ7PXw9A=;
        b=jkA9K6yYrYkJzb9Tr+qVPCVhk7Z/WL70iFV0iw+eYAcVEhix5/kV9yftMvUSgDZRJJ
         sEV/+1eP3dDVQaoCVrpEY6+exOMvqBfkNt+AMOUBIoMblVBUXiuYi5sA/AOZKzwLZ5TM
         S060ptaNNkUzP8N7nn32tW/6uRPiwJmvuqe5erpSxf/McQzEmQ3kGVQQeosez0ACdpwK
         h8aU/waa5RzV/R1T+gAk31ZSnSzuiPicgcO4WDRAoWp2q9s4ZyOtFCW5wfvEg85XLqd2
         EhRHpyJuFlf1rXQd23jvdQytZdwG2d8AR0ZLhLsecfwALtOtRHRPQxksMzb8rtqUYdON
         cdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743878013; x=1744482813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snlX1McCli16iM2RGtD1yvfIPaEuaS5GubilZ7PXw9A=;
        b=rCaFx2EICPwHUEWp9+FxSvnuJRZjrxbZyLC1k+VIidgrbC3Fmin0GkWUf6p3gdDsUw
         4DnpCyaMwKVLGkqdH4zRAEnXeLnF/apAZV5F80umVfr77giCS7oioWTtP83sTRlBchhT
         Ln/l60S/B34w1q7lGvKf6YbGop+PrxvhDEYcrC8mAt4PHfR1xA20a+mzPpGA6+h59PIB
         oShzY/7bJD7aCUe3SDZqGC+K/hQvslA3bhePIH6ROScpB7F9V9QwSFPU4iYVAnSwGHcr
         Jwaz4l2+asfpoCBdMUuae4uId5w5jbOCR1Zc6a8s32j6eh5MLdmUQ3VOsb/qa+psRXp/
         Xt7g==
X-Forwarded-Encrypted: i=1; AJvYcCVFjMJrK56HvcdA8BBS8C1ZgLzdcUi+RX+Kk86LEi/5ygXooIA3x4AbD+sz3pV0HEwsdQDkBl/V08vk63Y=@vger.kernel.org, AJvYcCXT+cz3AVeHiBETmktLSTkYBA/DDtGMqCMRDNz58LXXpVGCpccmA31EWzGxqlV/eZkVUjqO7gB1VYvTGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8X8GNouhg6oFGJN/3bbp5HW34DB6b7YwYgn2Xd612235IwIyx
	UaJjXX/S75cmf08Iy5jJo8tpHVmYMd1SzO+tYM+aDdqU2MN4uLyEOQ2bFP8q
X-Gm-Gg: ASbGncu3XnvlY0YE3IBoKvoVUy2I4P0Ha5K59WG9YeBuTFG0dXPjqWaaabnKZzHU6Od
	q21eX802aAVe82k9fOGpIOTgZhFjq1Np6Ow6rBQdtu5WS+YusJ5YbonI11i4K74OhfxuxSzpIsJ
	kD1vE9msgPSQHHdQWcdyETBGBXsOwJPPBR3REsTeWT2ea4Nhl9eM3bXXBMyfTZ34f6DzBYYs10Q
	mAqdYr/H2X7embvoiWaFqF2ejMC6nNTdBlWmRWvi3QA5CBB89wFDpwbh59IoldvUEc5aVxheDrr
	6BuLtD0RHz75xR3fDGKHub1/AXnupyctauPL/Tnpf0cvTfLBOA1kWn0cLigPol68M1E=
X-Google-Smtp-Source: AGHT+IEMz8wYn3HLo+F2XMu5k91FMjXA+av+weHzrvjr8bAw8UlFMDNxPhVkU+NYH8Hyj9CsV6nidg==
X-Received: by 2002:a17:902:e552:b0:220:c813:dfcc with SMTP id d9443c01a7336-22a8a8b80a3mr99752745ad.40.1743878013358;
        Sat, 05 Apr 2025 11:33:33 -0700 (PDT)
Received: from localhost.localdomain ([123.17.0.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e61dsm52980965ad.190.2025.04.05.11.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 11:33:32 -0700 (PDT)
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
Subject: [PATCH v4 3/5] docs: ABI: Document LP5812 LED sysfs interfaces
Date: Sun,  6 Apr 2025 01:32:44 +0700
Message-Id: <20250405183246.198568-4-trannamatk@gmail.com>
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

The LP5812 is a 4 × 3 matrix RGB LED driver
with autonomous animation engine control.

The driver provides interfaces to configure
LED modes manual/autonomous, set PWM/DC values,
and manage autonomous animation engines.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../ABI/testing/sysfs-bus-i2c-devices-lp5812  | 150 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812 b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
new file mode 100644
index 000000000000..e745f0f936c5
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
@@ -0,0 +1,150 @@
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_enable
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Enables or disables the LP5812 device. (RW)
+        0 - Disable
+        1 - Enable
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/dev_config
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Configures drive mode and scan order. (RW)
+        Some valid values: tcmscan:4:0:1:2:3 (default), tcmscan:3:0:1:2, mixscan:2:2:0:3, mixscan:3:0:1:2:3
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_command
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Issues device-level commands. (WO)
+        Valid values: "update", "start", "stop", "pause", "continue"
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_reset
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Triggers a software reset of the device. (WO)
+        1 - resets device
+        0 - does not reset device
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/fault_clear
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Clears fault status. (WO)
+        1 - clears fault status
+        0 - does not clear fault status
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/tsd_config_status
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Report the current thermal shutdown config status. (RO)
+
+What:		/sys/bus/i2c/devices/.../led_<id>/enable
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Enables or disables the specified LED channel. (RW)
+        1 - Enable
+        0 - Disable
+
+What:		/sys/bus/i2c/devices/.../led_<id>/mode
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Selects LED operation mode. (RW)
+        Valid values: "manual", "autonomous"
+
+What:		/sys/bus/i2c/devices/.../led_<id>/manual_dc
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        DC current level in manual mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/manual_pwm
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        PWM duty cycle in manual mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_dc
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        DC current level used in autonomous mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_dc
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        DC current level used in autonomous mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/pwm_dimming_scale
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        PWM dimming scale type. (RW)
+        Valid values: "linear", "exponential"
+
+What:		/sys/bus/i2c/devices/.../led_<id>/pwm_phase_align
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Configures PWM phase alignment. (RW)
+        Valid values: "forward", "middle", "backward"
+
+What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_animation
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Controls AEU configuration and playback. (RW)
+        Format: (aeu number):(start pause time):(stop pause time):(playback time)
+        with aeu number 1, 2, 3; playback time 0 - 15
+
+What:		/sys/bus/i2c/devices/.../led_<id>/aep_status
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Shows current animation pattern status, value from 0 to 7. (RO)
+
+What:		/sys/bus/i2c/devices/.../led_<id>/auto_pwm_val
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Shows the pwm value in autonomous mode when pause the animation, value from 0 to 255. (RO)
+
+What:		/sys/bus/i2c/devices/.../led_<id>/lod_lsd
+Date:		April 2025
+KernelVersion:	6.14
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        0 0 mean no lod and lsd fault detected, 1 1 mean lod and lsd fault detected (RO)
+
+
+
+
+
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 3fcc7192e01a..903070e18d05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23535,6 +23535,7 @@ TEXAS INSTRUMENTS' LP5812 LED DRIVER
 M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 F:	drivers/leds/Kconfig
 F:	drivers/leds/Makefile
-- 
2.25.1


