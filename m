Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F27BC6E10D6
	for <lists+linux-leds@lfdr.de>; Thu, 13 Apr 2023 17:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbjDMPTA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Apr 2023 11:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbjDMPS6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Apr 2023 11:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13EED9013
        for <linux-leds@vger.kernel.org>; Thu, 13 Apr 2023 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681399096;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=HkFrf371n3q3T/PZtZx2WJtsRnWzXQw+29ZKklq7bDU=;
        b=dsvSHP+2a20dGBDO99EbNCseBXStx/GobdDW7xyJsYNm4ckT8z5XllXHRdV8nUPVP3FQw/
        dkMun7cIMbhA61fabjEg7vLLyL3aBVoGCpSjSxXMsejwBN40wgeEBFn/WDafTon0d8y7xc
        nvZahlnjyUUHT/fEKyrZKvLVkdl2uEw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-zhEyzppKOA6HEmGMZTFN8Q-1; Thu, 13 Apr 2023 11:18:11 -0400
X-MC-Unique: zhEyzppKOA6HEmGMZTFN8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F0DD29DD997;
        Thu, 13 Apr 2023 15:18:11 +0000 (UTC)
Received: from x1.nl (unknown [10.39.192.251])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BC031141511D;
        Thu, 13 Apr 2023 15:18:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org
Subject: [PATCH 0/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC LED driver
Date:   Thu, 13 Apr 2023 17:18:03 +0200
Message-Id: <20230413151808.20900-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Here is a patch series to add support for the LED controller on
Intel Cherry Trail Whiskey Cove PMICs.

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

 Documentation/leds/index.rst          |   1 +
 Documentation/leds/leds-cht-wcove.rst |  29 ++
 drivers/leds/Kconfig                  |  11 +
 drivers/leds/Makefile                 |   1 +
 drivers/leds/leds-cht-wcove.c         | 466 ++++++++++++++++++++++++++
 5 files changed, 508 insertions(+)
 create mode 100644 Documentation/leds/leds-cht-wcove.rst
 create mode 100644 drivers/leds/leds-cht-wcove.c

-- 
2.39.1

