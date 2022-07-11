Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB66256440D
	for <lists+linux-leds@lfdr.de>; Sun,  3 Jul 2022 06:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbiGCD7k (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 2 Jul 2022 23:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbiGCD7H (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 2 Jul 2022 23:59:07 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C363D13D
        for <linux-leds@vger.kernel.org>; Sat,  2 Jul 2022 20:57:48 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id h65so8911044oia.11
        for <linux-leds@vger.kernel.org>; Sat, 02 Jul 2022 20:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W92t9vb8RyuMAsngPIQE5DDwov75LnCzM9uTCriJUuE=;
        b=dtBiwIUOP73p3Ub+FJgRTZULzSMWy19sIwUMCtfYLY3c9h6VZGqcvJnJ/lgru4/nJo
         RTE2NkiqRdWnALkUIJHia2vIoF1GwyW9pvoHw52KKNblp1q9YnVZO873NN/bmUJXvXfS
         X8ObHCBnHB0ebShNkloMz0cZ0ctDG86xJFS0jhZVIfqCGLYFuo4ReRKUAZbhY5M1z0Pq
         wSYGADDJ1NGDg/gQ4PQjGlRyhj7IBqLs26WsEU+6QgyvDc4fmijJZlvmce+d19NvJEPE
         NHI98XNiSl+S7FvCWog9h9RjvbmoIKmdEp9wCwRYpDeBn/VPB9u+z74UdkVkhGrTB1jA
         tIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W92t9vb8RyuMAsngPIQE5DDwov75LnCzM9uTCriJUuE=;
        b=d3rw5HpWSLBGLP9mivvIwZCmB0kRJksmA3idTba1ZBTi9ksstbHsmE8fy6SO8VVrY/
         j12Sf2aRwrZo0iv9Uxcqx6QHDaDawzVfyObeWpvIp2BaE8urU1aPKYH7SS3CaSGncYdd
         NPtdrqqiGrodD7srKcdGqyJ6JsjSTUQWBVUmIDnyMu92VOyyrTuwwYnBQltmXaLC8DAq
         /7K2iP7Mjcqb1Po3a39Y/0JoU18BWY4LtCx7iinuKiz6zpPJD7nV28aW4XVqHm+hGzFY
         u0gJI4Fk6LnclnQH6EefsTltrSr8QDFFUxO+FGdDE4NFnxBMxHpTOzuUI+2KEB4wTd6X
         bIZw==
X-Gm-Message-State: AJIora8636E5px1nZKHUoDiEh9Mjf7ohEp66GTULQLNIIzn3O5Dnljon
        QoMBSakT/CUhIiD/pPZP+kFlgQ==
X-Google-Smtp-Source: AGRyM1uNAYPGQITKnJ9PX66/GdKmHQYcgLdvZwQy3L6b7FyJwRJV8X8tCMWB0wH2/SYsnFlxxGkKFg==
X-Received: by 2002:a05:6808:148b:b0:335:8f41:3ab0 with SMTP id e11-20020a056808148b00b003358f413ab0mr13683198oiw.172.1656820667876;
        Sat, 02 Jul 2022 20:57:47 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:47 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     phone-devel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        devicetree@vger.kernel.org,
        Martin Botka <martin.botka@somainline.org>,
        linux-leds@vger.kernel.org, Rob Herring <robh@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: leds: qcom-lpg: Add compatible for PM660L LPG block
Date:   Sat,  2 Jul 2022 22:56:41 -0500
Message-Id: <165682055969.445910.11818943864906447784.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220511190718.764445-1-marijn.suijten@somainline.org>
References: <20220511190718.764445-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 11 May 2022 21:07:15 +0200, Marijn Suijten wrote:
> Document the availability of an LPG configuration for the PM660L PMIC in
> the Qualcomm Light Pulse Generator driver.
> 
> 

Applied, thanks!

[3/4] arm64: dts: qcom: pm660l: Add LPG node
      commit: fc41893fe8289967d0aaffab25d8bb96334cc676
[4/4] arm64: dts: qcom: sdm630-nile: Add RGB status LED on the PM660L LPG
      commit: dd764e1a42367c93d1e8e3f9e1ce08752a6dbac2

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
