Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500D7271195
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 02:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgITAZE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 20:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgITAZE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 20:25:04 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B3FC0613CF
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 17:25:04 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 9312E1409F6;
        Sun, 20 Sep 2020 02:25:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600561501; bh=4rBkVyzUgRC88uXItpIeaQB+7FWRHAYn5480/BYR6wY=;
        h=From:To:Date;
        b=hGPvlmjnZFsgPxrQ+5k/Pi4KdLhpD3mJycLa05YTn/71TnvkWRKic6/ge3tDIaH2b
         meNv9PJiADZ3TpCeKIJj10DjsoRKkqfLVNksYRCfB+cwK9PFIOZ3gqgUD3GUjdRfsa
         hlzGfhoCcgoUP4p/ZQQJr/35io09qxeUGE3shWho=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Peter Meerwald <p.meerwald@bct-electronic.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Zahari Petkov <zahari@balena.io>
Subject: [PATCH leds 0/7] leds: pca963x cleanup
Date:   Sun, 20 Sep 2020 02:24:53 +0200
Message-Id: <20200920002500.5851-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

this is a cleanup of pca963x LED driver, in spirit of previous
patches I sent recently.

This series should apply on your for-next.

Marek

Cc: Peter Meerwald <p.meerwald@bct-electronic.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>
Cc: Zahari Petkov <zahari@balena.io>

Marek Behún (7):
  leds: pca963x: cosmetic: use helper variables, better indentation
  leds: pca963x: use devres LED registering function
  leds: pca963x: cosmetic: rename variables
  leds: pca963x: cosmetic: rename variables
  leds: pca963x: use flexible array
  leds: pca963x: register LEDs immediately after parsing, get rid of
    platdata
  leds: pca963x: use struct led_init_data when registering

 drivers/leds/leds-pca963x.c                | 399 +++++++++------------
 include/linux/platform_data/leds-pca963x.h |  35 --
 2 files changed, 168 insertions(+), 266 deletions(-)
 delete mode 100644 include/linux/platform_data/leds-pca963x.h


base-commit: a0e550dc351ab5fabe8ea86e45b974494a0a6bf8
-- 
2.26.2

