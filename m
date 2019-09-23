Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B261ABB229
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 12:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439442AbfIWKVJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 06:21:09 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56406 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439439AbfIWKVJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 06:21:09 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NAL3f9016425;
        Mon, 23 Sep 2019 05:21:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569234063;
        bh=3Qp41sFKIRa/fbfqRf8DnT0JKJAM2yq+SpoHtYKTFmI=;
        h=From:To:CC:Subject:Date;
        b=iUbhD99i0OQYiSOhWEY+/Hfuhde+ZtaN/uDW7RCYG6Q4Cs/lor5EB9HSGwjznmYwk
         jb8U2dOxnHokHYv3uQPWDk3clTqSCG/t6p8Puq2Rj5E2G6NnrmLKa1KQzKsYh9oXBf
         7+D9FGbOy6TMHcJBuKaESAA4biK8R19qCNELFhXM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8NAL3kB005967
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 23 Sep 2019 05:21:03 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 23
 Sep 2019 05:21:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 23 Sep 2019 05:20:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NAL222049544;
        Mon, 23 Sep 2019 05:21:03 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <daniel.thompson@linaro.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dmurphy@ti.com>, <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v5 0/3] leds: Add control of the voltage/current regulator to the LED core
Date:   Mon, 23 Sep 2019 12:20:56 +0200
Message-ID: <20190923102059.17818-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series makes it possible for the LED core to manage the power supply
of a LED. It uses the regulator API to disable/enable the power if when the
LED is turned on/off.
This is especially useful in situations where the LED driver/controller is
not supplying the power.
Because updating a regulator state can block, it is always defered to
set_brightness_delayed().

changes in v5:
- fixed build error in led_set_brightness_sync(). Explain the role of
  flush__work()

changes in v4:
- Add a new patch to make led_set_brightness_sync() use
  led_set_brightness_nosleep() and then wait the work to be done
- Rework how the core knows how the regulator needs to be updated.

changes in v3:
- reword device-tree description
- reword commit log
- remove regulator updates from functions used in atomic context. If the
  regulator must be updated, it is defered to a workqueue.
- Fix led_set_brightness_sync() to work with the non-blocking function
  __led_set_brightness()

changes in v2:
- use devm_regulator_get_optional() to avoid using the dummy regulator and
  do some unnecessary work

Jean-Jacques Hiblot (3):
  led: make led_set_brightness_sync() use led_set_brightness_nosleep()
  dt-bindings: leds: document the "power-supply" property
  leds: Add control of the voltage/current regulator to the LED core

 .../devicetree/bindings/leds/common.txt       |  6 ++
 drivers/leds/led-class.c                      | 17 ++++
 drivers/leds/led-core.c                       | 78 +++++++++++++++++--
 drivers/leds/leds.h                           |  3 +
 include/linux/leds.h                          |  5 ++
 5 files changed, 101 insertions(+), 8 deletions(-)

-- 
2.17.1

