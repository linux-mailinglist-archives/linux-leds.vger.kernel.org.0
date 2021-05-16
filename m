Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D24F381E3B
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 12:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbhEPKzQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 06:55:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:47724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230158AbhEPKzI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 16 May 2021 06:55:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CAC761352;
        Sun, 16 May 2021 10:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621162433;
        bh=21CCoTvk0P2nJNZOW0CE5KdGJy4Om6wkSpbdQjM6tQE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Jh0QJfnixOHk8arKkDDHxCVbP5npvVzJVxnUcpLmtf2vx5NPm3v2DwoJuA0iu+k0N
         Ly/4kjcqVUm+0rrnWc/GpHIEzjoOXPGQOLtAoFinU1rJo54Bs6UJ/mEe/bLcx6iUrH
         QhVk9XC+JJ9UDFHEBn2cB8T/VxaWoEnI1xydgmfixhnm/lcwgOhElhbGRmLFPfeNU9
         0g0Yvc6yIWtkfBo2XRFouGgINFsDC9DmiooFNQ6lMlumoy+3iL5cFSwwcBwC0qR9T3
         A7wBnpZA6Ncm7AW8Ll4cRB8Bn2sATVlPdvUDGIiryp6MsTATZ7nJgE4DB0nkq55zgl
         GpvHyWEnTChOg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liEP9-003s92-C4; Sun, 16 May 2021 12:53:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Pavel Machek" <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 17/17] staging: nuc-led: update the TODOs
Date:   Sun, 16 May 2021 12:53:45 +0200
Message-Id: <f23fed6a89f66564f5af52f241016a4b9823ce04.1621161037.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621161037.git.mchehab+huawei@kernel.org>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Now that most functionality were merged at the driver,
update its TODO list, and add a "TODO" comment for the two
WMI API commands that are currently not implemented.

In summary:

-  on Rev 0.64, command 0x07 (LED_NOTIFICATION) is meant to store
   all config settings at EEPROM. That doesn't seem to be needed
   on Skull Canyon, but tests with different hardware would be
   nice in order to double-check it. Also, maybe Rev 1.00 would
   make it mandatory;
-  Rev 1.00 added command 0x08 to switch the LED type
   (LED_SWITCH_TYPE at the driver's nomenclature) between
   single color LED and multi color LED). Not sure how this
   should be properly implemented (if this is the case);
-  The tests for NUC6 version were using a Skull Canyon NUC.
   It allowed to check that the driver's logic runs, but
   it is not enough to see if everything is really working.
   Tests on NUC6 or NUC7 are required;
-  On a suspend test, I noticed that some controls were reset
   to the default at resume time. It is required to check
   what's happening there and address it properly.
-  Need to validate the uAPI and document it before moving
   this driver out of staging.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/nuc-led/TODO      | 12 +++++++-----
 drivers/staging/nuc-led/nuc-wmi.c |  6 ++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/nuc-led/TODO b/drivers/staging/nuc-led/TODO
index d5296d7186a7..df6f3f653eb0 100644
--- a/drivers/staging/nuc-led/TODO
+++ b/drivers/staging/nuc-led/TODO
@@ -1,6 +1,8 @@
-- Add support for 6th gen NUCs, like Skull Canyon
-- Improve LED core support to avoid it to try to manage the
-  LED brightness directly;
-- Test it with 8th gen NUCs;
-- Add more functionality to the driver;
+- Test it with 6th gen and 10th NUCs;
+- Add support for LED_NOTIFICATION;
+- Add support for LED_SWITCH_TYPE;
+- Some LED parameters are changing after returning
+  from suspend. Need to check what's happening there
+  (hardware bug?) and ensure that the parameters will
+  be properly restored after resume.
 - Stabilize and document its sysfs interface.
diff --git a/drivers/staging/nuc-led/nuc-wmi.c b/drivers/staging/nuc-led/nuc-wmi.c
index 2d9c49d72703..e87e97d56364 100644
--- a/drivers/staging/nuc-led/nuc-wmi.c
+++ b/drivers/staging/nuc-led/nuc-wmi.c
@@ -42,16 +42,14 @@ enum led_cmds {
 	LED_OLD_SET_LED                 = 0x02,
 
 	/* Rev 0.64 and 1.0 cmds */
-
 	LED_QUERY			= 0x03,
 	LED_NEW_GET_STATUS		= 0x04,
 	LED_SET_INDICATOR		= 0x05,
 	LED_SET_VALUE			= 0x06,
-	LED_NOTIFICATION		= 0x07,
-	LED_SWITCH_TYPE			= 0x08,
+	LED_NOTIFICATION		= 0x07, // TODO: add support for it
 
 	/* Rev 1.0 cmds */
-
+	LED_SWITCH_TYPE			= 0x08, // TODO: add support for it
 	LED_VERSION_CONTROL             = 0x09,
 };
 
-- 
2.31.1

