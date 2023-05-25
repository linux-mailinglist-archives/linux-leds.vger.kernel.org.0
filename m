Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24E0F71141B
	for <lists+linux-leds@lfdr.de>; Thu, 25 May 2023 20:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241149AbjEYSe4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 May 2023 14:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234289AbjEYSeZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 May 2023 14:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BD1E68
        for <linux-leds@vger.kernel.org>; Thu, 25 May 2023 11:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685039603;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=qZp0RPyPlAJvcvIaUxnYPJ3TWzLBbRJxgtzOa5lGKIc=;
        b=TfjTHYqbCJ4TonB6Nlc/8951PwLMG0M3codlinjT9aV94Q5ridGoZHpOVhv/hUpQyWIhjn
        yDHUkWXL04OuiJchYHHz4p4FrLVgQ4aAtD5DgeduswsgEkbf9UPROjbwrdsmo7faKsm+2i
        GN5zmueWA9idgZyLmMSw2puh87ffHlM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-Ei8gr1cRPfCSDcNq_C-X7w-1; Thu, 25 May 2023 14:33:20 -0400
X-MC-Unique: Ei8gr1cRPfCSDcNq_C-X7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 745781C07844;
        Thu, 25 May 2023 18:33:19 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8D08B40C1258;
        Thu, 25 May 2023 18:33:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] leds: cht-wcove: Mark cht_wc_leds_brightness_get() static
Date:   Thu, 25 May 2023 20:33:17 +0200
Message-Id: <20230525183317.129232-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

cht_wc_leds_brightness_get() is only used internally, mark it static.

Cc: Yauhen Kharuzhy <jekhor@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202305260008.QCRrKILf-lkp@intel.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/leds-cht-wcove.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
index 0cfebee98910..0a5c30e5ed5d 100644
--- a/drivers/leds/leds-cht-wcove.c
+++ b/drivers/leds/leds-cht-wcove.c
@@ -141,7 +141,7 @@ static int cht_wc_leds_brightness_set(struct led_classdev *cdev,
 	return ret;
 }
 
-enum led_brightness cht_wc_leds_brightness_get(struct led_classdev *cdev)
+static enum led_brightness cht_wc_leds_brightness_get(struct led_classdev *cdev)
 {
 	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
 	unsigned int val;
-- 
2.40.1

