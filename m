Return-Path: <linux-leds+bounces-4519-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B762A97513
	for <lists+linux-leds@lfdr.de>; Tue, 22 Apr 2025 21:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21B5D3B4121
	for <lists+linux-leds@lfdr.de>; Tue, 22 Apr 2025 19:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8922629617E;
	Tue, 22 Apr 2025 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7QmSKfv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51B226A092;
	Tue, 22 Apr 2025 19:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745348559; cv=none; b=k/PZqW2iwNdEtqc/ZI1tyWdxnRQwH5yGCEEVxk84vGQJjFG7kd4Qvs6xOtWayoCO9r9JlrXS88i1qGOaVXxCS5uGGZFGsUPuw1PCPRjX1TC1YCVLpvNgmhaAiD49KZhY/31paH9wZ2u8rdErDcW32G9CfOq8EDydtmW6txViBdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745348559; c=relaxed/simple;
	bh=4EN6wjjS++BTNmZaBWQjbaKHreX9rEpElOMGuPmETP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DogtP2htNBrOmGXJuwvMwn9NtrC9pmoyLwjJ0Xdk4G3nwup8lcfMXJk+JRO+LO2Ll+R9zUGzoagSugSqzfBBqvawSpnYYaLvhh2colBw04kVaOS4bHYYyu0BHGV2RAJ5+pj2NrUKKMOR9RbrOdI7IDS49GP1ra1TLHdsXwW8OQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7QmSKfv; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so4855049b3a.3;
        Tue, 22 Apr 2025 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745348557; x=1745953357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lY91ierubUyj3BTMt47i5dAwABuxH4RNOKn5seJw6E=;
        b=Z7QmSKfv+LiSKZvGj6EGZXtDhK8ljtWnMERk6WSLx4TliY+dmE6uMfEmZktQsJmlSh
         ipbI/WOP+aTuK1OVAIE4tu1D5ZTr3KBmqEt4BEsL6NzZ7bdnUk/o+FwnnbByY3ora1cE
         +BK1otb5viSwzhYvXhfn9ATVXYYui4WYziybv7QM1N9qhb2rZX80jee/xtDY2MGlH2IH
         japdWH7CWjFEU2flkVF/SJX9CF7R2dKUG6ZSF5fTjrwgZuqFypL/YqpH0USCRN9wq1pX
         9yCPxZf7ADezvAs+CUaVO/O3GB7T6fWwgpyM7djWKQIY3yfKScYlg7Bz61SWaDaFKoo4
         acmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745348557; x=1745953357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lY91ierubUyj3BTMt47i5dAwABuxH4RNOKn5seJw6E=;
        b=vGW2x4a1msQKSgssj3dFBmKvaxAVu83/Q3318YzsCuyvqNuHY9yjkh55YEZhG0R+IQ
         IURnzu0EVAhgzOgsCBwWFLsn+rkdMG5qsxLWJQss4uN0CG2AwqtVJ2/Uj6ZVdcSTiEpk
         6XgFRyHaLoifj1XLwX0pfZY81vQU5OIBopichnp7fLQi1FO2WES/AYHyvvuPzPE9eXUm
         hYekmprirNABRFKBuUbk3pvumgWSIpmiBSMj7f6uJ6/KjvbHaowJ9haKjm8KGnDCbi41
         +LNXXyy18tgUlCyO4L+vB8zfrWUN9V3eOscw8GmSQVhmJTVRAyo+XwrL9jtUpeOj8umf
         EbNw==
X-Forwarded-Encrypted: i=1; AJvYcCVxS5YRlaRVx4rovKwEjAEGC9xrD5SeBawFfTVNwErABBkNIzNdx9cR9ryqWlBOZmea9vRoIxB2qOpk7Gw=@vger.kernel.org, AJvYcCWFmqWixJ+VG7/qy+aiV9fk3O44IuKTTF+BXWkCFKlAc7UuZT1kjbydYuoVOrc3EHxStB35sz5+v2qQdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTQP+u0rYt1Vt1Rf/X+G8Yb/YRephqc4a6tf4/GyZYNjOFThwV
	WiAvY0VHW4d9y+Af1BCiv1yJMv7RQX2jKl+FVUTCjvdwEvl6ZiiW
X-Gm-Gg: ASbGncv8MCXQpMhWh8g72iv24Bx+TQkJZPZSxlJJUPIXimbuqMAhYSnoqIp8z8bKqVO
	AHdtMcCtV7AWo6RxniMWd8dVxGf4f0dKwmZOUYIOi2cAJMc2Wyzo1onmA9joCnE51+F4fnLHP8j
	E9+sEd7ADpgS4tNImha3vq60uUdqgcO4BXFi/9rmKU23Lmh2FmU6Fc4h893v5I+3393nZcHP0d2
	gKwp67qAtyljYK1XhpziccdW4LI5XxM1NBrsTp8ToFybJ3lYitptbolHlgsA3Q2+l7LRhANF0HV
	mgsmsNGfH1K31jdfubFBiQIn/dAVzpbore5kTA2EJqRvUMnf1Bt4Wg==
X-Google-Smtp-Source: AGHT+IGOJy/nCAf9cANAee/iwEy5uSsTDlDXdXqZQJ1IE5bhKejVMp3658n2qLtWieSBZt7STmZmyQ==
X-Received: by 2002:a05:6a00:1907:b0:736:5dae:6b0d with SMTP id d2e1a72fcca58-73dc14b430cmr18774469b3a.10.1745348557072;
        Tue, 22 Apr 2025 12:02:37 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa574fasm9287684b3a.99.2025.04.22.12.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:02:36 -0700 (PDT)
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
Subject: [PATCH v7 3/5] docs: ABI: Document LP5812 LED sysfs interfaces
Date: Wed, 23 Apr 2025 02:01:19 +0700
Message-Id: <20250422190121.46839-4-trannamatk@gmail.com>
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

The LP5812 is a 4 × 3 matrix RGB LED driver
with autonomous animation engine control.

The driver provides interfaces to configure
LED modes manual/autonomous, set PWM/DC values,
and manage autonomous animation engines.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../ABI/testing/sysfs-bus-i2c-devices-lp5812  | 144 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 145 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812 b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
new file mode 100644
index 000000000000..04689663a643
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
@@ -0,0 +1,144 @@
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_enable
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Enables or disables the LP5812 device. (RW)
+        0 - Disable
+        1 - Enable
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/dev_config
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Configures drive mode and scan order. (RW)
+        Some valid values: tcmscan:4:0:1:2:3 (default), tcmscan:3:0:1:2, mixscan:2:2:0:3, mixscan:3:0:1:2:3
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/device_command
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Issues device-level commands. (WO)
+        Valid values: "update", "start", "stop", "pause", "continue"
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/sw_reset
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Triggers a software reset of the device. (WO)
+        1 - resets device
+        0 - does not reset device
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/fault_clear
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Clears fault status. (WO)
+        1 - clears fault status
+        0 - does not clear fault status
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/tsd_config_status
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Report the current thermal shutdown config status. (RO)
+
+What:		/sys/bus/i2c/devices/.../led_<id>/activate
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Activate or deactivate the specified LED channel. (RW)
+        1 - Activate
+        0 - Deactivate
+
+What:		/sys/bus/i2c/devices/.../led_<id>/mode
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Selects LED operation mode. (RW)
+        Valid values: "manual", "autonomous"
+
+What:		/sys/bus/i2c/devices/.../led_<id>/manual_dc
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        DC current level in manual mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/manual_pwm
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        PWM duty cycle in manual mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_dc
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        DC current level used in autonomous mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_dc
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        DC current level used in autonomous mode. (RW)
+        Valid values: 0 - 255
+
+What:		/sys/bus/i2c/devices/.../led_<id>/pwm_dimming_scale
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        PWM dimming scale type. (RW)
+        Valid values: "linear", "exponential"
+
+What:		/sys/bus/i2c/devices/.../led_<id>/pwm_phase_align
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Configures PWM phase alignment. (RW)
+        Valid values: "forward", "middle", "backward"
+
+What:		/sys/bus/i2c/devices/.../led_<id>/autonomous_animation
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Controls AEU configuration and playback. (RW)
+        Format: (aeu number):(start pause time):(stop pause time):(playback time)
+        with aeu number 1, 2, 3; playback time 0 - 15
+
+What:		/sys/bus/i2c/devices/.../led_<id>/aep_status
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Shows current animation pattern status, value from 0 to 7. (RO)
+
+What:		/sys/bus/i2c/devices/.../led_<id>/auto_pwm_val
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        Shows the pwm value in autonomous mode when pause the animation, value from 0 to 255. (RO)
+
+What:		/sys/bus/i2c/devices/.../led_<id>/lod_lsd
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+        0 0 mean no lod and lsd fault detected, 1 1 mean lod and lsd fault detected (RO)
diff --git a/MAINTAINERS b/MAINTAINERS
index 0b4eb9f3a94e..aadd5dd76de4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23994,6 +23994,7 @@ TEXAS INSTRUMENTS' LP5812 LED DRIVER
 M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 F:	drivers/leds/Kconfig
 F:	drivers/leds/Makefile
-- 
2.25.1


