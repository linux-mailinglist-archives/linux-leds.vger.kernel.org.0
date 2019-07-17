Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8731C6BDBD
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jul 2019 16:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfGQOAA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jul 2019 10:00:00 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37350 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfGQOAA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jul 2019 10:00:00 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6HDxqSk062883;
        Wed, 17 Jul 2019 08:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563371992;
        bh=XbfWttQsD9HxjUDBssZl8Yh4lE+MdlmkC8ZSKN0ubjI=;
        h=From:To:CC:Subject:Date;
        b=u/wqkh9r280mzTDCWrrmUqWC9Xqq7FIa+nryqf62hRieZntb5ITucSR84049lMBQA
         Os7pzsTXBvgq0khbrOeYDLFAzTFyovVWkuwRPkq1Yz+rdVOZMOwanrrstTlRxLcnXr
         KPZAHtzfTa42+zAnf9EmBOv+9xYBtQHD0pV22Obg=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6HDxqO8108183
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 17 Jul 2019 08:59:52 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 17
 Jul 2019 08:59:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 17 Jul 2019 08:59:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6HDxpQb069975;
        Wed, 17 Jul 2019 08:59:52 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v3 0/3] leds: Add control of the voltage/current regulator to the LED core
Date:   Wed, 17 Jul 2019 15:59:45 +0200
Message-ID: <20190717135948.19340-1-jjhiblot@ti.com>
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

While at it, throw in a fix for led_set_brightness_sync() so that it can
work with drivers that don't provide brightness_set_blocking()

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
  dt-bindings: leds: document the "power-supply" property
  leds: Add control of the voltage/current regulator to the LED core
  leds: Make led_set_brightness_sync() also use __led_set_brightness()

 .../devicetree/bindings/leds/common.txt       |  4 ++
 drivers/leds/led-class.c                      | 15 ++++++
 drivers/leds/led-core.c                       | 53 +++++++++++++++++--
 drivers/leds/leds.h                           |  1 +
 include/linux/leds.h                          |  4 ++
 5 files changed, 73 insertions(+), 4 deletions(-)

-- 
2.17.1

