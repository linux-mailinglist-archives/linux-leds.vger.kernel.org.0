Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64FD325832F
	for <lists+linux-leds@lfdr.de>; Mon, 31 Aug 2020 23:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730169AbgHaVDv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 31 Aug 2020 17:03:51 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:60641 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbgHaVDu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 31 Aug 2020 17:03:50 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.54.199]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MkYLW-1ksD3D0AV4-00m5Go; Mon, 31 Aug 2020 23:03:33 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kCqxd-0003pQ-Il; Mon, 31 Aug 2020 23:03:30 +0200
Received: (nullmailer pid 28155 invoked by uid 2001);
        Mon, 31 Aug 2020 21:03:29 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v2 0/2] leds: pwm: Make automatic labels work
Date:   Mon, 31 Aug 2020 23:02:29 +0200
Message-Id: <20200831210232.28052-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: ad2a6dfffa3c54d786fac54cb1795fd5
X-Spam-Score: -2.4 (--)
X-Provags-ID: V03:K1:tg9wxDQ6YEt1M1K6RtRpsEbXznLx5mI9gVYjX+JClg81c4uZwLE
 YW1E0R86vH9a30GOBkrFuZzKSY+73iS6LIeleV7oV9aq2EwvMr0eWIE9/dpYM6UW7ra4J5y
 z+CaEMXeFq/0zY4lbjsiHHGfbB7v4+9hP2xVyyxuBuOkINejkQ6xwK5BDGOLahbYlzj+N/l
 sdWj27hKpE+j0s7E3ValQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:THVtx+oo+0Y=:+Cz3jj5VZo8Pxf0bW0H4jW
 4eYqaKHaA6n4u+CjDh99uK/E69P/gQ0Fe1JE5s7DYS3N6mHMxYKiCikWa0ixLG32LmbIukWy6
 mOHuTPsx1kUNgviNkdFyyUHzOkUpe48dB/TPQVUetmnRp6T/4D/aNnmVENOGB63u1TMfHkdPz
 VGlar3vNEY8CjzHbUMDeVTr4c/K7QDKi0Wc6NEEykdjc1zAbp6vhjrmaJteDwpxlW3buX0gfD
 DG8NtBgFTAUfhrSTwSZdgZ76342SyGd8Ue2OiMEbKWRKaZQPMMoDPcPUxTwFxAd4hRZWNseHB
 uMl6kn14Fzk/cnayiaidRKy7fFjh8J0sRICh5RZDhBH0L/OzTptSZjDH9x6+piEv/XavrAjDU
 n8kldoVPqbMSmFCCefppBs2YFjb8Ec5kTTr9pGBzqOtwyFNEywyoszv9eStgampD0KsR/Lkpl
 Zg0IGu8BB8qaAJpxe7FUC5b8g2Pg18PvottKxA9Le3n/7bSpr9CSlQ10OS80627PzDGkrVqGt
 frYIh2NWacIZvSSc2B4okFnDI3gzv4gI0uIEQ0RYucTRBNVUhOeztP8V+q0GcgHEXsYzxCgep
 FG3gPMyXFPXupo4wMr4dsxJyVmWXfRhIay4tYmMKxNxYmvPwx9bSa2Zwuz/MO/cXuCqA6IHmJ
 FQOpQy5qLf5xKBEBdHeau0xBVnGqaQ3Jz+izAVsBoc/cCDoIvLyKoMYNe4kP7sF6bYwWjGpPD
 Tf4U+PmnkjR7jOapMRFRoyKHH1ctQeX+aSb0ATtIRSmb4c3UNtcQ/5Gl4pV8uH3+szUf4Lktw
 hM0m/hUaXgo5PScFr/bpEOBhN6+0ehnsHf6Fy2MDflZk2hZEfe+TvPc0DHudWM7yQz7w9Nd
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hei hei,

for leds-gpio you can use the properties 'function' and 'color' in the
devicetree node and omit 'label', the label is constructed
automatically.  This is a common feature supposed to be working for all
LED drivers.  However it did not yet work for the 'leds-pwm' driver.
This series fixes the driver and takes the opportunity to update the
dt-bindings accordingly.

v1: based on v5.9-rc2, backport on v5.4.59 tested and working

v2: based on v5.9-rc3, added the dt-bindings update patch

Greets
Alex

Alexander Dahl (2):
  leds: pwm: Allow automatic labels for DT based devices
  dt-bindings: leds: Convert pwm to yaml

 .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
 .../devicetree/bindings/leds/leds-pwm.yaml    | 85 +++++++++++++++++++
 drivers/leds/leds-pwm.c                       |  9 +-
 3 files changed, 93 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml

-- 
2.20.1

