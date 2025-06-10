Return-Path: <linux-leds+bounces-4778-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D438AD4119
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 19:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED5377AC4D5
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 17:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51EFD24728D;
	Tue, 10 Jun 2025 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYtxDEaP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D57B2459FF;
	Tue, 10 Jun 2025 17:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749577432; cv=none; b=Y8P5In72jLF9tLtKlofme6YJBLjUuFM+JJTIAL0ui17zUkpXfKCzhliAgoX25NRJq5zJgciRBbn5aapu8uwcPg+Ek9TG+ZtJAJCmL8q0hVOl8EVQrHzkBL0d1Hh6Iz48erD+5bk4AZ9bANc/RtgzgDe0NR6yjzUtnYgraDpupf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749577432; c=relaxed/simple;
	bh=3+rfcDoZCFrk55lbfI9aZigLV0dzeN6kfrnIK/bhL7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQ1zFdkygAu5P4TaW4s8Zroao2p34FiLBmkm0Vb4wTQFM0a46TS6zPVshMJ/ZhJ0caPeZLx5KdwrytQhvoqDsv3MB2k6i9ihmSAXEso4MMhVdiqT1oYg3BrbWZLU9ply9YqEfI+vo+20OE44V+ALx3WNnfXfI00EZjKWo3MpcPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYtxDEaP; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso4201628a91.2;
        Tue, 10 Jun 2025 10:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749577430; x=1750182230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+WCECOIBnyg+qKnBvzOn3umPqjLKBXWvqmV6S2Rpcg=;
        b=SYtxDEaPOZSvBiVyiKLNOAkd1mx2l85CpDZd3E55nAoYvNrwfYI7tSOD6e+nrCFtcn
         E+bM282P7BGfYmHUCMAS93VvsTONVP0B9rgJufAnKs5bqzEtvNp2qGh2UHxwv/jQ04n3
         SlaYelDdHLrYzlYQerDBehSZ6Hv1VzsR+XeJOMyPzNmnPUiLR+DPKZ3HA55M0lgJRLXJ
         2eP/JAeIjyiDOSk3hTie5MG5frRiZ3HFBtsFA8kMpWhIyIl5pUXC6qESASECFX/MBy/8
         eLpn29aoHzXk+Vh8cfHn4D0f+VN4AxpQGIr0iXwX/Fil+UMyYmE6Mjf0g1803AR8QwnC
         orxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749577430; x=1750182230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+WCECOIBnyg+qKnBvzOn3umPqjLKBXWvqmV6S2Rpcg=;
        b=c7RFzFvN30YSPZySOptBl1eBkHHIWxQmcx77A5a2U68phq3s3+QjbXXMDLFjqtOVi9
         mRPLj0e6GRGoA/9e5c/69zZuvbuKgDB/KLr1DQXFcx+t8m7thK8fIYqF2K5/Y70/Ljcb
         K8nq1lKYqPHPiJvcAt78y96wBupxgum6pogUGbf2lY7PNB0XoLsftByQV8VuKmc/aPKP
         neGAsOTw9qMge4rfvhFn5C3i8mRm7v0NNNpXbUvYKOZrk1N8+W7xZRzG9DTQOiE78yxq
         xFYnhopc3+Mddihp3i1KFTdDjrcHFLacll452b1ym/S73Nzb/5N20fV0nUDkZY6ZRzZ6
         0Qxg==
X-Forwarded-Encrypted: i=1; AJvYcCUoAafBubacgqyqBwJKnh52F5F5thl4XyO8b0NQIlvXqVGc+5YFK1gSkMe21UIz95H4b9HpFdtF60r/Jg==@vger.kernel.org, AJvYcCVhY+5g1GRQhP5jlIfGtfnnKMUgX6KLmxerJFopR1IWZsZ1vvtWSPHrt2a2toClrCU323Oz3H7r89TjchYL@vger.kernel.org, AJvYcCW0kafrkiAB9TtB6Guczgx4Gy4YyC5wg1HjSk959OeXba+BFMBBw4lGdC99W/ymMjByO21OnupKvpdb@vger.kernel.org, AJvYcCWeBB8M1fPUWLcPIVk4nARoNtgn8G6puKdHFx+MspULj9S7n2YwwGPQ8Gi2bYgwzYrnp+IcYpaQGElT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq1Qq1AU+Rqn6MGX3CBuyJz6/YAObJt4IykIL2fIfudvMWHdfy
	/+rjTiY3hcY39xwLToEbnYvRUNXqzNbS8QOvCc9Nu9vFfwSVYn6w2WK0P5EciQ==
X-Gm-Gg: ASbGncvv7Rh0HtI8OFPK8jeHuKOu6c9J7s5vCaBqa0pln9sTcnSHs36eum79AbyEait
	WqutvOtgxNdXDC4qVoKEsXtfbtZ4vLjFupohV4GlaKkUVAmCA67sp8WL1gcobqKU4ibK8aOxTVy
	3WZrxFJr4edQeYh7+AwiWZWJV3aVAQxfe0mvFxSNxQNpav5FcH5vB6rUqR0hKObeRM0ik5Yo+qs
	CNDxn3CEyDY5IdwevpWTwvFRcjOgIOWQkeadXK65+YUF55ox9GaIc1Kyin/JR68moFICSsiRd8a
	5P2V99P8eu6V1VmYxwC6AQtMJ3qKYpppkqPXPifpdlMn3exJ+/zol9NMjlstvfFExHTZxHl/pnJ
	ZShBg+dk=
X-Google-Smtp-Source: AGHT+IGAsntME+TzMJWWEePamTIp44xjT1mZe4CvjyZO4HSV+43WW0r3YfNQL+WXAWSUak/H/dc6BA==
X-Received: by 2002:a17:90b:5252:b0:311:fde5:e225 with SMTP id 98e67ed59e1d1-313af11d8e9mr697757a91.14.1749577429574;
        Tue, 10 Jun 2025 10:43:49 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.113.163.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b044d91sm7470668a91.2.2025.06.10.10.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:43:49 -0700 (PDT)
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
Subject: [PATCH v9 3/4] docs: ABI: Document LP5812 LED sysfs interfaces
Date: Wed, 11 Jun 2025 00:43:18 +0700
Message-Id: <20250610174319.183375-5-trannamatk@gmail.com>
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

The LP5812 is a 4 × 3 matrix RGB LED driver with autonomous animation
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


