Return-Path: <linux-leds+bounces-9051-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 60XjMwLiU2pzfwMAu9opvQ
	(envelope-from <linux-leds+bounces-9051-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 20:50:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 231A8745A9A
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 20:50:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alistairbell.org header.s=mail header.b=R56aRzo1;
	dmarc=pass (policy=reject) header.from=alistairbell.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9051-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9051-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD9B830086DE
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 18:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB113B3BE1;
	Sun, 12 Jul 2026 18:50:16 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from alistairbell.org (alistairbell.org [88.208.227.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E973A9D9A
	for <linux-leds@vger.kernel.org>; Sun, 12 Jul 2026 18:50:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783882215; cv=none; b=D/NSGv4hIwLSomwMlbfqaJMN+zWlrHXt7/qWLjZKtKYQuiEznQq/KPhUgrN7fg8qGa3iA1oKQv+aB5y+NezP4Jqy6la/Wk2GxaFJaWuPHvdXamXhXwjLypu3cL4cBK1k0rIN4v/UG2Pnqk26gL+SZMI8/0f0OYWLLPMwXBQ5VLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783882215; c=relaxed/simple;
	bh=+6nX9JhD+UGNxoWDaD7olf9l8ds4+JHBb/+Ck/JRixc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZjbS3jxAK+/1jblhDjq4pZ7/7+LEQxT2M/Fl+Kr8W9RjusP8tAaqvHFO0iLHyss6RP69x3WiNnk1udEL7QdCvlgcpjfoPm+pY9Kq0oivNW76ZX/yvaHmFbYw4vylzi4mQRn9HObhdJKA81gh6bCLDbdrey6mU2dgUfchsktOJgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=alistairbell.org; spf=pass smtp.mailfrom=alistairbell.org; dkim=pass (2048-bit key) header.d=alistairbell.org header.i=@alistairbell.org header.b=R56aRzo1; arc=none smtp.client-ip=88.208.227.103
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alistairbell.org;
	s=mail; t=1783881845;
	bh=+6nX9JhD+UGNxoWDaD7olf9l8ds4+JHBb/+Ck/JRixc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R56aRzo1hNaypgBslLxEeqkZpsZoN02n3F1OqtsXJDQ6kVROrIzCXsD5JUxn4BI9O
	 5GCj/PhKIbMwgCHEVGMIYxhyOXtk018pwO9HCZjFZiXRPvaJD78WGZGhzFHxRwNqdn
	 nHIi7n3vK3ZDHwMbC/W1CTtAK78SinAK/brjSlFSChexELQ7P+seUM/85S9Qh3T/xj
	 2WHHp6ZIsjrQn6GhgVoRIdImqv7DFI7wAGwaRIwKfc6vREpGuC4alxp4+vM3QLrdfs
	 lI8hTSDKvez8UF+BS2GD4I7H0LxkogS8lkjPztCSrtinsWHh9DioSsQVDrsEOfxmOJ
	 R4KJw6djyn1LA==
Received: from localhost (host-78-150-86-125.as13285.net [78.150.86.125])
	by alistairbell.org (Postfix) with ESMTPSA id 1B1564EC8;
	Sun, 12 Jul 2026 18:44:05 +0000 (UTC)
From: Alistair Bell <dev@alistairbell.org>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	Alistair Bell <dev@alistairbell.org>
Subject: [PATCH 2/2] dt-bindings: leds: Add binding for ti,lp5816
Date: Sun, 12 Jul 2026 19:43:18 +0100
Message-ID: <20260712184318.78852-3-dev@alistairbell.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712184318.78852-1-dev@alistairbell.org>
References: <20260712184318.78852-1-dev@alistairbell.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alistairbell.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[alistairbell.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9051-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dev@alistairbell.org,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:dev@alistairbell.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev@alistairbell.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[alistairbell.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 231A8745A9A

Add devicetree binding for Texas Instruments LP5816
4-channel I2C LED device.

Signed-off-by: Alistair Bell <dev@alistairbell.org>
---
 .../ABI/testing/sysfs-class-leds-lp5816       | 123 ++++++++++++++++++
 .../devicetree/bindings/leds/ti,lp5816.yaml   |  45 +++++++
 MAINTAINERS                                   |   2 +
 3 files changed, 170 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-leds-lp5816
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5816.yaml

diff --git a/Documentation/ABI/testing/sysfs-class-leds-lp5816 b/Documentation/ABI/testing/sysfs-class-leds-lp5816
new file mode 100644
index 000000000..2d1fd107a
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-leds-lp5816
@@ -0,0 +1,123 @@
+What: /sys/class/leds/<device>/fade
+Date: July 2026
+KernelVersion: 7.2
+Contact: <dev@alistairbell.org>
+Description:
+	Enables/disables hardware fading of each individual LED and sets transition duration
+	between an old intensity and new intensity
+
+	Format: <enable_red> <enable_green> <enable_blue> <enable_white> <duration>
+
+	Possible values for <enable> are:
+
+	== =======
+	0  disable
+	1  enable
+	== =======
+
+	Disable: The LED intensity will change instantaneous
+	Enable: The LED intensity will transition between the old and new value either
+	linearly or exponentially based on their individual fade_mode over a period
+	specified by <duration>
+
+	Possible values for <duration> are:
+
+	==    =====
+	0     0.00s
+	1     0.05s
+	2     0.10s
+	3     0.15s
+	4     0.20s
+	5     0.25s
+	6     0.30s
+	7     0.35s
+	8     0.40s
+	9     0.45s
+	10    0.50s
+	12    2.00s
+	13    4.00s
+	14    6.00s
+	15    8.00s
+	==    =====
+
+	Reading this attribute returns the current fade configuration in the same
+	format as writing to it
+
+	Example:
+
+		$ echo 0 1 0 1 14 > /sys/class/leds/<device>/fade
+
+		Enables fade for the green and white channels whilst disabling red and blue.
+		Sets the duration to 6.0s
+
+		$ cat /sys/class/leds/<device>/fade
+		0 1 0 1 14
+
+		$ echo 0 1 0 0 > /sys/class/leds/<device>/multi_intensity
+		If the green LED is not already at full intensity you should notice it slowly getting
+		brighter until reaching 100% brightness after 6.0 seconds
+
+	Notes:
+		By default the driver initialises all fade modes to be disabled and a duration
+		of 0.0s
+
+
+What: /sys/class/leds/<device>/fade_mode
+Date: July 2026
+KernelVersion: 7.2
+Contact: <dev@alistairbell.org>
+Description:
+	Sets the fade transition of each individual LED to either linear or exponential
+
+	Format: <mode_red> <mode_green> <mode_blue> <mode_white>
+
+	Possible values for <mode_> are:
+
+	== ===========
+	0  linear
+	1  exponential
+	== ===========
+
+	Linear:
+
+	100% |           x
+	 80% |         x
+	 60% |       x
+	 40% |     x
+	 20% |   x
+	  0% |_____________   Time
+		 0 1 2 3 ... D
+
+	Constant increase/decrease in LED intensity between 0.0s and <duration>
+
+	Exponential:
+
+	100% |
+	 80% |          x
+	 60% |         x
+	 40% |        x
+	 20% |  x x x
+	  0% |_____________   Time
+		 0 1 2 3 ... D
+
+	Initially only a small visible change from the initial intensity then
+	will appear to quickly and smoothly transition to the brightness target
+
+	Example:
+		$ cat /sys/class/leds/<device>/fade_mode
+		0 0 0 0
+
+		Notice the default configuration is all LEDs in linear mode
+
+		$ echo 1 1 0 0 > /sys/class/leds/<device>/fade_mode
+
+		Sets red and green to use exponential mode and blue and white to linear
+
+		$ cat /sys/class/leds/<device>/fade_mode
+		1 1 0 0
+
+		Configuration stored and returned in the same format as was written to
+
+	Note:
+		If /sys/class/leds/<device>/fade is disabled on a specific color this configuration will
+		be saved for when fading is enabled
diff --git a/Documentation/devicetree/bindings/leds/ti,lp5816.yaml b/Documentation/devicetree/bindings/leds/ti,lp5816.yaml
new file mode 100644
index 000000000..d33489c30
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp5816.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lp5816.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments LP5816 4-Channel I2C RGBW LED Driver
+
+maintainers:
+  - Alistair Bell <dev@alistairbell.org>
+
+description: |
+  The LP5816 is a 4-channel I2C interface RGBW LED driver from Texas Instruments.
+  It supports independent control of red, green, blue, and white leds with
+  configurable fade effects and dimming.
+
+properties:
+  compatible:
+    const: ti,lp5816
+    description: |
+      Specifies device as LP5816 and the uses that kernel driver
+
+
+  reg:
+    maxItems: 1
+    description: I2C slave address
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      compatible = "vendor,i2c-controller";
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      led-controller@2c {
+        compatible = "ti,lp5816";
+        reg = <0x2c>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b6a8c812a..5835f929d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26765,6 +26765,8 @@ TEXAS INSTRUMENTS' LP5816 RGBW LED DRIVER
 M:	Alistair Bell <dev@alistairbell.org>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-class-leds-lp5816
+F:	Documentation/devicetree/bindings/leds/ti,lp5816.yaml
 F:	drivers/leds/Kconfig
 F:	drivers/leds/Makefile
 F:	drivers/leds/leds-lp5816.c
-- 
2.54.0


