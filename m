Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72EF1577630
	for <lists+linux-leds@lfdr.de>; Sun, 17 Jul 2022 14:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbiGQMnD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 17 Jul 2022 08:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiGQMnC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 17 Jul 2022 08:43:02 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7581D140C7;
        Sun, 17 Jul 2022 05:43:01 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id y8so11949512eda.3;
        Sun, 17 Jul 2022 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lL4qaMaHIgn/p1MioBy3fT7HhSN7m96aHZDDTbJaHeE=;
        b=WeTRpzV9klsbHl1g6G0DJ0alAEA8dIZ3gbUC3Bb16E1VLfDpReHXjaGT0uk5FwE88N
         WEOVLBARtVLv8a7aUrFsK4Kt0iD1KzSPbg039gwSeATGUHifbBXFthEYAs9k0V14FP+g
         RjnR7UF6sKhABmCzAZ1hZU6JIGEDYUNYsJJTvsSK3pd+hEL4OKWFXZmZDu9olWqOqs9S
         4y/JyLQEyRTun8ELkbz+JJAbXnVJ3v8G8xN68X9xi9hlnZ5BPEjj5Y3QZrBdKhaSXMwc
         BRucFsdXdfhEgQAC900m5JC/hZvUw1EnJKTtXgxMxBJ9Fg+JeIAdqmjmRGWAjgCJJLPM
         Ikhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lL4qaMaHIgn/p1MioBy3fT7HhSN7m96aHZDDTbJaHeE=;
        b=s2pQezeaAn+pHkxefYlqftSKb9mF2txzmdZpWvEIHHTsD5v1tAUT2wF+yjeuXXFMaa
         WJkw9Zp1K7MSjttsY5V1kKUkeG0EzzcdeVDoJ+OSJPcJbRapeXbb26fQiX2I/eKM0gXO
         dXagk6tUFnkwujF+/jnnl69HuUgdY3WrGHCaBo22HmjW9Gz00KlbXsgcEBDVu3Mn99m+
         NX7queIZ1933VniBSGCqNWSn8Q7XOtoHD1urN8HpJ4UQ/FCfRxDxw6vCHXgZ8L9XrQwg
         1jg9ZxkKcGL3AVLtW3x08iEJ1jcD5k/uzIgXMGDzFVQuK/JMJCEZNZaLlUPq6DqjriNz
         PaJA==
X-Gm-Message-State: AJIora+JCOJ1P/tuzmhkrh3oIivWUOprgD19+kIxnMSKcMjyJMDz6VnE
        AWFk0LEasAIj6xdg9HT9jnU46PdAyaI=
X-Google-Smtp-Source: AGRyM1uE/rRhYw4J9V2Rj/WP/m+lLa7Rot5CK4y3acR2WpcI3Ophrbq37pTfD3N5qOBomkqX7MGZ0w==
X-Received: by 2002:a05:6402:f08:b0:43a:b202:1f63 with SMTP id i8-20020a0564020f0800b0043ab2021f63mr31444819eda.207.1658061779994;
        Sun, 17 Jul 2022 05:42:59 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id i22-20020aa7c716000000b0043a64eee322sm4520588edq.28.2022.07.17.05.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:42:59 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        William Zhang <william.zhang@broadcom.com>,
        Anand Gore <anand.gore@broadcom.com>,
        Kursad Oney <kursad.oney@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-leds@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 0/3] leds-bcm63138: post apply/review fixes
Date:   Sun, 17 Jul 2022 14:42:45 +0200
Message-Id: <20220717124248.13562-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Hi Pavel,

Thanks a lot for accepting my patches. I'm sending those small fixups to
address your comments.

I still have to figure out how to simplify fls() code you pointed out.

Rafał Miłecki (3):
  dt-bindings: leds: leds-bcm63138: unify full stops in descriptions
  leds: add help info about BCM63138 module name
  leds: leds-bcm63138: get rid of LED_OFF

 Documentation/devicetree/bindings/leds/leds-bcm63138.yaml | 2 +-
 drivers/leds/blink/Kconfig                                | 2 ++
 drivers/leds/blink/leds-bcm63138.c                        | 3 +--
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.34.1

