Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97F791B2E17
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2020 19:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729130AbgDURRf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 Apr 2020 13:17:35 -0400
Received: from lists.nic.cz ([217.31.204.67]:35670 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725990AbgDURRf (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 21 Apr 2020 13:17:35 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 5020F13F7F8;
        Tue, 21 Apr 2020 19:17:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1587489453; bh=LWIcie82yUjRh/8jKgpGVs3a6HjwmDYIuje8bLse8PM=;
        h=From:To:Date;
        b=ro0Ufmm6yGlI0qCHRfwIe98dHaOUsUL8qZWZBNoWbjebY1r5V7OSGTWNmmp78acqf
         l7fBsxaMr+aYDpGGdiAzJtV8fgnC6lWEtwdpw4bqwsMi93tyCTMjCyZAoGAm6vpsXs
         CC5oDlu4Ycy8N4GP7lVJEmyStIFf/Twz/pDF+4Io=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH 0/2] Add Turris Omnia LEDs driver
Date:   Tue, 21 Apr 2020 19:17:30 +0200
Message-Id: <20200421171732.8277-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

this adds support for the Turris Omnia front panel RGB LEDs.
The patches should apply on Pavel's for-next branch.

Changes since RFC:
- added device-tree bindings documentation
- the reg property is abandoned, as discussed previously on mailing
  list, since it can be deduced from led-sources
- setting devicename is dropped

After a call with Pavel I decided that it would be good to first merge
this driver in this state, and then work on improving it, eg:
- adding support for changing global brightness via sysfs file as
  discussed previously
- adding support for proper device name (the first part of the sysfs
  name for the LED classdev). The best way to connect a LED to a device
  (for example a network interface) is via a phandle in device tree
  (utilizing trigger-sources, for example). This could be implemented
  as a LED subsystem library function and then used by drivers

Marek

Marek Behún (2):
  dt-bindings: leds: add cznic,turris-omnia-leds binding
  leds: initial support for Turris Omnia LEDs

 .../leds/cznic,turris-omnia-leds.yaml         | 113 +++++++
 MAINTAINERS                                   |   6 +-
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-turris-omnia.c              | 285 ++++++++++++++++++
 5 files changed, 414 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
 create mode 100644 drivers/leds/leds-turris-omnia.c

-- 
2.24.1

