Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 726751543F
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 21:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbfEFTQY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 15:16:24 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60786 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfEFTQX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 15:16:23 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x46JG9Mx033100;
        Mon, 6 May 2019 14:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557170169;
        bh=fSCI3Xo/8gpQuK8AZ4vjT1KevGt34HUjLaa0gLu2rvY=;
        h=From:To:CC:Subject:Date;
        b=xxAg3lmL8t9Y21ALVkPt3azo4Hitd18Cp+187ZcMM1X68ztQR6y7eYD+t0ou4QxdS
         MiMtCsLxvyC37iANy+QgPo44NWUzaS0bA1sPXYqgMRKskeq0f6QzV8zxzp6prDosDh
         DpDeipdZiiLEOtBnq5p0fszvdzBH/ep7pjwKb0Lc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x46JG9W0074952
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 6 May 2019 14:16:09 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 6 May
 2019 14:16:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 6 May 2019 14:16:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x46JG84h002029;
        Mon, 6 May 2019 14:16:08 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <lee.jones@linaro.org>, <rdunlap@infradead.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 0/7] LMU Rework
Date:   Mon, 6 May 2019 14:16:07 -0500
Message-ID: <20190506191614.25051-1-dmurphy@ti.com>
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

With this series there was an offline discussion that the filename of the LED
portion of the driver did not adhere to the directory file naming convention so
the file name has been changed

ti-lmu-led-common.c->leds-ti-lmu-common.c
ti-lmu-led-common.h->leds-ti-lmu-common.h

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
 .../devicetree/bindings/mfd/ti-lmu.txt        |  58 ++-
 drivers/leds/Kconfig                          |  15 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/leds-lm3697.c                    | 395 ++++++++++++++++++
 drivers/leds/leds-ti-lmu-common.c             | 156 +++++++
 drivers/mfd/Kconfig                           |   2 +-
 drivers/mfd/ti-lmu.c                          |  17 -
 include/linux/leds-ti-lmu-common.h            |  47 +++
 include/linux/mfd/ti-lmu-register.h           |  44 --
 include/linux/mfd/ti-lmu.h                    |   1 -
 11 files changed, 714 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
 create mode 100644 drivers/leds/leds-lm3697.c
 create mode 100644 drivers/leds/leds-ti-lmu-common.c
 create mode 100644 include/linux/leds-ti-lmu-common.h

-- 
2.21.0.5.gaeb582a983

