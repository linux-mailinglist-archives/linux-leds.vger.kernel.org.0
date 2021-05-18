Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5CF1387BFF
	for <lists+linux-leds@lfdr.de>; Tue, 18 May 2021 17:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343869AbhERPK3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 May 2021 11:10:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:49426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238675AbhERPK2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 18 May 2021 11:10:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21E1361350;
        Tue, 18 May 2021 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621350550;
        bh=P8/Nc52S1Mm1vaMyPNp8Z+6fLczbT6upDCNfpoFSPTA=;
        h=From:To:Cc:Subject:Date:From;
        b=uKf7GbnyZKfClrbmJclmnmLQLaPJHShVvVL104Aa63/i6UnzZgKLsEYfX2sB4moV8
         jhaPAshW3T2XHw2JHsoJqn/xp9AHuRpbMK5g7y48PMJsB4bjqrP4gkvrOuHifQNuzg
         IwA4Pknhd6SngURK5Z+xGaPFFoT027KJQ3mu26BjX/bJ3lgAS/PnWpNsJ1t4MrBnDO
         AXgLL0sO6tFMsHntJCm+99+6BQZrtDZoz+WLUIC1m+zJbUra5+WXerv/cyYJ6BmqC/
         V66nsljbdCv0EZ5SoBKc+ivYmxuaYW7nRC2OLaUR83edjgXEqqos8FEaP0fE7la2CO
         /flFipDk/Bg0g==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lj1LH-007HNu-TR; Tue, 18 May 2021 17:09:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        gregkh@linuxfoundation.org, Pavel Machek <pavel@ucw.cz>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 00/17] Adding support for controlling the leds found on Intel NUC
Date:   Tue, 18 May 2021 17:08:49 +0200
Message-Id: <cover.1621349813.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series add support for the LEDs found at Intel NUCs since
NUC version 6.

On several NUC models, the function of the LEDs are controlled by the NUC firmware
and are programmable, which allow them to indicate several different hardware events.

They can also be programmed to represent an userspace-driven event.

Some models come with single colored or dual-colored LEDs, but high end models 
have RGB LEDs.

Programming them can ether be done via BIOS or by the OS, however, BIOS settings
are limited. So, the vendor offers a Windows application that allows to fully use the
functionality provided by the firmware/hardware.

It should be noticed that there are 3 different API types, and there are already some
OOT drivers that were written to support them, using procfs, each one using a 
different (and IMO confusing) API.

After looking at the existing drivers and not liking the uAPI interfaces there, 
and needed to ajust the LEDs again after BIOS config reset,  as this is a
recommended procedure after BIOS upgrades, I opted to write a new driver
from scratch, unifying support for all different versions and using sysfs via
the leds class.

It should be noticed that those devices use the ACPI Windows Management
Interface (WMI). There are actually 3 different implementations for it:

- one for NUC6/NUC7, which has limited support for programming just
  two LEDs;
- a complely re-written interface for NUC8, which can program up to
  seven LEDs, named version 0.64;
- an extended version of the NUC8 API, added for NUC10, called version 
  1.0, with has a few differences from version 0.64.

Such WMI APIs are documented at:
  - https://www.intel.com/content/www/us/en/support/articles/000023426/intel-nuc/intel-nuc-kits.html
  - https://raw.githubusercontent.com/nomego/intel_nuc_led/master/specs/INTEL_WMI_LED_0.64.pdf
  - https://www.intel.com/content/dam/support/us/en/documents/intel-nuc/WMI-Spec-Intel-NUC-NUC10ixFNx.pdf

It should be noticed that, I wrote this driver mainly for my NUC8 (NUC8i7HNK),
but I also used a NUC6 in order to double-check if NUC6 support was not
crashing.  Yet, while the NUC6 model I have accepts the WMI LED API, it
doesn't really work, as it seems that the BIOS of my NUC6 doesn't let
userspace to program the LEDs.

I don't have any devices using NUC10 API, so the few differences between it
and NUC8 API weren't tested.

Due to the lack of full tests on NUC6 and NUC10, and because I wrote a new 
uAPI that's different than the procfs-based ones found at the OOT drivers, 
IMO, the better would be to merge this via staging, but as Greg's feedback
were to apply it directly under drivers/leds, this version was changed 
considering such premise.

PS. : after having the series accepted, I'll submit an extra patch for
Documentation/ABI, summarizing the ABI documentation found on patch 01.

-

- v2:
  - Added an ABI documentation at patch 01 and dropped the TODO;
  - Removed the .remove function, as it was just printing a message;
  - Add a check for a return code, as suggested by Dan Carpenter;
  - Did some code cleanups as also suggested by Dan Carpenter;
  - Changed the Kconfig description as suggested by Randy Dunlap.

Mauro Carvalho Chehab (17):
  docs: describe the API used to set NUC LEDs
  leds: add support for NUC WMI LEDs
  leds: leds-nuc: detect WMI API detection
  leds: leds-nuc: add support for changing S0 brightness
  leds: leds-nuc: add all types of brightness
  leds: leds-nuc: allow changing the LED colors
  leds: leds-nuc: add support for WMI API version 1.0
  leds: leds-nuc: add basic support for NUC6 WMI
  leds: leds-nuc: add brightness and color for NUC6 API
  leds: leds-nuc: Add support to blink behavior for NUC8/10
  leds: leds-nuc: get rid of an unused variable
  leds: leds-nuc: implement blink control for NUC6
  leds: leds-nuc: better detect NUC6/NUC7 devices
  leds: leds-nuc: add support for HDD activity default
  leds: leds-nuc: fix software blink behavior logic
  leds: leds-nuc: add support for changing the ethernet type indicator
  leds: leds-nuc: add support for changing the power limit scheme

 Documentation/leds/index.rst    |    1 +
 Documentation/leds/leds-nuc.rst |  447 +++++++
 MAINTAINERS                     |    7 +
 drivers/leds/Kconfig            |    8 +
 drivers/leds/Makefile           |    1 +
 drivers/leds/leds-nuc.c         | 2097 +++++++++++++++++++++++++++++++
 6 files changed, 2561 insertions(+)
 create mode 100644 Documentation/leds/leds-nuc.rst
 create mode 100644 drivers/leds/leds-nuc.c

-- 
2.31.1


