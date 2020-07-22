Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B99229B6B
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jul 2020 17:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732709AbgGVPcJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Jul 2020 11:32:09 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44564 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727985AbgGVPcI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jul 2020 11:32:08 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06MFVquY011789;
        Wed, 22 Jul 2020 10:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595431912;
        bh=R7Oa65f2HhKPSlBuczqXsfDjkDfALVHkd5h98zrQVsU=;
        h=From:To:CC:Subject:Date;
        b=qCiF/viGmpafrY1AvL3rojzLq/hXbnEjxyGQR6F2VlerEECn3/+Sqwhb1dEq9D1GM
         vcJvkvCGO/L78xLWtiS1K4k5tM+5iZLvJpvYYrjG77JPF7QxZv0Yv3cjeGPfa6XSOW
         Em9QhYK2/+jrqbbWPATA7QvfgIW8MBkeV/fDGR5s=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06MFVqZk065232
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Jul 2020 10:31:52 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 22
 Jul 2020 10:31:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 22 Jul 2020 10:31:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06MFVq7r115650;
        Wed, 22 Jul 2020 10:31:52 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <marek.behun@nic.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v32 0/6] Multicolor Framework v32
Date:   Wed, 22 Jul 2020 10:31:40 -0500
Message-ID: <20200722153146.8767-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

This is the remaining patches in the multicolor framework series.  Only the
LP50xx driver has been updated per the review comment here

https://lore.kernel.org/patchwork/patch/1274070/

In addition to these fixes fixes for the enable/disable and reset functions have
also been updated.

Summary:
Converted links from http->https
Fixed comment style
Fixed enable/disable function
Refactored probe_dt code
Fixed checkpatch style issues
Fixed issues when building with W=1 C=1


Dan Murphy (6):
  dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
  leds: lp50xx: Add the LP50XX family of the RGB LED driver
  ARM: defconfig: u8500: Add LP55XX_COMMON config flag
  ARM: dts: n900: Add reg property to the LP5523 channel node
  ARM: dts: imx6dl-yapp4: Add reg property to the lp5562 channel node
  ARM: dts: ste-href: Add reg property to the LP5521 channel nodes

 .../devicetree/bindings/leds/leds-lp50xx.yaml | 130 +++
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi    |  14 +-
 arch/arm/boot/dts/omap3-n900.dts              |  29 +-
 arch/arm/boot/dts/ste-href.dtsi               |  22 +-
 arch/arm/configs/u8500_defconfig              |   1 +
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-lp50xx.c                    | 791 ++++++++++++++++++
 8 files changed, 980 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
 create mode 100644 drivers/leds/leds-lp50xx.c

-- 
2.27.0

