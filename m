Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 673EA6E0150
	for <lists+linux-leds@lfdr.de>; Wed, 12 Apr 2023 23:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjDLV7y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Apr 2023 17:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjDLV7u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Apr 2023 17:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1399155BD
        for <linux-leds@vger.kernel.org>; Wed, 12 Apr 2023 14:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681336747;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JYHeE+jv2rqhDXwZdqxAf5qYQffkNx3KctvdgEemDUA=;
        b=RpNbjygC6O8Bq75fy4SyVRcYshhNobJwKC5Z+1iPVACwc2KWABWWOJZpJnRnwqgWV2r0nK
        xdjfYlipTYEPqVH3Oxnvcjg4FHWul0XYKnKoFkPYfCwxd8Af4s3/8e4MUAdtuC6ZZu+EfK
        IRoWb7t0D4nwoWeUwVf5vQjgaZKZjCU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-VaBf7Bm0NiiHbOAZjXecVw-1; Wed, 12 Apr 2023 17:59:06 -0400
X-MC-Unique: VaBf7Bm0NiiHbOAZjXecVw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACC18800B23;
        Wed, 12 Apr 2023 21:59:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EF40E1121320;
        Wed, 12 Apr 2023 21:59:04 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-leds@vger.kernel.org
Subject: [PATCH 4/4] leds: Clear LED_INIT_DEFAULT_TRIGGER when clearing current trigger
Date:   Wed, 12 Apr 2023 23:58:55 +0200
Message-Id: <20230412215855.593541-5-hdegoede@redhat.com>
In-Reply-To: <20230412215855.593541-1-hdegoede@redhat.com>
References: <20230412215855.593541-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Not all triggers use LED_INIT_DEFAULT_TRIGGER, which means that it
will not get cleared when the default trigger is a trigger which
does not use it such as "default-on".

If the default trigger then later gets replaced by a trigger which
does check LED_INIT_DEFAULT_TRIGGER, such as "timer" then that trigger
will behave as if it is the default trigger which it should not do.

To fix this clear the LED_INIT_DEFAULT_TRIGGER flag when clearing
the current trigger, so that it will not be set for any subsequently
set (non default) triggers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-triggers.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 8214d3f7bc5f..6a5e1f41f9a4 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -185,6 +185,7 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		led_cdev->trigger = NULL;
 		led_cdev->trigger_data = NULL;
 		led_cdev->activated = false;
+		led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;
 		led_set_brightness(led_cdev, LED_OFF);
 	}
 	if (trig) {
-- 
2.39.1

