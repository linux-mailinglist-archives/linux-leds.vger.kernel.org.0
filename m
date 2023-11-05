Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 084F37E1425
	for <lists+linux-leds@lfdr.de>; Sun,  5 Nov 2023 16:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjKEPuc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Nov 2023 10:50:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjKEPub (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 Nov 2023 10:50:31 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AB8C0;
        Sun,  5 Nov 2023 07:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=s31663417; t=1699199407; x=1699804207; i=wahrenst@gmx.net;
        bh=E+uuZK0fZ3sQgZHVpDH9aNXrkwpKbdWZFY3Elss2xDQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
         References;
        b=ZwJDjVwYRbGPevbhaFM0qsTduCZM2KzCnMDYYpF0t9IeiOFqJ+X7lyZT4STn6lWd
         QazMipWl4onwbZoXG1kTz2MIR9yW0SAyBrXg+LOF8+rSGY476cpZbmhLwdVzBIqtm
         eyAB4CuYteN6W9WhFtepprcbcAGEFbLQmfzNeGa09lRS4yXgR610ZIy83McJdOy5v
         3FhcJZ9Fyd0D3EEIilxEiA9b4kneWugklUQsLJ4y1y6Lysea3By6zBWIY/wymUypn
         h/jZ0c6U7Ipzf9s8QmpuUo2MNn5Dzm6rw2K67id7Ec5F3NxV6qfR+kHg8jbdLJv26
         a5GaPDru1eGufMAGxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxUrx-1rNUhT3KyP-00xwLd; Sun, 05
 Nov 2023 16:50:06 +0100
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-leds@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 1/2] leds: gpio: Add kernel log if devm_fwnode_gpiod_get fails
Date:   Sun,  5 Nov 2023 16:49:39 +0100
Message-Id: <20231105154940.97688-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231105154940.97688-1-wahrenst@gmx.net>
References: <20231105154940.97688-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g/ABuhNfhXEgaEmxztr++3ouhCxeHfxNMdLitbdYTdQ59lcT/U+
 loEAX3JHHDZHeY9sEhOMMVqilQ/3jszY3gcwmD8epmHJGDVXZpzTePmpM3J4ezMUwqJQGN9
 3tPjlakiHQyIRY0jyu/2e7Xpbp5Wo0v93tTdW1uLkdM44FENOLItTalR24CF0g8zY1I4FNd
 c2T/JJQ4DutGgyhWHGTSA==
UI-OutboundReport: notjunk:1;M01:P0:WebLp+kRBqU=;4NJHIe8pJZo2cbOAe8i7xbf8s6o
 0jxPVeP0txTadlj25G7EaIT7WgI+1jHygu2Lmc+DepnPISI4Q4Mk7mQ+cYatVQkiVOnBMpQJq
 UeXVxIAVOdAFKNjJbB1KpsiCJw2FtpHR1hbqq41pKww5SsZL6RBtR1nL8qrxata2ITgqL/kza
 4Yf7LqXTG2Ajt0N+k+UNPeiFfWdWub2gaSIsFZ44eQGPO8y7coY9+kllUEXiasY/ARFi8OU5Q
 yNUQOyQUJgaryivY0NGQuhXpIf3HKPhZ424kvnLThGUrRBT78XtSFRqKoSxFB4HIaIprkGktR
 N3junhRKJAJyzLfFsoduiBIt55B81POznYhSVgHsuTt/WyjN+gQv1Chh5enkQcQe9IcxPdG92
 MAA64ZIEiKOJNog8nlM6oQb+ZU01kcqPHsnPjnzhXIPwnZ3/OzA01SHClSslnneDV8LGvJXte
 51N8iksdYpkwdZPwkCMo/teqtBALTuIEt4Q+/px8ZP6P3WNawr+jhFgUQrE/uKznAQ7MmbP6a
 IdvXdSueqqZJCqY+tWpHD9BgGBDFG1hcnum8vCTGr9X8iTX36VXhA3hdwfPFfw07Na7PcJNNa
 9jOfWE2qHoWwHXFZLZOd35upSF/E57b8FC2Gbv75TBTGFIxR1FduQ1YvoPYo1XB1MMCKnbVqU
 BaCxMgm89gJGo56/TAFL6ALE863ZPg0VBNlahk0y+gedr7KqaluXh+ktUJB7BD67NUm/vrNHt
 E3+nD+YOk0zW3HmuI0GJ5A4eyZ7B1N3y9my/rVINubvNRySFGq52BOwVcZpT9psTdlS3yAh17
 mjUGfUfCcE1svLSDBqncCv4JK8/F5xi2EwopJF+QjUJrxjpndwiubyeSiRQyHx97lO7Gp4Msb
 ptYZtSEdfRt7MGIMlFNgmgDCRoOUb1Kt+s3d4XLMRmISSsOMO+2RDbP/xaXSBzo9CG/4bdMgV
 /HWS1Q==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In case leds-gpio fails to get the GPIO from the DT (e.g. the GPIO is
already requested) the driver doesn't provide any helpful error log:

    leds-gpio: probe of leds failed with error -16

So add a new error log in case devm_fwnode_gpiod_get() fails.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/leds/leds-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 710c319ad312..284a9e66fd9e 100644
=2D-- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -172,6 +172,8 @@ static struct gpio_leds_priv *gpio_leds_create(struct =
device *dev)
 		led.gpiod =3D devm_fwnode_gpiod_get(dev, child, NULL, GPIOD_ASIS,
 						  NULL);
 		if (IS_ERR(led.gpiod)) {
+			dev_err(dev, "Failed to get gpio '%pfw': %ld\n",
+				child, PTR_ERR(led.gpiod));
 			fwnode_handle_put(child);
 			return ERR_CAST(led.gpiod);
 		}
=2D-
2.34.1

