Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14BB421D935
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 16:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730172AbgGMOva (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 10:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729659AbgGMOv1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2020 10:51:27 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A09CC061755;
        Mon, 13 Jul 2020 07:51:27 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 2AAAEBC09E;
        Mon, 13 Jul 2020 14:51:24 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] leds: Replace HTTP links with HTTPS ones
Date:   Mon, 13 Jul 2020 16:51:15 +0200
Message-Id: <20200713145115.35121-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++++
X-Spam-Level: ******
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
X-Spam: Yes
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not just HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 Documentation/devicetree/bindings/leds/leds-lm3532.txt  | 2 +-
 Documentation/devicetree/bindings/leds/leds-lm3601x.txt | 4 ++--
 Documentation/devicetree/bindings/leds/leds-lm36274.txt | 2 +-
 Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 2 +-
 Documentation/devicetree/bindings/leds/leds-lm3697.txt  | 2 +-
 Documentation/devicetree/bindings/leds/leds-lp8860.txt  | 2 +-
 drivers/leds/leds-lm3532.c                              | 4 ++--
 drivers/leds/leds-lm3601x.c                             | 2 +-
 drivers/leds/leds-lm36274.c                             | 2 +-
 drivers/leds/leds-lm3692x.c                             | 2 +-
 drivers/leds/leds-lm3697.c                              | 2 +-
 11 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3532.txt b/Documentation/devicetree/bindings/leds/leds-lm3532.txt
index 53793213dd52..097490a5ff91 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm3532.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm3532.txt
@@ -102,4 +102,4 @@ led-controller@38 {
 };
 
 For more product information please see the links below:
-http://www.ti.com/product/LM3532
+https://www.ti.com/product/LM3532
diff --git a/Documentation/devicetree/bindings/leds/leds-lm3601x.txt b/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
index 095dafb6ec7f..17e940025dc2 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
@@ -47,5 +47,5 @@ led-controller@64 {
 }
 
 For more product information please see the links below:
-http://www.ti.com/product/LM36010
-http://www.ti.com/product/LM36011
+https://www.ti.com/product/LM36010
+https://www.ti.com/product/LM36011
diff --git a/Documentation/devicetree/bindings/leds/leds-lm36274.txt b/Documentation/devicetree/bindings/leds/leds-lm36274.txt
index 39c230d59a4d..de6f4931fb31 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm36274.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm36274.txt
@@ -82,4 +82,4 @@ lm36274@11 {
 };
 
 For more product information please see the link below:
-http://www.ti.com/lit/ds/symlink/lm36274.pdf
+https://www.ti.com/lit/ds/symlink/lm36274.pdf
diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
index 501468aa4d38..b1103d961d6c 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
@@ -62,4 +62,4 @@ led-controller@36 {
 }
 
 For more product information please see the link below:
-http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
+https://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
diff --git a/Documentation/devicetree/bindings/leds/leds-lm3697.txt b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
index 63992d732959..221b37b6049b 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm3697.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
@@ -70,4 +70,4 @@ led-controller@36 {
 }
 
 For more product information please see the link below:
-http://www.ti.com/lit/ds/symlink/lm3697.pdf
+https://www.ti.com/lit/ds/symlink/lm3697.pdf
diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
index 9863220db4ba..8bb25749a3da 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
@@ -47,4 +47,4 @@ led-controller@2d {
 }
 
 For more product information please see the link below:
-http://www.ti.com/product/lp8860-q1
+https://www.ti.com/product/lp8860-q1
diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index aa9bf8cda673..946ad67eaecb 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // TI LM3532 LED driver
-// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
-// http://www.ti.com/lit/ds/symlink/lm3532.pdf
+// Copyright (C) 2019 Texas Instruments Incorporated - https://www.ti.com/
+// https://www.ti.com/lit/ds/symlink/lm3532.pdf
 
 #include <linux/i2c.h>
 #include <linux/leds.h>
diff --git a/drivers/leds/leds-lm3601x.c b/drivers/leds/leds-lm3601x.c
index fce89f2a2d92..d0e1d4814042 100644
--- a/drivers/leds/leds-lm3601x.c
+++ b/drivers/leds/leds-lm3601x.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Flash and torch driver for Texas Instruments LM3601X LED
 // Flash driver chip family
-// Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+// Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
 
 #include <linux/delay.h>
 #include <linux/i2c.h>
diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index 836b60c9a2b8..59360482e7ba 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // TI LM36274 LED chip family driver
-// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+// Copyright (C) 2019 Texas Instruments Incorporated - https://www.ti.com/
 
 #include <linux/bitops.h>
 #include <linux/device.h>
diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 28a51aeb28de..e1e2d2b64a56 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // TI LM3692x LED chip family driver
-// Copyright (C) 2017-18 Texas Instruments Incorporated - http://www.ti.com/
+// Copyright (C) 2017-18 Texas Instruments Incorporated - https://www.ti.com/
 
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 872d26f9706a..024983088d59 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // TI LM3697 LED chip family driver
-// Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+// Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
 
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
-- 
2.27.0

