Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A921331237
	for <lists+linux-leds@lfdr.de>; Mon,  8 Mar 2021 16:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhCHPbY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Mar 2021 10:31:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:60270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229813AbhCHPa5 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 8 Mar 2021 10:30:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83E1665268;
        Mon,  8 Mar 2021 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615217456;
        bh=XDn9VnP1zc9fiTUfyroWNAus/+DLV8iMrXEa3AaEajs=;
        h=From:To:Cc:Subject:Date:From;
        b=WQPDsm91L2N5ld9qXRa5w/00lS7brnd5KDvyc03E5J7uAil/ycy9OAoBlcPNGSQ+I
         yrdCXxMxP9lWnVz4A63VcPgDtUMPy/swfeS2ozOGxfqGgXE1bX7nCDq6rRIEQ7xLrF
         /6hAT4ZNZqqYT/PAbtLAKkDBBSYHY1EsAbOR+9HgHgN21f4mMZh3JsTRZPjIbBXr6d
         KQoAuHBSD/Y4nH75t4XeGdzVQCgH1VQEEFxoLs3XNMAryp0OCH7h8pnPiOYWz4dqBm
         fXqWU30S9yaGyIDX84nSGqeN6TC3/XJKw9P4/W73Gmdki9FJtb9Ds+BuBmRZ2flGvi
         EtOFm4tqJozYg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] leds: lgm: fix gpiolib dependency
Date:   Mon,  8 Mar 2021 16:30:46 +0100
Message-Id: <20210308153052.2353885-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Without gpiolib, the driver fails to build:

    drivers/leds/blink/leds-lgm-sso.c:123:19: error: field has incomplete type 'struct gpio_chip'
            struct gpio_chip chip;
                             ^
    include/linux/gpio.h:107:8: note: forward declaration of 'struct gpio_chip'
    struct gpio_chip;
           ^
    drivers/leds/blink/leds-lgm-sso.c:263:3: error: implicit declaration of function 'gpiod_set_value' [-Werror,-Wimplicit-function-declaration]
                    gpiod_set_value(led->gpiod, val);
                    ^
    drivers/leds/blink/leds-lgm-sso.c:263:3: note: did you mean 'gpio_set_value'?
    include/linux/gpio.h:168:20: note: 'gpio_set_value' declared here
    static inline void gpio_set_value(unsigned gpio, int value)
                       ^
    drivers/leds/blink/leds-lgm-sso.c:345:3: error: implicit declaration of function 'gpiod_set_value' [-Werror,-Wimplicit-function-declaration]
                    gpiod_set_value(led->gpiod, 1);
                    ^

Add the dependency in Kconfig.

Fixes: c3987cd2bca3 ("leds: lgm: Add LED controller driver for LGM SoC")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/leds/blink/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/blink/Kconfig b/drivers/leds/blink/Kconfig
index 265b53476a80..6dedc58c47b3 100644
--- a/drivers/leds/blink/Kconfig
+++ b/drivers/leds/blink/Kconfig
@@ -9,6 +9,7 @@ if LEDS_BLINK
 
 config LEDS_BLINK_LGM
 	tristate "LED support for Intel LGM SoC series"
+	depends on GPIOLIB
 	depends on LEDS_CLASS
 	depends on MFD_SYSCON
 	depends on OF
-- 
2.29.2

