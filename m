Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 338F233D50A
	for <lists+linux-leds@lfdr.de>; Tue, 16 Mar 2021 14:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235285AbhCPNkU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Mar 2021 09:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235302AbhCPNjv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 16 Mar 2021 09:39:51 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B1FC06174A
        for <linux-leds@vger.kernel.org>; Tue, 16 Mar 2021 06:39:50 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b1e0:9434:c5b6:aecd])
        by albert.telenet-ops.be with bizsmtp
        id h1fo240070UTkXy061fo6Q; Tue, 16 Mar 2021 14:39:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lM9vH-0088S6-Lx; Tue, 16 Mar 2021 14:39:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lM9vH-009yMt-1j; Tue, 16 Mar 2021 14:39:47 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] leds: LEDS_BLINK_LGM should depend on X86
Date:   Tue, 16 Mar 2021 14:39:46 +0100
Message-Id: <20210316133946.2376963-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The Intel Lightning Mountain (LGM) Serial Shift Output controller (SSO)
is only present on Intel Lightning Mountain SoCs.  Hence add a
dependency on X86, to prevent asking the user about this driver when
configuring a kernel without Intel Lightning Mountain platform support.

While at it, merge the other dependencies into a single statement.

Fixes: c3987cd2bca34ddf ("leds: lgm: Add LED controller driver for LGM SoC")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/leds/blink/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/blink/Kconfig b/drivers/leds/blink/Kconfig
index 6dedc58c47b3ea16..852e634002cda7cf 100644
--- a/drivers/leds/blink/Kconfig
+++ b/drivers/leds/blink/Kconfig
@@ -9,10 +9,8 @@ if LEDS_BLINK
 
 config LEDS_BLINK_LGM
 	tristate "LED support for Intel LGM SoC series"
-	depends on GPIOLIB
-	depends on LEDS_CLASS
-	depends on MFD_SYSCON
-	depends on OF
+	depends on X86 || COMPILE_TEST
+	depends on GPIOLIB && LEDS_CLASS && MFD_SYSCON && OF
 	help
 	  Parallel to serial conversion, which is also called SSO controller,
 	  can drive external shift register for LED outputs.
-- 
2.25.1

