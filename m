Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 813896E94A8
	for <lists+linux-leds@lfdr.de>; Thu, 20 Apr 2023 14:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjDTMih (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Apr 2023 08:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjDTMig (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Apr 2023 08:38:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89441C7
        for <linux-leds@vger.kernel.org>; Thu, 20 Apr 2023 05:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681994266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=MSx/zgBuhwuNODZ5eKDsbO3IFQpOnNda/vutAsDrYRc=;
        b=cxQvEedtwXTQwXgH3mauMd45s75jKDVKX5oZIveM+3M7hYE7KdRn6Oba2N1MVNR+EhoWfP
        OGD/riPpHepvN17R31jxX1Q4CwEQM1PyRJShYJVNn3GYb6q1vStsWc0J3fs1BBw0H+2MnI
        3QbywJKsQULEgXvJbrBJFNdeF+YAepU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-uTn-zC90NaubICEgxZ3dBg-1; Thu, 20 Apr 2023 08:37:43 -0400
X-MC-Unique: uTn-zC90NaubICEgxZ3dBg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAFA42807D66;
        Thu, 20 Apr 2023 12:37:42 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.216])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0713E492C3E;
        Thu, 20 Apr 2023 12:37:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-leds@vger.kernel.org
Subject: [PATCH v2 0/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC LED driver
Date:   Thu, 20 Apr 2023 14:37:36 +0200
Message-Id: <20230420123741.57160-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi All,

Here is v2 of the patch series to add support for the LED controller
on Intel Cherry Trail Whiskey Cove PMICs.

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
 drivers/leds/leds-cht-wcove.c          | 471 +++++++++++++++++++++++++
 6 files changed, 523 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/leds/leds-cht-wcove.rst
 create mode 100644 drivers/leds/leds-cht-wcove.c

-- 
2.39.2

