Return-Path: <linux-leds+bounces-5188-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B36B17AFD
	for <lists+linux-leds@lfdr.de>; Fri,  1 Aug 2025 03:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D72C4E05B0
	for <lists+linux-leds@lfdr.de>; Fri,  1 Aug 2025 01:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF621422DD;
	Fri,  1 Aug 2025 01:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbNJoSsm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C23D7262A;
	Fri,  1 Aug 2025 01:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754012828; cv=none; b=dkac3iLIwbKAVHpOOUig/GcypsR42qFvoMhZ6vR3fyP8knbzcsHm/uATdwb+GGYeenEldUVGroWP2glH2eU9Htfwxwy2t55qHjKR1Zx3A5/NhtKJO8fCL8ZmxZE1DW2Pc0w0YmbWU7laoVhteJTe2peHB0aGg4sE/3r5hqFL/g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754012828; c=relaxed/simple;
	bh=ZVmPBePIfMrVHilLCY3efrpm9cVERQhSNA6dF6YblyA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FG+AtWTkPVU9z6pEJViFRN+uK1J/SA5V9N09VXISAS6FTF+3VE3qa448fAFTuFGJQmHRAmjhJA1ZjFWpQnD0HrkbiN/8BYwgRSpsf3kBqhFTlqp96Dg7zE72RDCyTo/b4ciLy6LN0Ix/MduypG+372KqHsk4LLWxamppTCJc83E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbNJoSsm; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b42312f1929so324456a12.1;
        Thu, 31 Jul 2025 18:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754012826; x=1754617626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4sEwWCKhE9o9XO4kAyIp50H0a35S3OvWlZDhc+P+nk=;
        b=jbNJoSsma37EVReSK8lsIMYUWkKkfEeT0yomV9RUihJ6moYzE1Tgeu6SOULfVO37On
         Um5oJ/OvcFh+SPqtcMKDBfrr/actEwChtA6WaIlnZ93Z9quS/EzJGltPTPdbjSj824NH
         2rQNuUuVAcleOEzTFZvdH67LLN9fs6lWd6YBExuR8y0+0dVDdEqpIwI+Vyg+QzY1gib6
         Qjd1kt39x+MbfHCSoXNty7PeaQCuFOqtuwQwE+6h2QSUnO32r4FOg8qtbY9VUPy8LN/R
         9sxLC3u4zt6xN+5fVSrAisAZLtBPEpF8QJliznLBI0sRlNtZOE6WifEvrh0eBQRrCcq8
         Kfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754012826; x=1754617626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4sEwWCKhE9o9XO4kAyIp50H0a35S3OvWlZDhc+P+nk=;
        b=UKmtJXkfF1hL9uqXdI7E+6ab7jFTb3XnMFlTmxKzDNoo819S/7AhKzi+ltllVBydoW
         27M0z4IWpT08AvDaZ+uXsRyULu3de0I9FdRRDtbyrOr6cr4M1DI8De4GZfsrmAkjDIUm
         uY+ZRnS+VoV1kwFscUpp7RpoLu2p/BIg8eJv5FgSL8QDqibchX3W4rhxUz4xwlRaxwQX
         CJInGh4/cG6Ny86S1rFsG6NrC/5gNqtALoTeT3rY2R2AQ6L8nlbAust+k2r6DjtgD856
         16Akx0k78SbCPmcLFxfUkl+unrwoeV3FC9o0aPPXIPW4rYGZ6c0cTCfZnPCR9Qv/Im1m
         GA/w==
X-Forwarded-Encrypted: i=1; AJvYcCU1dYqZvSDP7XJWJQsqcbsqEramnjQa+CXz6CyQpZCmZldJLAaSWpaxDMoeQ15EAPe28a/5mv913rsh@vger.kernel.org, AJvYcCUf8R1lXj9UhP3ExEW/jaXZzljxBCWYg1TuTih3nNg93N+YnT0X6zw4yM5VeZWqFA/ub4NWT1JnMv8AuA==@vger.kernel.org, AJvYcCUgOK6IQ4y1nBLaIEc+Tg8oeqF2hQ65srEBmYW2vdMoPIHyI2ObG00n4JmjGjyxrHLeGcEuAzZZ3898@vger.kernel.org, AJvYcCVQFs4E8z9PnttEWHr3FtYl1prfAbG6Tz0ZI2y8KuFlg9GzdNyri4ulz9Z0P4FkSuiY2Mc5baqUaXpAqzSj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6lDGmYqDSN6VoJWEjRS+DTwNpEQKzhej8ppzWjh/76cwwyyLO
	J15fDzTXollco2NuMS/bLebyFyEQnjKflUIvoW+plGitM8XFHcPXfGtl
X-Gm-Gg: ASbGncu0ApF/VjyNCCxix/qOkNEdPmzjHPwRgS2lnioB7QKVQtIqB6KT90ahW5G924u
	ZA5upG8ma89e/V0R3XCkAJoanwWh3yPO3swqG9kGuUotj6QjjMroub3tjgFWttJX5K4Ogg4fk13
	qsuCFn8DjVFsQ4Tz7cLQ6FMNLWD/aIINcY1KAHV6UerfMQ+5y+G/PfIpntI+5C69yeSDasetT+C
	MDtmQaNeifrBSZR89A+YCP8jrA5ktegUtq/wWIBJPkHs7CtYa/beF9U/NN8BbXzgGguKxIeXK7O
	FOgbNRQiBmFs+bv3hgTv2LNCQ6d1LC+Tz67lAxepCcWE4eCfbcjjHhwSIjlV+cDcvfnvngKrk4y
	+g1hHpb01yVGyswY/0UdvOAHL2Xk2BN5+jP6Z
X-Google-Smtp-Source: AGHT+IFC1hV70GdwEnBYSMEw5AtSUIQOfGxG6NzNrw7FSXz9Yt1Gf2I01rV4anYmdBb92J+07TyO7g==
X-Received: by 2002:a05:6a21:b92:b0:215:d565:3026 with SMTP id adf61e73a8af0-23dc0d637e2mr15104057637.20.1754012826301;
        Thu, 31 Jul 2025 18:47:06 -0700 (PDT)
Received: from localhost.localdomain ([171.254.200.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7b9377sm2514011a12.16.2025.07.31.18.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 18:47:05 -0700 (PDT)
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
Subject: [PATCH v13 4/4] docs: leds: Document TI LP5812 LED driver
Date: Fri,  1 Aug 2025 08:45:11 +0700
Message-Id: <20250801014511.139862-5-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250801014511.139862-1-trannamatk@gmail.com>
References: <20250801014511.139862-1-trannamatk@gmail.com>
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
 Documentation/leds/leds-lp5812.rst | 46 ++++++++++++++++++++++++++++++
 MAINTAINERS                        |  1 +
 3 files changed, 48 insertions(+)
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
index 000000000000..7d464334557c
--- /dev/null
+++ b/Documentation/leds/leds-lp5812.rst
@@ -0,0 +1,46 @@
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
+autonomous animation control. This driver provides sysfs interfaces to
+control and configure the LP5812 device and its LED channels.
+
+Sysfs Interface
+===============
+
+LP5812 device exposes a chip-level sysfs group:
+  /sys/bus/i2c/devices/<i2c-dev-addr>/lp5812_chip_setup/
+
+The following attributes are available at chip level:
+  - dev_config: Configure drive mode and scan order (RW)
+  - sw_reset: Reset the hardware (WO)
+  - fault_clear: Clear any device faults (WO)
+  - tsd_config_status: Read thermal shutdown config status (RO)
+
+Each LED channel is exposed as:
+  /sys/class/leds/led_<id>/
+
+Each LED exposes the following attributes:
+  - activate: Activate or deactivate the LED (WO)
+  - led_current: DC current value (0–255) (WO)
+  - max_current: maximum DC current bit setting (RO)
+  - lod_lsd: lod and lsd fault detected status (RO)
+
+Example Usage
+=============
+
+To control led_A in manual mode::
+    echo "tcmscan:4:0:1:2:3" > /sys/bus/i2c/devices/.../lp5812_chip_setup/dev_config
+    echo 1 1 1 > /sys/class/leds/LED_A/activate
+    echo 100 100 100 > /sys/class/leds/LED_A/led_current
+    echo 50 50 50 > /sys/class/leds/LED_A/multi_intensity
+    echo 255 > /sys/class/leds/LED_A/brightness
diff --git a/MAINTAINERS b/MAINTAINERS
index 608a7f3feb07..42af71c7634d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24830,6 +24830,7 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 F:	Documentation/ABI/testing/sysfs-class-led-lp5812
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/rgb/Kconfig
 F:	drivers/leds/rgb/Makefile
 F:	drivers/leds/rgb/leds-lp5812.c
-- 
2.25.1


