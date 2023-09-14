Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 713D479FE99
	for <lists+linux-leds@lfdr.de>; Thu, 14 Sep 2023 10:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234455AbjINIk5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 14 Sep 2023 04:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232128AbjINIk4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Sep 2023 04:40:56 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F898106
        for <linux-leds@vger.kernel.org>; Thu, 14 Sep 2023 01:40:52 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-ccc462deca6so702274276.0
        for <linux-leds@vger.kernel.org>; Thu, 14 Sep 2023 01:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694680851; x=1695285651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBgKOX9HU0Cqf61gn84yvvVhKTbuYZo7XwNQLZJ6zZQ=;
        b=n+HADZPRDaVcTgqRN5ARP3ajMfJkvybXCSDh3gpfl44JUiypjc0/2V2H9xRDnMa02L
         GogX8fQVXn0s381cAovCMd06foZrauZjhyOBap0mLDCAPHe3mXoT2aiP6eFCtCELQtf0
         No3nDZ3MqXZpg/BBorPaKFo+cw34NcuLUlb1PflEN1Z3qw/tn81HcLFh+y2UyWJT2Sor
         PtE7Yj/2gQpR8iGR+T0IZvUC8JSH9v9x2pEJ0M3a5Mwf6x456JRwPNAMXKiFoPEb4AGR
         /1O+1HTjQPjbydRY9fcyGmp6UfLzwETv4QUkc7rt+QZfoDy0B6DzDfhHbfbv1lemzh8j
         fgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694680851; x=1695285651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBgKOX9HU0Cqf61gn84yvvVhKTbuYZo7XwNQLZJ6zZQ=;
        b=rk7tlVIQ1lKThGHHB93yjKArLngpszdpfMWg+IgQWuS5wTNaFZ2qeURDEfQO6lMoXS
         B9OU3mV3ynqstKE96CP+UzxdCDCpQ35pc9f9wGaDQFrRTC2RHMpEVNOKDy3zi+ySX868
         GLoYAvTcDiz9HBweMgAXKkbzgQ/VNpsbKIXn5AJKRBbttl/T9L0W9rQUDQP6V7FxyFSL
         UfFqt2xGhBh7H9lGxo8sTl5IChVJlI5mNnYYxdL+t0paj1wVT32ffXkApG2t9IrwlJEd
         u4hswRoLgO5m+xcJ+bWxIzCV1VFIrLO40gn+6Yi/9kyxCWfzpLxUpY+zEoAqLC/eNH8t
         8Baw==
X-Gm-Message-State: AOJu0YxXT91e52+8pwF/YZnFmT+oWgO+Wr4X76LbShPjsNfnhYsqHka8
        NdI92G2FXgF4hzvMt8cz2dr+gcuaSoQI+mQxawZrEQ==
X-Google-Smtp-Source: AGHT+IFwZobHxcqKOc9i9F0FwU196xwcuhkf7p5VMd50HiyGLwvFBTBzw2gNzhm4i/jnEP5lPJDUpXQSAPyK3EQ0058=
X-Received: by 2002:a25:8001:0:b0:d4b:6a0:fe2b with SMTP id
 m1-20020a258001000000b00d4b06a0fe2bmr4591638ybk.36.1694680851406; Thu, 14 Sep
 2023 01:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230912-gpio-led-trigger-dt-v1-0-1b50e3756dda@linaro.org>
 <20230912-gpio-led-trigger-dt-v1-1-1b50e3756dda@linaro.org> <20230913133451.GA2841610-robh@kernel.org>
In-Reply-To: <20230913133451.GA2841610-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Sep 2023 10:40:40 +0200
Message-ID: <CACRpkdb72f9WFeEGo-tXscZaBmFH04WiePM+tJSmuuXQxxy=3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Mention GPIO triggers
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
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Sep 13, 2023 at 3:34=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Tue, Sep 12, 2023 at 03:44:30PM +0200, Linus Walleij wrote:
> > We reuse the trigger-sources phandle to just point to
> > GPIOs we may want to use as LED triggers.
> >
> > Example:
> >
> > gpio: gpio@0 {
> >     compatible "my-gpio";
> >     gpio-controller;
> >     #gpio-cells =3D <2>;
> >     interrupt-controller;
> >     #interrupt-cells =3D <2>;
> >     #trigger-source-cells =3D <2>;
>
> BTW, this is not documented for any GPIO binding. If we want to specify
> the cell size, then it has to be added to every GPIO controller binding.
> If not, we then need to reference gpio.yaml in every GPIO controller
> binding (along with unevaluatedProperties). Doesn't have to be done for
> this patch to go in though.

Yeah I mean this trigger-sources =3D <...>; one-size-fits-all is a bit
weird in a way.

My other idea was to simply add trigger-gpios to the normal way
and be done with it, but now the trigger binding has this weird
thing.

Would trigger-gpios be better?

Yours,
Linus Walleij
