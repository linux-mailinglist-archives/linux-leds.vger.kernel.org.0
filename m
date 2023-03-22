Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05F066C4177
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 05:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjCVEOF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 00:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjCVEOE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 00:14:04 -0400
X-Greylist: delayed 1914 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 21 Mar 2023 21:14:02 PDT
Received: from m126.mail.126.com (m126.mail.126.com [220.181.12.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0F31F18B2C
        for <linux-leds@vger.kernel.org>; Tue, 21 Mar 2023 21:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=yNEto
        kRAgptmn8Q7UhCFJ5SNvKxLvarbRSkba0BBYQw=; b=UXAhkpLa8drFdrIC7eWow
        /H9FhcvN7Mb8C/x2RmJ/YVGUG0KJOf1VtCH3MtFCxKvviUo8MePqiUvWT/Fh+V0L
        I7agkfwTw8mepYAUIusvWI0Iq8/8XdOU6/6tlPUs2M4xJnD0UzjyXHOEGddMx/z7
        5R15z3eUMKrx/U1Nm99L2M=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id _____wD3_7fpeBpk5+yZAQ--.2410S2;
        Wed, 22 Mar 2023 11:41:30 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     pavel@ucw.cz, matthias.bgg@gmail.com, windhl@126.com,
        gene_chen@richtek.com, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] leds: mt6360: Add missing fwnode_handle_put()
Date:   Wed, 22 Mar 2023 11:41:28 +0800
Message-Id: <20230322034128.1856117-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_7fpeBpk5+yZAQ--.2410S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWkJryfWrW8ur1DJw43Jrb_yoWkWrX_Wr
        y7WrWxXr95uF42gFsFyr4FqrZ2kF48uw18CFs293WSgw17Jr1rX3yvvF93ZryrXF43try5
        GF40ya47Ca4fKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREKsj7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3As6F1pEFGbfeAAAsx
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In mt6360_init_isnk_properties(), we should add
fwnode_handle_put() when break out of the iteration
fwnode_for_each_child_node() as it will automatically
increase and decrease the refcounter.

Fixes: 679f8652064b ("leds: Add mt6360 driver")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/leds/flash/leds-mt6360.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index e1066a52d2d2..bbb8e4284873 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -637,14 +637,17 @@ static int mt6360_init_isnk_properties(struct mt6360_led *led,
 
 			ret = fwnode_property_read_u32(child, "reg", &reg);
 			if (ret || reg > MT6360_LED_ISNK3 ||
-			    priv->leds_active & BIT(reg))
+			    priv->leds_active & BIT(reg)) {
+				fwnode_handle_put(child);
 				return -EINVAL;
+				}
 
 			ret = fwnode_property_read_u32(child, "color", &color);
 			if (ret) {
 				dev_err(priv->dev,
 					"led %d, no color specified\n",
 					led->led_no);
+				fwnode_handle_put(child);
 				return ret;
 			}
 
-- 
2.25.1

