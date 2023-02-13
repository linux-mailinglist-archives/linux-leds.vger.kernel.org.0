Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1F7694634
	for <lists+linux-leds@lfdr.de>; Mon, 13 Feb 2023 13:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjBMMqt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Feb 2023 07:46:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbjBMMqi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Feb 2023 07:46:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B051A481
        for <linux-leds@vger.kernel.org>; Mon, 13 Feb 2023 04:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676292340;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=AnJoYBSrnxau6xe0s/FoZpvzZMcp5n1ICaH81YVRh4k=;
        b=CtEgv/sl6TwFRF1izw42CJ3+h4UWS/smk+ujqiymnCogq2lEmiPAjzEAEqBEykNPpz/N6K
        CEDIoBGdFcOz7put309tO0SfCWaced9hvnYboZ90/iVNm3vhuP1go4TlyyPxjz5H4LBmi5
        0+j7HWIACdVCPr/xxcpysjoe6O/pJNM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-GzXStqZ3Obml1-Y6mG4TSQ-1; Mon, 13 Feb 2023 07:45:36 -0500
X-MC-Unique: GzXStqZ3Obml1-Y6mG4TSQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5645181B7C9;
        Mon, 13 Feb 2023 12:45:35 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.132])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AFFE8403D0C1;
        Mon, 13 Feb 2023 12:45:30 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [RESEND PATCH 0/3] leds: tps68470: LED driver for TPS68470
Date:   Mon, 13 Feb 2023 20:45:17 +0800
Message-Id: <20230213124520.1635257-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This work allows user to control the indicator and flash LEDs though
sysfs in user space. TPS68470 is a part of INT3470 and provides GPIO,
LED, and power controls.

To allow the user to control these two LEDs, two masks for the
ILEDCTL, called TPS68470_ILEDCTL_ENA and TPS68470_ILEDCTL_ENA and a two
bits mask, called TPS68470_ILEDCTL_CTRLB are defined and are used to
enable/disable the LEDs and set the power status, respectively.

The LED driver called leds-tps68470 provides the sysfs interface and
the register configuration implementation. For the indicator LED,
only TPS68470_ILEDCTL_ENA needs to be set to turn on/off the LED. For the
flash LED, TPS68470 provides 4 levels of power settings. After enabling
the TPS68470_ILEDCTL_ENB, the power level should also be set.
The strategy is

Brightness  |  Power
=======================
LED_OFF     |   -
LED_ON      |   4mA
LED_HALF    |   8mA
LED_FULL    |   16mA

Moreover, the user and application can set the brightness through sysfs,
/sys/class/leds/tps68470-ileda and /sys/class/leds/tps68470-iledb

Kate Hsuan (3):
  platform: x86: int3472: Add MFD cell for tps68470 LED
  include: mfd: tps68470: Add masks for LEDA and LEDB
  leds: tps68470: Add LED control for tps68470

 drivers/leds/Kconfig                          |  12 ++
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-tps68470.c                  | 170 ++++++++++++++++++
 drivers/platform/x86/intel/int3472/tps68470.c |   3 +-
 include/linux/mfd/tps68470.h                  |   5 +
 5 files changed, 190 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-tps68470.c

-- 
2.39.0

