Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27A67BA1CB
	for <lists+linux-leds@lfdr.de>; Sun, 22 Sep 2019 12:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728190AbfIVKYa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 22 Sep 2019 06:24:30 -0400
Received: from honk.sigxcpu.org ([24.134.29.49]:36228 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728172AbfIVKYa (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 22 Sep 2019 06:24:30 -0400
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 090C6FB05;
        Sun, 22 Sep 2019 12:24:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AQR9nS1p7lvh; Sun, 22 Sep 2019 12:24:27 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id B2A0548644; Sat, 21 Sep 2019 14:12:12 -0700 (PDT)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] leds: lm3692x: Probing and flag fixes
Date:   Sat, 21 Sep 2019 14:12:07 -0700
Message-Id: <cover.1569100154.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The driver currently returns success on init although probing fails and
register setup uses flag values from other registers which is confusing when
reading the driver. This series cleans this up.

Changes from v2:
- Add Acked-by from Pavel Machek, thanks!
  https://lore.kernel.org/linux-leds/20190920114743.GA21835@amd/
- As per review comment from Dan Murphy
  https://lore.kernel.org/linux-leds/2bde2870-08a3-38b9-9cd7-fee0e2107743@ti.com/
  - rename return value from ret2 to reg_ret
  - print error code

Changes from v1:
- Add reviewed by's from Dan Murphy, thanks!
  https://lore.kernel.org/linux-leds/cover.1568772964.git.agx@sigxcpu.org/T/#mc183f3f65931371fa9f9ca2e0e83e0b85010f24b
  https://lore.kernel.org/linux-leds/cover.1568772964.git.agx@sigxcpu.org/T/#mb845fac36327a5d5dd03fe7e988eef0eb5626f82
  https://lore.kernel.org/linux-leds/cover.1568772964.git.agx@sigxcpu.org/T/#m995bce73dda3e3bd4f0c2e8f98cbd04a39c13832
- As per review comment from Dan Murphy
  - Don't drop error message when disabling the regulator fails
    https://lore.kernel.org/linux-leds/cover.1568772964.git.agx@sigxcpu.org/T/#m2ab6dc33b7277b71a197c3747847f1c4d9d9c1d8
  - Handle -ENODEV (when the regulator is not set)
    https://lore.kernel.org/linux-leds/cover.1568772964.git.agx@sigxcpu.org/T/#mf6212c29bbfa37b43200ea2c9744074de4f068ee
- Add Acked-by from Pavel Machek, thanks!
  https://lore.kernel.org/linux-leds/20190919095415.GA29939@amd/

Guido Günther (5):
  leds: lm3692x: Print error value on dev_err
  leds: lm3692x: Don't overwrite return value in error path
  leds: lm3692x: Handle failure to probe the regulator
  leds: lm3692x: Use flags from LM3692X_BOOST_CTRL
  leds: lm3692x: Use flags from LM3692X_BRT_CTRL

 drivers/leds/leds-lm3692x.c | 47 +++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 17 deletions(-)

-- 
2.23.0.rc1

