Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC23E377FEB
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbhEJJwL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:52:11 -0400
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83]:16879 "EHLO
        fgw22-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230449AbhEJJwF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:05 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 37901f08-b175-11eb-88cb-005056bdf889;
        Mon, 10 May 2021 12:50:57 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 00/28] leds: cleanups and fwnode refcounting bug fixes
Date:   Mon, 10 May 2021 12:50:17 +0300
Message-Id: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

When analyzing the current state of affairs with fwnode reference counting 
I found that a lot of core doesn't take it right. Here is a bunch of
corresponding fixes against LED drivers.

The series includes some cleanups and a few other fixes grouped by a driver.

First two patches are taking care of -ENOTSUPP error code too  prevent its
appearance in the user space.

Andy Shevchenko (28):
  leds: class: The -ENOTSUPP should never be seen by user space
  leds: core: The -ENOTSUPP should never be seen by user space
  leds: el15203000: Give better margin for usleep_range()
  leds: el15203000: Make error handling more robust
  leds: el15203000: Correct headers (of*.h -> mod_devicetable.h)
  leds: el15203000: Introduce to_el15203000_led() helper
  leds: lgm-sso: Fix clock handling
  leds: lgm-sso: Put fwnode in any case during ->probe()
  leds: lgm-sso: Don't spam logs when probe is deferred
  leds: lgm-sso: Remove unneeded of_match_ptr()
  leds: lgm-sso: Remove explicit managed resource cleanups
  leds: lgm-sso: Drop duplicate NULL check for GPIO operations
  leds: lgm-sso: Convert to use list_for_each_entry*() API
  leds: lm3532: select regmap I2C API
  leds: lm3532: Make error handling more robust
  leds: lm36274: Put fwnode in error case during ->probe()
  leds: lm36274: Correct headers (of*.h -> mod_devicetable.h)
  leds: lm3692x: Put fwnode in any case during ->probe()
  leds: lm3692x: Correct headers (of*.h -> mod_devicetable.h)
  leds: lm3697: Update header block to reflect reality
  leds: lm3697: Make error handling more robust
  leds: lm3697: Don't spam logs when probe is deferred
  leds: lp50xx: Put fwnode in error case during ->probe()
  leds: lt3593: Put fwnode in any case during ->probe()
  leds: lt3593: Make use of device properties
  leds: pwm: Make error handling more robust
  leds: rt8515: Put fwnode in any case during ->probe()
  leds: sgm3140: Put fwnode in any case during ->probe()

 drivers/leds/Kconfig              |  7 ++-
 drivers/leds/blink/leds-lgm-sso.c | 86 +++++++++++++------------------
 drivers/leds/flash/leds-rt8515.c  |  4 +-
 drivers/leds/led-class.c          |  4 --
 drivers/leds/led-core.c           |  7 ++-
 drivers/leds/leds-el15203000.c    | 54 ++++++++-----------
 drivers/leds/leds-lm3532.c        |  7 +--
 drivers/leds/leds-lm36274.c       |  3 +-
 drivers/leds/leds-lm3692x.c       | 11 ++--
 drivers/leds/leds-lm3697.c        | 22 ++++----
 drivers/leds/leds-lp50xx.c        |  2 +-
 drivers/leds/leds-lt3593.c        | 13 ++---
 drivers/leds/leds-pwm.c           | 16 +++---
 drivers/leds/leds-sgm3140.c       |  8 +--
 14 files changed, 106 insertions(+), 138 deletions(-)

-- 
2.31.1

