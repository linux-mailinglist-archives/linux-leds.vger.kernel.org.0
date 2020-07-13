Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0104121DA95
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 17:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730293AbgGMPqg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 11:46:36 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55044 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729884AbgGMPqe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2020 11:46:34 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06DFkOPE039101;
        Mon, 13 Jul 2020 10:46:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594655184;
        bh=cydmKQhdfnYTmfxeA1V/UTrs4wag2D0hxMQWxeyyt0g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=TbiWkTIY4epDE2+GicRWNVEFNKNhCtPeb6tQBYoxr9uhS4yxjnT/avxwf1DtAmIfm
         ZhRPOZd9QhftigLOuZoySoQyfR0VQ/n8Q6tsuYjauXIJyYsOPX4Vm0wQq/xasXmihH
         A0UMa2zEFjVtZo3lmeyczEYNwkYzkfi/zYA01OAs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06DFkOPS019890;
        Mon, 13 Jul 2020 10:46:24 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 13
 Jul 2020 10:46:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 13 Jul 2020 10:46:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06DFkN9h126246;
        Mon, 13 Jul 2020 10:46:23 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <marek.behun@nic.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v30 11/16] ARM: defconfig: u8500: Add LP55XX_COMMON config flag
Date:   Mon, 13 Jul 2020 10:45:39 -0500
Message-ID: <20200713154544.1683-12-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713154544.1683-1-dmurphy@ti.com>
References: <20200713154544.1683-1-dmurphy@ti.com>
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
2.27.0

