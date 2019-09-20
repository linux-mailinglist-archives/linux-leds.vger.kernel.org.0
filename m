Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44CB7B8F5C
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2019 13:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408807AbfITL6P (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Sep 2019 07:58:15 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46664 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404368AbfITL6O (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Sep 2019 07:58:14 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KBwA4L065674;
        Fri, 20 Sep 2019 06:58:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568980690;
        bh=ey0viNTdU+GzdBNr4SUzMtQl3KW8nudMOoaA604+7+c=;
        h=From:To:CC:Subject:Date;
        b=iemKs8utd2aXKzYUao7FtZRIt5BpxxYouOflH1fVpdtG1gVit9CBNUu35AFfC0sfr
         no4ngcqEW9dYhOil8BkoKUV0yjYYZkgaBCA5jj/rfrEwM3WFzoNd7ErQvEWyMHNSK8
         fQ8rxpKb5cSoQxrEicQF1SLh2E1IY5mnbf/Gr3To=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KBwAQk098944
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 06:58:10 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 06:58:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 06:58:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KBw9ZA115013;
        Fri, 20 Sep 2019 06:58:09 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <dmurphy@ti.com>
CC:     <tomi.valkeinen@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v4 0/2] leds: tlc591xx: switch to managed LED registration
Date:   Fri, 20 Sep 2019 13:58:04 +0200
Message-ID: <20190920115806.14475-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This subject of this series used to be "leds: tlc591xx: switch to OF and
managed API"

This mini-series updates the tlc591xx driver to use the managed API. The
driver is also modified to pass the initialization data to the LED core
layer. The goal is to be able to the generic led-backlight [0] driver on
top of it.

changes in v4:
- rebased on top of linux-leds/for-5.5

changes in v3:
- rebased on top of linux-leds/for-next
- use devm_led_classdev_register_ext() instead of the late
  devm_of_led_classdev_register()
- let the LED core assign the names of the LEDs

changes in v2:
- fixed LED indexing. Previous version did not allow for holes: if n LEDs
  were used, they had to be led(0) to led(n-1)
Jean-Jacques Hiblot (2):
  leds: tlc591xx: simplify driver by using the managed led API
  leds: tlc591xx: use devm_led_classdev_register_ext()

 drivers/leds/leds-tlc591xx.c | 88 ++++++++++--------------------------
 1 file changed, 25 insertions(+), 63 deletions(-)

-- 
2.17.1

