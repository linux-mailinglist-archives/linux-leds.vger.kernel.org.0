Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E03B8270B00
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 07:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgISFpf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 01:45:35 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:43765 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgISFpf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 01:45:35 -0400
X-Greylist: delayed 780 seconds by postgrey-1.27 at vger.kernel.org; Sat, 19 Sep 2020 01:45:34 EDT
Received: from methusalix.internal.home.lespocky.de ([92.117.44.159]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MtfeD-1kcPbe3KyF-00v676; Sat, 19 Sep 2020 07:32:13 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kJVTm-0004mv-6F; Sat, 19 Sep 2020 07:32:11 +0200
Received: (nullmailer pid 7638 invoked by uid 2001);
        Sat, 19 Sep 2020 05:32:09 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v5 0/3] leds: pwm: Make automatic labels work
Date:   Sat, 19 Sep 2020 07:31:42 +0200
Message-Id: <20200919053145.7564-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 3b5b4ff3ca3583cb7f12014899502a35
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:lq4IJsOe1g2SSinIL81Ac6vmNVDBhOTg7BqnGfzcGHy4V6soo2J
 uH7qOPwmitn/GQitYIFZWIVY4BTvpHXF7nwqQQBpeI0Ae4zjy5POOAyulbsr3gzIRmuA2yw
 tzEH9RyzvShIpJGZ1ykaVN+C4r8ePANfO5VjeF3NoX44AAfTnQN5DjEAMQnXsiggkmhNOMd
 AH9NOWXHnumPpVajy67EQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gnHs68amGnY=:VSrlcf9W5TJlXhsenUwuKN
 HeozVt3iH3lWYD6yjMEJSch83arRnaFdF64UrdBkef6ywGbTYOd6k0yxQ3b8AUecV2CwB8eEX
 Yzv1YjAIUVt/RVdG/6ZC6Hmjd8OKq5/CzUfZNbt+ktIfjb/GaMZsQd+Ih5CB41uxL/L7+fHWU
 x2Ejf8MaugQ9kNcYBSI6qwAEL06blzPZvjKlnRVZSwcwz9egeMymmk1d6aZ6Ip5HSvPlrquuJ
 nDxxpAxkJuhEnda5Ui8n8xcEWZ7HIJnhPvmQWqWI5DPvIxoKi9Isc19Hf38XW+lIyklfQzoo+
 CeklTaFJ+99m2XTL29owAwFaXvRtSTcdnJIqWIBHOXMXNodhAToV/XAKyXvrExoKXMQq31D3q
 efKYSsybp7ZAHCZQDSgCfWnq6DvXRNeYqqkFsi5aTfTXidEWDJ25Gec5KFG+Lmljn20CxNed7
 3nDD08DQhFTz4MyFSyKAsa1L9DBFoStR9BER6E6cYyNtqSdf+4aCke8yAM2gGX6k4a9IQ536t
 CZMXvyN+paVb7KEhJYXOv1boiHOKC/huFfpU0ere+e8zCB7fM+jAa9cliejtXCFoNUlnWI8rz
 zDYjQ0sg3WRyt9UUXOuO3L2Y3KUd5938Wez82e4LlRcEFZBr7M2F3b7Hh9ArOMsX0d7pW0rPc
 OHRDDyCM6hzqWa0YrS+l3zYyxAgCOYihJC6bXv+hRr9owxJ1ixqZDqp7aMa6jZWhnU6XOHvmF
 is/lEaCdq/1pCe57Z5nwcSWnkByMAwhxLH7dZU7fZp8r6b3HJFmwHK17QrksqSRGxRbN6GRWy
 opBaDTjuydQKnieduAQRBy2tGprM4U5JCDfo+1crFkTw1vqDay8TyWfmGRMrNw+XvPvpzmk
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hei hei,

for leds-gpio you can use the properties 'function' and 'color' in the
devicetree node and omit 'label', the label is constructed
automatically.  This is a common feature supposed to be working for all
LED drivers.  However it did not yet work for the 'leds-pwm' driver.

This series removes platform_data support for the leds-pwm driver and
takes the opportunity to update the leds-pwm dt-bindings accordingly.

v5 was tested on a at91 sama5d2 based platform with LEDs connected to
GPIO and PWM.

Greets
Alex

v5:
- replaced patch 1/3 by a new patch removing platform_data support for
  the leds-pwm driver
- little rewording of commit message in patch 2/3
- updated patch 3/3 based on feedback by Rob Herring
- added Marek Behún to Cc, because he also works on removing
  platform_data support
- rebased series on pavel/for-next

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
  leds: pwm: Remove platform_data support
  leds: pwm: Allow automatic labels for DT based devices
  dt-bindings: leds: Convert pwm to yaml

 .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
 .../devicetree/bindings/leds/leds-pwm.yaml    | 82 +++++++++++++++++++
 drivers/leds/leds-pwm.c                       | 33 ++------
 3 files changed, 89 insertions(+), 76 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml


base-commit: 03eb2ca44a95105d1482d5e7471016cf8b383f97
-- 
2.20.1

