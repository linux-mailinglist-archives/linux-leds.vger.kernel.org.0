Return-Path: <linux-leds+bounces-5231-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A13F4B2962F
	for <lists+linux-leds@lfdr.de>; Mon, 18 Aug 2025 03:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3E883AA688
	for <lists+linux-leds@lfdr.de>; Mon, 18 Aug 2025 01:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD76D23C4FA;
	Mon, 18 Aug 2025 01:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jfz/Cicf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB4623C4E1;
	Mon, 18 Aug 2025 01:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755480450; cv=none; b=mSjDXkjenZDsRsuEVfsBsOnFdgqpe15HNdt7PrHasTuw/5JWMcnJRkG7fI2Y0wtkKorMj+fjLFK2g2Jxqo63BxgWh9rgFdQtMLivTGjxA2SQeVQOaPrqF5sNQ1HkZfbCsa0wqyF5WX8nL+cqFOUZhC+CS/chJtsBk7deSpJ9qUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755480450; c=relaxed/simple;
	bh=YYfnwaU2YOGJ7AFmccYeg2FiCUU+20P3ULo5LK90Sjw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mCJztR84nqLmq15BBfow7jscYswRDKwKPGowUfhfhcIsWGqS+NooRGtBTS5M0hNgmyBfj719rXHsrX7WX6m3stCckEMD4jZzjzOlKLUUuhK329bZ1/QddNN/jMzgkZ39nRdMeEnA7os5Jpd8yQAagf8h+5ob/HyLfjSgI+4hFfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jfz/Cicf; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-32326e5f0bfso2926085a91.3;
        Sun, 17 Aug 2025 18:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755480448; x=1756085248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2hhQ1eT+/gKOxmT2TqJqg2gW8rdjYFSQOxpgEIgX34=;
        b=Jfz/Cicf1PM/SYF/2O0i+OsRXnJ7KHHQ0wW6/0t5tG5aJS8CpSPI1aQsN2tRSG3dF7
         1FBX6aWj6LMMHxh2P7yIqVBhQXl62ynnx4VGawb3aW7ZU7bEHHnMlhCJy4TJ3F6C810i
         aeVuCmbugqQvdJ0xUUZ6yqzIgW+hw6XERzuOhI7yYBvK8i6BQZ9xSB/ijCHUsXPgXyiG
         qRR1noSwMt8vmvg30vMKaBcfjCZggUVUu+BTOJaHOZn5+d1HP8IDrI0HH4uChi9JFm0C
         U9tF342SFFe6CdcWpOyWqXPH6WmBa0OYI1Zjk28o9ofklsRHJVf0ijFl/IBtv0UwXBD9
         CrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755480448; x=1756085248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2hhQ1eT+/gKOxmT2TqJqg2gW8rdjYFSQOxpgEIgX34=;
        b=Z9U8CYNl+u+UV39jS5PZuUiR5gquMw0DoEqZo+6K+g9KFTeQmZMFqYcydy4kkKgqQF
         NxGxoVfb3ZriGTfjCt35Nprla0PFIF42gSZJpUH8E0AZTkyHhOoav8YRx9JagU9UH645
         h0wEYdkelaJFNYohadt+RHkYz8nCYYN4LU2VLaVpKgKwxSP3+ZDih0L+RXBbyr0GpMLJ
         TTERbgH7T88rPLWThRi78MJtWkaga0wXmBEeWQXSgg7qm0+MEoIKQZ/B155HdpCbwBL2
         T+oi4K4VE94pw9a0deDpVnTeYr5SxRFOYPiZ3cWyQ0waFBUKTYRUvqlKNLfAIXffLVxv
         ju4w==
X-Forwarded-Encrypted: i=1; AJvYcCUy0YQs1Uw3jni8b7ZuVlMC6CyF5l77E+Puro5O9oBYPl4jbk3sna+IcccPqU3EO6s6ZGVqau6sSRnn99lN@vger.kernel.org, AJvYcCWQOTHF8CypDXeXKtKtM9OnS8hj6H6RNxddfL+h6O+i/+o/tfrenJVr+NZFHjKbjeB1mzkel5y9DcFt@vger.kernel.org, AJvYcCXQ4bIuws5i3vXfM5dq9oUjdnm87OsC1Y26EPQM10zsO4rnRdRfmLkWn+3lR3mHWxAPXug0pezTMZi85g==@vger.kernel.org, AJvYcCXrl+1MNb/NbA6mnaktu0+0UCEawEaWFMmgkW5jWWU2LCep5q1SCUwYRWD8QQ16CaWPp+CZ0mrXjsDj@vger.kernel.org
X-Gm-Message-State: AOJu0YypRds2hFcGAhiQAR2ZenF/rDPp/j7ZEZn82r7xOepCkgO16abU
	0Z2VR6N6qwr8bgSMrbTW7RSM6fqN8jXtZQcNSh/fbbs3utT9NXRRM5KILl6Mjw==
X-Gm-Gg: ASbGncv0c3UXY6tnxaMCd4gxfSYX26SKKNb9j6lmelWeyJTjiOXoo1U2BfS8fJejnb/
	owNuuXx5LaJh+dmY1dsb03BdQmSgIl9dJQKmP0Lusf4u2LrcZA2NfN0A3+Ihw8vzsLCFuznk27Z
	6r6aL1hhgRRWvU+Shj4qakooCBUXWB0q0Zt/HEnMyMn4nQXOM3YtyhMNOwjZo7TgIMT3e2/5hDe
	NOxEs3SJJgpGR9RpXQPgvD9Qn3WoypBRwh6YtgGOCK0RiGkVEt1JDr9r6TLgOaAfjsF8NgbKAs3
	eD5cMbsKc2L0IqXl7HHmSag/D+tDOOFVJf6Mq1LuulfJ5XWpFHnEAxlasfcBatWinWN7Ndrv/tV
	RQOqcHEuFKYhViv7lJoLca9AUcJf+FnBqhA==
X-Google-Smtp-Source: AGHT+IH29YsWQf1oh2epVxhCygpiFpX5VBbG4hj3ehj+oVtzPIXVR/302uaFOxNNDFTvw0lq9C8Low==
X-Received: by 2002:a17:90b:3c42:b0:312:e76f:5213 with SMTP id 98e67ed59e1d1-3234215b3eamr14610518a91.28.1755480448020;
        Sun, 17 Aug 2025 18:27:28 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.205])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d5d7070sm6709620a12.15.2025.08.17.18.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 18:27:27 -0700 (PDT)
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
Subject: [PATCH v13 RESEND 3/4] docs: ABI: Document LP5812 LED sysfs interfaces
Date: Mon, 18 Aug 2025 08:26:53 +0700
Message-Id: <20250818012654.143058-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818012654.143058-1-trannamatk@gmail.com>
References: <20250818012654.143058-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LP5812 is a 4x3 matrix RGB LED driver with autonomous animation
engine control.

This patch documents the basic sysfs interfaces provided by the driver,
including LED activation, current control, fault status, and simple
chip-level operations such as software reset and fault clearing.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../ABI/testing/sysfs-bus-i2c-devices-lp5812  | 32 +++++++++++++++++++
 .../ABI/testing/sysfs-class-led-lp5812        | 32 +++++++++++++++++++
 MAINTAINERS                                   |  2 ++
 3 files changed, 66 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-lp5812

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812 b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
new file mode 100644
index 000000000000..d0d622753be8
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
@@ -0,0 +1,32 @@
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/dev_config
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Configures drive mode and scan order. (WO)
+		Some valid values: tcmscan:4:0:1:2:3 (default), tcmscan:3:0:1:2, mixscan:2:2:0:3, mixscan:3:0:1:2:3
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
index 000000000000..93eeecc60864
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-lp5812
@@ -0,0 +1,32 @@
+What:		/sys/class/leds/led_<id>/activate
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Activate or deactivate the specified LED channel. (WO)
+		1 - Activate
+		0 - Deactivate
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
+What:		/sys/class/leds/led_<id>/lod_lsd
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		0 0 mean no lod and lsd fault detected, 1 1 mean lod and lsd fault detected (RO)
diff --git a/MAINTAINERS b/MAINTAINERS
index c2e1c02e206d..608a7f3feb07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24827,6 +24827,8 @@ TEXAS INSTRUMENTS' LP5812 RGB LED DRIVER
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


