Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 964C2242F9B
	for <lists+linux-leds@lfdr.de>; Wed, 12 Aug 2020 21:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgHLTuy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Aug 2020 15:50:54 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44540 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbgHLTuw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Aug 2020 15:50:52 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07CJobm6111032;
        Wed, 12 Aug 2020 14:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597261837;
        bh=zH737v8+ekxHxtS/IZ+9IoMs2IBqoic2gOwxmSErk7E=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=H5rqOfMtDXmT2QWkyu3Qf2ueztmmK9HtzMRjBRSlPldCPPUrCLwb3UAfNYQ2KuMWg
         ZDVSSjurEJN1zi/7zRfbiklFG0EFlQzNuRN839UF8AE0XSo5QORu2NFp8u1FBjK9hP
         7zZRQbZTvPbe4yIAfddQ0okHHEzxIWWwUXXcN0bg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07CJobbk126038;
        Wed, 12 Aug 2020 14:50:37 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 12
 Aug 2020 14:50:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 12 Aug 2020 14:50:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07CJoadx088033;
        Wed, 12 Aug 2020 14:50:36 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <marek.behun@nic.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Dan Murphy <dmurphy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v33 3/6] ARM: defconfig: u8500: Add LP55XX_COMMON config flag
Date:   Wed, 12 Aug 2020 14:50:17 -0500
Message-ID: <20200812195020.13568-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200812195020.13568-1-dmurphy@ti.com>
References: <20200812195020.13568-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The dependencies for the LP55XX LED drivers have been updated so that
the child devices (i.e. LP5521) now depends on the LP55XX_COMMON config
flag as opposed to the device selecting the LP55XX_COMMON flag.  The
LP55XX_COMMON needs to be set in the defconfig.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 arch/arm/configs/u8500_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 28dd7cf56048..dea599e1c17e 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -113,6 +113,7 @@ CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_LM3530=y
 CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_LP55XX_COMMON=y
 CONFIG_LEDS_LP5521=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
-- 
2.28.0

