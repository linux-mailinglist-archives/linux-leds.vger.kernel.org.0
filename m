Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD254222AE1
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jul 2020 20:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbgGPSVL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Jul 2020 14:21:11 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36066 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729411AbgGPSU7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Jul 2020 14:20:59 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06GIKedO019894;
        Thu, 16 Jul 2020 13:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594923640;
        bh=cydmKQhdfnYTmfxeA1V/UTrs4wag2D0hxMQWxeyyt0g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vwY0DxAR0E3w1ODjTCdAMhbYw1FUHVPKy8NxRq5vk6L3ZbAa1eAvDh2Fooqm7lGkn
         I1KX7WhJMiMwsdHX+B7WOY3ZgkoN97VrX2ELcHbd1m7veB5LjWZRY7pn1bNjBxC9H3
         NCV725Rh3wVLy9ie1KjmTgARMfPisMe0pHuxert0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06GIKeoS087349
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jul 2020 13:20:40 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 16
 Jul 2020 13:20:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 16 Jul 2020 13:20:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06GIKejc090137;
        Thu, 16 Jul 2020 13:20:40 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <marek.behun@nic.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v31 07/12] ARM: defconfig: u8500: Add LP55XX_COMMON config flag
Date:   Thu, 16 Jul 2020 13:20:02 -0500
Message-ID: <20200716182007.18389-8-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716182007.18389-1-dmurphy@ti.com>
References: <20200716182007.18389-1-dmurphy@ti.com>
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

