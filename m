Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2C306C5027
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 17:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjCVQKD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 12:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjCVQJt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 12:09:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72BBD47432;
        Wed, 22 Mar 2023 09:09:44 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C33B5118E;
        Wed, 22 Mar 2023 17:09:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679501382;
        bh=W5f7kXxLSCbuWrLJsrUYzlcJtgZwBnmH4jczxzSgIA8=;
        h=From:To:Cc:Subject:Date:From;
        b=JBo2UsWQxsfTCS3naLtl3nVtIdz/8Qf6tZ2lvdZwCtZE4psodzJ2eME32tgUodjq4
         Lm6kj5A5kMZoa2jSZtKWVOudj/pOqvK2GYfmeMILVVx9tR9AHl/LJraTXrqHdsbXVj
         Ft0nVpeMeRYI3ikaOwIe0sLr6vj4u0gFlcH3yhN4=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, hdegoede@redhat.com,
        markgross@kernel.org, sboyd@kernel.org, hpa@redhat.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 0/8] Add WLED support to TPS68470 LED driver
Date:   Wed, 22 Mar 2023 16:09:18 +0000
Message-Id: <20230322160926.948687-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series relies on the recent "leds: tps68470: LED driver for TPS68470" set
from Kate Hsuan [1]

The TPS68470 provides two additional LED outputs on top of the indicator LEDs.
Add support for those to the driver. The configuration of the chip is drawn from
platform data which is expected to be passed to the driver. Additionally update
the int3472-tps68470 driver to register led lookups from platform data so that
the right LED is driven for each sensor, and finally define those lookups for
the Microsoft Surface Go line.

Kate, Hans, this is the changes I made on top of the tps68470-led series to
enable the IR LED on my Go2 (plus one additional patch to media). #5 could
probably just be squashed into the other series though. The last two patches
cover how I think the LED lookup should work - I unfortunately can't see an
automatic way to guarantee the right LED goes to the right sensor.

Thanks
Dan

[1] https://lore.kernel.org/platform-driver-x86/20230321153718.1355511-1-hpa@redhat.com/T/

Daniel Scally (8):
  platform/x86: int3472: Add platform data for LEDs
  platform/x86: int3472: Init LED registers using platform data
  platform/x86: int3472: Add TPS68470 LED Board Data
  platform/x86: int3472: Add tps68470-led as clock consumer
  leds: tps68470: Refactor tps68470_brightness_get()
  leds: tps68470: Support the WLED driver
  platform/x86: int3472: Support LED lookups in board data
  platform/x86: int3472: Define LED lookup data for MS Surface Go

 drivers/leds/leds-tps68470.c                  | 170 +++++++++++++++++-
 drivers/platform/x86/intel/int3472/tps68470.c |  31 +++-
 drivers/platform/x86/intel/int3472/tps68470.h |  10 ++
 .../x86/intel/int3472/tps68470_board_data.c   |  31 ++++
 include/linux/mfd/tps68470.h                  |  12 ++
 include/linux/platform_data/tps68470.h        |  11 ++
 6 files changed, 248 insertions(+), 17 deletions(-)

-- 
2.34.1

