Return-Path: <linux-leds+bounces-4509-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C55A94521
	for <lists+linux-leds@lfdr.de>; Sat, 19 Apr 2025 20:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38D0A1894DBE
	for <lists+linux-leds@lfdr.de>; Sat, 19 Apr 2025 18:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145441E0B9C;
	Sat, 19 Apr 2025 18:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nioC+UO9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB111C84C7;
	Sat, 19 Apr 2025 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745088300; cv=none; b=NIw8jKwH84OnheRLpEkta3oY8CUBeL7SOdP8Fq3scYU/jAE/PrJ8GuOSClWeJUhTMceOq+CiUQNafqXHYjJDaurd0QxyYg0iL9JoWOnxjzfg2yC3SSrMM2nK97V5NZa/6zo3ku1Ai/Q4ZRNnEWlQjrC1E5+R0Lvhf3xN/2jdUYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745088300; c=relaxed/simple;
	bh=OGWQQv2QV7YwAf7/3puWoImfHAkezv0U8AsR+TfHaSs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O3PYSEoOHaJfyvhjbqYEcq4ORLKIsl51Q1l32AdNLK1fxOhuTvLS/PqHjdyQ8VayPd190uKrVVjXWMydA6VMUMTMLGPb+tgn9YhzkkstqWAwnXXUzHS1yP2LKtn5im2xgs0XBo4Toy+FgBFg4+eOn2n+N36Po6Al/R/8kWZALx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nioC+UO9; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so2145431a91.1;
        Sat, 19 Apr 2025 11:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745088297; x=1745693097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvRRxUMeHxKyCDe7zQDutSRdG030ffk9jWsfevatuKk=;
        b=nioC+UO9FaLTGJZ4MG15HDvMXB4M4Y0hBy6AtAfhPypgfhvFTBwVh9cpFyZRDPG8lA
         b37Ap8H6QFCLAv03/cWmK4rF/9gxBYbUA4JvGCg4sQ4hzwhChLk2KAvnYvwvSlyEg2Kl
         KKyhvcb5hbLMsVoFBs7lzYyO1Q7eVzp53dvtHfPk1TyfJh9ndxiVUCwiyCFsYG72yprp
         zmWrXGEMBJ92RKvv/s8tRDRXroTsDt5vi03jcU95C9ALsriMaQ1/xWHJj8KgKGKVL5rk
         ZIM27AoywgnGzXfxZRYum/tj5RzZ17vjmu9pTU/ZSthnJ3y6RAAzmx7nbKb5aDcadpRH
         fn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745088297; x=1745693097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvRRxUMeHxKyCDe7zQDutSRdG030ffk9jWsfevatuKk=;
        b=YZIXnijQovMICgsUoRVNUAyvCbJsY+J3O9cMfoSEDlM8n2ZtpnVhaK9gbAS2bW55Kn
         aa2XxS/fG6CCcjA2WPvBls4+//8cu40OFHtfp3RFuMgbwBTHqkYxkNB2f9UvsddkeOEb
         WMpPKQQKeStR67YRp8opZQcSF920C4u9Fnaos6Jqhio+DzfF8FDCPnuGqvyyD++Zf3Rb
         eIbofSJUzW0VyW0o4q12il/vLj4iWchkdwf7ozmArzt5MB+NE1ML+cv203nCD/l6Z5xe
         ok0/9yNOCBDhcCZCwOT2Tkha0WtJqlgVxaorEcm+sVZspfxNYX8AyztgXORpc8YDJaNQ
         0dug==
X-Forwarded-Encrypted: i=1; AJvYcCUB3nJoTYt6Ep87YWJEsBnP6afBR8S5woB/6mT+zWJ3erB86QGjLvIwLJRfKkViKYOT0HjMF/XFyW8Ydt0=@vger.kernel.org, AJvYcCUen1BzWKPuDac4EIXGPFjLxcoUIHIaInwyto7RF9mvdefUauA8xfoQ/XkcXnMd4sJWxucUdwG/IMUNeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxgmCaIdm4oCaB6FUBqApJ6OJUm3fJ6yMxJ9x0yjK8zzgdqzzX
	uXEK7ORg1d9ce+V/1o84RY/i3PAuCyq+suNU1JqMCnmn9jBt61SK
X-Gm-Gg: ASbGncunhBP7QNjBd0ZdOh4BOKbiKkgj8juFv9YYxziuTVGXb6BzUhe5Qzfl93Ls6Bu
	CjDXrD6H6Y10btQ0HUQm+iuT1Cf7XXjRbpCb9Id7VXexogxjv+eYzLtEt8phgfBiKEcORDyJ9/y
	qRpw5avSSCSMGm6eFYi+p7QpuqqYFh5rZ6zwN/9nX1DPVWdQneoOe3AbEhnJGqL895mqesj4nqr
	x04cepuCqpua5k+WTzgAr78QOqKg3MNMtVxEk6wnOyBsEMcBjmm1vIaGiv8qgfbrP1igdUZM/rA
	uxlvcLowWK3756HuRB/vl6DuOrRM96zcZkBjEQWzgYstxBOWi39u
X-Google-Smtp-Source: AGHT+IGGLz6StxTqGLZtPbAGuL8qgJYLm3/r3EBN/gJxXniKEHd57aS6eVzUc84ZqWYFWjWMxyX+SA==
X-Received: by 2002:a17:90b:5103:b0:2ff:5e4e:861 with SMTP id 98e67ed59e1d1-3087bba0323mr9968785a91.24.1745088297425;
        Sat, 19 Apr 2025 11:44:57 -0700 (PDT)
Received: from localhost.localdomain ([123.17.0.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e1149b1sm3383052a91.40.2025.04.19.11.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 11:44:57 -0700 (PDT)
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
Subject: [PATCH v6 3/5] docs: ABI: Document LP5812 LED sysfs interfaces
Date: Sun, 20 Apr 2025 01:43:31 +0700
Message-Id: <20250419184333.56617-4-trannamatk@gmail.com>
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
index c8a7058668dc..63ecb019e3bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23938,6 +23938,7 @@ TEXAS INSTRUMENTS' LP5812 LED DRIVER
 M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 F:	drivers/leds/Kconfig
 F:	drivers/leds/Makefile
-- 
2.25.1


