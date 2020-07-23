Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 175CE22AFB6
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 14:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbgGWMx0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 08:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgGWMxZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2020 08:53:25 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39CDC0619DC
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2020 05:53:25 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 5ECCB14095F;
        Thu, 23 Jul 2020 14:53:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1595508803; bh=j+8m6bsjeK2sBBux8I46aH+ZcWiRThLh7nyZdHzPVw8=;
        h=From:To:Date;
        b=dWuJ+bITOeabRdAYPciWoJ+vnvNFdTEJUnEoDdKS+Yx22v6HiENKKH2SMKdQ9LEqE
         i1YTtcMlQA/oJhycpYG5oI+U2FHS8vR39rZvifpFjd4uGjhVr+4IjlP51RfV0Ga/GX
         Bki88RAU/GYp50srYRmfubB1pFNW5yvyUWCAAoG0=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, jacek.anaszewski@gmail.com,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v7 0/3] Add Turris Omnia LEDs driver
Date:   Thu, 23 Jul 2020 14:53:17 +0200
Message-Id: <20200723125320.3572-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

this is version 7 of LED driver for Turris Omnia, appliable on top
of Pavel's for-next branch.

Marek

changes since v6:
- comment formatted to 80 columns as per Pavel's request

changes since v5:
- added additionalProperties: false to yaml scheme as requested by Rob
- changed 'multi color' to 'multicolor' in commit message
- changed LEDS_CLASS_MULTI_COLOR to LEDS_CLASS_MULTICOLOR in Kconfig
  depend
- added Rob's reviewed-by tag to dt patch and Dan's to driver adding
  patch

changes since v4:
- fixed a typo in dt-binding
- change to dt-binding documentation as suggested by Dan Murphy so that
  it is less confusing
- cleaning up some things in the code addressed by Dan Murphy
- added sysfs ABI documentation for the brightness file controlling the
  brightness of the whole panel

changes since v3:
- added a note in yaml scheme to the description of multi-led property
  that no subnodes for the specific channels are needed since this
  controller only supports RGB LEDs. A comment into the device-tree
  example in the yaml scheme is added saying the same thing.

changes since v2:
- using multicolor LED framework now, major rewrite
- added support for global brightness (Omnia has a button which can
  switch between 8 levels of intensity of all the LEDs at once, but
  in reality any value between 0% and 100% can be set, and we want to
  access this setting via software)

Marek Behún (3):
  dt-bindings: leds: add cznic,turris-omnia-leds binding
  leds: initial support for Turris Omnia LEDs
  Documentation: ABI: leds-turris-omnia: document sysfs attribute

 .../sysfs-class-led-driver-turris-omnia       |  14 +
 .../leds/cznic,turris-omnia-leds.yaml         |  90 ++++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-turris-omnia.c              | 295 ++++++++++++++++++
 5 files changed, 411 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
 create mode 100644 drivers/leds/leds-turris-omnia.c

-- 
2.26.2

