Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1942B7A2567
	for <lists+linux-leds@lfdr.de>; Fri, 15 Sep 2023 20:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbjIOSOl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 15 Sep 2023 14:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236329AbjIOSOl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 15 Sep 2023 14:14:41 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CCB51FE8
        for <linux-leds@vger.kernel.org>; Fri, 15 Sep 2023 11:14:36 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-ccc462deca6so2271392276.0
        for <linux-leds@vger.kernel.org>; Fri, 15 Sep 2023 11:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694801675; x=1695406475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbloVE8nmpRklzhuAiR112rqAdagyUfXz/yXE+ALMUw=;
        b=pD9LDM/jSQsevy3WblHMaCVcpilmziyEba7tYSSaaFOrvpVuWkruqHyckseN4DitTJ
         wd6Y/m0hHoBdFcKMdsEM1CBqXSyMvfOWsBFm1zZw1nenYG1XHA/Ciw43LuVIkZYxLpHx
         YFhrN1+yQpOYuByKY0nI0482YFZzL+VzxEgdrP2wgf9HlYUQfkhmMRW9y1O4Dj6m2Jb5
         WdXQTr12xuDe1Xn8aIHEAKDAI3Z2ei0mo9HJnkhS4Up6Hj2RVlMdVeDelgczXRdp2HMW
         hEf9Ylu6AQVGqWwkUIdA4yhHSR7oRP+rf1FDftaLpG0jZGPK1ZldFHsnbnwPd8kHGTbG
         fLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694801675; x=1695406475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbloVE8nmpRklzhuAiR112rqAdagyUfXz/yXE+ALMUw=;
        b=t/DImzKeGCPpwrdWI/MTZLz3TMMQHizUuqRYqT9iu6Cl2HM50LpslfKboAhFEASD1S
         JASi3yHuheEad9gxN5iZY0DF2KV862mlLKGrSy7Z2P3YAeyviUSCJC7AGNCJtyEiYMdm
         0FFpFooP8P0XHCnlNUW3ndPp5x4DbnWuhxXf6P5BM7ZBMawbaXFi0SiOir4fn2UPTW/+
         3eoIlHc6VtJBbxGj4B8pAlkoYtdjJwYHk5gY5kmPOc+UW6y54S97LaSrZXL/UaG6wXpj
         BNqYzz9Ospwm3IuImKsLQpyLMZ8RaNu6dZc6NQTfoET/RhFEeA83odDFPLAZNs0Ccl24
         cXhg==
X-Gm-Message-State: AOJu0YxpnhydB6HEM4afjEHxrpYcFH0L51dsxNT9SsMMFAK5EBbBtzIh
        PGMtff472oeBUuiqZyHD3aFZkj0UOjkC+LQP87fSAg==
X-Google-Smtp-Source: AGHT+IGhlDPPzTH3Fqdci1fTXm/PKLPUl8DSShnol/oSLFycRyWZpMfwroUjr2RIyQNpxuS8IG60KfH3yNBFW9UaSaI=
X-Received: by 2002:a25:9702:0:b0:d82:9342:8612 with SMTP id
 d2-20020a259702000000b00d8293428612mr97916ybo.12.1694801671461; Fri, 15 Sep
 2023 11:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230912-gpio-led-trigger-dt-v1-0-1b50e3756dda@linaro.org>
 <20230912-gpio-led-trigger-dt-v1-2-1b50e3756dda@linaro.org> <20230915141549.GA3658872-robh@kernel.org>
In-Reply-To: <20230915141549.GA3658872-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 15 Sep 2023 20:14:19 +0200
Message-ID: <CACRpkdaG2oGGDjLGWgdi7Y-QS_1Odj7cbbuDiBX8DdNx7agOiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] leds: triggers: gpio: Rewrite to use trigger-sources
To:     Rob Herring <robh@kernel.org>
Cc:     =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Sep 15, 2023 at 4:15=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> > +     /*
> > +      * The generic property "trigger-sources" is followed,
> > +      * and we hope that this is a GPIO.
> > +      */
> > +     gpio_data->gpiod =3D fwnode_gpiod_get_index(dev->fwnode,
> > +                                               "trigger-sources",
> > +                                               0, GPIOD_IN,
> > +                                               "led-trigger");
>
> Isn't this going to look for "trigger-sources-gpio" and
> ""trigger-sources-gpios"?

Indeed. I'll simply code an exception for this into
gpiolib-of.c, it's an OF pecularity after all.

Yours,
Linus Walleij
