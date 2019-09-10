Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA78AE8BD
	for <lists+linux-leds@lfdr.de>; Tue, 10 Sep 2019 13:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390407AbfIJLAC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Sep 2019 07:00:02 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37066 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfIJLAC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Sep 2019 07:00:02 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8AAxqB3120291;
        Tue, 10 Sep 2019 05:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568113192;
        bh=tCs+ZjIyQkDzrb2FMt+l1fPEknxKowmXyWf2qmXDAm0=;
        h=From:To:CC:Subject:Date;
        b=lcNXj1GZsqgh0aDzUt1fuLe8sfgcApRou61xmZSimuShpfT2NURbgaU0jMkXcMyKo
         hhAqVKYADDdL8P7i+diGyR/tBJcrfnCyuJRgwGD4/WhO2kFQlaXbMupZb2SlrjZlpS
         aRKsJMM2eYbmiW8ChQF0sRhNev9wKHU4qRaWNoX8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8AAxqph038243
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 10 Sep 2019 05:59:52 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 10
 Sep 2019 05:59:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 10 Sep 2019 05:59:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AAxpYh018214;
        Tue, 10 Sep 2019 05:59:51 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dridevel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v5 0/4] Add a generic driver for LED-based backlight
Date:   Tue, 10 Sep 2019 12:59:42 +0200
Message-ID: <20190910105946.23057-1-jjhiblot@ti.com>
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


Jean-Jacques Hiblot (2):
  leds: Add managed API to get a LED from a device driver
  dt-bindings: backlight: Add led-backlight binding

Tomi Valkeinen (2):
  leds: Add of_led_get() and led_put()
  backlight: add led-backlight driver

 .../bindings/leds/backlight/led-backlight.txt |  28 ++
 drivers/leds/led-class.c                      |  92 ++++++
 drivers/video/backlight/Kconfig               |   7 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/led_bl.c              | 264 ++++++++++++++++++
 include/linux/leds.h                          |   6 +
 6 files changed, 398 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
 create mode 100644 drivers/video/backlight/led_bl.c

-- 
2.17.1

