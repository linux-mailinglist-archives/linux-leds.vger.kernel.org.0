Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 139CC5BF7B
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2019 17:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbfGAPPY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jul 2019 11:15:24 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36186 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730177AbfGAPOg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jul 2019 11:14:36 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61FERSA124727;
        Mon, 1 Jul 2019 10:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561994067;
        bh=8ZPMCskt8nRAXKm5rMG8eKdJwKab0ooefSSXjtYKA2w=;
        h=From:To:CC:Subject:Date;
        b=ecku1xWwcUY7k8zzijG0i0WVvjwfg/wYTo2GTb9ZFGj6PV7Ajm8qroD90sHlLA56C
         7bxb8XMqaZ5WJ0i73T+LXITf5/9cU0yq7EUMNV1kJeGHvN5NiSpYDA0kyPGXNDTYv/
         LzJPN0hog0Ni5E2XCZb+4RJbVpl6qwimqMqG6bUw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61FERJW055541
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 1 Jul 2019 10:14:27 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 10:14:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 10:14:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61FEQDs043919;
        Mon, 1 Jul 2019 10:14:26 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH 0/4] Add a generic driver for LED-based backlight
Date:   Mon, 1 Jul 2019 17:14:19 +0200
Message-ID: <20190701151423.30768-1-jjhiblot@ti.com>
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

This series takes it from there and implements the binding that was
discussed in https://patchwork.kernel.org/patch/7293991/. In this new
binding the backlight device is a child of the LED controller instead of
being another platform device that uses a phandle to reference a LED.

Jean-Jacques Hiblot (2):
  leds: of: create a child device if the LED node contains a
    "compatible" string
  devicetree: Update led binding

Tomi Valkeinen (2):
  backlight: add led-backlight driver
  devicetree: Add led-backlight binding

 .../devicetree/bindings/leds/common.txt       |   3 +
 .../video/backlight/led-backlight.txt         |  39 ++++
 drivers/leds/led-class.c                      |  16 ++
 drivers/video/backlight/Kconfig               |   7 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/led_bl.c              | 217 ++++++++++++++++++
 include/linux/leds.h                          |  11 +
 7 files changed, 294 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/backlight/led-backlight.txt
 create mode 100644 drivers/video/backlight/led_bl.c

-- 
2.17.1

