Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4FA044AB44
	for <lists+linux-leds@lfdr.de>; Tue,  9 Nov 2021 11:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhKIKSt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 9 Nov 2021 05:18:49 -0500
Received: from mxout70.expurgate.net ([194.37.255.70]:52779 "EHLO
        mxout70.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243180AbhKIKSt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 9 Nov 2021 05:18:49 -0500
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mkO3P-0007Jy-16; Tue, 09 Nov 2021 11:08:35 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mkO3O-00087q-8X; Tue, 09 Nov 2021 11:08:34 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id CDF94240041;
        Tue,  9 Nov 2021 11:08:33 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id 53F3C240040;
        Tue,  9 Nov 2021 11:08:33 +0100 (CET)
Received: from localhost.localdomain (unknown [10.2.3.40])
        by mail.dev.tdt.de (Postfix) with ESMTPSA id 0C9CA20176;
        Tue,  9 Nov 2021 11:08:33 +0100 (CET)
From:   Florian Eckert <fe@dev.tdt.de>
To:     pavel@ucw.cz, robh+dt@kernel.org, Eckert.Florian@googlemail.com
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Florian Eckert <fe@dev.tdt.de>
Subject: [PATCH 0/2] leds: Add KTD20xx RGB LEDs driver from Kinetic
Date:   Tue,  9 Nov 2021 11:08:20 +0100
Message-ID: <20211109100822.5412-1-fe@dev.tdt.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: 151534::1636452514-00006D5A-0B19120C/0/0
X-purgate: clean
X-purgate-type: clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Introduce the KTD2061/58/59/60 RGB LEDs driver. The difference in these
parts are the address number on the I2C bus the device is listen on.

All KT20xx device could control up to 12 LEDs. The chip can be operated
in two variants.

Florian Eckert (2):
  leds: ktd20xx: Add the KTD20xx family of the RGB LEDs driver from
    Kinetic
  dt: bindings: KTD20xx: Introduce the ktd20xx family of RGB drivers

 .../bindings/leds/leds-ktd20xx.yaml           | 123 +++
 MAINTAINERS                                   |   7 +
 drivers/leds/Kconfig                          |  13 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-ktd20xx.c                   | 801 ++++++++++++++++++
 5 files changed, 945 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd20xx.y=
aml
 create mode 100644 drivers/leds/leds-ktd20xx.c

--=20
2.20.1

