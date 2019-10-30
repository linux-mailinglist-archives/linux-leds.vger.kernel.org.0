Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1D5E98A5
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2019 10:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfJ3JB6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Oct 2019 05:01:58 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35113 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbfJ3JB6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Oct 2019 05:01:58 -0400
Received: by mail-pl1-f194.google.com with SMTP id x6so701569pln.2
        for <linux-leds@vger.kernel.org>; Wed, 30 Oct 2019 02:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=m5azgLhd2I2E3q9JQtIgUVQ0suPVCkYbQEeRBm5oMb8=;
        b=SNIJd0jrHsBMX6/ZKZfmY+w36WI2FQ8qqZCU7AAOSX1m1BH+waTBtt4HsR5Cpitl0M
         qizjCUyqfRXUfN6QTVJOMhqIJjxSn2xIGAaLdkeydUjLLMvQqr564H7wMctcKfSwSKhI
         34pcDje4oDfteKOd0sOIWEPkpGduCiO9uBJes8AEfdXJj//H+RJxVEhKME1VjEfcglcv
         bQtYVMecgFVUuv8CqgXp3WMq/wv1mpqGjiGcc+F8WXGpzrls96q4j9uVNmvQtTjNZqOy
         xRH30D1vP/r22R/QtbgSOmLCKl/U61AlaG9mLcczOCemky44THQcAFq/cMwg0aH4OZ4p
         j7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=m5azgLhd2I2E3q9JQtIgUVQ0suPVCkYbQEeRBm5oMb8=;
        b=ert0LSsR+FEwO2CCUh1f9+D0tNUo5sH5CkRZYlevrgmcNQLI+XXoXaVbH07JVYrRik
         4jpYXQBfb1y3bA1aI2QGODFwfQqW6BE/twLN3/W5WbmjgTPHYbMgboTHZUNDMyQOIxST
         JM9RSJli2HSMge4S4nMc7pFH6FUrcNZcgoTPVpB7ErJ1Jbn24myvikyOguMhhgzGstCf
         bSkR3/cG6B3BLgKBBqtxPRGokeosKoofgKozuKsUDd6dsDH0b0XiaNBedKvksSZ2SXI7
         l/mLdEK6PorHxY4gvwwkVMEwFhsuVzqHQp2cT1v8yKNuuvqV7X8hzCriLIEGi3Y5D2b/
         huOA==
X-Gm-Message-State: APjAAAVf8YStZCpTNVRzsdYGLwYBEUyMgXRXBjSV9ZCABRz2QCuyFl2Y
        jH/cnV1T5JwNbh451jTjRb0k
X-Google-Smtp-Source: APXvYqx1+RxRWncZTcuyUZhz6kgWlf5fD+XfO4AMeFborkT4X05rfAgRFXHGr0HdkiWpGhfJT+G4fg==
X-Received: by 2002:a17:902:d891:: with SMTP id b17mr3445548plz.310.1572426117078;
        Wed, 30 Oct 2019 02:01:57 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:618e:77d9:c9fa:423a:3851:8df4])
        by smtp.gmail.com with ESMTPSA id g24sm2070351pfi.81.2019.10.30.02.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:01:56 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     shawnguo@kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        darshak.patel@einfochips.com, prajose.john@einfochips.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: leds: Document commonly used LED triggers
Date:   Wed, 30 Oct 2019 14:31:21 +0530
Message-Id: <20191030090124.24900-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030090124.24900-1-manivannan.sadhasivam@linaro.org>
References: <20191030090124.24900-1-manivannan.sadhasivam@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This commit documents the LED triggers used commonly in the SoCs. Not
all triggers are documented as some of them are very application specific.
Most of the triggers documented here are currently used in devicetrees
of many SoCs.

Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/leds/common.txt         | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 9fa6f9795d50..2a6806161590 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -55,6 +55,23 @@ Optional properties for child nodes:
      "timer" - LED flashes at a fixed, configurable rate
      "pattern" - LED alters the brightness for the specified duration with one
                  software timer (requires "led-pattern" property)
+     "mmc[N]" - LED indicates [N]th MMC storage activity
+     "flash" - LED indicates camera flash state
+     "torch" - LED indicates camera torch state
+     "audio-mute" - LED indicates audio mute state
+     "audio-micmute" - LED indicates mic mute state
+     "bluetooth-power" - LED indicates bluetooth power state
+     "usb-gadget" - LED indicates USB gadget activity
+     "usb-host" - LED indicates USB host activity
+     "mtd" - LED indicates MTD memory activity
+     "nand-disk" - LED indicates NAND memory activity (deprecated),
+                  in new implementations use "mtd"
+     "disk-read" - LED indicates disk read activity
+     "disk-write" - LED indicates disk write activity
+     "none" - No trigger assigned to the LED. This is the default mode
+              if trigger is absent
+     "cpu" - LED indicates activity of all CPUs
+     "cpu[N]" - LED indicates activity of [N]th CPU
 
 - led-pattern : Array of integers with default pattern for certain triggers.
                 Each trigger may parse this property differently:
-- 
2.17.1

