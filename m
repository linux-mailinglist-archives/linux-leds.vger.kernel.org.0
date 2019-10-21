Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D95FDDF486
	for <lists+linux-leds@lfdr.de>; Mon, 21 Oct 2019 19:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729388AbfJURsc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Oct 2019 13:48:32 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45466 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfJURsc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Oct 2019 13:48:32 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9LHmGXT106697;
        Mon, 21 Oct 2019 12:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571680096;
        bh=ZwYCmSJISLlctMkOmdCBQhpfeOM6eOVhv3sn+5wMhWY=;
        h=From:To:CC:Subject:Date;
        b=WpTmVX3Xhx8IEeeRylglfqTlBXR1dRX3Lf0Cr3RbgzlveXErmICtDbjHRcosTYFqw
         3ZNOzzsf80/CR00/DbI5EKzOGBjm42e9w1xCzhw4t+rfghJj4Mv9uh+J6qGqtik84q
         J73ytbBjte0Jwa2EqCJkxUAWYFKO+pP/NQGpCNsQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9LHmGDZ047640
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 21 Oct 2019 12:48:16 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 21
 Oct 2019 12:48:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 21 Oct 2019 12:48:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9LHmEWg111687;
        Mon, 21 Oct 2019 12:48:15 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomi.valkeinen@ti.com>, <jjhiblot@ti.com>
Subject: [PATCH v7 0/2] Subject: [PATCH v7 0/2] leds: Add control of the voltage/current regulator to the LED core
Date:   Mon, 21 Oct 2019 19:47:49 +0200
Message-ID: <20191021174751.4421-1-jjhiblot@ti.com>
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
Because updating a regulator state can block, it is always a defered job.

Note: this series relies on led_cdev->dev->of_node being populated [0]

[0] https://lkml.org/lkml/2019/10/3/139

changes in v7:
- Add sysfs interface to control the auto-off feature

changes in v6:
- Introduce a new property in DT binding to delay turning OFF the regulator
  The idea is to keep the regulator ON for some time after the LED is turned
  off in order to not change the regulator state when the LED is blinking.
- Use an atomic to track the state of the regulator to ensure consistency.
- Remove changes in led_set_brightness_sync().

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

Jean-Jacques Hiblot (2):
  dt-bindings: leds: document the "power-supply" property
  leds: Add control of the voltage/current regulator to the LED core

 .../devicetree/bindings/leds/common.txt       |  14 ++
 drivers/leds/led-class.c                      | 156 +++++++++++++++++-
 drivers/leds/led-core.c                       | 129 ++++++++++++++-
 drivers/leds/leds.h                           |  18 ++
 include/linux/leds.h                          |   9 +
 5 files changed, 318 insertions(+), 8 deletions(-)

-- 
2.17.1

