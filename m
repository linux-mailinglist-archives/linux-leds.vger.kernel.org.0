Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1205069EFA7
	for <lists+linux-leds@lfdr.de>; Wed, 22 Feb 2023 08:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbjBVHz7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Feb 2023 02:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjBVHz6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Feb 2023 02:55:58 -0500
Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EAE2BEF3;
        Tue, 21 Feb 2023 23:55:55 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <prvs=9431929e93=fe@dev.tdt.de>)
        id 1pUjyg-000UrY-Ce; Wed, 22 Feb 2023 08:55:50 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1pUjyf-0002DS-Iu; Wed, 22 Feb 2023 08:55:49 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id 29FFB24004B;
        Wed, 22 Feb 2023 08:55:49 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id 93103240040;
        Wed, 22 Feb 2023 08:55:48 +0100 (CET)
Received: from localhost.localdomain (unknown [10.2.3.40])
        by mail.dev.tdt.de (Postfix) with ESMTPSA id DEA272B933;
        Wed, 22 Feb 2023 08:55:47 +0100 (CET)
From:   Florian Eckert <fe@dev.tdt.de>
To:     u.kleine-koenig@pengutronix.de, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, pavel@ucw.cz, lee@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Eckert.Florian@googlemail.com
Subject: [PATCH v6 0/2] leds: ledtrig-tty: add tty_led_mode xtension
Date:   Wed, 22 Feb 2023 08:55:37 +0100
Message-ID: <20230222075539.484878-1-fe@dev.tdt.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: 151534::1677052550-7915299C-E60BD40E/0/0
X-purgate-type: clean
X-purgate: clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

here commes v6 of this series to add additional tty_led_modes.

v6:
Changes compared to the v5 patchset with
20230221081901.15557-1-fe@dev.tdt.de are.

Addressed review comments by kernel test robot are:

* fix Documentation/ABI/testing/sysfs-class-led-trigger-tty:9:
  WARNING: Unexpected indentation.
* fix Documentation/ABI/testing/sysfs-class-led-trigger-tty:9:
  WARNING: Block quote ends without a blank line; unexpected unindent.

Thanks to Jiri Slaby, who gave me the crucial hint of what I need to fix,
to possibly make the 'Kernel test robot' happy.


v5:
Changes compared to the v4 patchset with
20230220152038.3877596-1-fe@dev.tdt.de are.

Sorry for the inconvenience, but I sent the wrong patch for
ledtrig-tty.c in v4. The v5 patchset now includes all the changes I
specified in the v4 patchset.


v4:
Changes compared to the v3 patchset with
20230220093739.320478-1-fe@dev.tdt.de are.

Addressed review comments by Jiri Slaby are:

ledtrig-tty.c:
- Do not use __TTY_LED_MAX pattern us instead __TTY_LED_LAST =3D TTY_LED_=
RNG
- Move declartion and assignment into one singel line
- Use __TTY_LED_LAST pattern, to simplify tty_mode_show and
  tty_mode_store handling


v3:
Changes compared to the v2 patchset with
20230217094403.1574468-1-fe@dev.tdt.de are.

Addressed review comments by Greg K-H are:

tty.h:
- Fix first comment line and remark -%ENOTTY for the new function
  'tty_get_mget' to make a proper kernel doc.
- Add the return value -%ENOTTY again, I thought it was no longer needed.


v2:
Changes compared to the initial patchset with
20230213140638.620206-1-fe@dev.tdt.de are.

Addressed review comments by Jiri Slaby are:

tty.h:
- Fix compilation error because of wrong rebaseing
- Remove empty lines
- Use new 'tty_get_mget' in 'tty_tiocmget'

ledtrig-tty.c:
- Update commit description
- Use enum for tty_led_mod in struct ledtrig_tty_date
- Rename sysfs file from 'mode' to 'tty_led_mode'
- Change tty_led_mode show function to use loop instead of switch/case
- Change tty_led_mode store function to use loop instead of switch/case
- Check return value of function tty_get_mget


Florian Eckert (2):
  tty: new helper function tty_get_mget
  trigger: ledtrig-tty: add additional modes

 .../ABI/testing/sysfs-class-led-trigger-tty   |  16 ++
 drivers/leds/trigger/ledtrig-tty.c            | 145 ++++++++++++++++--
 drivers/tty/tty_io.c                          |  28 +++-
 include/linux/tty.h                           |   1 +
 4 files changed, 169 insertions(+), 21 deletions(-)

--=20
2.30.2

