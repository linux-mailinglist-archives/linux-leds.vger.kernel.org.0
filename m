Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC03F3BFEF
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2019 01:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390731AbfFJXhp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Jun 2019 19:37:45 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40028 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390716AbfFJXho (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Jun 2019 19:37:44 -0400
Received: by mail-pl1-f193.google.com with SMTP id a93so4265025pla.7
        for <linux-leds@vger.kernel.org>; Mon, 10 Jun 2019 16:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PwvhwkI8F4zvLVsJwAGnKk3UZTvA+WVT+qCBY1uqWqg=;
        b=hijO8nHj6AanoC+to/aLESdGAjYajAq/Wwo6ROP8Jh065ysj+O/VWUY+CjGk1QGNLO
         Nzjj4CGR7IV5n0DZhEvJ8T9VttRm3HNbJ8f655p8CVolKCbEHYeRHF0Q7pT55hBt7oMM
         UA5ufOa5wv1gkQHsFvqsinxJo7kP1Tysa/l1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PwvhwkI8F4zvLVsJwAGnKk3UZTvA+WVT+qCBY1uqWqg=;
        b=tqxIZvvAgtzrVPytik3+RDO4IC2zHR1RBJ1KeHRuUbr7pMkvO9+Zpxza2IWs6H38WP
         CM7UQzHBiBfkenn3j/81u9ZiWJxYB4XXhj5yBL6BZJg9rU+uVF98rS6M3Fp5VvmRnsA8
         aYWfrUFVyjEy0WSPNdi520wr1sI692pyotW7OYljpwufKNo3/iCkJSZpqwJMIILY9QVf
         p+qMUSc9zzWyLXS5D6N1qF8LD5tjk+QBhN7LTHOJbPAB+Sv6dDvTN/ArEqPQttBrB5Tv
         jgwbxXyXZOAs+xvbodIYofq4RKS+ro+tlnQdxpOeguTp2P5lxJL+WeHxBr1N1ri3W+zQ
         F9FQ==
X-Gm-Message-State: APjAAAWSeqDyqnVeWk6C21rTpHMHw8/vrgXFwLEKgX+NvlVCWW8SGW3K
        zbV/r8UAvmpozWtiufmect314A==
X-Google-Smtp-Source: APXvYqxzuWk+HHUFs0uzAZUj3UB9CiltN6z/LVO8neBboHeE9VutR2V17/0JmmVYiipinsqCD9j37w==
X-Received: by 2002:a17:902:7581:: with SMTP id j1mr72670630pll.23.1560209864163;
        Mon, 10 Jun 2019 16:37:44 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id q144sm8898518pfc.103.2019.06.10.16.37.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 16:37:43 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 1/2] dt-bindings: pwm-backlight: Add 'max-brightness' property
Date:   Mon, 10 Jun 2019 16:37:38 -0700
Message-Id: <20190610233739.29477-1-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add an optional 'max-brightness' property, which is used to specify
the number of brightness levels (max-brightness + 1) when the node
has no 'brightness-levels' table.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 .../devicetree/bindings/leds/backlight/pwm-backlight.txt       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
index 64fa2fbd98c9..98f4ba626054 100644
--- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
+++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
@@ -27,6 +27,9 @@ Optional properties:
                             resolution pwm duty cycle can be used without
                             having to list out every possible value in the
                             brightness-level array.
+  - max-brightness: Maximum brightness value. Used to specify the number of
+                    brightness levels (max-brightness + 1) when the node
+                    has no 'brightness-levels' table.
 
 [0]: Documentation/devicetree/bindings/pwm/pwm.txt
 [1]: Documentation/devicetree/bindings/gpio/gpio.txt
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

