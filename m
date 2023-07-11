Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71E0F74EA57
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jul 2023 11:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbjGKJZ0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jul 2023 05:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbjGKJZF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jul 2023 05:25:05 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A381BDA
        for <linux-leds@vger.kernel.org>; Tue, 11 Jul 2023 02:21:06 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3466725f0beso7107165ab.1
        for <linux-leds@vger.kernel.org>; Tue, 11 Jul 2023 02:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689067266; x=1691659266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EcSi56+I/iiHX6DYCKsNAvHqRVfHSrumW++BHQC568=;
        b=FcDG0z6O6apqWaZX92K+NiLUDRZx2DzRF3R2Cl0ZCrhDUJytRpVSvFk5KzrkdrRh7k
         fpWe93nbCwShBqEpwdqdWX3BfyRfFzJyet9kxGZmTctrc2IJH6vVoV6rkNs3rhSHNHIm
         iQTE/5yjnnYaC+zq7GMf2xKxeA8JhCtf0xKsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689067266; x=1691659266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EcSi56+I/iiHX6DYCKsNAvHqRVfHSrumW++BHQC568=;
        b=geZZFWoig/UIBWadwf+47Z88OX73tJlP84/9vZdKqjJ6uzsv5L+3sdPMs4IiHm2FhK
         tkRsmg2VpL8iBOqcFKZvsUn60W5dRcZLBKH82/i4R7+Ae5cWwLE0Cx38usIs+bgCTCcW
         hZrujTQAeF9awPcP4BKOnDJWjLs4qC13u5S+opVeDtD5AFx47DLiLknXdBe+CUjscreA
         w9Spfd/x2lmmRZV6t+tFExUwRnOPwNnoeuy5WZwGJfYZipT7T23f5uUqcSiJu/py3yJn
         Y5sGnmvRsw8zwCooT4GIETdf/uvV651IgdWBjYOwCufSZmdfTGBzqxUvRXpZkBEbF4ZU
         Hh4Q==
X-Gm-Message-State: ABy/qLb0/TKdwuLU+lGHn7fdxKQXC7IKn/pXvh/QQZFx53HpSWD/shDW
        rzSo7ULYDh5Xum/Yir+tPx9qot1p0FyXgYNEHDA=
X-Google-Smtp-Source: APBJJlHE/rwthGJkI95Z6CPBQPfghuULE6wHWqVTH4eJZiivLC+/3JSXZUX8qUqUVHLSvK5DlL0MNg==
X-Received: by 2002:a92:d30f:0:b0:345:d6a8:8dcb with SMTP id x15-20020a92d30f000000b00345d6a88dcbmr16625757ila.19.1689067266298;
        Tue, 11 Jul 2023 02:21:06 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id y4-20020a920904000000b00346097ca74dsm471666ilg.71.2023.07.11.02.21.05
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 02:21:05 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-77acb944bdfso270789839f.0
        for <linux-leds@vger.kernel.org>; Tue, 11 Jul 2023 02:21:05 -0700 (PDT)
X-Received: by 2002:a5d:9f48:0:b0:776:fd07:3c96 with SMTP id
 u8-20020a5d9f48000000b00776fd073c96mr18436123iot.7.1689067265096; Tue, 11 Jul
 2023 02:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230711083055.1274409-1-fshao@chromium.org> <CAHp75VfSL5j-ZUYkezELWzq+c_V+CFL6iVQWQ=roPYrZ=h1rSw@mail.gmail.com>
In-Reply-To: <CAHp75VfSL5j-ZUYkezELWzq+c_V+CFL6iVQWQ=roPYrZ=h1rSw@mail.gmail.com>
From:   Fei Shao <fshao@chromium.org>
Date:   Tue, 11 Jul 2023 17:20:28 +0800
X-Gmail-Original-Message-ID: <CAC=S1njKS0fLBtBS9P_K5gawaA7E804=Jkhe0PGekVAUxUbEDw@mail.gmail.com>
Message-ID: <CAC=S1njKS0fLBtBS9P_K5gawaA7E804=Jkhe0PGekVAUxUbEDw@mail.gmail.com>
Subject: Re: [PATCH] leds: pwm: Fix an error code
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Andy,

On Tue, Jul 11, 2023 at 5:10=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jul 11, 2023 at 11:31=E2=80=AFAM Fei Shao <fshao@chromium.org> wr=
ote:
> >
> > Use the negated -EINVAL as the error code.
>
> Thank you, it seems Dan had been the first one.
>
> Message ID <a33b981a-b2c4-4dc2-b00a-626a090d2f11@moroto.mountain>
Thanks for the pointer. Please disregard this patch.

Regards,
Fei
>
> --
> With Best Regards,
> Andy Shevchenko
