Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14D86105458
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2019 15:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbfKUO1d (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 21 Nov 2019 09:27:33 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:39266 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfKUO1d (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 21 Nov 2019 09:27:33 -0500
Received: by mail-qt1-f196.google.com with SMTP id t8so3875486qtc.6;
        Thu, 21 Nov 2019 06:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=z3Rgwff4mW05eEw3aRpfEtDwcdTG4aD4VTMxiRfMsmE=;
        b=aLv72o+2wFDfIAmXIF/yB7mMwZ8UBE8FKlgfTAegymH7fv7GPPIds4bc8rJcc2S1mC
         ZBw7PgMItKMFnAG0vGxQPfYsjq95dG7p1rzKUHbRejQXIxIzbucgBQabw6O3PTDH2kY+
         2Hs5cHmqhf1HeLalENIG8BGWPRdVW26QjiOego1H/kNzf9xnbNm+lljIekKCGkW2J46z
         0sCbtsKJUQAs7ibrMXfrjSB9dqzQ3XNyJAgu5zJkCbL77gZtaoFgwDOU0SOeVcEbX93A
         Rzo5IqbuwKybhqAXa6ggt0QAqm8+BrggEbwQZjxRK/7wGcaznajDC7lorzD22ARvpFEJ
         PGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=z3Rgwff4mW05eEw3aRpfEtDwcdTG4aD4VTMxiRfMsmE=;
        b=qBqFzMX+qmVXgE1wqA7DK18zquvCacsiZYDOAtspaqvxJeEdFSBoO74AyaCsQ3Un15
         LOkMhGI82EZ06kLpZDdnsreua0coj/ahpUstWH5TcnVNDjR/0W6xUoVpQRBGVgXkkVLX
         RoJE9ScTuOK7Hzd1gkxFgYPy1DqNrOZFD2Pscvq+b+MJ9z88QC/OJK4lKXvmxAHVk2LE
         Fuz5vP/HdIduU5yTl5XMPBV0Luo3ATy7ZfGjFszFGjdl8GwDdL7TNkJ+XbNohMzrzOg9
         yIaTHW6xAlk0X0tmh9j9FbJH9CZP9r/CsVzVEO5dtlp2gDsriMbJI8QcDjAEHh083jiL
         41xA==
X-Gm-Message-State: APjAAAU/DCAlJmlz/pbkF3oNOy8MCGepAZnQOqzwXdLW09vnBHAYdKfD
        asmrMVApH5sizfNv5Pds9cg=
X-Google-Smtp-Source: APXvYqyvyKTEDG4kCWqZBLbZtqSUuslKOQ1alMpboXLbtLnctFh422B78+JdZN5IDsZZ+nkNzQC0+A==
X-Received: by 2002:aed:3c0a:: with SMTP id t10mr8945130qte.173.1574346452231;
        Thu, 21 Nov 2019 06:27:32 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id l198sm1442931qke.70.2019.11.21.06.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 06:27:31 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v4 0/2] tps6105x add devicetree and leds support
Date:   Thu, 21 Nov 2019 09:27:24 -0500
Message-Id: <20191121142726.22856-1-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

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

