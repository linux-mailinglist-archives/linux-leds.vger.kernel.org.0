Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00A6BB6691
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 16:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731492AbfIRO5u (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 10:57:50 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:59140 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731432AbfIRO5u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Sep 2019 10:57:50 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IEvf7G030885;
        Wed, 18 Sep 2019 09:57:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568818661;
        bh=YZMQQ9rDqkdsxQjmsPw71m3JOMBZg+cqKmNu/NVV8jw=;
        h=From:To:CC:Subject:Date;
        b=HHQRgiBrlOd3HrxDcN/lDislCD07wT5VqZdN5uW3bCMkC7y/DGgGAeQKs5KbRxTH4
         8dUlqPQlM3/FJLEeiInZkk1XXo6RNaLODKtX7xOTPEJEz93pBGtPGHwAIjdxyohVg/
         6PmNHCKxui18FvXyCrXeihhwaxslA6fzDbdxciJc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8IEvfLS003149
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Sep 2019 09:57:41 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 18
 Sep 2019 09:57:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 18 Sep 2019 09:57:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IEvdlH012783;
        Wed, 18 Sep 2019 09:57:40 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, <jjhiblot@ti.com>
Subject: [PATCH v7 0/5] Add a generic driver for LED-based backlight
Date:   Wed, 18 Sep 2019 16:57:25 +0200
Message-ID: <20190918145730.22805-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series aims to add a led-backlight driver, similar to pwm-backlight,
but using a LED class device underneath.

A few years ago (2015), Tomi Valkeinen posted a series implementing a
backlight driver on top of a LED device:
https://patchwork.kernel.org/patch/7293991/
https://patchwork.kernel.org/patch/7294001/
https://patchwork.kernel.org/patch/7293981/

The discussion stopped because Tomi lacked the time to work on it.

changes in v7:
- rebased on top of linux-leds/for-next
- populate the of_node member of the LED device if fwnode is a of_node
  (this is a new patch and the first of the series).
- devm_led_get() works only when the device tree is used. Add a few checks
  for that.  

changes in v6:
- trim the list of included headers
- remove useless definition of BKL_FULL_BRIGHTNESS

changes in v5:
- removed LED brightness scaling
- disable sysfs the interface of the LEDs when used by the backlight device

changes in v4:
- fix dev_err() messages and commit logs following the advices of Pavel
- cosmetic changes (indents, getting rid of  "? 1 : 0" in
  led_match_led_node())

changes in v3:
- dt binding: don't limit the brightness range to 0-255. Use the range of
  the underlying LEDs. as a side-effect, all LEDs must now have the same
  range
- driver: Adapt to dt binding update.
- driver: rework probe() for clarity and remove the remaining goto.

changes in v2:
- handle more than one LED.
- don't make the backlight device a child of the LED controller.
- make brightness-levels and default-brightness-level optional
- removed the option to use a GPIO enable.
- removed the option to use a regulator. It should be handled by the LED
  core
- don't make any change to the LED core (not needed anymore)

Jean-Jacques Hiblot (3):
  leds: populate the device's of_node when possible
  leds: Add managed API to get a LED from a device driver
  dt-bindings: backlight: Add led-backlight binding

Tomi Valkeinen (2):
  leds: Add of_led_get() and led_put()
  backlight: add led-backlight driver

 .../bindings/leds/backlight/led-backlight.txt |  28 ++
 drivers/leds/led-class.c                      | 106 ++++++-
 drivers/video/backlight/Kconfig               |   7 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/led_bl.c              | 260 ++++++++++++++++++
 include/linux/leds.h                          |   6 +
 6 files changed, 407 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
 create mode 100644 drivers/video/backlight/led_bl.c

-- 
2.17.1

