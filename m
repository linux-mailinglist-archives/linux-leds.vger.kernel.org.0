Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B14F381E27
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 12:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhEPKzJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 06:55:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:47694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229478AbhEPKzH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 16 May 2021 06:55:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6C5F611B0;
        Sun, 16 May 2021 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621162433;
        bh=o26owUkPzbznUNvf/j3gzXChdDLd5dBQkyI4OqYODuI=;
        h=From:To:Cc:Subject:Date:From;
        b=QFHKbB86hlLT6YE/Y5p2Xq6owAKd3NAKrqIxLKOeio5VQLDOtyRcjooYAVbZ8VEvy
         Hpcmj0GU5Vor56djP1oyKIrL622tkwCKQ56UOH2BCzq/aMeavv7uMNdkTaI+UG1vHl
         O4wZl8v2wNjzbOoMRclbQ5GozJrfm+qslbRw9VDAR/5aisGNQGt2mSbCNLtscqsaCm
         w2Z64kzMVZLuPz/x72wfGqzDd+gqMa5YOJZ6L+38vdG2NZqIZMvnpbnzKJRU6G6XKC
         WNGuXcLtqWi7chr/AAPBDKjlLvwRlMT5s4D26XS2nOCmBXKZGyW+L+kobDu7tmE0WT
         /30wQz7LGUojQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liEP8-003s7x-J9; Sun, 16 May 2021 12:53:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 00/17] Add an experimental driver for Intel NUC leds
Date:   Sun, 16 May 2021 12:53:28 +0200
Message-Id: <cover.1621161037.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Greg,

This series add support for the LEDs found at Intel NUCs since
NUC version 6.

On several NUC models, the function of the LEDs are programmable,
which allow them to indicate several different hardware events.

They can even be programmed to represent an userspace-driven event.

Some models come with single colored or dual-colored LEDs, but
high end models have RGB LEDs.

Programming them can ether be done via BIOS or by the OS.

There are 3 different API types, and there is already some OOT
drivers that were written to support them, using procfs, each
one using a different (and IMO confusing) API.

After looking at the existing drivers and not liking the uAPI
interfaces there, I opted to write a new driver from scratch,
unifying support for all different versions and using sysfs
via the leds class.

It should be noticed that those devices use the Windows Management
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

I wrote this driver mainly for my NUC8 (NUC8i7HNK), but I used a NUC6
in order to double-check if NUC6 support was not crashing.  Yet, while
the NUC6 model I have accepts the WMI LED API, it doesn't work, as it
seems that the BIOS of my NUC6 doesn't let userspace to program the LEDs.

I don't have any devices using NUC10 API.

Due to the lack of full tests on NUC6 and NUC10, and because I
wrote a new uAPI that's different than the procfs-based ones found
at the OOT drivers, I'm opting to submit this first to staging.

This should allow adjusting the uAPI if needed, and to get feedback from
people using it on NUC6, NUC10 and on other NUC models that would be
compatible with it.

Mauro Carvalho Chehab (17):
  staging: add support for NUC WMI LEDs
  staging: nuc-wmi: detect WMI API detection
  staging: nuc-wmi: add support for changing S0 brightness
  staging: nuc-wmi: add all types of brightness
  staging: nuc-wmi: allow changing the LED colors
  staging: nuc-wmi: add support for WMI API version 1.0
  staging: nuc-wmi: add basic support for NUC6 WMI
  staging: muc-wmi: add brightness and color for NUC6 API
  staging: nuc-wmi: Add support to blink behavior for NUC8/10
  staging: nuc-wmi: get rid of an unused variable
  staging: nuc-wmi: implement blink control for NUC6
  staging: nuc-wmi: better detect NUC6/NUC7 devices
  staging: nuc-led: add support for HDD activity default
  staging: nuc-wmi: fix software blink behavior logic
  staging: nuc-wmi: add support for changing the ethernet type indicator
  staging: nuc-wmi: add support for changing the power limit scheme
  staging: nuc-led: update the TODOs

 MAINTAINERS                       |    6 +
 drivers/staging/Kconfig           |    2 +
 drivers/staging/Makefile          |    1 +
 drivers/staging/nuc-led/Kconfig   |   11 +
 drivers/staging/nuc-led/Makefile  |    3 +
 drivers/staging/nuc-led/TODO      |    8 +
 drivers/staging/nuc-led/nuc-wmi.c | 2100 +++++++++++++++++++++++++++++
 7 files changed, 2131 insertions(+)
 create mode 100644 drivers/staging/nuc-led/Kconfig
 create mode 100644 drivers/staging/nuc-led/Makefile
 create mode 100644 drivers/staging/nuc-led/TODO
 create mode 100644 drivers/staging/nuc-led/nuc-wmi.c

-- 
2.31.1


