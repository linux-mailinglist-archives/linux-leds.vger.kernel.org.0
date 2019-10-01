Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F124EC3F4E
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2019 20:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731575AbfJASEd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Oct 2019 14:04:33 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37684 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727269AbfJASEY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Oct 2019 14:04:24 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91I4KD6039878;
        Tue, 1 Oct 2019 13:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569953060;
        bh=WT/P1mEnJj8WBgXcn3xJJ5zXtDgJwUFTqbvfHlc/1d4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=OOXuR11SyBzFS6yxZ4SvKUl3JFco8sOVmcUwsszet4vV6w64xazynBXFD3A03SrYI
         VVVzBtAiMoUU2qyPLBqnjYEoLkRMbArd9C2Je9E6iUpjRJKq8tK8gxZnTlohgq2dEs
         YS6WqBY2VjAoIYscmP1sPwpuUveXBipundRcI7UU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91I4K30037723;
        Tue, 1 Oct 2019 13:04:20 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 13:04:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 13:04:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91I4J9b126184;
        Tue, 1 Oct 2019 13:04:19 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 5/5] leds: lm3601x: Convert class registration to device managed
Date:   Tue, 1 Oct 2019 13:04:39 -0500
Message-ID: <20191001180439.8312-5-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191001180439.8312-1-dmurphy@ti.com>
References: <20191001180439.8312-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert LED flash class registration to device managed class
registration API.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm3601x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lm3601x.c b/drivers/leds/leds-lm3601x.c
index b02972f1a341..a68e4f97739c 100644
--- a/drivers/leds/leds-lm3601x.c
+++ b/drivers/leds/leds-lm3601x.c
@@ -350,8 +350,7 @@ static int lm3601x_register_leds(struct lm3601x_led *led,
 	init_data.devicename = led->client->name;
 	init_data.default_label = (led->led_mode == LM3601X_LED_TORCH) ?
 					"torch" : "infrared";
-
-	return led_classdev_flash_register_ext(&led->client->dev,
+	return devm_led_classdev_flash_register_ext(&led->client->dev,
 						&led->fled_cdev, &init_data);
 }
 
-- 
2.22.0.214.g8dca754b1e

