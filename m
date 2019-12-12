Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD6E11C3F6
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 04:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727595AbfLLDkA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Dec 2019 22:40:00 -0500
Received: from mx2.suse.de ([195.135.220.15]:58492 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726771AbfLLDj7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Dec 2019 22:39:59 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 665FAAD7B;
        Thu, 12 Dec 2019 03:39:57 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [RFC 03/25] arm64: dts: realtek: rtd1295: Add Xnano X5
Date:   Thu, 12 Dec 2019 04:39:30 +0100
Message-Id: <20191212033952.5967-4-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191212033952.5967-1-afaerber@suse.de>
References: <20191212033952.5967-1-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The Xnano X5 is an OTT TV Box.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/arm64/boot/dts/realtek/Makefile             |  1 +
 arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts | 30 ++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts

diff --git a/arch/arm64/boot/dts/realtek/Makefile b/arch/arm64/boot/dts/realtek/Makefile
index 54bd02d11c02..ef8d8fcbaa05 100644
--- a/arch/arm64/boot/dts/realtek/Makefile
+++ b/arch/arm64/boot/dts/realtek/Makefile
@@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_REALTEK) += rtd1293-ds418j.dtb
 
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-mele-v9.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-probox2-ava.dtb
+dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-xnano-x5.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-zidoo-x9s.dtb
 
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1296-ds418.dtb
diff --git a/arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts b/arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts
new file mode 100644
index 000000000000..d7878ff942e6
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1295-xnano-x5.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (c) 2017-2019 Andreas Färber
+ */
+
+/dts-v1/;
+
+#include "rtd1295.dtsi"
+
+/ {
+	compatible = "xnano,x5", "realtek,rtd1295";
+	model = "Xnano X5";
+
+	memory@1f000 {
+		device_type = "memory";
+		reg = <0x1f000 0x3ffe1000>; /* boot ROM to 1 GiB or 2 GiB */
+	};
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.16.4

