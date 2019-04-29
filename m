Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47AFDEC14
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 23:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729482AbfD2V3t (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 17:29:49 -0400
Received: from mail.nic.cz ([217.31.204.67]:52787 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729476AbfD2V3r (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 29 Apr 2019 17:29:47 -0400
Received: from dellmb.labs.office.nic.cz (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTP id D3D31634BF;
        Mon, 29 Apr 2019 23:29:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556573384; bh=efzGKcrrcPtOmI7mxgh/2hMIHbPJD71C1NA1mop4rdY=;
        h=From:To:Date;
        b=smx9sKVCIrK1LFwuzvNC+aYvxKQZszIs61Z2ARzALL67C2Wmbfpcz6f7F3UUrqE+f
         nBicSGIohwCyJLuA9A29ry1EZ1EFUqrrg7p7xNJZn+RFQ286buUyCf/+dRo1MTpobK
         Tp6kKx4oDTFlfya9KbaKj8d+7y+/jCYS8EwBeEJQ=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds/for-next v2 0/2] leds: turris_omnia changes
Date:   Mon, 29 Apr 2019 23:29:42 +0200
Message-Id: <20190429212944.15643-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi, I am sending v2 of changes for leds-turris-omnia:

Changes since v1:
 - addressed Pavel's comments, he is right
 - also added code to set default color of all LEDs to [255,255,255] on driver
   unbind event, because LEDs are on this event also being put into HW trigger
   mode and if their previous colors were for example set to [0,0,0], the HW
   would not be able to light them up

Tested on my Omnia just now.

Marek

Marek Behún (2):
  leds: turris_omnia: build if CONFIG_COMPILE_TEST=y
  leds: turris-omnia: Add support for 256 brightness values

 drivers/leds/Kconfig             |  6 +++---
 drivers/leds/leds-turris-omnia.c | 21 +++++++++++++++++++--
 2 files changed, 22 insertions(+), 5 deletions(-)

-- 
2.21.0

