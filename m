Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B115D10026
	for <lists+linux-leds@lfdr.de>; Tue, 30 Apr 2019 21:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbfD3TRj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 15:17:39 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35624 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfD3TRe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 15:17:34 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UJHSkh074196;
        Tue, 30 Apr 2019 14:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556651848;
        bh=5Cc46fQGbRle7czY3LeRkwHXtTxFzqcTTn/K9OBcv58=;
        h=From:To:CC:Subject:Date;
        b=pYgLSkW+sp1GglMpokzib4N/eqtYNsoqDrWvs4nM2s7LYm25h75u6kLpA7qpSzee6
         EU4WTg++2vJS61DrGJRsWxRnHSQXZ0qHUlz0HQa5qO6adWfxWFbDHTSewIy5iERq2Q
         8upat44eZfJtCdgY9+Wqyl9qydbJDL0mwCtoGzjA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UJHSlK063079
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 14:17:28 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 14:17:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 14:17:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UJHRl1030878;
        Tue, 30 Apr 2019 14:17:27 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 0/7] LMU Common code intro
Date:   Tue, 30 Apr 2019 14:17:23 -0500
Message-ID: <20190430191730.19450-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

I have added the Reviewed-by for dt bindings as well as made the Kconfig change
pointed out for the common code flag

Dan

Dan Murphy (7):
  dt-bindings: mfd: LMU: Fix lm3632 dt binding example
  dt-bindings: mfd: LMU: Add the ramp up/down property
  dt-bindings: mfd: LMU: Add ti,brightness-resolution
  leds: TI LMU: Add common code for TI LMU devices
  dt-bindings: ti-lmu: Modify dt bindings for the LM3697
  mfd: ti-lmu: Remove support for LM3697
  leds: lm3697: Introduce the lm3697 driver

 .../devicetree/bindings/leds/leds-lm3697.txt  |  73 ++++
 .../devicetree/bindings/mfd/ti-lmu.txt        |  56 ++-
 drivers/leds/Kconfig                          |  15 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/leds-lm3697.c                    | 395 ++++++++++++++++++
 drivers/leds/ti-lmu-led-common.c              | 155 +++++++
 drivers/mfd/Kconfig                           |   2 +-
 drivers/mfd/ti-lmu.c                          |  17 -
 include/linux/mfd/ti-lmu-register.h           |  44 --
 include/linux/mfd/ti-lmu.h                    |   1 -
 include/linux/ti-lmu-led-common.h             |  47 +++
 11 files changed, 712 insertions(+), 95 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
 create mode 100644 drivers/leds/leds-lm3697.c
 create mode 100644 drivers/leds/ti-lmu-led-common.c
 create mode 100644 include/linux/ti-lmu-led-common.h

-- 
2.21.0.5.gaeb582a983

