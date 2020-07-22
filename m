Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0EB229B72
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jul 2020 17:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732878AbgGVPcS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Jul 2020 11:32:18 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56568 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732843AbgGVPcR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jul 2020 11:32:17 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06MFW3iK106126;
        Wed, 22 Jul 2020 10:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595431923;
        bh=cydmKQhdfnYTmfxeA1V/UTrs4wag2D0hxMQWxeyyt0g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Snget1fCvrlNasWXMutPte48mHSY3mYs2KQWuuMJWo1FpBE7G8aknf6XlfUa+YHw3
         XbsxOhs1783vXqprMennQLJTfSLLqM+iHwxvJtgDzA0eL7DnkHgYuUW+lqQz1eZoeg
         CiHmn81q1fyV13JPhZXGHuXDh0Fwnov8+wOhSi1U=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06MFW3ZS065739
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Jul 2020 10:32:03 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 22
 Jul 2020 10:32:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 22 Jul 2020 10:32:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06MFW2JX110699;
        Wed, 22 Jul 2020 10:32:03 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <marek.behun@nic.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v32 3/6] ARM: defconfig: u8500: Add LP55XX_COMMON config flag
Date:   Wed, 22 Jul 2020 10:31:43 -0500
Message-ID: <20200722153146.8767-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200722153146.8767-1-dmurphy@ti.com>
References: <20200722153146.8767-1-dmurphy@ti.com>
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

