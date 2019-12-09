Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E794116E6E
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2019 15:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfLIOCj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Dec 2019 09:02:39 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37291 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfLIOCj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Dec 2019 09:02:39 -0500
Received: by mail-qt1-f194.google.com with SMTP id w47so15627992qtk.4;
        Mon, 09 Dec 2019 06:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=FS4GdxXu7/QfDNL7uDYbRfkUTYRCZcMTRaDIlBmOHhE=;
        b=NIR//USzARfjaib/j+FaNjU5EJFI57vjLwO/c/ZHkLa2+Bfm4UMI324rEdZ/Gdp3ly
         kDvv+zkgqy7DLmjUALOgmjtHwRAWVBOWewKpBaaGRyUXj0fZuyTBZWMuzZ7HyYPB6Cc4
         8m2wJi29Rsplx7Bwvttw2nYCPbvAPQTJ4btUVJ3lOoX/OdIawCs2SSd8REm5coH6OfE9
         DSefBUeEYd2mgVON+3VR6Si8EMcJ0mO1sY75LLvqmcE6ZhACKG9JEAJQ0XDRrFGv4Ie2
         BwIlFpEQeV+vk8E0lyT2Pi9hLmgcIg75VyLT1476Yqe6NhiqzJReFaCYLti/pAWhjAcp
         l6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FS4GdxXu7/QfDNL7uDYbRfkUTYRCZcMTRaDIlBmOHhE=;
        b=jYwvZxZp+P1svsqFiXElpYuVIWCd4kOcrvIrr3mbZCiEOS2+xysU+oTpszKg/5F+Io
         cqLGvU1u+kGXybpheuMDIn9BNrEzucM8Jcw7kbhOWfJEoeVV0RdGbWHja1JIkYgASxEk
         lXSb8iRXlIOWjS6NfnLQAiOiGE6FBzTYfZnkbg0I4WvcEW7CJduykH8S8ar99v8KK6iP
         HfZ9HOrwcym7fUUvxrt5fna/BC0w8Afm/5+S86uuhLOx368j1nqUzuyWUGAqtf1UWC95
         jU9a6iZk3zwpf8cSbn7jZuwxl6nxqvh31+WSae149ZRQLAgH84bkiUzXIgbwGUXj/Evy
         dLOg==
X-Gm-Message-State: APjAAAVGh1ON5aYA3D7Stx2y9Lo6vTATS9xgorOrkt0fJmW5MAsEHrvg
        uz74uS/WTzLzGufo/R0wxF5kYsOL
X-Google-Smtp-Source: APXvYqw02zHBpMFCOAfyakZVuDIk8pCl6TASpy/ZWVs4rrmP6otr86I7hisTCLFDwvpRpKVMwU94Hw==
X-Received: by 2002:aed:2b07:: with SMTP id p7mr24996770qtd.180.1575900157988;
        Mon, 09 Dec 2019 06:02:37 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id h28sm10128023qte.54.2019.12.09.06.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 06:02:37 -0800 (PST)
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
Subject: [PATCH v5 0/2] tps6105x add devicetree and leds support
Date:   Mon,  9 Dec 2019 09:02:32 -0500
Message-Id: <20191209140234.6558-1-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

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
  leds: tps6105x: add driver for mfd chip led mode
  dt-bindings: mfd: update TI tps6105x chip bindings

 .../devicetree/bindings/mfd/tps6105x.txt      | 47 ++++++++++-
 drivers/leds/Kconfig                          | 10 +++
 drivers/leds/Makefile                         |  1 +
 drivers/leds/leds-tps6105x.c                  | 83 +++++++++++++++++++
 4 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-tps6105x.c

-- 
2.17.1

