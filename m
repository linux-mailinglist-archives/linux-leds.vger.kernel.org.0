Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6964A7AA29A
	for <lists+linux-leds@lfdr.de>; Thu, 21 Sep 2023 23:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbjIUVWs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 21 Sep 2023 17:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjIUVWg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 21 Sep 2023 17:22:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E27897E4
        for <linux-leds@vger.kernel.org>; Thu, 21 Sep 2023 13:50:30 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A816C433C9;
        Thu, 21 Sep 2023 20:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695329429;
        bh=o/Agu4YpPPbLZVgNf6CK3kCG/+pD6mnDaJlC2mGAkdM=;
        h=From:To:Cc:Subject:Date:From;
        b=XML8PgsHmjjo+J3USVhE/uxEqviDVz/8QN5eHRB4VcT46hA6tvM/vdhaq+ZBG73g8
         iN6fDp0RNZyuWL8y3mCjXfA9sdWSmd5qdBNGubkkEXpSKdk5XQKqdxgbsEboFcKTV4
         9GVTiGA3oVnVpidMyPeQA8vdiJh1aDBYau2PTLs75zbhtzaTbyp0foe4aV6pSm5C11
         2oSDyaG/xc3UfD8mssZc0BKI0wSFl5d8QkYmqBkmP6xiGHd11S224i5oDZkChXgLh8
         bZIRI/2EuKGTsAedqEYRBC/N7C8FLiI0URQ5yhf0Msj0IPyg0EvkUKBIgP8HuXLJgk
         uM/b6pkKYgyYw==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH] leds: turris-omnia: Fix unused variable
Date:   Thu, 21 Sep 2023 22:50:25 +0200
Message-ID: <20230921205025.20303-1-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The variable ret is not used in this function.

Fixes: 28350bc0ac77 ("leds: turris-omnia: Do not use SMBUS calls")
Closes: https://lore.kernel.org/linux-leds/202309212215.Yl5VQaSm-lkp@intel.com/T/#u
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index e1a4629479c5..f27241896970 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -60,7 +60,6 @@ struct omnia_leds {
 static int omnia_cmd_write_u8(const struct i2c_client *client, u8 cmd, u8 val)
 {
 	u8 buf[2] = { cmd, val };
-	int ret;
 
 	return i2c_master_send(client, buf, sizeof(buf));
 }
-- 
2.41.0

