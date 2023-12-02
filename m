Return-Path: <linux-leds+bounces-237-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45902801E19
	for <lists+linux-leds@lfdr.de>; Sat,  2 Dec 2023 19:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBAA71F21009
	for <lists+linux-leds@lfdr.de>; Sat,  2 Dec 2023 18:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695C88813;
	Sat,  2 Dec 2023 18:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="pMxTOXhx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF30119
	for <linux-leds@vger.kernel.org>; Sat,  2 Dec 2023 10:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701542270; x=1702147070; i=wahrenst@gmx.net;
	bh=3HxM5kssNUFLCYwM5lCJgIgZwB5nFhoC1KwQjW2Es2g=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=pMxTOXhxRljCxmWpnJeZodr/7DvxEMmDbCvR0+LxwNMVSdnp1lpd6AxICTLITGou
	 n1Kv8uHGHrdXe6IbcnESO7MyifX7Ie7eAOrw8fCFGnFb7kd7n9o4VipzdKEHUzEBC
	 GsnN6knrCXWAI9gHzqGZ6g8DuMjdKDcQspbvNMMCgGEgN6/m9pPbL6u4uRaP2R7oO
	 xj9zdsEIQqyvqjwzOKiTzv3tYpZmFiB4zhHh98Y1TQLfKSJnQfawOPmFah64aNga7
	 0czHQijBGlvohij8QjvugLwye0Q6kkUzbCfv5dMOjk6HceECR6xJMflTOcw5nxvIb
	 +x2p44qbd/SmCBLvzg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7sHy-1rDKcW2RiE-004zto; Sat, 02
 Dec 2023 19:37:50 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3] leds: gpio: Add kernel log if devm_fwnode_gpiod_get fails
Date: Sat,  2 Dec 2023 19:36:36 +0100
Message-Id: <20231202183636.7055-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AtE5uwvxVIU8lclAcq4bJIZSThR52X6tjzV8ltx67vLHTRQFOBq
 TLGMx/NAAkt0FCjvhcaWQzf1RLVD4dvQSAsBPOlb1CK/oZx8yUoygY4pF6f3UCRy3f/MPZW
 THEeD/wPzTXHP/MEXSEOCS2q4bxFDFFgnm3y4MjfvjRUwU0yL9QoZCyOP7lxm/qcIYybH2d
 WObU4fZ0CKRHYCu3v9NkA==
UI-OutboundReport: notjunk:1;M01:P0:iEfrNUyOe3g=;MfOhNjkyewSN0u4gjUSJBiFU6hP
 YgOC6mvRQ1dXQa65eSG+Y9qv1KsOBC+aQC9LLQOp30E3G/H6/AhgQ6tR/4Go6UgdwfTZEx/TO
 e2kWY7GJY3lC6CDVHk8y0v9FcGpAsasXpbR7IvcxprWtFn7Q82DQrW0hFoD26vQUlSkAvPzT4
 59G+fNCJz7B+AAkv0H8yW4MSzmyuk03GQ8g+n7q+yQfgp1cEYx7Rq2ChFTBE0cs8J/wkMTqJl
 g5GezPQVpRYN7RlCDW9eAOI2Kb2xgeyZFGXpRZdlyppub2tycANKXU2lZ9RkunbENb+IeJ1qc
 Pg/zZicQPCuxWwK932STj/EKrTAOnGFFF+1DFuQw7O/O4wJSDb+eE1JLN9ZIvimZ7ITkU8hLz
 hCOJ3McH19xF+SFY1LcvoupXQAnEL+7+2IH8QRRGTC6GEyN+4avRGno8zTfTJNnHLt2nrAaDR
 VSphvfAmlZqeUEig01YqK/Ct558FpxpHViAAQdIvJusKXE3tm+7OJucOA1PK+lQYONRpGqj7D
 DY8zPTfgqTRaLH3aE7N3p6whHKrF3vLmdIhbmRQ11gkV6oLlvpWVuHDRNf0ZDnrQMgbzArp3d
 T/m+E9l6BgFEIKDTGbMROFz7HiYVMlQQzy4lMdoqWBm701pMxT3skU/H9fZTJLc/qIMF/ozoK
 6HJIhHZnvbluL02Tn6uGvIEU/y5x5MYWgSchQJXZ0u9Bpv32PvlsckGN6FpEnWo6zF4P3rS5+
 nwa3u5Q2OfoGaGU4zEkkh5FQK03Z3hATjDx+3Fpbd8U7mbrTS58bZGZCL5VWiBAkjfdxyBLMr
 ouz+f3+F/+Wz6eCMoEuHdRrLR28A9pBU5A596doACE6ms4Vc97rG1i4dXN5YTH3RAvroQITnd
 tPJdfExM0+r6ovMxGrOOIeuCbeOca2mxAyHwQll0+u7Zql+lkImoC2YkUZ02zcjywfMUkRbve
 Ur0JPg==

In case leds-gpio fails to get at least one of possibly many GPIOs
from the DT (e.g. the GPIO is already requested) neither gpiolib nor
the driver does provide any helpful error log:

    leds-gpio: probe of leds failed with error -16

As the driver knows better how to handle errors with such mandatory
GPIOs, let's implement an error log which points to the affected
GPIO.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--

Previous discussion:
https://lore.kernel.org/linux-leds/20231201112330.GD3259151@google.com/T/

Changes in V3:
- drop already applied patch from series
- s/gpio/GPIO/ as suggested by Lee Jones
- improve commit message

Changes in V2:
- replace dev_err with dev_err_probe to handle EPROBE_DEFER properly

 drivers/leds/leds-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 710c319ad312..83fcd7b6afff 100644
=2D-- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -172,6 +172,8 @@ static struct gpio_leds_priv *gpio_leds_create(struct =
device *dev)
 		led.gpiod =3D devm_fwnode_gpiod_get(dev, child, NULL, GPIOD_ASIS,
 						  NULL);
 		if (IS_ERR(led.gpiod)) {
+			dev_err_probe(dev, PTR_ERR(led.gpiod), "Failed to get GPIO '%pfw'\n",
+				      child);
 			fwnode_handle_put(child);
 			return ERR_CAST(led.gpiod);
 		}
=2D-
2.34.1


