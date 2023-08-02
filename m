Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C882476D350
	for <lists+linux-leds@lfdr.de>; Wed,  2 Aug 2023 18:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjHBQIO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Aug 2023 12:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235411AbjHBQH5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Aug 2023 12:07:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB194134
        for <linux-leds@vger.kernel.org>; Wed,  2 Aug 2023 09:07:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 40FB961A36
        for <linux-leds@vger.kernel.org>; Wed,  2 Aug 2023 16:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20B8C433CB;
        Wed,  2 Aug 2023 16:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690992473;
        bh=ni13gyMmmTO9FMgSjd9qCvK8PHGZ+Lo3T9LWOQxNuvI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d6RSx+D5cUbwjGevipQIfZWA/2Gwer8epQa1I2KqsCHu/py50aF+h+TCMjeQz5w12
         BqHFY3jbEvMlyND8XDK8qDfI7mBbf5V5yNyAnSw+8fHZ0x60c+M9pEySv+joH+lFkP
         6/Q0CZydk+7Mdjs75/mj+tiPpcyFlECFHsuBfw9NfQhKoqpXwdMTX5zxSg70BVaF7x
         pUXJkDN70qoVenKzatSbI21wMBM5CsnSlLyvri4Z2sRx36U/DoRIpx6Jw5UbKWid70
         0n8RbTw6sboE52x/fE0h0GYwzHfQw/iRl6aw3+si4AFgyW29OinXNhHDzKDEg9qCSu
         H5DAmXd9YNBiA==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v3 1/6] leds: turris-omnia: drop unnecessary mutex locking
Date:   Wed,  2 Aug 2023 18:07:43 +0200
Message-ID: <20230802160748.11208-2-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802160748.11208-1-kabel@kernel.org>
References: <20230802160748.11208-1-kabel@kernel.org>
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

Do not lock driver mutex in the global LED panel brightness sysfs
accessors brightness_show() and brightness_store().

The mutex locking is unnecessary here. The I2C transfers are guarded by
I2C core locking mechanism, and the LED commands itself do not interfere
with other commands.

Fixes: 089381b27abe ("leds: initial support for Turris Omnia LEDs")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 64b2d7b6d3f3..bbd610100e41 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -156,12 +156,9 @@ static ssize_t brightness_show(struct device *dev, struct device_attribute *a,
 			       char *buf)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-	struct omnia_leds *leds = i2c_get_clientdata(client);
 	int ret;
 
-	mutex_lock(&leds->lock);
 	ret = i2c_smbus_read_byte_data(client, CMD_LED_GET_BRIGHTNESS);
-	mutex_unlock(&leds->lock);
 
 	if (ret < 0)
 		return ret;
@@ -173,7 +170,6 @@ static ssize_t brightness_store(struct device *dev, struct device_attribute *a,
 				const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-	struct omnia_leds *leds = i2c_get_clientdata(client);
 	unsigned long brightness;
 	int ret;
 
@@ -183,15 +179,10 @@ static ssize_t brightness_store(struct device *dev, struct device_attribute *a,
 	if (brightness > 100)
 		return -EINVAL;
 
-	mutex_lock(&leds->lock);
 	ret = i2c_smbus_write_byte_data(client, CMD_LED_SET_BRIGHTNESS,
 					(u8)brightness);
-	mutex_unlock(&leds->lock);
-
-	if (ret < 0)
-		return ret;
 
-	return count;
+	return ret < 0 ? ret : count;
 }
 static DEVICE_ATTR_RW(brightness);
 
-- 
2.41.0

