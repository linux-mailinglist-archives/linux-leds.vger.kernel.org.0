Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3646F2A88
	for <lists+linux-leds@lfdr.de>; Sun, 30 Apr 2023 22:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbjD3UAv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 30 Apr 2023 16:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjD3UAu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 30 Apr 2023 16:00:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 214E6E42
        for <linux-leds@vger.kernel.org>; Sun, 30 Apr 2023 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682884806;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=LNBeMm2coIPUTm8eGvGZepjyD6h5tipkBo4j9xRjRHg=;
        b=Jv8nhZR7bmSltnJ8caf5qDwNGrIogWNh7ZLTNnZSYmZ7EGOrqcyt3O79l7NuJk8iLe4Q3b
        VSlO7R6+yf2BnudOocC01LQz+cekILAXSJMd/Ci8T8V0ewcsuo1Y96BhSg4V06FOq8/zcz
        eEMUsv1KFzD2RSxrXLqiEEnk7/hSvS8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-tWabpl83PreesbR440LdNg-1; Sun, 30 Apr 2023 16:00:02 -0400
X-MC-Unique: tWabpl83PreesbR440LdNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFD1F102F22C;
        Sun, 30 Apr 2023 20:00:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E8B6BC15BA0;
        Sun, 30 Apr 2023 20:00:00 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>, linux-leds@vger.kernel.org
Subject: [PATCH v3 0/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC LED driver
Date:   Sun, 30 Apr 2023 21:59:47 +0200
Message-Id: <20230430195952.862527-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi All,

Here is v3 of the patch series to add support for the LED controller
on Intel Cherry Trail Whiskey Cove PMICs.

Changes in v3:
- Some comment tweaks and s/LED_OFF/0/ and s/LED_ON/1/
- Refuse to load on the Yoga Tab 3 as it turns out the LED1 driver output
  is connected to a haptic feedback motor there (and LED2 is unused)

Changes in v2 (of my version of this):
- Address Pavel's small remarks on patch 1/5,
  see patch 1/5's commit message for details
- Improve/extend pattern docs in Documentation/leds/leds-cht-wcove.rst

This is based on the original patch for this from Yauhen Kharuzhy,
with additional work on top by me.

This addresses the review remarks on the v2 posting from Yauhen:
- Since the PMIC is connected to the battery any changes we make to
  the LED settings are permanent, even surviving reboot / poweroff.
  Save LED1 register settings on probe() and if auto-/hw-control was
  enabled on probe() restore the settings on remove() and shutdown().
- Add support for the pattern trigger to select breathing mode

This makes the charging LED on devices with these PMICs properly
reflect the charging status (this relies on sw control on most
devices) and this also allows control of the LED behind the pen
(digitizer on) symbol on the keyboard half of the Lenovo Yoga Book
1 models.

Regards,

Hans


Hans de Goede (4):
  leds: cht-wcove: Add suspend/resume handling
  leds: cht-wcove: Add support for breathing mode use hw_pattern sysfs
    API
  leds: cht-wcove: Set default trigger for charging LED
  leds: cht-wcove: Use breathing when LED_INIT_DEFAULT_TRIGGER is set

Yauhen Kharuzhy (1):
  leds: Add Intel Cherry Trail Whiskey Cove PMIC LED driver

 Documentation/leds/index.rst           |   1 +
 Documentation/leds/leds-cht-wcove.rst  |  38 ++
 Documentation/leds/well-known-leds.txt |   2 +-
 drivers/leds/Kconfig                   |  11 +
 drivers/leds/Makefile                  |   1 +
 drivers/leds/leds-cht-wcove.c          | 477 +++++++++++++++++++++++++
 6 files changed, 529 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/leds/leds-cht-wcove.rst
 create mode 100644 drivers/leds/leds-cht-wcove.c

-- 
2.39.2

