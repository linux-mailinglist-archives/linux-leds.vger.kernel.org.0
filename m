Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF50459FF6
	for <lists+linux-leds@lfdr.de>; Tue, 23 Nov 2021 11:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235459AbhKWKVt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Nov 2021 05:21:49 -0500
Received: from mxout70.expurgate.net ([194.37.255.70]:54887 "EHLO
        mxout70.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbhKWKVs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Nov 2021 05:21:48 -0500
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mpSsi-0002Vw-UC; Tue, 23 Nov 2021 11:18:32 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mpSsi-0003m5-2I; Tue, 23 Nov 2021 11:18:32 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id AFDE6240041;
        Tue, 23 Nov 2021 11:18:31 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id 31E84240040;
        Tue, 23 Nov 2021 11:18:31 +0100 (CET)
Received: from localhost.localdomain (unknown [10.2.3.40])
        by mail.dev.tdt.de (Postfix) with ESMTPSA id B159820F00;
        Tue, 23 Nov 2021 11:18:30 +0100 (CET)
From:   Florian Eckert <fe@dev.tdt.de>
To:     pavel@ucw.cz, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2 0/2] leds: Add KTD20xx RGB LEDs driver from Kinetic
Date:   Tue, 23 Nov 2021 11:18:24 +0100
Message-ID: <20211123101826.9069-1-fe@dev.tdt.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
Content-Transfer-Encoding: quoted-printable
X-purgate: clean
X-purgate-ID: 151534::1637662712-000071A3-28DD6CAD/0/0
X-purgate-type: clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Introduce the KTD2061/58/59/60 RGB LEDs driver. The difference in these
parts are the address number on the I2C bus the device is listen on.

All KT20xx device could control up to 12 LEDs. The chip can be operated
in two variants.

v2: fix kbuild ci warnings
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Florian Eckert (2):
  leds: ktd20xx: Add the KTD20xx family of the RGB LEDs driver from
    Kinetic
  dt: bindings: KTD20xx: Introduce the ktd20xx family of RGB drivers

 .../bindings/leds/leds-ktd20xx.yaml           | 123 +++
 MAINTAINERS                                   |   7 +
 drivers/leds/Kconfig                          |  13 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-ktd20xx.c                   | 792 ++++++++++++++++++
 5 files changed, 936 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd20xx.y=
aml
 create mode 100644 drivers/leds/leds-ktd20xx.c

--=20
2.20.1

