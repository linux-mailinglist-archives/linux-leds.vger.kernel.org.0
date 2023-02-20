Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B92869D078
	for <lists+linux-leds@lfdr.de>; Mon, 20 Feb 2023 16:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbjBTPUy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Feb 2023 10:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231713AbjBTPUw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Feb 2023 10:20:52 -0500
Received: from mxout70.expurgate.net (mxout70.expurgate.net [91.198.224.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8095A30D6;
        Mon, 20 Feb 2023 07:20:49 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <prvs=9429674533=fe@dev.tdt.de>)
        id 1pU7y7-000F81-TL; Mon, 20 Feb 2023 16:20:43 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1pU7y7-0009Vd-6t; Mon, 20 Feb 2023 16:20:43 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id A910B24004B;
        Mon, 20 Feb 2023 16:20:42 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id 1A327240040;
        Mon, 20 Feb 2023 16:20:42 +0100 (CET)
Received: from localhost.localdomain (unknown [10.2.3.40])
        by mail.dev.tdt.de (Postfix) with ESMTPSA id 9C37F2C0D2;
        Mon, 20 Feb 2023 16:20:41 +0100 (CET)
From:   Florian Eckert <fe@dev.tdt.de>
To:     u.kleine-koenig@pengutronix.de, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, pavel@ucw.cz, lee@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Eckert.Florian@googlemail.com
Subject: [PATCH v4 0/2] leds: ledtrig-tty: add tty_led_mode xtension
Date:   Mon, 20 Feb 2023 16:20:36 +0100
Message-ID: <20230220152038.3877596-1-fe@dev.tdt.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: 151534::1676906443-5BFF91EA-05EE3E06/0/0
X-purgate: clean
X-purgate-type: clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

here commes v4 of this series to add additional tty_led_modes.


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
 drivers/leds/trigger/ledtrig-tty.c            | 146 ++++++++++++++++--
 drivers/tty/tty_io.c                          |  28 +++-
 include/linux/tty.h                           |   1 +
 4 files changed, 170 insertions(+), 21 deletions(-)

--=20
2.30.2

