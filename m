Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1E44266288
	for <lists+linux-leds@lfdr.de>; Fri, 11 Sep 2020 17:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgIKPwT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Sep 2020 11:52:19 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:49049 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgIKPwI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Sep 2020 11:52:08 -0400
Received: from methusalix.internal.home.lespocky.de ([109.250.103.56]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1My3Ef-1kRwV22uGl-00zVsj; Fri, 11 Sep 2020 17:40:59 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kGlAW-00012l-Dq; Fri, 11 Sep 2020 17:40:57 +0200
Received: (nullmailer pid 28446 invoked by uid 2001);
        Fri, 11 Sep 2020 15:40:55 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v4 0/3] leds: pwm: Make automatic labels work
Date:   Fri, 11 Sep 2020 17:40:01 +0200
Message-Id: <20200911154004.28354-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 770cd104049592bdf1705ca88dc38dfa
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:e4FvXaQWDj87KwD0kEbtAGIU3u5VS+b8RpwJ8Fxy+7ih3wJ005A
 dC03taXs1FPmBoQuk4ab6GKiSV4FkUwZWKiod2sLL/htRdqmxD3y5vdUgfkknuYJLaSDD1B
 kI6GShk76+2S4ls/wX1LLXWySYA2UdZL1m+00mhsvQhWfN0CpQCRSxQYQn9Kkuix26Jvtna
 NqNUEGcsCyjK6txldsrUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tw3UZtp/rnM=:sDO9j+BgAKob0PGbBEVo5g
 mkmsuB6Wcj99V8EpMmMSwiIzYdzSQY3St+SRgZ6Wo4vRxQtu8aCJWNNbeVbRG9z4syWtf9hpw
 vYUvN6iCm9kG+JOX22QBoRCO/Cm60ZvsaN/+uaDqLxX3XuPV9YJYmz8I/+wCaNaLDopOgTOTk
 smYjL9YDYRTy7iBg8zp4TBiC5HEnAC3AcwTZb3OJAOLCb1Bzt9/1uF+J51qiAhagoFfh77208
 CincEkM7X6GJ1YCILC8mJJ6qIPheiUylCEpw/tiZdvCuBeFiPX7K2T//mPFWrf6PGerfphyIY
 vQdUr4R5kqY0b/fX729pmalf1Wh4u19HbQ7F4n6x2tGOlKGOTh9X4apAgqFVM+sg6LrpIvoYT
 Gd76viGE89v2RIGhZZodBIfS+fbg01eT7rd3fsb7PyC6gTM0H9CICCai6VdOyZ+/aZnQnTddo
 nN9c8fzjXogqsf43ZSN8WzyV+shS3WEM39HZkeamRGZkcLpdOsfhY1XyP/MJxsXKPKTwvmadY
 6SBnoepoL4pycMwSQjcCw919raEKDWg+hVzpZvGi3AgA8hPFxkwqbc5Ta9hNZntyY3NTVteyn
 F4yDZjAQWnJXwQ2PayR6YyBGT7EtvVClNIVKw58ynDbi4oF3OhfPyUiq2TlLCcFlGZeVVLq+9
 1SQv2T4y8RlJ3u8BmszpAmA9bBhKeoIhRA/4KC7aI1wswtnc5C47mtcjR9GNoI7hhSk2GghgQ
 UVjMMexq+gT2AypMhGuTrUweAZPjinepLO7r0E7bphEPoeGjAPBEOb9tPAl/pDCZs+7we0o3Y
 Ed5Knx3st8RkIW9JKq19EKn3gjmHWc1UQgAJHD8bYmaOG6OiPTLeyGZKG6Pr3MgWWnZdRNG
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hei hei,

for leds-gpio you can use the properties 'function' and 'color' in the
devicetree node and omit 'label', the label is constructed
automatically.  This is a common feature supposed to be working for all
LED drivers.  However it did not yet work for the 'leds-pwm' driver.

This series changes led-core a bit to add a non-ugly fix for the
leds-pwm driver and takes the opportunity to update the leds-pwm
dt-bindings accordingly.

v4 was tested on a at91 sama5d2 based platform with LEDs connected to
GPIO and PWM.

Greets
Alex

v4:
- added led-class patch handling fwnode passing differently (patch 1/3)
- adapted leds-pwm patch to new led-class (patch 2/3)
- contacted original author of leds-pwm dt binding on license issue
  (patch 3/3)

v3:
- series rebased on v5.9-rc4
- changed license of .yaml file to recommended one (patch 2/2)
- added Acked-by to both patches

v2:
- series rebased on v5.9-rc3
- added the dt-bindings update patch (2/2)

v1:
- based on v5.9-rc2
- backport on v5.4.59 tested and working

Alexander Dahl (3):
  leds: Require valid fwnode pointer for composing name
  leds: pwm: Allow automatic labels for DT based devices
  dt-bindings: leds: Convert pwm to yaml

 .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
 .../devicetree/bindings/leds/leds-pwm.yaml    | 85 +++++++++++++++++++
 drivers/leds/led-class.c                      |  2 +-
 drivers/leds/leds-pwm.c                       |  3 +-
 4 files changed, 88 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml

-- 
2.20.1

