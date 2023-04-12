Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 814AE6E014E
	for <lists+linux-leds@lfdr.de>; Wed, 12 Apr 2023 23:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjDLV7w (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Apr 2023 17:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjDLV7u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Apr 2023 17:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4593C2A
        for <linux-leds@vger.kernel.org>; Wed, 12 Apr 2023 14:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681336743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=3km+WdaXAxmREOQBluv9G0scwhkQuown0nnjATModf8=;
        b=ZW4FhH73IJORe0EbZd/OcdSXKhugNDWRzEbPaSVz/7uJJhORkcnYSnT6lF4zrlBBLHa4VQ
        /jCEKoZfx0c254UloMWkIBRiVBLUYTVNicBV86NJrrnB9/J6sPUUtBIUskKLAispWA8WQk
        fDLCqDbDx2l38ySGdqXUKSyrbFPtBBU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-WeQVIJeUP52RckcS4WGLEw-1; Wed, 12 Apr 2023 17:59:02 -0400
X-MC-Unique: WeQVIJeUP52RckcS4WGLEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB78D185A791;
        Wed, 12 Apr 2023 21:59:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1D8671121320;
        Wed, 12 Apr 2023 21:59:00 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-leds@vger.kernel.org
Subject: [PATCH 0/4] Fix oops about sleeping in led_trigger_blink()
Date:   Wed, 12 Apr 2023 23:58:51 +0200
Message-Id: <20230412215855.593541-1-hdegoede@redhat.com>
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

Hi All,

Here is a patch series to fix an oops about sleeping in led_trigger_blink()
+ one other small bugfix.

Patches 1-3 should arguably have a:

Fixes: 0b9536c95709 ("leds: Add ability to blink via simple trigger")

tag, but Fixes tags tend to lead to patches getting automatically added
to the stable series and I would prefer to see this series get some
significant testing time in mainline first, so I have chosen to omit
the tag.

Regards,

Hans


Hans de Goede (4):
  leds: Change led_trigger_blink[_oneshot]() delay parameters to
    pass-by-value
  leds: Fix set_brightness_delayed() race
  leds: Fix oops about sleeping in led_trigger_blink()
  leds: Clear LED_INIT_DEFAULT_TRIGGER when clearing current trigger

 drivers/leds/led-core.c                  | 81 ++++++++++++++++++++----
 drivers/leds/led-triggers.c              | 17 ++---
 drivers/leds/trigger/ledtrig-disk.c      |  9 +--
 drivers/leds/trigger/ledtrig-mtd.c       |  8 +--
 drivers/net/arcnet/arcnet.c              |  8 +--
 drivers/power/supply/power_supply_leds.c |  5 +-
 drivers/usb/common/led.c                 |  4 +-
 include/linux/leds.h                     | 43 ++++++++++---
 net/mac80211/led.c                       |  2 +-
 net/mac80211/led.h                       |  8 +--
 net/netfilter/xt_LED.c                   |  3 +-
 11 files changed, 125 insertions(+), 63 deletions(-)

-- 
2.39.1

