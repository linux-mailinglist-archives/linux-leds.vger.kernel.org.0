Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 344445652E5
	for <lists+linux-leds@lfdr.de>; Mon,  4 Jul 2022 13:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233691AbiGDLAH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Jul 2022 07:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233132AbiGDLAG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Jul 2022 07:00:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C70BFD35
        for <linux-leds@vger.kernel.org>; Mon,  4 Jul 2022 04:00:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8D502615F9
        for <linux-leds@vger.kernel.org>; Mon,  4 Jul 2022 11:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48F5C341CE;
        Mon,  4 Jul 2022 11:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656932403;
        bh=zUPFihIJAAbV5NsZohIh6G/oQ2NNdrQe3akgMMJcq8k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RMPjG4dRgYNemN3ErDUszl2w23ASEapiyYQIaV93bWDje8Rq4xEiIzsWNZFSBSXbr
         5uhEiiliVOzZ/Lp2OfMbG8g4em42drGy7G7HClVLaqIoUmA1jr7X04HDlHXDmckg+Y
         YueBSA4w40dODEu5ewFx7ttTFMmx7jYw9tZwSCmHbK+g5Of6CNmTuIpYDRIIfMJZT8
         Vc9QJQYFB82jNK1mELhirl1ZZ1PtzcK1aRHVGbN9BlHah+Q4+c/PmQO+VBVxGs315b
         u/qdLAbE9RMRlX7CPh+C0m+/SuWH3KwIfOhEtqljwc/1bzV14EIBetu6JS5MDxbOhN
         yr8Vjue3fAwyw==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc:     pali@kernel.org, Josef Schlehofer <josef.schlehofer@nic.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 2/3] leds: turris-omnia: initialize multi-intensity to full
Date:   Mon,  4 Jul 2022 12:59:54 +0200
Message-Id: <20220704105955.15474-3-kabel@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704105955.15474-1-kabel@kernel.org>
References: <20220704105955.15474-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The default color of each LED before driver probe (255, 255, 255).
Initialize multi_intensity to this value, so that it corresponds to the
reality.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index c2dfb22d3065..fae155bd119c 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -131,10 +131,13 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	}
 
 	led->subled_info[0].color_index = LED_COLOR_ID_RED;
+	led->subled_info[0].intensity = 255;
 	led->subled_info[0].channel = 0;
 	led->subled_info[1].color_index = LED_COLOR_ID_GREEN;
+	led->subled_info[1].intensity = 255;
 	led->subled_info[1].channel = 1;
 	led->subled_info[2].color_index = LED_COLOR_ID_BLUE;
+	led->subled_info[2].intensity = 255;
 	led->subled_info[2].channel = 2;
 
 	led->mc_cdev.subled_info = led->subled_info;
-- 
2.35.1

