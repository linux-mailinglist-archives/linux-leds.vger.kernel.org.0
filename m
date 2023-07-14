Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB017535BC
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jul 2023 10:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235677AbjGNIxM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Jul 2023 04:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235753AbjGNIxB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Jul 2023 04:53:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE072120
        for <linux-leds@vger.kernel.org>; Fri, 14 Jul 2023 01:53:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C6F6761C9C
        for <linux-leds@vger.kernel.org>; Fri, 14 Jul 2023 08:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4457EC433CB;
        Fri, 14 Jul 2023 08:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689324779;
        bh=7/e4SBxn7hv2OmNuhqD/9ZmO4FGuiP/KNu8UxBKbWc4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UzjYx0r6PusLvZ4sX9zbW9vyJydVmyaAIRVTNzWAA7604UR+v3nihfp44YFZdUG6o
         cZDdK3+oS3yVGc5u6r79KhmIsACp1CRFR5ALEMz+NE+zgBqT0ZjsSgH5XjJDCwjhV1
         p1fFFtpeJvBXoupqaZWdEy9aMn4nO8QUXksG7n7QMba9uEzi7FBWqieFBcNnHS7f4c
         CPjpJEjEraJecvz8ZAfLlO7mYwleoPee5cD0MkXip9fUFGt2ta6SvFsm3LqTEluv49
         y63uFLaXH+MQlLIbz43U2yrLgbSJ4QGRaQzdhOwZawfrqXgiNJ8BVwYi99EI22ook7
         efGn2x3Ws+Eog==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 1/3] leds: turris-omnia: change max brightness from 255 to 1
Date:   Fri, 14 Jul 2023 10:52:51 +0200
Message-ID: <20230714085253.13544-2-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714085253.13544-1-kabel@kernel.org>
References: <20230714085253.13544-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Using binary brightness makes more sense for this controller, because
internally in the MCU it works that way: the LED has a color, and a
state whether it is ON or OFF.

The resulting brightness computation with led_mc_calc_color_components()
will now always result in either (0, 0, 0) or the multi_intensity value.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 64b2d7b6d3f3..c063b6b710f9 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -110,7 +110,7 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	init_data.fwnode = &np->fwnode;
 
 	cdev = &led->mc_cdev.led_cdev;
-	cdev->max_brightness = 255;
+	cdev->max_brightness = 1;
 	cdev->brightness_set_blocking = omnia_led_brightness_set_blocking;
 
 	/* put the LED into software mode */
-- 
2.41.0

