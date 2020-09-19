Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF2942710F3
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 00:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgISWPx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 18:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgISWPx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 18:15:53 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16548C0613CE;
        Sat, 19 Sep 2020 15:15:52 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 5A00A140925;
        Sun, 20 Sep 2020 00:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600553749; bh=zCbpIM/C4TLd7NaidOQ92vSkSL8MTP7HW502znmDqcE=;
        h=From:To:Date;
        b=M+YV9S1lx1aeX/qUFLBHxb6+4fmWRQQ1JJpCisjFf5kH3RcScov34gpsJAssT114w
         Wye+CM+hQzE9ZWdWkU++pzUVGZQHVzgm8lCIzg2f5SgvF0q7BGFgPQ+2XtUmetRU0J
         11JNGPwYTvV/a11/MgrROdYkM5Wo5U15tCjdbIC4=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Adam Ford <aford173@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH leds + devicetree 00/13] leds: tca6507 cleanup
Date:   Sun, 20 Sep 2020 00:15:35 +0200
Message-Id: <20200919221548.29984-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
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

Hi Pavel,

this is a cleanup of tca6507 LED driver.

This series applies on your for-next, but:
- the last patch should be added only after LED core parses
  `linux,default-trigger` property
- there is DT binding change and device tree change, I am not sure
  who should apply those patches

Mainly we are getting rid of platform data, but also a potential bug is
being fixed and bindings are DT being aligned.

Marek

Cc: NeilBrown <neilb@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Adam Ford <aford173@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org

Marek Behún (13):
  leds: tca6507: Absorb platform data
  leds: tca6507: use fwnode API instead of OF
  dt-bindings: leds: tca6507: convert to YAML
  ARM: dts: omap3: gta04: rename LED controlled subnodes
  leds: tca6507: do not set GPIO names
  leds: tca6507: cosmetic change: use helper variable
  leds: tca6507: register LEDs and GPIOs immediately after parsing
  leds: tca6507: remove binding comment
  leds: tca6507: use devres for LED and gpiochip registration
  leds: tca6507: let gpiolib set gpiochip's of_node
  leds: tca6507: fail on reg value conflict
  leds: tca6507: set registers to zero before LEDs/GPIOs registration
  leds: tca6507: use struct led_init_data when registering

 .../devicetree/bindings/leds/tca6507.txt      |  49 ----
 .../devicetree/bindings/leds/ti,tca6507.yaml  | 134 ++++++++++
 arch/arm/boot/dts/omap3-gta04.dtsi            |  12 +-
 drivers/leds/leds-tca6507.c                   | 234 ++++++------------
 include/linux/leds-tca6507.h                  |  21 --
 5 files changed, 217 insertions(+), 233 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/tca6507.txt
 create mode 100644 Documentation/devicetree/bindings/leds/ti,tca6507.yaml
 delete mode 100644 include/linux/leds-tca6507.h


base-commit: a0e550dc351ab5fabe8ea86e45b974494a0a6bf8
-- 
2.26.2

