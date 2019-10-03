Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2167DC99DE
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2019 10:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbfJCI2b (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Oct 2019 04:28:31 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:59904 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfJCI2b (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Oct 2019 04:28:31 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x938SGt5086185;
        Thu, 3 Oct 2019 03:28:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570091296;
        bh=ZEHDwWZtjItO4loUVl/4DVTQMNSpL7iyeLeaFKV6yBI=;
        h=From:To:CC:Subject:Date;
        b=F9r1mbIEv5nYVhtMXq/tihqyGZ223AwTPNqczkOtK87jYm8rOOwIcmZO4a7Vw6R2N
         h+n5OFLt8B2hQR+Ms5qCJ6VU2XHHWGcIyX9350Xer0AK1vPdCnFDYUGBJpREX01me6
         VDMDVnp3MLcVfXyhxGMAPtMrbLUB1V26hTZkSVNs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x938SG2q094622
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 3 Oct 2019 03:28:16 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 03:28:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 03:28:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x938SE6N082784;
        Thu, 3 Oct 2019 03:28:15 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v8 0/5] Add a generic driver for LED-based backlight
Date:   Thu, 3 Oct 2019 10:28:07 +0200
Message-ID: <20191003082812.28491-1-jjhiblot@ti.com>
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

changes in v8:
- use class_find_device_by_of_node() instead of class_find_device()
- renamed devm_led_get() as devm_of_led_get()

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
 drivers/leds/led-class.c                      |  98 ++++++-
 drivers/video/backlight/Kconfig               |   7 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/led_bl.c              | 260 ++++++++++++++++++
 include/linux/leds.h                          |   6 +
 6 files changed, 399 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
 create mode 100644 drivers/video/backlight/led_bl.c

-- 
2.17.1

