Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3683489DF
	for <lists+linux-leds@lfdr.de>; Thu, 25 Mar 2021 08:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhCYHLt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Mar 2021 03:11:49 -0400
Received: from us-smtp-delivery-115.mimecast.com ([216.205.24.115]:26711 "EHLO
        us-smtp-delivery-115.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229461AbhCYHLW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 25 Mar 2021 03:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1616656279;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GY3hL0Igk/PO21P0HJNq1kl6Syk9iKbOPoOn09Ag31E=;
        b=nlcVD9iGaIU23rOZs4N8lbGmV9QP+94vpjoNwoMyicq4+lFxWaUcLucGhu/YGvn1rOCHv2
        hv/vr6ptUIrpXym4LeJBD4i+B7iX2tOTgzG4zoTZ7x+ep3zI90VvIbqwWRITvIOkEfG5e7
        VZDXEcG3+hNQjeruT6UKbTtrXN1CoLg=
Received: from mail.maxlinear.com (174-47-1-83.static.ctl.one [174.47.1.83])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-Vz8Diqy3Ns-_LcI79bZQrw-1; Thu, 25 Mar 2021 03:11:18 -0400
X-MC-Unique: Vz8Diqy3Ns-_LcI79bZQrw-1
Received: from sgsxdev001.isng.phoenix.local (10.226.81.111) by
 mail.maxlinear.com (10.23.38.120) with Microsoft SMTP Server id 15.1.2176.2;
 Thu, 25 Mar 2021 00:11:13 -0700
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     <pavel@ucw.cz>
CC:     <arnd@kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kilobyte@angband.pl>,
        <rafael.j.wysocki@intel.com>, <john@phrozen.org>,
        <hmehrtens@maxlinear.com>, <ckim@maxlinear.com>,
        <qwu@maxlinear.com>, Rahul Tanwar <rtanwar@maxlinear.com>
Subject: [PATCH v2 1/1] leds: lgm: Improve Kconfig help
Date:   Thu, 25 Mar 2021 15:11:08 +0800
Message-ID: <468455e66ce27bc731fab08be8aeccedba2ed342.1616655898.git.rtanwar@maxlinear.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1616655898.git.rtanwar@maxlinear.com>
References: <cover.1616655898.git.rtanwar@maxlinear.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA115A51 smtp.mailfrom=rtanwar@maxlinear.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Remove unnecessary Kconfig symbol LEDS_BLINK
Improve Kconfig help text to make it more useful.

Signed-off-by: Rahul Tanwar <rtanwar@maxlinear.com>
---
 drivers/leds/Kconfig              |  5 ++---
 drivers/leds/Makefile             |  2 +-
 drivers/leds/blink/Kconfig        | 28 +++++++++++++---------------
 drivers/leds/blink/Makefile       |  2 +-
 drivers/leds/blink/leds-lgm-sso.c |  4 ++--
 5 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b6742b4231bf..4ca8cd594518 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -928,13 +928,12 @@ config LEDS_ACER_A500
          This option enables support for the Power Button LED of
          Acer Iconia Tab A500.

+source "drivers/leds/blink/Kconfig"
+
 comment "Flash and Torch LED drivers"
 source "drivers/leds/flash/Kconfig"

 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"

-comment "LED Blink"
-source "drivers/leds/blink/Kconfig"
-
 endif # NEW_LEDS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2a698df9da57..7e604d3028c8 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -110,4 +110,4 @@ obj-$(CONFIG_LEDS_CLASS_FLASH)              +=3D flash/
 obj-$(CONFIG_LEDS_TRIGGERS)            +=3D trigger/

 # LED Blink
-obj-$(CONFIG_LEDS_BLINK)                +=3D blink/
+obj-y                                  +=3D blink/
diff --git a/drivers/leds/blink/Kconfig b/drivers/leds/blink/Kconfig
index 6dedc58c47b3..8a11f9acd1a7 100644
--- a/drivers/leds/blink/Kconfig
+++ b/drivers/leds/blink/Kconfig
@@ -1,21 +1,19 @@
-menuconfig LEDS_BLINK
-       bool "LED Blink support"
-       depends on LEDS_CLASS
-       help
-         This option enables blink support for the leds class.
-         If unsure, say Y.
-
-if LEDS_BLINK
-
-config LEDS_BLINK_LGM
-       tristate "LED support for Intel LGM SoC series"
+config LEDS_LGM
+       tristate "LED support for LGM SoC series"
        depends on GPIOLIB
        depends on LEDS_CLASS
        depends on MFD_SYSCON
        depends on OF
        help
-         Parallel to serial conversion, which is also called SSO controlle=
r,
-         can drive external shift register for LED outputs.
-         This enables LED support for Serial Shift Output controller(SSO).
+         This option enables support for LEDs connected to GPIO lines on
+         Lightning Mountain (LGM) SoC. Lightning Mountain is a AnyWAN
+         gateway-on-a-chip SoC to be shipped on mid and high end home
+         gateways and routers.
+
+         These LEDs are driven by a Serial Shift Output (SSO) controller.
+         The driver supports hardware blinking and the LEDs can be configu=
red
+         to be triggered by software/CPU or by hardware.

-endif # LEDS_BLINK
+         Say 'Y' here if you are working on LGM SoC based platform. Otherw=
ise,
+         say 'N'. To compile this driver as a module, choose M here: the m=
odule
+         will be called leds-lgm-sso.
diff --git a/drivers/leds/blink/Makefile b/drivers/leds/blink/Makefile
index 2fa6c7b7b67e..fa5d04dccf13 100644
--- a/drivers/leds/blink/Makefile
+++ b/drivers/leds/blink/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_LEDS_BLINK_LGM)   +=3D leds-lgm-sso.o
+obj-$(CONFIG_LEDS_LGM) +=3D leds-lgm-sso.o
diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lg=
m-sso.c
index 7d5c9ca007d6..e78792c90117 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Intel Lightning Mountain SoC LED Serial Shift Output Controller driver
+ * Lightning Mountain SoC LED Serial Shift Output Controller driver
  *
- * Copyright (c) 2020 Intel Corporation.
+ * Copyright (c) 2021 Intel Corporation.
  */

 #include <linux/bitfield.h>
--
2.17.1

________________________________

This electronic mail (including any attachments) may contain information th=
at is privileged, confidential, and/or otherwise protected from disclosure =
to anyone other than its intended recipient(s). Any dissemination or use of=
 this electronic mail or its contents (including any attachments) by person=
s other than the intended recipient(s) is strictly prohibited. If you have =
received this message in error, please notify us immediately by reply e-mai=
l so that we may correct our internal records. Please then delete the origi=
nal message (including any attachments) in its entirety.

