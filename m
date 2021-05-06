Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 692E0374FE5
	for <lists+linux-leds@lfdr.de>; Thu,  6 May 2021 09:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbhEFHR6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 6 May 2021 03:17:58 -0400
Received: from mail-m176216.qiye.163.com ([59.111.176.216]:65044 "EHLO
        mail-m176216.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbhEFHR6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 6 May 2021 03:17:58 -0400
X-Greylist: delayed 502 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 May 2021 03:17:57 EDT
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
        by mail-m176216.qiye.163.com (Hmail) with ESMTPA id A73D1C20196;
        Thu,  6 May 2021 15:08:35 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] leds: Fix reference file name of documentation
Date:   Thu,  6 May 2021 15:08:24 +0800
Message-Id: <20210506070824.10965-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQh4aTFYaHxkZGEodH0wfHU1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mwg6STo5Gj8RHkMOQikQOTI2
        KisKCx1VSlVKTUlLSUNPQkpNT0JOVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFISkNINwY+
X-HM-Tid: 0a794081c13dd976kuwsa73d1c20196
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In commit 56b01acc1c79a ("dt-bindings: gpio: fairchild,74hc595:
Convert to json-schema"), gpio-74x164.txt was deleted and replaced
by fairchild,74hc595.yaml. Fix the reference file name.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 Documentation/devicetree/bindings/leds/leds-bcm6328.txt | 4 ++--
 Documentation/devicetree/bindings/leds/leds-bcm6358.txt | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
index ccebce597f37..a555d94084b7 100644
--- a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
+++ b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
@@ -4,8 +4,8 @@ This controller is present on BCM6318, BCM6328, BCM6362 and BCM63268.
 In these SoCs it's possible to control LEDs both as GPIOs or by hardware.
 However, on some devices there are Serial LEDs (LEDs connected to a 74x164
 controller), which can either be controlled by software (exporting the 74x164
-as spi-gpio. See Documentation/devicetree/bindings/gpio/gpio-74x164.txt), or
-by hardware using this driver.
+as spi-gpio. See Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml),
+or by hardware using this driver.
 Some of these Serial LEDs are hardware controlled (e.g. ethernet LEDs) and
 exporting the 74x164 as spi-gpio prevents those LEDs to be hardware
 controlled, so the only chance to keep them working is by using this driver.
diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6358.txt b/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
index da5708e7b43b..6e51c6b91ee5 100644
--- a/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
+++ b/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
@@ -3,7 +3,7 @@ LEDs connected to Broadcom BCM6358 controller
 This controller is present on BCM6358 and BCM6368.
 In these SoCs there are Serial LEDs (LEDs connected to a 74x164 controller),
 which can either be controlled by software (exporting the 74x164 as spi-gpio.
-See Documentation/devicetree/bindings/gpio/gpio-74x164.txt), or
+See Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml), or
 by hardware using this driver.
 
 Required properties:
-- 
2.25.1

