Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3711B270FE1
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 20:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgISSDJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 14:03:09 -0400
Received: from mail.nic.cz ([217.31.204.67]:52574 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgISSDH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 14:03:07 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 591551409ED;
        Sat, 19 Sep 2020 20:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600538585; bh=HGvcLVwpyTZiR9gkCs18hJV4VUPiUmymIRmCaSweAE0=;
        h=From:To:Date;
        b=xcrNTMnhl9Kj42S/ai8Wxgvmf8E5AKPpm8PAuEWVRZ3rGhZsLdinhxABkTMZU89rU
         0KjT6lURFRIC2q6OKNrlXE97oAYJ2B2HjgspCNV3sWfv7eZPjBYA05Y5JZebF1a2NS
         6slvQr0GZiH6NbzrnhRUdepvrtsyJsxBW0JPgWLg=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v3 0/9] Start moving parsing of `linux,default-trigger` to LED core (a cleanup of LED drivers)
Date:   Sat, 19 Sep 2020 20:02:55 +0200
Message-Id: <20200919180304.2885-1-marek.behun@nic.cz>
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

this is v3, on top of your current for-next branch.

Changes:
- lm36274 again with the use-after-free issue you mentioned solved
- lm3532 does not need to parse `label` since it uses init_data
- leds-syscon can also use init_data by simple change
- the last patch, which moves parsing of `linux,default-trigger`, is now
  compatible with current version of the patches

Marek

Marek Behún (9):
  leds: lm36274: cosmetic: rename lm36274_data to chip
  leds: lm36274: don't iterate through children since there is only one
  leds: lm36274: use struct led_init_data when registering
  leds: lm36274: do not set chip settings in DT parsing function
  leds: lm36274: use platform device as parent of LED
  leds: lm36274: use devres LED registering function
  leds: lm3532: don't parse label DT property
  leds: syscon: use struct led_init_data when registering
  leds: parse linux,default-trigger DT property in LED core

 drivers/leds/led-class.c         |   5 ++
 drivers/leds/leds-an30259a.c     |   3 -
 drivers/leds/leds-aw2013.c       |   3 -
 drivers/leds/leds-bcm6328.c      |   4 -
 drivers/leds/leds-bcm6358.c      |   4 -
 drivers/leds/leds-cr0014114.c    |   3 -
 drivers/leds/leds-el15203000.c   |   3 -
 drivers/leds/leds-gpio.c         |   3 -
 drivers/leds/leds-is31fl32xx.c   |   3 -
 drivers/leds/leds-lm3532.c       |  15 ----
 drivers/leds/leds-lm36274.c      | 128 ++++++++++++++-----------------
 drivers/leds/leds-lm3692x.c      |   3 -
 drivers/leds/leds-lm3697.c       |   3 -
 drivers/leds/leds-lp50xx.c       |   3 -
 drivers/leds/leds-lp8860.c       |   4 -
 drivers/leds/leds-lt3593.c       |   3 -
 drivers/leds/leds-max77650.c     |   3 -
 drivers/leds/leds-mt6323.c       |   4 -
 drivers/leds/leds-ns2.c          |   3 -
 drivers/leds/leds-pm8058.c       |   2 -
 drivers/leds/leds-pwm.c          |   5 --
 drivers/leds/leds-syscon.c       |   9 +--
 drivers/leds/leds-tlc591xx.c     |   3 -
 drivers/leds/leds-turris-omnia.c |   2 -
 24 files changed, 68 insertions(+), 153 deletions(-)


base-commit: a0e550dc351ab5fabe8ea86e45b974494a0a6bf8
-- 
2.26.2

