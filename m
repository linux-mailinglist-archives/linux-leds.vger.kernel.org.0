Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5ADA3AB4E
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729869AbfFITIk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:08:40 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52092 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729812AbfFITIj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:39 -0400
Received: by mail-wm1-f66.google.com with SMTP id 207so1605128wma.1;
        Sun, 09 Jun 2019 12:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ipNXWxSXmJHgEXKOioqVUFKoetd2vU7KLHH9gAYBw7U=;
        b=m5qEOY6t4e8305WqbgRbiqupo9by5+OohjXpL8UEnJE1lUM2nPS1rYWehN58/3twKd
         8UHmHX8bt/P9AiJfjzNqiXW2//g8xz5kzBnwusc0I5VEhyLV+3v8G6aLKIEGMklY1IuY
         /50wx5GEuuxqUBpDW1M87wsd88ekulxZMzQah3P7Rid4IVDkfp4wCMErRbkzjFxrjvw2
         pwJzzNHHLMp70zGNLs98aI/c18AjMkYZ7NjvUjmbwlwKocFsBC1+wN5QSpe9YxFQV3ge
         UcrdRPW7qklVnZJOxBZNZM4ztvqa/jl/2gR+uQy3P9Rk2z/aaDfWLgCpvi8J5jrg6jkE
         VnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ipNXWxSXmJHgEXKOioqVUFKoetd2vU7KLHH9gAYBw7U=;
        b=RcSAMd1FXx2rto+c5XhxTN2WJHnX/bfyBot7SR5adn+yRHmqFbPTo5Qahm9T2x7nQD
         wWMzWKvF4+c3LbD6a1MeLg+yQCAFmxeEJ6YdYm4Ss9FlJeVLvujXlKFVa2s8idJTWGbV
         M8oCwj5KsctZX5Po3RzvVZxKebaUGtUBfvUOJLJG6JfZv83yUU5bdU7M8zq8hL5fIr4U
         dNhMkA8np2f8XOS49l1w9s6q/NdedgnKaOtEkEDB+HULQ2+xXc5Fx6au+ZB3/55082HL
         xFu4huNWeoOJct7FmZMmjPDUGsrL/sBjW3nEU4ZORVA5CBeJ42qGV0gGZvL56/L3eCl2
         MFHg==
X-Gm-Message-State: APjAAAVDCzpdAxioK0UIyCdhXtftXBJd1bj3wzbcwTEQYBPJnhzw0/sJ
        SqSSxtQzn1n6IhGOCd/fbep6iB4v
X-Google-Smtp-Source: APXvYqz+MDT6pzuEa3VACZKohSVo5Dv/cHnBHp4VE971yB9/MA1SritdvCVGhV9IeAEAwMzvTnm8sw==
X-Received: by 2002:a1c:228b:: with SMTP id i133mr10933756wmi.140.1560107317111;
        Sun, 09 Jun 2019 12:08:37 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:36 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v5 06/26] dt-bindings: sc27xx-blt: Add function and color properties
Date:   Sun,  9 Jun 2019 21:07:43 +0200
Message-Id: <20190609190803.14815-7-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Refer to new "function" and "color" properties and mark "label"
as deprecated.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt b/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
index dddf84f9c7ea..df2b4e1c492b 100644
--- a/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
+++ b/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
@@ -14,7 +14,9 @@ Required child properties:
 - reg: Port this LED is connected to.
 
 Optional child properties:
-- label: See Documentation/devicetree/bindings/leds/common.txt.
+- function: See Documentation/devicetree/bindings/leds/common.txt.
+- color: See Documentation/devicetree/bindings/leds/common.txt.
+- label: See Documentation/devicetree/bindings/leds/common.txt (deprecated).
 
 Examples:
 
@@ -25,17 +27,17 @@ led-controller@200 {
 	reg = <0x200>;
 
 	led@0 {
-		label = "red";
+		color = <LED_COLOR_ID_RED>;
 		reg = <0x0>;
 	};
 
 	led@1 {
-		label = "green";
+		color = <LED_COLOR_ID_GREEN>;
 		reg = <0x1>;
 	};
 
 	led@2 {
-		label = "blue";
+		color = <LED_COLOR_ID_BLUE>;
 		reg = <0x2>;
 	};
 };
-- 
2.11.0

