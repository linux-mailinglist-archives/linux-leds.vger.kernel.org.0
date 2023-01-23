Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54636677E0A
	for <lists+linux-leds@lfdr.de>; Mon, 23 Jan 2023 15:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbjAWOa7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Jan 2023 09:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232312AbjAWOa6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Jan 2023 09:30:58 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6497C24481
        for <linux-leds@vger.kernel.org>; Mon, 23 Jan 2023 06:30:56 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id b7so11001705wrt.3
        for <linux-leds@vger.kernel.org>; Mon, 23 Jan 2023 06:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Da+hSgaK1WT1wNbShCQdIMzhNbm+JCBNC1eXaZYQxFk=;
        b=tU8ACDmnm9fiGwunC7HIXCP8Ktp9bCMq5U11MQkNlNME2Huocmq5Et448WBGb5jai+
         ADGxO7Beqc8tuuXO3z+b12QKQgpZ+aw1iuRBTBPpm3V/vbBX8rFVkeoZivusI98OrTFf
         iD4SslwY72kanILbDAP1c7W8dz7RNMYC1W+uV3vThRUFxixBEfLQSsk3rNibOex3HOis
         AwkS3dP6OrrpfquzoZKq76Oe/PAoS0f1zYoWovWErMmxJ4yMlj9wEX1d7dU2eAnmZBqN
         1t8pwAoy3xyrZCfx4wCG/wc1ngIy1x/leAPP/vb8VANwRAjNfO9FuBpmADRF3zZjpTwJ
         1DUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Da+hSgaK1WT1wNbShCQdIMzhNbm+JCBNC1eXaZYQxFk=;
        b=bVBYT6R9z3/qbrzCk+QPiVdRYmaZ7zwyBESQL3I7OBT5Ucga45Evlk8uo0Tz2LXpGA
         aghhOvNG1a0xzPGjb8kmlz75+PQFp8ElCPXY5V9T5vghjj1exUf2Q5oDy5EG/OdcLPvX
         XWP8VUB6q5RG2SIeORXiO6eJ5O2F+CCKvSZggI/pEsp5Ap5HXReOtVDP5A3Uz/7S26Ea
         xTUxKcrPOjLBA8vnonXA6TpbCMLb6HOT/4zM4pegX1aMY/i2kjPjFnwH6pu613HFgZaC
         QEAGh4Rt81OQXcE+Fdm5s4X8+OeMuDtQOA4C9bXI/wIkV6AG7PHHXpNHY1mGjAzvzuwP
         T19w==
X-Gm-Message-State: AFqh2krrZfdLRMjTOw5D7tSQMqca5eQyFKyO5JgM5/TH1vEafA/vGXl/
        Hga/5WvFYzVqO4AdIEvJs+mqLw==
X-Google-Smtp-Source: AMrXdXu+/DzWFdvmrnHqMwUtpEwkMO5ieJgcY5ksKjZub1P+gC1GsvWZFBORDjzoRtJl3KmDgpB+2g==
X-Received: by 2002:a05:6000:608:b0:28f:29b3:1a7f with SMTP id bn8-20020a056000060800b0028f29b31a7fmr26030725wrb.36.1674484254755;
        Mon, 23 Jan 2023 06:30:54 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id c14-20020a5d4cce000000b002426d0a4048sm5068204wrt.49.2023.01.23.06.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 06:30:54 -0800 (PST)
Date:   Mon, 23 Jan 2023 14:30:52 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jianhua Lu <lujianhua000@gmail.com>
Cc:     Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v9 2/2] backlight: ktz8866: Add support for Kinetic
 KTZ8866 backlight
Message-ID: <Y86aHA5JMHPgkB9A@aspen.lan>
References: <20230120155018.15376-1-lujianhua000@gmail.com>
 <20230120155018.15376-2-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120155018.15376-2-lujianhua000@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Jan 20, 2023 at 11:50:18PM +0800, Jianhua Lu wrote:
> Add support for Kinetic KTZ8866 backlight, which is used in
> Xiaomi tablet, Mi Pad 5 series. This driver lightly based on
> downstream implementation [1].
> [1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/elish-r-oss/drivers/video/backlight/ktz8866.c
>
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>

Thanks for all the changes!

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
