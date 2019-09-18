Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 946E3B6707
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 17:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbfIRP0N (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 11:26:13 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57182 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbfIRP0N (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Sep 2019 11:26:13 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IFQ9JG121562;
        Wed, 18 Sep 2019 10:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568820369;
        bh=SFlBMSb3x783E4jty7qQwLL/6wBoBuWi+kOKaDtnFtw=;
        h=From:To:CC:Subject:Date;
        b=ojwPknxPFl/s3Rb98N2sqxnU5+I/AfrDmEg60oQ6J4u4aDtVDFhvGUcDcK7NHJVni
         ofvXBC/DGijm/yb1N3QwPv8JQOb/VQq2fSBGGTMzl9fz/Wjxm5dVsKrWy/pxvikPyk
         QjShmAXwC8uIyL6MFBy8QNApaFaFjzRtuSNBZppg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8IFQ9dw038121
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Sep 2019 10:26:09 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 18
 Sep 2019 10:26:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 18 Sep 2019 10:26:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IFQ8CY051498;
        Wed, 18 Sep 2019 10:26:08 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <dmurphy@ti.com>
CC:     <tomi.valkeinen@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v3 0/2] leds: tlc591xx: switch to managed LED registration
Date:   Wed, 18 Sep 2019 17:25:54 +0200
Message-ID: <20190918152556.9925-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This subject of this series used to be "leds: tlc591xx: switch to OF and
managed API"

This mini-series updates the tlc591xx driver to use the managed API. The
driver is also modified to pass the initialization data to the LED core
layer. The goal is to be able to the generic led-backlight [0] driver on
top of it.

changes in v3:
- rebased on top of linux-leds/for-next
- use devm_led_classdev_register_ext() instead of the late
  devm_of_led_classdev_register()
- let the LED core assign the names of the LEDs

changes in v2:
- fixed LED indexing. Previous version did not allow for holes: if n LEDs
  were used, they had to be led(0) to led(n-1)

[0]: https://patchwork.kernel.org/project/dri-devel/list/?series=175709

Jean-Jacques Hiblot (2):
  leds: tlc591xx: simplify driver by using the managed led API
  leds: tlc591xx: use devm_led_classdev_register_ext()

 drivers/leds/leds-tlc591xx.c | 83 ++++++++++--------------------------
 1 file changed, 23 insertions(+), 60 deletions(-)

-- 
2.17.1

