Return-Path: <linux-leds+bounces-4474-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DE2A88674
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 17:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72353581C0E
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 15:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAB42749F2;
	Mon, 14 Apr 2025 14:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuXlXZp1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17102749F3;
	Mon, 14 Apr 2025 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642715; cv=none; b=YftpBQE/oY9gKURCDBt4keraQ/Qc/5ovktjAnk48s5+pS+0iP5KzSXVqNbmbeHpt3omAtz0XAYn0KByhzlwde08tPduksOntQEv8gq4GKZLduxg84IILZ8/szues/mE3cnDSlAWtLcOOr7n4/ct9mCYqrg1IQvx12021OOthbyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642715; c=relaxed/simple;
	bh=OGWQQv2QV7YwAf7/3puWoImfHAkezv0U8AsR+TfHaSs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WNywamDBZ5v4I0s+nstK9G9MqnoO3ylI3puwynyTJH/DC9UTJqtPdywT/Yitn+GbymS05eOHJIxV91Q0DD6h2m2t3GGZ4Fjtpfe6PTWoJhuiY/2M5w/CVrfwufIMo4zt7xpfQdPPCeTsqRuOBesuu5evwDHYBbO4VQe0yJEioQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuXlXZp1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2295d78b45cso62683855ad.0;
        Mon, 14 Apr 2025 07:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642713; x=1745247513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvRRxUMeHxKyCDe7zQDutSRdG030ffk9jWsfevatuKk=;
        b=QuXlXZp1uKMFN6qLyH8BYsA/RHUiiPx9Gpmp2odZyp3WY9n4JiU/EnyVPMCiwl5Bzj
         JILHQwgpw5HCplM4sSjd9cGHErLeXruMH6PPVuN7sXRSh3BA640aUCrI5OqitUA9WkKe
         zTBuR2o+sjlIgc8fhPLiz+kPeGwXMG7tVJgzVTbJpgYvh6E53nqz41uSzUn7Qyz0YDuF
         rGje6o8ay521FPLjFEmHDs4AoNtxBTzPVb/6vn1w8wtfopp/83x/0YgldO4caOk/N3qJ
         Iiyg7ZZahHbcXjdoFCJJQeMe5eLXuIk/pp8QfTTuseXCOuGJGvjg02Zqr5PcLWue/ffc
         yihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642713; x=1745247513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvRRxUMeHxKyCDe7zQDutSRdG030ffk9jWsfevatuKk=;
        b=Qjc0HbfUIKfvC7XxAG+Bh+TN0pxAMCZqOcS7EZRXtoWXDTN+xkW7anqSkufTwABG4L
         uPfdAqdmdxzaNbDU93TnzOIPfCP2mdXkgg54fjd+Gfe0YNqxk0Rz3rP2cX72PefZ59Bh
         2uwQRLDkFbjsHVDOTpqgeiFlFyMSwliKyLEAi6HWsguRyjneck/dWAyO5dkJMltNC7KL
         qU4lPl/PZmpzWdH+Yw5gwLs762RrU32jgx+8VfxocVa9lTv+TuOroSL3ID/b7gD00Y7a
         RzNILOvQDAIDXIboHTgpVXvQyh8jtduZOtbk0SOUBjmK52/z3+vhsKFfWS5qzaYMQH/p
         iXZg==
X-Forwarded-Encrypted: i=1; AJvYcCVD64BtYXc7viUUt33QNuM9YYPjToPZRbozTflLPBECG2PSGvkztQSls91Vj93G/bHR0NdR84alUQYhA4I=@vger.kernel.org, AJvYcCVQbQoTyEc+BdFFu6+aIHcq6Y1pzBLSkpNUdYQD0BE1dcfYfSfUZKblPTlAxhynDtliwF8guKWy0K3/fA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6dKeg+V6/EXeKxeFAgAoCwty/Gl9nIST1WjZYjDbsK6XbHZ8E
	NcdiLSU30xa2RP9WMDPJbl9jNSGnaPEpbJS4I5Lhig4EJP2b1Y8IDeyGrWY+
X-Gm-Gg: ASbGncuZhCNsPN67y0QqAtee8sxUHgvKpvY+1Bo8u+fkkAu9rTj8x0KfoIUFzIxsCqM
	kd0j7yItBC9Z9KiRBAfmZyAQ7Cx7K6iQERUQWr/R/1+XSwkJM2Mai2jLGs3ZIW4kGj3Os/udLq1
	I8UOpIOyTWKlnPlkhXn+NayBcUJKBXN/9flC8ffedMEOInTi8TfhQuKDIpIFimzgdbRarVnTbcC
	1iiTmB0NNv/V0+HZnFN30Q6xItlM4ueCXLbchlVy0XnfHU3cQYf0JxDA1TO4Te5FQUCSJHJfojf
	MTGs1QE060UOYHyXYLnMtLEN/OFWFTNatOs7dgvFAJ2F30hfvaPuEA==
X-Google-Smtp-Source: AGHT+IEe+GUM/FW7s0UnaLfykwGUKNPnP/o1GzSjXqCGTgTouzD+ZMCe6nCQb0Pkj61rk/mR32BlBA==
X-Received: by 2002:a17:902:ebc1:b0:224:1ef:1e00 with SMTP id d9443c01a7336-22bea4b67abmr180480565ad.19.1744642712769;
        Mon, 14 Apr 2025 07:58:32 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f1071sm6632165b3a.120.2025.04.14.07.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:58:32 -0700 (PDT)
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
Subject: [PATCH v5 3/5] docs: ABI: Document LP5812 LED sysfs interfaces
Date: Mon, 14 Apr 2025 21:57:40 +0700
Message-Id: <20250414145742.35713-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250414145742.35713-1-trannamatk@gmail.com>
References: <20250414145742.35713-1-trannamatk@gmail.com>
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


