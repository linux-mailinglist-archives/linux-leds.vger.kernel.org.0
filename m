Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEC551208AF
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2019 15:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbfLPOdH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Dec 2019 09:33:07 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37188 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728014AbfLPOdG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Dec 2019 09:33:06 -0500
Received: by mail-qk1-f196.google.com with SMTP id 21so2602386qky.4;
        Mon, 16 Dec 2019 06:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=iOSeUyEU1fkveiExoPDURDT6oyTtUpKpG0pS9lvxGPk=;
        b=hHxa+EilxYDWvtczudP+0nTtwS0qAb+p90p84Vjb9WBCWj8OGqda8Zm9KRVGxct8EZ
         fdkBWDe1TJBwYcZzY8NthMyNzOGUnZQmT6Fbu4vL99oACL6O79iQurTg5HyQW1zbP0ak
         y5S1hc22S1aNwEEAwsLUEttXcHjJf2ndve0vF/D0oGIVbHE0+0y9DJqdkghg3zT5lKAX
         5/+hMUS18YHlTj4pdUnuluISJ0JKClBlpcjQmlxJXsTes7j8cXdwNiyC0OV7P4qAihq8
         Eh4MBeQ1JylT/15tJ7kyUOn35QriHjCsjsU7hUQWRbBM36wJXHEPPf5PhzClzQnyZ3V5
         9Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iOSeUyEU1fkveiExoPDURDT6oyTtUpKpG0pS9lvxGPk=;
        b=JioUpvSnLFcpNLVUDIpwTNLzNn+p8VBLalo73fazXWD9+1RO74Q33ldrbVYp6kfImg
         b538ZUaRpH5kEcnFJjc2++b+p7kyItmHj06sthOya4430fxhaoiv7DhMFHuQaz12mz+N
         DahIDxalU35FxozdlE9qeTQqrxVbTz4KvziArsMtrZ7sLYo3Oa9q/CE5FxaOIqd+mcvu
         0v26MnY5bINiI+Vl/PWGjWeuJWc+NrMYe/Sb+/kk30s27zUVaDF8v5d7k5SURRuildVF
         F6k8VF1xxYG3nz15HmJxaBOdO1H6uFVu4/soZYh8FZS2n0Ag2odB+hQJcdQDptCPk5Mg
         BH1w==
X-Gm-Message-State: APjAAAX0rUue18I08XidBcz+I8ZmiGIp+wa4EJUe8RUG3+RGj6E/qaC+
        v4Q3bmpEjLLa4C4gYbBAUKI=
X-Google-Smtp-Source: APXvYqyvqDkwXVx1vUgCuwUdrEJNtkhmJ9S6wB4zjLnLnnzhRmbZLukDpMWiBw8mOaYKRqcgwKBDJQ==
X-Received: by 2002:a05:620a:b06:: with SMTP id t6mr28082853qkg.373.1576506785265;
        Mon, 16 Dec 2019 06:33:05 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id b3sm6966992qtr.86.2019.12.16.06.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 06:33:04 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v6 0/2] tps6105x add devicetree and leds support
Date:   Mon, 16 Dec 2019 09:32:57 -0500
Message-Id: <20191216143259.24587-1-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

v5 -> v6:
	Dan Murphy's suggestions:
	- s/mfd/MFD/
	- s/led/LED/
	- Added copyright message
	- fixed regmap_update_bits alignment
	- added a comment to clarify that fwnode / devicetree support is
	  optional, and device_get_next_child_node() returning NULL is
	  supported
	Lee Jones's suggestions:
	- removed 'Tree:' line from commit message
	- changed over to relative paths

v4 -> v5:
	Added Jacek Anaszewski's Acked-by tag on both patches.
	Added Rob Herring's Reviewed-by tag on devicetree patch.
	Lee Jones:
	- tweaked commit message s/led/LED/
	- use relative paths in Devicetree binding docs, line up ':'s

v3 -> v4:
	Removed tps6105 mfd patch - it was accepted (Mark Brown).
	
	Use the new LED registration API - suggested by Jacek Anaszewski.
	
	Updated led dt bindings to document function, color usage.

v2 -> v3:
	Removed tps6105x regulator patch - it was accepted (Mark Brown).
	
	Removed devicetree/platdata bindings for tps6105x led naming.
	I can test only with a 4.19 vendor kernel, which does not have the
	latest led naming infrastructure (function/color). Drop devicetree/
	fwnode/pdata led naming in favour of hard-coding to "tps6105x::torch",
	so the patch can be tested by me, yet remains acceptable to upstream.

v1 -> v2:
	Select chip operational mode by looking at subnode name, _not_ its
	compatible property. Suggested by Mark Brown.

I needed led operation for this mfd chip, so I added a very simple
driver for this.

My platform (arm imx6q) is devicetree-based, so I added optional
devicetree support for this chip and its sub-drivers.

Sven Van Asbroeck (2):
  leds: tps6105x: add driver for MFD chip LED mode
  dt-bindings: mfd: update TI tps6105x chip bindings

 .../devicetree/bindings/mfd/tps6105x.txt      | 47 +++++++++-
 drivers/leds/Kconfig                          | 10 +++
 drivers/leds/Makefile                         |  1 +
 drivers/leds/leds-tps6105x.c                  | 89 +++++++++++++++++++
 4 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-tps6105x.c

-- 
2.17.1

