Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 627EE2710F6
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 00:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgISWPy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 18:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbgISWPy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 18:15:54 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C46A4C0613CF
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 15:15:53 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 1AC77140A8B;
        Sun, 20 Sep 2020 00:15:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600553751; bh=THU05AS8cM8S66T0HM2dKmIyx2xbBNwDT60pTXBwSK0=;
        h=From:To:Date;
        b=mNMB3a9vj0iCXkHgCm2Jao/o2dGiuD8aLJjPUEIpRDm5GoSrRUZreLDvLjO+LAUne
         TQnFHC0C6cZ5tt0TOUAEwKW71XIPi3sGsGXWcAU/qGLbauuaLXDjU3VC4KP7lpBaMW
         88EyrgAWc2rZVAUT69v4dItAi1mBbPr6VmX1XPYQ=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH leds + devicetree 08/13] leds: tca6507: remove binding comment
Date:   Sun, 20 Sep 2020 00:15:43 +0200
Message-Id: <20200919221548.29984-9-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919221548.29984-1-marek.behun@nic.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Remove the binding comment at the beginning. The information for
platdata is now obsolete and DT binding is documented in device-tree
bindings.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: NeilBrown <neilb@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/leds/leds-tca6507.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index e9c7c19481702..03858b61c7af1 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -69,23 +69,6 @@
  * defaulted.  Similarly the banks know if each time was explicit or a
  * default.  Defaults are permitted to be changed freely - they are
  * not recognised when matching.
- *
- *
- * An led-tca6507 device must be provided with platform data or
- * configured via devicetree.
- *
- * The platform-data lists for each output: the name, default trigger,
- * and whether the signal is being used as a GPIO rather than an LED.
- * 'struct led_plaform_data' is used for this.  If 'name' is NULL, the
- * output isn't used.  If 'flags' is TCA6507_MAKE_GPIO, the output is
- * a GPO.  The "struct led_platform_data" can be embedded in a "struct
- * tca6507_platform_data" which adds a 'gpio_base' for the GPIOs, and
- * a 'setup' callback which is called once the GPIOs are available.
- *
- * When configured via devicetree there is one child for each output.
- * The "reg" determines the output number and "compatible" determines
- * whether it is an LED or a GPIO.  "linux,default-trigger" can set a
- * default trigger.
  */
 
 #include <linux/module.h>
-- 
2.26.2

