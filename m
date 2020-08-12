Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3587242F93
	for <lists+linux-leds@lfdr.de>; Wed, 12 Aug 2020 21:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgHLTun (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Aug 2020 15:50:43 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44528 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgHLTum (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Aug 2020 15:50:42 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07CJoQqV110975;
        Wed, 12 Aug 2020 14:50:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597261826;
        bh=T0TvMRXLEYd7VyqjQ3n8OazCVX9xX3llTyDlXEMt8FM=;
        h=From:To:CC:Subject:Date;
        b=qi6quTcdTqtPa8SKIm7fGhi/eSbGBIxLANVZODNqQxIVVp9G58hhuM3rpd16uShTh
         LSjXa8h1MwUhWvfgBRkb8OSy2I/1joEVsTVpws8JogBoDhCECGPMe1a7PF1sJ01GG+
         DL+G0pky918/+t/SluvfK9ckSpT4C6uOhJ9FVx54=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07CJoQxl125945;
        Wed, 12 Aug 2020 14:50:26 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 12
 Aug 2020 14:50:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 12 Aug 2020 14:50:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07CJoQAc109760;
        Wed, 12 Aug 2020 14:50:26 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <marek.behun@nic.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v33 0/6] LP50xx addition and remainder Multicolor patches
Date:   Wed, 12 Aug 2020 14:50:14 -0500
Message-ID: <20200812195020.13568-1-dmurphy@ti.com>
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

These are the final patches from the original multicolor framework patchset.

Changes made were to the LP50xx to rework regmap_defaults to eliminate used
only once #defines.  Also fixed putting the child node in the dt parsing and
changed regmap regcache type to flat.

Dan

Dan Murphy (6):
  dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
  leds: lp50xx: Add the LP50XX family of the RGB LED driver
  ARM: defconfig: u8500: Add LP55XX_COMMON config flag
  ARM: dts: n900: Add reg property to the LP5523 channel node
  ARM: dts: imx6dl-yapp4: Add reg property to the lp5562 channel node
  ARM: dts: ste-href: Add reg property to the LP5521 channel nodes

 .../devicetree/bindings/leds/leds-lp50xx.yaml | 130 ++++
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi    |  14 +-
 arch/arm/boot/dts/omap3-n900.dts              |  29 +-
 arch/arm/boot/dts/ste-href.dtsi               |  22 +-
 arch/arm/configs/u8500_defconfig              |   1 +
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-lp50xx.c                    | 634 ++++++++++++++++++
 8 files changed, 823 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
 create mode 100644 drivers/leds/leds-lp50xx.c

-- 
2.28.0

